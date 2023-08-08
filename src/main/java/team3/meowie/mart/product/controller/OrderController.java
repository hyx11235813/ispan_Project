package team3.meowie.mart.product.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.ui.Model;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;
import team3.meowie.mart.product.model.Order;
import team3.meowie.mart.product.model.OrderDetail;
import team3.meowie.mart.product.model.ShoppingCart;
import team3.meowie.mart.product.service.OrderService;
import team3.meowie.mart.product.service.ShoppingCartService;
import team3.meowie.member.model.User;
import team3.meowie.member.service.UserService;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Set;



/**
 * ClassName:OrderController
 * Description:
 * Create:2023/5/5 下午 04:12
 */
@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
        UserService userService;



    //訂單列表
    @GetMapping("/orders")
    public String findAllOrder(@RequestParam(defaultValue = "0") int page, Model model) {
        //每頁顯示的訂單數量
        int pageSize = 10;
        Page<Order> orderPage = orderService.getOrdersPage(page, pageSize);
        List<Order> orders = orderPage.getContent();
        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", orderPage.getTotalPages());


//        List<Order> list = orderService.findAllOrders();
//        List<OrderDetail> list2 = orderService.findOrderDetails();
//        model.addAttribute("allorders", list);
//        model.addAttribute("orderdetails", list2);
        return "NewBack/mart/showOrders";


    }

    //單筆訂單
    @GetMapping("/orders/editorder")
    public String findOrderById(@RequestParam("id") String orderid, Model model) {
        Order ob = orderService.findOrderByid(orderid);
        System.out.println(ob);
        List<OrderDetail> list = orderService.findOrderDetails();
        System.out.println(list);
        model.addAttribute("singleorder", ob);
        model.addAttribute("orderdetails", list);
        return "/NewBack/mart/showOrders";
    }


    //修改訂單
    @PutMapping("/orders/edit")
    public String editOrderById(@ModelAttribute("singleorder") Order order) {
        try {
            orderService.updateOrderById(order);

        } catch (IOException e) {
            e.printStackTrace();

        }
        return "redirect:/orders";
    }

    //購物車列表
    @GetMapping("/orders/shoppingcart/shoppingcartdetail")
    public String findShoppingCartById(Model model) {
        List<ShoppingCart> list = shoppingCartService.findAll();
        model.addAttribute("order", new Order());
        model.addAttribute("shoppingcart", list);
        model.addAttribute("orderdetail", new OrderDetail());
        return "/product/test";
    }


//    @PostMapping("/orderdetail/create")
//    public String createOrderDetail(Model model) {
//        model.addAttribute("orderdetail", new OrderDetail());
//
//
//        return "/order/front/order";
//    }
    //新增單筆訂單
    @PostMapping("/orders/create")
    public String createOrder(@ModelAttribute("order") Order order, HttpSession session) throws JsonProcessingException {
        if(userService.isLogin()){order.setUser(userService.findUserByUsername(userService.getLoginUsername()));
        orderService.createOrder(order);
        Integer totalPrice = Integer.parseInt((String) session.getAttribute("totalPrice"));
        session.setAttribute("totalPrice", totalPrice);
        return "redirect:/contact/create";}else {
            return "redirect:/login";
        }
    }




    //新增聯絡人資料
    @GetMapping("/contact/create")
    public String createContact(Model model, HttpSession session) {
        model.addAttribute("orderDetail",new OrderDetail());
        Order order = (Order) session.getAttribute("order");

        model.addAttribute("order", order);
        Integer totalPrice = (Integer) session.getAttribute("totalPrice");
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("aaa", 15);
//        System.out.println("Total amount: " + order.getTotalamount());
        return "/order/front/contact";
    }



    @ResponseBody
    @PostMapping("/orders/ecpayCheckout")
    public String ecpayCheckout(@ModelAttribute("order") Order order, @RequestParam("TotalAmount") Integer totalAmount) {
        order.setTotalamount(totalAmount);
        String aioCheckOutALLForm = orderService.ecpayCheckout(order);
        return aioCheckOutALLForm;
    }

    //結帳controller
//    @ResponseBody
//    @PostMapping("shop/ecpayCheckout")
//    public String ecpayCheckout(@ModelAttribute("order") Order order,
//                                @CurrentSecurityContext(expression = "authentication")Authentication authentication){
//        //
//
//        return aioCheckOutALLForm;
//    }




}
