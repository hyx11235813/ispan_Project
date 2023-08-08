package team3.meowie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import team3.meowie.moviesSearch.model.Movie;
import team3.meowie.moviesSearch.model.MovieRepository;
import team3.meowie.moviesSearch.service.MovieService;
import team3.meowie.show.model.Show;
import team3.meowie.show.model.ShowRepository;
import team3.meowie.show.service.ShowService;

import java.util.List;

@Controller
public class BackPageController {
@Autowired
private MovieRepository movieRepository;
@Autowired
private ShowRepository showRepository;
@Autowired
private ShowService showService;
@Autowired
private MovieService movieService;
//@Autowired
//private ticketService ticketService;
//@Autowired
//private ticketRepository ticketRepository;

	
	@GetMapping("/backIndex")
	public String backIndex() {
		return "NewBack/backIndex";
	}
	
	@GetMapping("/backMart")
	public String backMart() {
		return "NewBack/mart/blank";
	}
	@GetMapping("/backForum")
	public String backforum() {
		return "NewBack/forum/blank";
	}
	@GetMapping("/backMovies")
	public String backMovies() {
		return "NewBack/movies/BackMovieList";
	}
	
	@GetMapping("/backTickets")
	public String backTickets() {
		return "NewBack/tickets/AllShowPage";
	}

	@GetMapping("/backStickInsect")
	public String backStickInsect() {
		return "NewBack/crawler/blank";
	}
	@GetMapping("/backLadyBug")
	public String backLadyBug() {
		return "NewBack/crawler/blank2";
	}
	@GetMapping("/locust")
	public String locust() {
		return "NewBack/crawler/blank3";
	}
	@GetMapping("/jelly")
	public String jelly() {
		return "NewBack/crawler/blank4";
	}
}
