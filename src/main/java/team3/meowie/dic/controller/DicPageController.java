package team3.meowie.dic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import team3.meowie.dic.model.dto.CommentDto;
import team3.meowie.dic.model.dto.PostDto;
import team3.meowie.member.service.UserService;

@Controller
public class DicPageController {
 @Autowired
 private UserService userService;
 
	@GetMapping("/dic/index")
	public String backendPage() {
		return "discussion-backend/index";
	}
       
	//backend
	@GetMapping("/dic/addArticle")
	public String showAddArticleForm(Model model) {
		model.addAttribute("postDto", new PostDto());
		return "discussion-backend/addArticle";
	}
	//frontend
	@GetMapping("/dic/movieList")
	public String movieListPage() {
		return "discussion-frontend/movieList";
		
	} 
	
	@GetMapping("/discussion-frontend/discussion")
	public String showDiscussionPage(Model model) {
		 model.addAttribute("postDto", new PostDto());
		 model.addAttribute("commentDto", new CommentDto());
		 		 
		 if (!userService.isLogin()) {
				return "redirect:/login";
			}
	    return "discussion-frontend/discussion";
	}
	

	
	
//	@GetMapping("/dic/notificationManagement")
//	public String notificationManagement() {
//		return "discussion-backend/notificationManagement";
//	}

	
	

}