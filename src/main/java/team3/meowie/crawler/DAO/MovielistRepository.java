package team3.meowie.crawler.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import team3.meowie.crawler.model.Movielist;

public interface MovielistRepository extends JpaRepository<Movielist, Integer> {

	@Modifying
	@Query(value = "DBCC CHECKIDENT('crawlerMovielist', RESEED, 0)", nativeQuery = true)
	void resetId();
}
