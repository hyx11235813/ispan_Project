package team3.meowie.show.model;

import org.springframework.format.annotation.DateTimeFormat;
import team3.meowie.moviesSearch.model.Movie;
import team3.meowie.ticket.model.Ticket;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "showList")
public class Show {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long showId;


    public Long getShowId() {
        return showId;
    }


    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date time;

    @Column(nullable = false)
    private String cinema;

    @ManyToOne(targetEntity = Movie.class, fetch = FetchType.EAGER)
    private Movie movie;

    @OneToMany(mappedBy = "show", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Ticket> tickets = new ArrayList<>();


    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getCinema() {
        return cinema;
    }

    public void setCinema(String cinema) {
        this.cinema = cinema;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }
}