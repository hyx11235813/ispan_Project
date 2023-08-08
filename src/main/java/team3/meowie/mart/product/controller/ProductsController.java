package team3.meowie.mart.product.controller;

import org.hibernate.AssertionFailure;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import team3.meowie.mart.product.model.Category;
import team3.meowie.mart.product.model.Product;
import team3.meowie.mart.product.model.ProductRepository;
import team3.meowie.mart.product.service.ProductService;

import javax.persistence.Id;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;



/**
 * ClassName:ProductsController
 * Description:
 * Create:2023/4/27 下午 07:26
 */
@Controller
public class ProductsController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private static final Logger log = LoggerFactory.getLogger(ProductsController.class);

//    @GetMapping("/product/pig")
//    public String pig(Model model) {
//        model.addAttribute("ddd", "Hello JSP");
//        return "product/storeindex";
//    }

    @GetMapping("/product/index")
    public String hello(Model model) {
        model.addAttribute("message", "Hello JSP");
        return "product/index";
    }

    @GetMapping("/product/add")
    public String addProduct(Model model) {
        model.addAttribute("product", new Product());
        List<Category> categoryList = productService.getCategoryList();
        model.addAttribute("categoryList", categoryList);
        System.out.println(categoryList);

        Product latest = productService.getLatest();
        model.addAttribute("latest", latest);
        return "NewBack/mart/blankaddProduct";
    }


    @PostMapping("/product/post")
    public String postProduct(Product product, Model model)throws IOException {
        product.setCoverImage(product.getImageFile().getBytes());

        productService.addProduct(product);


        model.addAttribute("product", new Product());

        Product latest = productService.getLatest();
        model.addAttribute("latest", latest);
//        return "NewBack/mart/showProductsPage";
        return "redirect:/product";
    }


    @GetMapping("/product")
    public String goShowProducts(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
        Page<Product> page = productService.findByPage(pageNumber);
        model.addAttribute("page", page);
        Product latest = productService.getLatest();
        model.addAttribute("latest", latest);
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        return "NewBack/mart/showProductsPage";
    }

    @DeleteMapping("/product/delete")
    public String deleteProductById(@RequestParam Integer id) {
        productService.deleteProductById(id);
        return "redirect:/product";
    }

    @GetMapping("/product/update") //
    public String updateProductById(@RequestParam("id") Integer id, Model model) {
//        Product product = productService.findProductById(id);
        model.addAttribute("product", productService.findProductById(id));
        return "product/updateProductPage";
    }

    @PutMapping("/product/editpage")
    public String putEditedProduct(@ModelAttribute("product") Product product) throws IOException {
        product.setCoverImage(product.getImageFile().getBytes());

            productService.updateById(product);


        return "redirect:/product";

    }

    @GetMapping(value = "/product/{id}") //顯示圖片
    public ResponseEntity<byte[]> getCoverImage(@PathVariable("id") Integer id) {
        byte[] image = productService.getProductById(id);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);
        headers.setContentLength(image.length);
        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }



}


