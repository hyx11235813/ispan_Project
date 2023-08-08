package team3.meowie.dic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team3.meowie.dic.model.Comment;
import team3.meowie.dic.model.CommentRepository;
import team3.meowie.dic.model.Posts;
import team3.meowie.dic.model.dto.CommentDto;
import team3.meowie.dic.service.CommentService;
import team3.meowie.dic.service.PostService;
import team3.meowie.member.model.User;
import team3.meowie.member.service.IUserService;

@Controller
public class CommentController {
 

	@Autowired
	private CommentService commentService;
	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	IUserService userService;
	@Autowired
	PostService postService;
	  
	//Save Comment to db
	@PostMapping("/dic/submitPost/commentPost")
	@ResponseBody
	public ResponseEntity<?> submitComment(@ModelAttribute("commentDto") CommentDto commentDto, Model model){
	    Comment comment = new Comment();
//	測試表單來的postID,我用表單綁定隱藏input，并在open modal的function中使用.val()給值，modal表達submit后這個controller一樣可以獲取到postID
//	    System.out.println(" postId: " + commentDto.getPostID());
	    
	    //先抓取commnetDto傳來的postID，在透過此ID去post找，最後在set到comment的裏面成一個json
	    Posts post=postService.findPostById(commentDto.getPostID());
	    comment.setContent(commentDto.getContent());	    
	    comment.setPost(commentDto.getPost());
	    comment.setPost(post);
	    comment.setCommentID(commentDto.getCommentID());
	    
	    String name = userService.getLoginUsername();
	    User user = userService.findUserByUsername(name);
	    comment.setUser(user);
	    
	    commentService.addComment(comment);
	    
	    model.addAttribute("commentDto", new CommentDto());
	    
  
	    // 
	    return ResponseEntity.ok().body(comment);
	}
	
	
	@GetMapping("/dic/getCommentsByPostId")
	@ResponseBody
	public ResponseEntity<List<CommentDto>>getCommentsByPostId(@RequestParam("postId")Integer postId){
		List<CommentDto> comments=commentService.getCommentsByPostId(postId);
		
		
		
		return ResponseEntity.ok(comments);
	}
	
	//jsp頁面載入就發送請求到這裏獲取登錄者id，這裏回傳json并讓js設爲全局變數以獲取數據
	@GetMapping("/dic/getloggedInUserId")
	public ResponseEntity<Integer>  getloggedInUserId(Model model) {
		String name=userService.getLoginUsername();
		User user=userService.findUserByUsername(name);
		Integer loggedInUserId = user.getId();
		 return ResponseEntity.ok(loggedInUserId);
//		model.addAttribute("loggedInUserId"+loggedInUserId);
//		return "discussion-frontend/discussion";
	} 
	@DeleteMapping("/dic/deleteComment")
	public ResponseEntity<Integer> deleteComment(@RequestParam("commentID") Integer commentID) {
	    try {
	        commentService.deleteCommentByCommentId(commentID);
	        return ResponseEntity.ok().build();
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}
	
 
		
	} 	
	
	
	
	
	
	
	
	

