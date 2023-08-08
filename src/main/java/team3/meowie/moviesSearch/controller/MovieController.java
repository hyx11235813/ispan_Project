package team3.meowie.moviesSearch.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team3.meowie.moviesSearch.model.Movie;
import team3.meowie.moviesSearch.model.MovieRepository;

@RestController
@RequestMapping("/api/movies")
public class MovieController {

	@Autowired
	private MovieRepository movieRepository;

	 // 全部搜尋
	@GetMapping
	public List<Movie> getAllMovies() {
		return movieRepository.findAll();
	}
	
	 @GetMapping("/movies")
	    public List<Movie> getLimitedMovies(@RequestParam(value = "limit", defaultValue = "10") int limit) {
	        List<Movie> movies = movieRepository.findAll();
	        return movies.stream().limit(limit).collect(Collectors.toList());
	    }

	// 單筆搜尋
	@GetMapping("/{id}")
	public Optional<Movie> getMovieById(@PathVariable Long id) {
		return movieRepository.findById(id);
	}

	// 創建
	@PostMapping
	public Movie addMovie(@RequestBody Movie movie) {
		return movieRepository.save(movie);
	}

	// 更新
	@PutMapping("/{id}")
	public Movie updateMovie(@PathVariable Long id, @RequestBody Movie updatedMovie) {
		Movie movie = movieRepository.findById(id).orElseThrow(() -> new RuntimeException("Movie not found"));
		movie.setName(updatedMovie.getName());
		movie.setDirector(updatedMovie.getDirector());
		movie.setActors(updatedMovie.getActors());
		movie.setLength(updatedMovie.getLength());
		movie.setDescription(updatedMovie.getDescription());
		return movieRepository.save(movie);
	}

	// 刪除
	@DeleteMapping("/{id}")
	public void deleteMovie(@PathVariable Long id) {
		movieRepository.deleteById(id);
	}
	
}
