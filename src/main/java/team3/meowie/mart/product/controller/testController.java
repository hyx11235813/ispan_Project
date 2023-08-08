package team3.meowie.mart.product.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * ClassName:testController
 * Description:
 * Create:2023/5/4 下午 01:27
 */
public class testController {

    @GetMapping("/product/kkkk")
    public String test(Model model) {
        model.addAttribute("ddd", "Hello JSP");
        return "product/test";
    }
}
