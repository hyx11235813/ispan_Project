package team3.meowie.show.service;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team3.meowie.moviesSearch.model.Movie;
import team3.meowie.moviesSearch.model.MovieRepository;
import team3.meowie.show.model.ShowRepository;
import team3.meowie.show.model.Show;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Date;
import java.util.logging.Logger;

@Service
public class ShowService {
java.util.logging.Logger Logger = java.util.logging.Logger.getLogger("ShowService");
    @Autowired
    private ShowRepository showRepository;

    @Autowired
    private MovieRepository movieRepository;

    @Transactional

    public List<Show> getAvailableShows() {
        return showRepository.findByTimeAfter(Date.from(LocalDateTime.now().minusMinutes(30).toLocalDate().atStartOfDay().atZone(java.time.ZoneId.systemDefault()).toInstant()));
    }
    public Show getShowById(Long id) {
        Logger.info(showRepository.findById(id).toString() + "getShowById");
        return showRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid show Id:" + id));
    }
}