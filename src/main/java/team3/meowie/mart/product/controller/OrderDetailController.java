package team3.meowie.mart.product.controller;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import team3.meowie.mart.product.model.OrderDetail;
import team3.meowie.mart.product.service.OrderDetailService;

/**
 * ClassName:OrderDetailController
 * Description:
 * Create:2023/5/9 上午 06:54
 */
@Controller
public class OrderDetailController {
    @Autowired
    private OrderDetailService orderDetailService;

    @PostMapping("/contact/createOrderdetail")

    public String createOrderDetail(OrderDetail orderDetail , Model model) {
        orderDetailService.createOrderDetail(orderDetail);
        model.addAttribute("orderDetail", orderDetail);





        return "/contact/createOrderdetail";
    }
}
