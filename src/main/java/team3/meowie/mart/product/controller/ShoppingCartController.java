package team3.meowie.mart.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import team3.meowie.mart.product.model.Product;
import team3.meowie.mart.product.model.ProductRepository;
import team3.meowie.mart.product.model.ShoppingCart;
import team3.meowie.mart.product.service.ProductService;
import team3.meowie.mart.product.service.ShoppingCartService;
import team3.meowie.member.model.User;
import team3.meowie.member.service.IUserService;
import team3.meowie.member.service.UserService;

import java.io.IOException;
import java.util.List;

/**
 * ClassName:ShoppingCartController
 * Description:
 * Create:2023/5/4 上午 07:28
 */

//@RequestMapping("/cart")
@Controller
public class ShoppingCartController {
    @Autowired
    IUserService userService;
    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    private ProductService productService;
@Autowired
ProductRepository productRepository;

    //購物車列表
//    @GetMapping("/product/shoppingcart")
    @GetMapping("/product/shoppingcart")
    public String findAll(Model model) {
        List<ShoppingCart> shoppingcarts = shoppingCartService.findAll();
        model.addAttribute("shoppingcarts", shoppingcarts);
        return "/product/shoppingcart";
    }

@PostMapping("/product/shoppingcart/add")
    public String addShopcart(@RequestParam("product")Product product) {
    shoppingCartService.addShoppingCart(product.getId(), userService.findUserByUsername(userService.getLoginUsername()));
    return "redirect:/product/shoppingcart";}





    //刪除購物車
//    @DeleteMapping("/product/shoppingcart/delete")
    @DeleteMapping("/product/shoppingcart/delete")
    public String deleteBySCId(@RequestParam("id") String shoppingCartId) {
        shoppingCartService.deleteShoppingCartById(shoppingCartId);
        return "redirect:/product/shoppingcart";
    }

    //修改購物車
//    @PutMapping("/product/shoppingcart")
    @PutMapping("/product/shoppingcart")
    public String editBySCId(@ModelAttribute("shoppingcart")ShoppingCart shoppingcart) {
        try {
            shoppingCartService.editShoppingCartById(shoppingcart);
        }catch(IOException e) {
            e.printStackTrace();
        }
        return "redirect:/product/shoppingcart";
    }

//創立購物車，並將畫面重新導向商品詳細頁面
//    @PostMapping("/shoppingcarts/create")
//    public String createShoppingCart(@RequestParam("id")Integer productid) {
//        shoppingCartService.createShoppingCart(shoppingcart,id);



//        return "redirect:/front/product/details/"+id+"#";
//        return "redirect:/product/showProductsPage";
    }





