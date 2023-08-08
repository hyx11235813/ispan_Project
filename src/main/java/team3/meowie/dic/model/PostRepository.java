package team3.meowie.dic.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

//@Repository
public interface PostRepository extends JpaRepository<Posts, Integer> {

	// Search by title and content
	Page<Posts> findByTitleContainingOrContentContaining(String keyword1, String keyword2, Pageable pageable);

	// Search by title
	List<Posts> findByTitleContainingOrderByPostDateDesc(String keyword1);

	Posts findFirstByOrderByPostDateDesc();

	List<Posts> findAllByOrderByPostDateDesc();

	// Find user posts history
	// 查詢 Posts 和 users 兩個資料表，之間的關聯是user_id
	@Query("SELECT p FROM Posts p WHERE p.user.id = :user_id ORDER BY p.postDate DESC")
	List<Posts> findAllPostsByUserId(@Param("user_id") Integer user_id);

	// 評論數量由大到小
	@Query(value = "SELECT p.* " +
	        "FROM Posts p " +
	        "INNER JOIN (SELECT c.PostID, COUNT(c.CommentID) AS comment_count " +
	        "            FROM Comments c " +
	        "            GROUP BY c.PostID) subq " +
	        "ON p.PostID = subq.PostID " +
	        "ORDER BY subq.comment_count DESC, p.PostDate DESC",
	        nativeQuery = true)
	List<Posts> findAllPostsOrderByCommentsCountDescc();
	 
	//依照評論數量對文章進行排行
	@Query(value = "SELECT p.PostID, p.Title, p.Content, p.Image, COUNT(c.CommentID) as commentCount, p.user_id, u.username, u.name, p.PostDate " +
	        "FROM Posts p LEFT JOIN Comments c ON p.PostID = c.PostID " +
	        "JOIN users u ON p.user_id = u.user_id " +
	        "GROUP BY p.PostID, p.Title, p.Content, p.Image, p.user_id, u.username, u.name, p.PostDate " +
	        "ORDER BY commentCount DESC, p.PostID DESC", nativeQuery = true)

	List<Object[]> findAllPostsOrderByCommentsCountDesc();





}