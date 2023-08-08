package team3.meowie.show.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import team3.meowie.moviesSearch.model.Movie;
import team3.meowie.moviesSearch.model.MovieRepository;
import team3.meowie.show.model.Show;
import team3.meowie.show.model.ShowRepository;
import team3.meowie.show.service.ShowService;
import team3.meowie.ticket.model.Ticket;
import team3.meowie.ticket.model.TicketRepository;
import team3.meowie.ticket.service.TicketService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ShowPageController {

    @Autowired
    TicketService ticketService;
    @Autowired
    TicketRepository ticketRepository;
    @Autowired
    private MovieRepository movieRepository;
    @Autowired
    private ShowRepository showRepository;
    @Autowired
    private ShowService showService;

    private static final Logger LOGGER = LoggerFactory.getLogger(ShowPageController.class);

//	@GetMapping("/shows")
//	public String showAddShowForm(Model model) {
//		List<Movie> movies = movieRepository.findAll();
//		model.addAttribute("movies", movies);
//		model.addAttribute("show", new Show());
//		return "addShowForm";
//	}
//	    @PostMapping("/movies/{movieId}/shows")
//	    public String addShow(@PathVariable Long movieId, @ModelAttribute("show") Show show) {
//	        Movie movie = movieRepository.findById(movieId).orElseThrow(() -> new IllegalArgumentException("Invalid movie id"));
//	        show.setMovie(movie);
//	        showRepository.save(show);
//	        return "redirect:/movies/" + movieId;
//	    }

    @GetMapping("/booking/admin/{showId}")
    public String showBookingAdmin(@PathVariable("showId") Long showId, Model model) {
        List<Ticket> tickets = ticketService.getTicketByShow(showId);
          model.addAttribute("tickets", tickets);
        return "/NewBack/tickets/ticket-table";
    }

    @GetMapping("/shows")//這個加到後台
    public String showList(Model model) {
        List<Show> shows = showRepository.findAll();
        model.addAttribute("shows", shows);
        List<Movie> movies = movieRepository.findAll();
        model.addAttribute("movies", movies);
        model.addAttribute("show", new Show());
        return "NewBack/tickets/AllShowPage";
    }

    @PostMapping("/shows")//這個是按送出的事件
    public String addShow(@RequestParam Long movieId,
                          @RequestParam String time,
                          @RequestParam String cinema) throws ParseException {
        Movie movie = movieRepository.findById(movieId).orElseThrow(() -> new IllegalArgumentException("Invalid movie id"));
        Show show = new Show();
        show.setMovie(movie);
        show.setCinema(cinema);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Date date = formatter.parse(time);
        show.setTime(date);

        showRepository.save(show);
        LOGGER.info("Show added: " + show.getShowId());
        ticketService.generateTickets(show.getShowId(), cinema);
        LOGGER.info("Finished generating tickets for show: " + show.getShowId());
        return "redirect:/shows";
    }

    @GetMapping("/shows/showAdded")//(完成後會轉這頁)
    public String showAdded() {
        return "shows/showAdded";
    }

    @GetMapping("/shows/available")
    public String showAvailable(Model model) {
        List<Show> shows = showService.getAvailableShows();
        List<Movie> movies = shows.stream().map(Show::getMovie).distinct().toList();
        model.addAttribute("shows", shows);
        model.addAttribute("movies", movies);
        LoggerFactory.getLogger(ShowPageController.class).info("Available shows: " + shows + " size: " + shows.size());
        return "shows/available";
    }
}

