package team3.meowie.dic.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import team3.meowie.dic.model.PostRepository;
import team3.meowie.dic.model.Posts;
import team3.meowie.dic.model.dto.CommentDto;
import team3.meowie.dic.model.dto.PostDto;
import team3.meowie.dic.service.CommentService;
import team3.meowie.dic.service.PostService;
import team3.meowie.member.model.User;
import team3.meowie.member.service.IUserService;

@Controller
public class PostController {

    @Autowired
    private PostService postService;
    @Autowired
    private PostRepository postRepository;
    @Autowired
    IUserService userService;
    @Autowired
    CommentService commentService;

    // Submit Post
    @GetMapping("/dic/submitPost")
    public String displayForm(Model model) {
        model.addAttribute("postForm", new PostDto());
        return "discussion-backend/addArticle";
    }

    // Submit Post to DB
    @PostMapping("/dic/submitPost/post")
    public String submitPost(@ModelAttribute("postDto") PostDto postDto, Model model) {
        Posts posts = new Posts();
        posts.setTitle(postDto.getTitle());
        posts.setContent(postDto.getContent());

        MultipartFile imageFile = postDto.getImage();
        byte[] imageData = null;
        if (imageFile != null) {
            try {
                imageData = imageFile.getBytes();
            } catch (IOException e) {
                e.printStackTrace();
            }
            posts.setImage(imageData);
        }
        String name = userService.getLoginUsername();
        User user = userService.findUserByUsername(name);
        posts.setUser(user);
        postService.addPost(posts);
        model.addAttribute("postDto", new PostDto());
        return "redirect:/dic/showAllPosts";

    }

