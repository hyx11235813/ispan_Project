package team3.meowie.ticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.bytebuddy.asm.Advice.Local;
import net.bytebuddy.asm.Advice.Return;
import team3.meowie.member.model.User;
import team3.meowie.show.model.Show;
import team3.meowie.show.model.ShowRepository;
import team3.meowie.ticket.model.Ticket;
import team3.meowie.ticket.model.TicketRepository;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;

@Service
public class TicketService {

	public Date getShowTime(Long ticketId) {
		Optional<Ticket> optionalTicket = ticketRepository.findById(ticketId);
		if (optionalTicket.isPresent()) {
			Ticket ticket = optionalTicket.get();
			return ticket.getShow().getTime();
		}
		return null;
	}

	@Autowired
	private TicketRepository ticketRepository;
	@Autowired
	private ShowRepository showRepository;

	public Ticket saveTicket(Ticket ticket) {
		return ticketRepository.save(ticket);
	}

	public Ticket findById(Long ticketId) {
		return ticketRepository.findByTicketid(ticketId);
	}

	public void generateTickets(Long showId, String cinema) {
		int j = switch (cinema) {
		case "A" -> 40;
		case "B" -> 30;
		case "C" -> 20;
		default -> 0;
		};
		Optional<Show> optionalShow = showRepository.findById(showId);
		if (optionalShow.isPresent()) {
			Show show = optionalShow.get();
			String movieName = show.getMovie().getName();
			for (int i = 1; i <= j; i++) {
				Ticket ticket = new Ticket();
				ticket.setPayed(false);
				ticket.setSeat(i);
				ticket.setMovieName(movieName);
				ticket.setShow(show);
				ticket.setCinema(cinema);
				ticket.setRow(i % 5 == 0 ? i / 5 : i / 5 + 1);
				ticket.setSeatNumber((i - 1) % 5 + 1);
				ticket.setPrice(250);
				ticketRepository.save(ticket);
			}
		}

	}

	public List<Ticket> getTicketByIds(List<Long> ticketIds) {
		List<Ticket> tickets = new ArrayList<>();
		for (Long ticketid : ticketIds)
			tickets.add(ticketRepository.findByTicketid(ticketid));
		return tickets;
	}

	public List<Ticket> getTicketByShow(Long showId) {
		return ticketRepository.findTicketsByShow(showId);
	}

	public List<Ticket> getTicketsByUser(User user) {
		return ticketRepository.findTicketsByUser(user);
	}

	public Integer getAllTicketByTime() {
		LocalDate endDate = LocalDate.now();
		LocalDate yesterday = endDate.minusDays(1);
		Integer sum = 0;
		List<Ticket> findTicketByShowTime = ticketRepository.findTicketByShowTime(yesterday, endDate);
		for (Ticket t : findTicketByShowTime) {
			if (t.getPayed() == true) {
				sum += t.getPrice();
			}
		}
		return sum;
	}

	public Map<LocalDate, Map<String, Integer>> getSumByMoviename() {
		LocalDate now = LocalDate.now();
		LocalDate startday = now.minusDays(8);
		Map<LocalDate, Map<String, Integer>> re = new TreeMap<>();
		List<Object[]> sumdata = ticketRepository.findSumByMoviename(startday, now);
		for (Object[] result : sumdata) {

			java.sql.Date timestamp = (java.sql.Date) result[0];
			LocalDate time = timestamp.toLocalDate();
			String movieName = (String) result[1];
			Integer totalPrice = (Integer) result[2];

			if (re.containsKey(time)) {
				Map<String, Integer> moviedata = re.get(time);
				moviedata.put(movieName, totalPrice);
			} else {
				Map<String, Integer> moviedata = new TreeMap<>();
				moviedata.put(movieName, totalPrice);
				re.put(time, moviedata);
			}
		}
		return re;
	}

	public String getSeatByDate() {
		LocalDate now = LocalDate.now();
		LocalDate day = now.minusDays(1);
		return ticketRepository.findSeatByDate(day);
	}

	public Map<String, Long> getHottestMovie() {
		LocalDate now = LocalDate.now();
		LocalDate startday = now.minusDays(8);
		List<Object[]> hottestMovie = ticketRepository.findHottestMovie(startday, now);
		Map<String, Long> re = new HashMap<>();
		for (Object[] result : hottestMovie) {
			String movieName = (String) result[0];
			Long sum = ((Number) result[1]).longValue();
			re.put(movieName, sum);
		}
		return re;
	}
	public Map<LocalDate,Map<String,Float>> getSeatByDates(){
		LocalDate now = LocalDate.now();
		LocalDate startday = now.minusDays(8);
		List<Object[]> findSeatByDates = ticketRepository.findSeatByDates(startday, now);
		Map<LocalDate,Map<String,Float>> re = new HashMap<>();
		for(Object[] result : findSeatByDates) {
			java.sql.Date timestamp = (java.sql.Date) result[0];
			LocalDate time = timestamp.toLocalDate();
			String movieName = (String) result[1];
			String percentage = (String)result[2];
			float floatValue = Float.parseFloat(percentage.replace("%", "")) / 100;
			if (re.containsKey(time)) {
				Map<String, Float> moviedata = re.get(time);
				moviedata.put(movieName, floatValue);
			} else {
				Map<String, Float> moviedata = new TreeMap<>();
				moviedata.put(movieName, floatValue);
				re.put(time, moviedata);
			}
		
		}
		return re;
	}
}
