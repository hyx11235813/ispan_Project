package team3.meowie.ticket.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import team3.meowie.member.model.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PrePersist;
import javax.persistence.TypedQuery;

import java.util.Date;
import java.util.List;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, Long> {
	@PersistenceContext
	EntityManager entityManager = null;

	List<Ticket> findByShowShowId(Long showId);

	@Query("SELECT t FROM Ticket t JOIN t.show s WHERE s.showId = :showId")
	default List<Ticket> findAllByShowId(@Param("showId") Long showId) {
		TypedQuery<Ticket> query = entityManager
				.createQuery("SELECT t FROM Ticket t JOIN t.show s WHERE s.showId = :showId", Ticket.class);
		query.setParameter("showId", showId);
		return query.getResultList();
	}

//@Query
	List<Ticket> findTicketsByUser(User user);

	@Query
	Ticket findByTicketid(Long ticketId);

	@Query("SELECT t FROM Ticket t JOIN t.show s WHERE s.showId = :showId")
	List<Ticket> findTicketsByShow(Long showId);

	@Query(value = "select * from ticket t join showList s ON t.show_id = s.showid where s.time between :starttime and :endtime",nativeQuery = true)
	List<Ticket> findTicketByShowTime(@Param("starttime") LocalDate startdate,@Param("endtime")LocalDate endDate);
	
	@Query(value = "select CAST(s.time AS DATE) ,t.moviename,SUM(Case when t.payed = 1 then t.price else 0 end)as x "
			+ "from ticket t join showList s ON t.show_id = s.showid "
			+ "where CAST(s.time AS DATE) between :starttime and :endtime "
			+ "group by movieName ,CAST(s.time AS DATE)",nativeQuery = true)
	List<Object[]> findSumByMoviename(@Param("starttime")LocalDate startdate,@Param("endtime")LocalDate endDate);
	@Query(value = "select "
		    +"format(SUM(CAST(t.payed AS FLOAT))/COUNT(t.payed),'P2')"
		    +"from ticket t "
		    +"join showList s "
		    +"ON t.show_id = s.showid "
		    +"where CAST(s.time AS DATE) = :date "
		    +"GROUP BY CAST(s.time AS DATE)",nativeQuery = true)
	String findSeatByDate(@Param("date")LocalDate date);
	@Query(value = "select Top 1 t.movieName , SUM(Case when t.payed = 1 then t.price else 0 end)as hot "
			+"from ticket t join showList s ON t.show_id = s.showid "
			+"where CAST(s.time AS DATE) between :starttime and :endtime "
			+"group by movieName "
			+"order by hot DESC",nativeQuery = true)
	List<Object[]>findHottestMovie(@Param("starttime")LocalDate startdate,@Param("endtime")LocalDate endDate);
	@Query(value = "select CAST(s.time AS DATE),t.movieName,"
		    +"format(SUM(CAST(t.payed AS FLOAT))/COUNT(t.payed),'P2') as seat "
		    +"from ticket t "
		    +"join showList s "
		    +"ON t.show_id = s.showid "
		    +"where CAST(s.time AS DATE) between :startdate and :enddate "
		    +"GROUP BY CAST(s.time AS DATE),t.movieName",nativeQuery = true)
	List<Object[]> findSeatByDates(@Param("startdate")LocalDate startdate,@Param("enddate")LocalDate enddate);	    
}
