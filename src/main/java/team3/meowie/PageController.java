package team3.meowie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import team3.meowie.dic.model.PostRepository;
import team3.meowie.dic.model.Posts;
import team3.meowie.dic.service.PostService;
import team3.meowie.mart.product.model.Product;
import team3.meowie.mart.product.model.ProductRepository;
import team3.meowie.mart.product.service.ProductService;

@Controller
public class PageController {
	
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductService productService;
    
    @Autowired
	private PostService postService;
	@Autowired
	private PostRepository postRepository;
    
    
    @GetMapping("/")
    public String index(Model model) {
    	List<Posts> posts = postRepository.findAllByOrderByPostDateDesc();
        model.addAttribute("posts", posts);
    	
        List<Product> products = productRepository.findAllByOrderByAddedDesc();
        model.addAttribute("products", products);
        return "index";
    }
    @GetMapping(value = "/indexProductIMG/{id}") //顯示圖片
    public ResponseEntity<byte[]> getCoverImage(@PathVariable("id") Integer id) {
        byte[] image = productService.getProductById(id);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);
        headers.setContentLength(image.length);
        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }

    @GetMapping("/forum")
    public String forum() {
        return "forum";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @Controller
    public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController {

        @RequestMapping("/error")
        public ModelAndView handleError(HttpServletRequest request) {
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("errorMsg", "發生錯誤，請稍後再試。");
            modelAndView.setViewName("error");
            return modelAndView;
        }

        public String getErrorPath() {
            return "/error";
        }
    }

    @GetMapping("/Movies/search")
    public String tmdbAPI() {
        return "Movie/tmdb";
    }

//    @GetMapping("/test")
//    public String test() {
//        return "search/Search";
//    }

}
