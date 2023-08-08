package team3.meowie.show.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import team3.meowie.moviesSearch.model.Movie;
import team3.meowie.show.model.Show;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Repository
public interface ShowRepository extends JpaRepository<Show, Long> {


    List<Show> getShowsByShowId(Long movieId);


    String getCinemaByShowId(Long showId);


    @Query("SELECT s.showId FROM Show s")
    List<String> findAllId();

    @Query("SELECT DISTINCT s.movie FROM Show s")
    List<Movie> findDistinctMovies();

    List<Show> findByTimeAfter(Date time);
    }


