package team3.meowie.crawler.controller;

import java.net.http.HttpTimeoutException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.checkerframework.common.reflection.qual.GetClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import team3.meowie.crawler.model.Comments;
import team3.meowie.crawler.model.Movielist;
import team3.meowie.crawler.model.TopMovielist;
import team3.meowie.crawler.service.CommentsService;
import team3.meowie.crawler.service.MovielistService;
import team3.meowie.crawler.service.TopMovielistService;
import team3.meowie.email.model.Email;
import team3.meowie.email.service.EmailService;
import team3.meowie.moviesSearch.model.Movie;
import team3.meowie.moviesSearch.service.MovieService;
import team3.meowie.show.service.ShowService;
import team3.meowie.ticket.service.TicketService;

@Controller
public class crawlerController {
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private MovielistService movielistService;
	@Autowired
	private TopMovielistService topMovielistService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ShowService showService;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private EmailService emailService;

	@ResponseBody
	@ExceptionHandler(java.net.http.HttpTimeoutException.class)
	public String handleError() {
		return "connection error";
	}

	@ResponseBody
	@GetMapping("crawler/comment/yahoo")
	public List<Comments> autoCrawlerCommentsFromYahoo(@RequestParam(name = "moviename") String moviename)
			throws HttpTimeoutException {
		commentsService.autoCrawlerCommentsFromYahoo(moviename);
		return commentsService.findComments(moviename);
	}

	@GetMapping("crawler/comment/yahoo/toplist")
	public String autoCrawlerToplistMovieCommentsFromYahoo() throws HttpTimeoutException {
		commentsService.autoCrawlerTopMovieslistCommentsFromYahoo(topMovielistService.todayTopMovielist());
		return "crawler/test";
	}

	@ResponseBody
	@GetMapping("crawler/toplist/yahoo")
	public List<TopMovielist> autoCrawlerTopMovielistFromYahoo() {
		return topMovielistService.autoCrawlerTopMovielistFromYahoo();
	}

	@ResponseBody
	@GetMapping("crawler/toplist/today")
	public List<TopMovielist> todayToplist() {
		return topMovielistService.todayTopMovielist();
	}

	@GetMapping("crawler/movielist/yahoo")
	public String autoCrawlerMovielistComingSoonFromYahoo() {
		movielistService.autoCrawlerMovielistComingSoonFromYahoo();
		return "crawler/test";
	}

	// 傳圖 測試用
	@GetMapping("crawler/movielist/id")
	public ResponseEntity<byte[]> autoCrawlerMovieFromYahoo(@RequestParam(name = "id") Integer id) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		Movielist rs = movielistService.findoneById(id);
		byte[] image = rs.getImage();
		return new ResponseEntity<>(image, headers, HttpStatus.OK);
	}

	@ResponseBody
	@GetMapping("crawler/movielist/{days}")
	public Map<LocalDate, Map<String, Integer>> movieRecommendList(@PathVariable("days") int days) {
		Map<LocalDate, Map<String, Integer>> recommendMovieList = topMovielistService.getNewRank(days);
		System.out.println(recommendMovieList);
		return recommendMovieList;
	}

	@ResponseBody
	@GetMapping("crawler/movielist/comingsoon")
	public Map<String, Movielist> addComingSoonMovie() {
		List<Movielist> findAll = movielistService.findAll();
		Map<String, Movielist> reMovielist = new HashMap<>();
		for (Movielist movie : findAll) {
			reMovielist.put(movie.getMoviename(), movie);
		}
		return reMovielist;
	}

	@ResponseBody
	@GetMapping("crawler/movielist/allMovieComments")
	public Map<String, List<Comments>> allMovieComments() throws HttpTimeoutException {
		List<Movie> allMovies = movieService.getAllMovies();
		List<String> allMovieName = new ArrayList<>();
		Map<String, List<Comments>> re = new HashMap<>();
		for (Movie movie : allMovies) {
			allMovieName.add(movie.getName());
		}
		for (String moviename : allMovieName) {
			commentsService.autoCrawlerCommentsFromYahoo(moviename);
			List<Comments> findComments = commentsService.findComments(moviename);
			re.put(moviename, findComments);
		}
		return re;
	}

	@ResponseBody
	@GetMapping("crawler/img/{moviename}")
	public String getImg(@PathVariable("moviename") String moviename) {
		return commentsService.searchImg(moviename);
	}

	@ResponseBody
	@GetMapping("crawler/imdb/comments")
	public List<Comments> getImdbComments(@RequestParam(name = "moviename") String moviename) {
		return commentsService.imdbComments(moviename);
	}

	@GetMapping("ticket/img/{moviename}")
	public ResponseEntity<byte[]> getImage(@PathVariable("moviename") String moviename) {
		String searchImg = commentsService.searchImg(moviename);
		RestTemplate restTemplate = new RestTemplate();
		byte[] imageBytes = restTemplate.getForObject(searchImg, byte[].class);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		headers.setContentLength(imageBytes.length);
		return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
	}
	@ResponseBody
	@GetMapping("ticket/today/totalsale")
	public Integer getTotalsale() {
		System.out.println(ticketService.getAllTicketByTime());
		return ticketService.getAllTicketByTime();
	}
	@ResponseBody
	@GetMapping("ticket/canva")
	public Map<LocalDate,Map<String,Integer>> getCanvaData(){
		return ticketService.getSumByMoviename();
	}
	@ResponseBody
	@GetMapping("ticket/today/seat")
	public String getSeat() {
		return ticketService.getSeatByDate();
	}
	@ResponseBody
	@GetMapping("ticket/hottest")
	public Map<String,Long>getHottest(){
		return ticketService.getHottestMovie();
	}
	@ResponseBody
	@GetMapping("ticket/seats")
	public Map<LocalDate,Map<String,Float>>getSeats(){
		return ticketService.getSeatByDates();
	}
	@ResponseBody
	@GetMapping("back/shortMessage")
	public List<Email> getAllEmails() {
	    return emailService.getAllEmails();
	}
}
