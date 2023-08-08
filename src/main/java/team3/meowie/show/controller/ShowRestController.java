//package team3.meowie.show.controller;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//import team3.meowie.moviesSearch.model.MovieRepository;
//import team3.meowie.show.model.Show;
//import team3.meowie.show.model.ShowRepository;
//import team3.meowie.show.service.ShowService;
//import team3.meowie.ticket.model.TicketRepository;
//import team3.meowie.ticket.service.TicketService;
//
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//@RestController
//public class ShowRestController {
//
//    @Autowired
//    TicketService ticketService;
//    @Autowired
//    TicketRepository ticketRepository;
//    @Autowired
//    private MovieRepository movieRepository;
//
//    @Autowired
//    private ShowRepository showRepository;
//    @Autowired
//    private ShowService showService;
//    private static final Logger LOGGER = LoggerFactory.getLogger(ShowPageController.class);
//
//    @PostMapping("/shows")//這個是按送出的事件
//public void addShow(@RequestParam Long movieId, @RequestParam String time, @RequestParam String cinema) throws ParseException {
//        Show show = new Show();
//        show.setMovie(movieRepository.findById(movieId).orElseThrow(() -> new IllegalArgumentException("Invalid movie id")));
//        show.setCinema(cinema);
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd' 'HH:mm");
//        Date date = formatter.parse(time);
//        show.setTime(date);
//
//    }
//}