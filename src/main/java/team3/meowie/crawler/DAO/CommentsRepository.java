package team3.meowie.crawler.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import team3.meowie.crawler.model.Comments;

public interface CommentsRepository extends JpaRepository<Comments, Integer> {
		@Query(value = "from Comments where moviename=:moviename")
		public List<Comments> findByMoviename(@Param(value="moviename")String moviename);
}
