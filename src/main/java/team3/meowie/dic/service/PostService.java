package team3.meowie.dic.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.deser.Deserializers.Base;

import team3.meowie.dic.model.PostRepository;
import team3.meowie.dic.model.Posts;
import team3.meowie.dic.model.dto.PostDto;
import team3.meowie.member.model.User;

@Service
public class PostService {

    @Autowired
    private PostRepository postRepository;

    // Add post to db
    public void addPost(Posts posts) {
        postRepository.save(posts);

    }

    //-----------------------------
    public Posts getLatest() {
        return postRepository.findFirstByOrderByPostDateDesc();
    }

    public String getUsernameByPostId(Integer postId) {
        Posts post = findPostById(postId);
        User user = post.getUser();
        return user.getUsername();
    }

    public PostDto getPostDetailsByPostId(Integer postId) {
        Posts post = findPostById(postId);
        User user = post.getUser();
        String title = post.getTitle();
        Date postDate = post.getPostDate();
        //Date要先轉爲string
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedPostDate = sdf.format(postDate);
        String username = user.getUsername();
        String content = post.getContent();
        byte[] imageBytes = post.getImage();
        String imageBase64 = Base64.getEncoder().encodeToString(imageBytes);

        return new PostDto(postId, content, username, title, formattedPostDate, imageBase64);
    }
//--------------------test	

    public Posts findPostById(Integer id) {
        Optional<Posts> option = postRepository.findById(id);
        if (option.isEmpty()) {
            return null;
        }
        return option.get();

    }

    // Find post and pag
    public Page<Posts> findByPage(Integer pageNumber) {
        Pageable pgb = PageRequest.of(pageNumber - 1, 9, Sort.Direction.DESC, "PostDate");
        Page<Posts> page = postRepository.findAll(pgb);
        return page;
    }

    // Find post old to new
    public Page<Posts> findByPageOldToNew(Integer pageNumber) {
        Pageable pgb = PageRequest.of(pageNumber - 1, 9, Sort.Direction.ASC, "PostDate");
        Page<Posts> page = postRepository.findAll(pgb);
        return page;
    }

    // Find post new to old //back end
    public Page<Posts> findByPageNewToOld(Integer pageNumber) {
        Pageable pgb = PageRequest.of(pageNumber - 1, 9, Sort.Direction.DESC, "PostDate");
        Page<Posts> page = postRepository.findAll(pgb);
        return page;
    }

    // For infinite scroll //front-end
    public Page<Posts> findByPageNewToOld(Integer pageNumber, Integer pageSize) {
        // pageNumber是指頁頁數;pageSize是指一頁有幾筆
        PageRequest pageRequest = PageRequest.of(pageNumber - 1, pageSize, Sort.by(Sort.Direction.DESC, "PostDate"));
        return postRepository.findAll(pageRequest);
    }

    public Page<Posts> findByPageOldToNew(Integer pageNumber, Integer pageSize) {
        // pageNumber是指頁頁數;pageSize是指一頁有幾筆
        PageRequest pageRequest = PageRequest.of(pageNumber - 1, pageSize, Sort.by(Sort.Direction.ASC, "PostDate"));
        return postRepository.findAll(pageRequest);
    }

    // Search title and content /paging
    public Page<Posts> searchByKeywordForTitleAndContent(String keyword, Integer pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 9, Sort.Direction.DESC, "PostDate");
        Page<Posts> page = postRepository.findByTitleContainingOrContentContaining(keyword, keyword, pageable);
        return page;
    }

    // search by title
    public List<Posts> findByTitleContainingOrderByPostDateDesc(String keyword) {
        List<Posts> page = postRepository.findByTitleContainingOrderByPostDateDesc(keyword);
        return page;
    }

    //	透過使用者id查詢在不同討論區發表的所有文章
    public List<Posts> findPostsByUserId(Integer userId) {
        return postRepository.findAllPostsByUserId(userId);
    }


    // Update specify post
    @Transactional
    public Posts updatePostById(Integer id, String newTitle, String newContent, byte[] newImage) {
        Optional<Posts> option = postRepository.findById(id);

        if (option.isPresent()) {
            Posts posts = option.get();
            posts.setTitle(newTitle);
            posts.setContent(newContent);
            posts.setImage(newImage);
            return posts;
        }
        return null;
    }

    // Delete post
    public void deletePostById(Integer id) {
        postRepository.deleteById(id);
    }

    public List<Posts> getPostsSortedByComments() {
        List<Object[]> queryResult = postRepository.findAllPostsOrderByCommentsCountDesc();

        List<Posts> posts = new ArrayList<>();
        for (Object[] row : queryResult) {
            Posts post = new Posts();
            post.setPostID((Integer) row[0]);
            post.setTitle((String) row[1]);
            post.setContent((String) row[2]);
            post.setImage((byte[]) row[3]);
            posts.add(post);
        }

        return posts;
    }

}
