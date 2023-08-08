package team3.meowie.crawler.DAO;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import team3.meowie.crawler.model.TopMovielist;

public interface ToplistRepository extends JpaRepository<TopMovielist, Integer> {
	
	//重置table的id
	@Modifying
	@Query(value = "DBCC CHECKIDENT('crawlerTopMovielist', RESEED, 0)", nativeQuery = true)
	void resetId();
	
	List<TopMovielist> findByAdded(Date date);
	
}
