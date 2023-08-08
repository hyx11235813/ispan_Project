package team3.meowie.moviesSearch.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team3.meowie.moviesSearch.model.Movie;
import team3.meowie.moviesSearch.model.MovieRepository;

@Service
public class MovieService {

	@Autowired
	private MovieRepository movieRepository;

	public List<Movie> getAllMovies() {
		return movieRepository.findAll();
	}

	public Movie getMovieById(Long id) {
		Optional<Movie> movie = movieRepository.findById(id);
		return movie.orElse(null);
	}

	public Movie addMovie(Movie movie) {
		return movieRepository.save(movie);
	}

	public Movie updateMovie(Long id, Movie movie) {
		Optional<Movie> existingMovie = movieRepository.findById(id);
		if (existingMovie.isPresent()) {
			movie.setId(id);
			return movieRepository.save(movie);
		} else {
			return null;
		}
	}

	public boolean deleteMovie(Long id) {
		Optional<Movie> existingMovie = movieRepository.findById(id);
		if (existingMovie.isPresent()) {
			movieRepository.deleteById(id);
			return true;
		} else {
			return false;
		}
	}
}
