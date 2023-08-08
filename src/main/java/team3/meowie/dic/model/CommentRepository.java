package team3.meowie.dic.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CommentRepository extends JpaRepository<Comment, Integer> {

	
	 @Query("SELECT c FROM Comment c JOIN FETCH c.user WHERE c.post.postID = :postID")
	    List<Comment> findByPost_PostID(Integer postID);
	
//	
	@Query("SELECT c.post.postID, COUNT(c) FROM Comment c GROUP BY c.post.postID")
	List<Object[]> findCommentsCountPerPost();

	

}
