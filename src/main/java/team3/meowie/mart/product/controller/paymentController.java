package team3.meowie.mart.product.controller;

import team3.meowie.ecpay.payment.integration.AllInOne;
import team3.meowie.ecpay.payment.integration.domain.AioCheckOutALL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team3.meowie.mart.product.model.Order;
import team3.meowie.mart.product.model.OrderDetail;
import team3.meowie.mart.product.model.OrderRepository;
import team3.meowie.mart.product.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * ClassName:paymentController
 * Description:
 * Create:2023/5/10 上午 04:01
 */



@Controller
public class paymentController {

    @Autowired
    OrderService orderService;

    @Autowired
    private OrderRepository orderRepository;

    @ResponseBody
    @GetMapping("/goECPay")
    public void goECPay(Model model, @NotNull HttpServletRequest request, @NotNull HttpServletResponse response, HttpSession session)
            throws IOException {

        Order order = (Order) request.getAttribute("order");
        // 設定金流
        AllInOne aio = new AllInOne("");
        AioCheckOutALL aioCheck = new AioCheckOutALL();
        // 特店編號
        aioCheck.setMerchantID("2000132");
        // 特店交易時間
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        sdf.setLenient(false);
        aioCheck.setMerchantTradeDate(sdf.format(new Date()));

        //交易金額
        aioCheck.setTotalAmount("9487");
//        aioCheck.setTotalAmount(order.getTotalamount().toString());
        aioCheck.setTradeDesc("測試交易描述");

        //商品名稱
        aioCheck.setItemName("測試商品");
        aioCheck.setMerchantTradeNo("Test998704444");
//        aioCheck.setMerchantTradeNo("Test" + order.getOrderid());
        aioCheck.setReturnURL("http://localhost:8080/ECpay/return");
        aioCheck.setOrderResultURL("http://localhost:8080/ECpay/result");
        // 出輸畫面
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        out.println(aio.aioCheckOut(aioCheck, null));

    }

    //綠界回傳
    @PostMapping("/ECpay/return")
    public String returnURL(@RequestParam("MerchantTradeNo") String MerchantTradeNo,
                            @RequestParam("RtnCode") int RtnCode,
                            @RequestParam("TradeAmt") int TradeAmt,
                            Model model, HttpServletRequest request) {

        if (RtnCode == 1) {
            String orderid = MerchantTradeNo.substring(13);
            Order order= orderService.findOrderByid(orderid);
            order.setPayment("已付款");
            orderRepository.save(order);
        }
        //這邊需要返回視圖嗎??
return "redirect:/orders";
    }



    //查詢歷史訂單
    @PostMapping("/ECPay/showHistory")
    public String showECPAYHistoryOrder(Model model, HttpServletRequest request) {
        //取得使用者資料
        Integer memberid = 1;
        //取得使用者的訂單
        List<Order> orders = orderService.getOrdersForMember(memberid);
        //取出訂單詳細資料
        Map<Integer, Set<OrderDetail>> orderDetailsGroup = new HashMap<Integer, Set<OrderDetail>>();
        for(Order order : orders) {
            String orderid= order.getOrderid();
            Set<OrderDetail> orderDetails = order.getOrderDetails();
            orderDetailsGroup.put(Integer.parseInt(orderid), orderDetails);
        }
//        String orderid = request.getParameter("orderid");
//        Order order = orderService.findOrderByid(orderid);
        model.addAttribute("oder_list", orders);
        model.addAttribute("order", orderDetailsGroup);
        return "/order/showHistoryOrder";
    }
}