    //	 Find all post and paging
    @GetMapping("/dic/showAllPosts")
    public String ShowAllPosts(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {

        Page<Posts> page = postService.findByPage(pageNumber);
        for (Posts post : page.getContent()) {
            byte[] imageData = post.getImage();
            if (imageData != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                post.setBase64Image(base64Image);
            }
        }
        model.addAttribute("page", page);

        return "NewBack/forum/dicBack";
    }

    // Edit post
    @GetMapping("/dic/post/edit")
    public String postEdit(@RequestParam("postID") Integer postID, Model model) {
        Posts posts = postService.findPostById(postID);
        String base64Image = Base64.getEncoder().encodeToString(posts.getImage());
        posts.setBase64Image(base64Image);
        model.addAttribute("post", posts);
        return "NewBack/forum/blank";
    }

    // Update post
    @PutMapping("/dic/post/edit")
    public String putPost(@ModelAttribute("postDto") PostDto postDto) {
        MultipartFile imageFile = postDto.getImage();
        byte[] imageData = null;

        if (imageFile != null && !imageFile.isEmpty()) {
            try {
                imageData = imageFile.getBytes();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            // 如果未提交新圖片，保留原始圖片
            imageData = postService.findPostById(postDto.getPostID()).getImage();
        }
        postService.updatePostById(postDto.getPostID(), postDto.getTitle(), postDto.getContent(), imageData);
        return "redirect:/dic/showAllPosts";
    }

    // Delete Post
    @DeleteMapping("/dic/post/delete")
    public String deletePost(@RequestParam Integer id) {
        postService.deletePostById(id);
        return "redirect:/dic/showAllPosts";
    }

    @DeleteMapping("/dic/historyPost/delete")
    public ResponseEntity<?> historyPost(@RequestParam Integer id) {
        postService.deletePostById(id);
        return ResponseEntity.ok().build(); // 創建一個具有 200 OK HTTP 狀態碼的 ResponseEntity 返回給ajax，否則會有錯誤
    }

    // search posts
    @GetMapping("/dic/showAllPosts/search")
    public String searchForTitleAndContent(@RequestParam("keyword") String keyword, @RequestParam(name = "page", defaultValue = "1") Integer pageNumber, Model model) {
        try {
//			System.out.println("Keyword: " + keyword);
//			System.out.println("Page number: " + pageNumber);
            Page<Posts> page = postService.searchByKeywordForTitleAndContent(keyword, pageNumber);
//			System.out.println("Search results: " + page.getContent().size());

            for (Posts post : page.getContent()) {
                byte[] imageData = post.getImage();
                if (imageData != null) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    post.setBase64Image(base64Image);
                }
            }
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "discussion-backend/searchResults";
    }

    // Ajax /search by keywords for title
    @GetMapping(value = "/dic/showAllPosts/searchTitle", produces = "application/json")
    public ResponseEntity<List<Posts>> searchTitle(@RequestParam("keyword") String keyword) {
        List<Posts> posts = null;
        try {
//			System.out.println("Keyword: " + keyword);
            posts = postService.findByTitleContainingOrderByPostDateDesc(keyword);

//			System.out.println("Search results: " + posts.size());

            for (Posts post : posts) {
                byte[] imageData = post.getImage();
                if (imageData != null) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    post.setBase64Image(base64Image);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // If null return empty json//if not return page(json)
        return ResponseEntity.ok(posts != null ? posts : Collections.emptyList());
    }

    // Frontend--------------------------------------------------------------------


    // User add post
    @PostMapping("/dic/user/posts/addPost")
    public String userAddPost(@ModelAttribute PostDto postDto, Model model) {
        Posts posts = new Posts();
        posts.setTitle(postDto.getTitle());
        posts.setContent(postDto.getContent());

        if (!userService.isLogin()) {
            return "redirect:/login";
        }
        String name = userService.getLoginUsername();
        User user = userService.findUserByUsername(name);

        MultipartFile imageFile = postDto.getImage();
        byte[] imageData = null;
        if (imageFile != null) {
            try {
                imageData = imageFile.getBytes();
            } catch (IOException e) {
                e.printStackTrace();
            }

            posts.setImage(imageData);
        }
        model.addAttribute("commentDto", new CommentDto());
        posts.setUser(user);// ------------測試
        postService.addPost(posts);
        return "redirect:/discussion-frontend/discussion";

    }

    // Frontend user edit
    // post--------------------------------------------------------


    @GetMapping("/dic/user/posts/edit")
    public ResponseEntity<Posts> showEditPostForm(@RequestParam Integer postID) {
        Posts posts = postService.findPostById(postID);
        return ResponseEntity.ok(posts);
    }

    //在評論的modal上顯示文章
    @GetMapping("/dic/user/posts/comment")
    public ResponseEntity<PostDto> showCommentOnModal(@RequestParam Integer postID) {
        PostDto postDto = postService.getPostDetailsByPostId(postID);
        return ResponseEntity.ok(postDto);
    }

    // User edit post
    @PostMapping("dic/user/posts/edit") // 使用者在 modal編輯後會發送時會透過 action傳資料過來
    public String editPost(@ModelAttribute PostDto postDto) {

        MultipartFile imageFile = postDto.getImage();
        byte[] imageData = null;
        if (imageFile != null && !imageFile.isEmpty()) {
            try {
                imageData = imageFile.getBytes();
            } catch (IOException e) {
                e.printStackTrace();
            }

        } else {
            imageData = postService.findPostById(postDto.getPostID()).getImage();
        }

        Posts posts = postService.findPostById(postDto.getPostID());

        if (posts != null) {
            postService.updatePostById(postDto.getPostID(), postDto.getTitle(), postDto.getContent(), imageData);
        }
        // 使用者發送編輯後，會轉跳的頁面
        return "discussion-frontend/discussion";

    }

    // 使用者在發文記錄編輯透過 action更新資料
    @PostMapping("dic/user/posts/historyEdit") // 使用者在 modal編輯後會發送時會透過 action傳資料過來
    public String historyEdit(@ModelAttribute PostDto postDto) {

        MultipartFile imageFile = postDto.getImage();
        byte[] imageData = null;
        if (imageFile != null && !imageFile.isEmpty()) {
            try {
                imageData = imageFile.getBytes();
            } catch (IOException e) {
                e.printStackTrace();
            }

        } else {
            imageData = postService.findPostById(postDto.getPostID()).getImage();
        }

        Posts posts = postService.findPostById(postDto.getPostID());

        if (posts != null) {
            postService.updatePostById(postDto.getPostID(), postDto.getTitle(), postDto.getContent(), imageData);
        }
        // 使用者發送編輯後，會轉跳的頁面
        return "redirect:/dic/userPostHistory";

    }

    // 搜尋使用者id發表過的文章----------5/9---------test.ok抓取到該 userid 發表的文章---
    @GetMapping("/dic/userPostHistory")
    public String userPostHistoryPage(Model model) {

        String userName = userService.getLoginUsername();
        User user = userService.findUserByUsername(userName);
        Integer userId = user.getId();
        List<Posts> userPosts = postService.findPostsByUserId(userId);

        if (userPosts == null || userPosts.isEmpty()) {// test： 空列表不算是 null 而是empty
            System.out.println("not found by userid");
        }
        for (Posts post : userPosts) {
//			System.out.println("Post IDd: " + post.getPostID() + ", Title: " + post.getTitle() + ",content:"
//					+ post.getContent() + ",image:" + post.getImage());
            byte[] imageData = post.getImage();
            if (imageData != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                post.setBase64Image(base64Image);
                System.out.println("base64Image" + base64Image);
            }
        }
        model.addAttribute("userPosts", userPosts);
        return "discussion-frontend/userPostHistory";
    }
//-----------------------------------------

    @GetMapping({"/dic/user/posts/list", "/dic/user/posts/addPostPage"})
    public String UserPosts(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {

        Page<Posts> page = postService.findByPage(pageNumber);
        for (Posts post : page.getContent()) {
            byte[] imageData = post.getImage();
            if (imageData != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                post.setBase64Image(base64Image);
            }
        }
        // for addPostPage
        model.addAttribute("postDto", new PostDto());
        // for user commnet
        model.addAttribute("commentDto", new CommentDto());

        // for posts list
        model.addAttribute("page", page);

        return "discussion-frontend/discussion";
    }
    @GetMapping(value = "/dic/user/posts/scroll", produces = "application/json")
    public ResponseEntity<List<Posts>> InfiniteScroll(@RequestParam(name = "pageNumber", defaultValue = "1") Integer pageNumber, @RequestParam(name = "pageSize", required = false) Integer pageSize) {
        if (pageSize == null) {
            pageSize = 5; // load pages number
        }
        Page<Posts> page = postService.findByPageNewToOld(pageNumber, pageSize);
        List<Posts> postList = page.getContent();

        List<Object[]> commentsCountList = commentService.getCommentsCountPerPost();
        Map<Integer, Integer> commentsCountMap = commentsCountList.stream().collect(Collectors.toMap(arr -> (Integer) arr[0], arr -> ((Long) arr[1]).intValue()));

        for (Posts post : postList) {
            byte[] imageData = post.getImage();
            if (imageData != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                post.setBase64Image(base64Image);
            }
            Integer commentsCount = commentsCountMap.getOrDefault(post.getPostID(), 0);
            post.setCommentsCount(commentsCount);
//            System.out.println("新到舊@GetMapping/  Post ID: " + post.getPostID() + ", Title: " + post.getTitle() + ", User ID: " + post.getUser().getId() + ",name: " + post.getUser().getName());
        }

        return ResponseEntity.ok(postList);
    }


    /// Infinite scroll----------------------Old to new

    @GetMapping(value = "/dic/user/posts/scroll/old", produces = "application/json")
    public ResponseEntity<List<Posts>> InfiniteScrollOld(@RequestParam(name = "pageNumber", defaultValue = "1") Integer pageNumber, @RequestParam(name = "pageSize", required = false) Integer pageSize) {
        if (pageSize == null) {
            pageSize = 5;
        }
        Page<Posts> page = postService.findByPageOldToNew(pageNumber, pageSize);
        List<Posts> postList = page.getContent();

        List<Object[]> commentsCountList = commentService.getCommentsCountPerPost();
        Map<Integer, Integer> commentsCountMap = commentsCountList.stream().collect(Collectors.toMap(arr -> (Integer) arr[0], arr -> ((Long) arr[1]).intValue()));

        for (Posts post : postList) {
            byte[] imageData = post.getImage();
            if (imageData != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                post.setBase64Image(base64Image);
            }
            Integer commentsCount = commentsCountMap.getOrDefault(post.getPostID(), 0);
            post.setCommentsCount(commentsCount);

//            System.out.println("舊到新@GetMapping/  Post ID: " + post.getPostID() + ", Title: " + post.getTitle() + ", User ID: " + post.getUser().getId() + ",name: " + post.getUser().getName());
        }

        return ResponseEntity.ok(postList);
    }

    // 文章依照評論數量來排序
    @GetMapping("/dic/user/posts/scroll/comments")
    public ResponseEntity<List<Posts>> getPostsSortedByComments() {
        List<Object[]> queryResult = postRepository.findAllPostsOrderByCommentsCountDesc();

        List<Object[]> commentsCountList = commentService.getCommentsCountPerPost();
        Map<Integer, Integer> commentsCountMap = commentsCountList.stream().collect(Collectors.toMap(arr -> (Integer) arr[0], arr -> ((Long) arr[1]).intValue()));

        List<Posts> posts = new ArrayList<>();
        for (Object[] row : queryResult) {
            Posts post = new Posts();
            post.setPostID((Integer) row[0]);
            post.setTitle((String) row[1]);
            post.setContent((String) row[2]);
            post.setImage((byte[]) row[3]);
            post.setPostDate((Date) row[8]);
            User user = new User();
            user.setId(row[5] != null ? (Integer) row[5] : null);
            user.setUsername(row[6] != null ? (String) row[6] : null);
            user.setName(row[7] != null ? (String) row[7] : null);
            post.setUser(user);

            Integer commentsCount = commentsCountMap.getOrDefault(post.getPostID(), 0);
            post.setCommentsCount(commentsCount);
            byte[] imageData = post.getImage();
            if (imageData != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                post.setBase64Image(base64Image);
            }
            posts.add(post);
        }

        return ResponseEntity.ok(posts);
    }

}




