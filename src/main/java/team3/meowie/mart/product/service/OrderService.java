package team3.meowie.mart.product.service;

import team3.meowie.ecpay.payment.integration.domain.AioCheckOutALL;
import team3.meowie.ecpay.payment.integration.AllInOne;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team3.meowie.mart.product.model.*;
import team3.meowie.member.service.IUserService;

import java.io.IOException;
import java.util.*;

/**
 * ClassName:OrderService
 * Description:
 * Create:2023/5/5 下午 03:23
 */
@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    IUserService iUserService;


    public List<Order> getOrdersForMember(Integer id) {
        return orderRepository.findByUserId(id);
    }

    @Transactional
    public void createOrder(Order order) {
        Date date = new Date();
        String dateString = String.valueOf(date.getTime());
        //建立id
        order.setOrderid(dateString);
        //建立日期
        order.setOrderdate(date);
        //建立訂單狀態
        order.setPaymentcondition("已付款");

        //建立訂單付款方式
        order.setPayment("信用卡");

        //將購物車內容加入訂單明細
        Set<OrderDetail> orderdetails = new HashSet<>();
        List<ShoppingCart> shoppingcarts = shoppingCartService.findAll();
        for (ShoppingCart shoppingCart : shoppingcarts) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);

            orderDetail.setUnitprice(shoppingCart.getUnitPrice());
            orderDetail.setQuantity(shoppingCart.getQuantity());
            orderDetail.setpOrderDetail(shoppingCart.getProduct());
            orderDetail.setOrder(order);
            orderdetails.add(orderDetail);
        }
        //先設定死會員id

;
        //計算訂單總金額
        Integer totalamount = 0;
        for (ShoppingCart shoppingCart : shoppingcarts) {
            totalamount += shoppingCart.getQuantity() * shoppingCart.getUnitPrice();
        }


        order.setTotalamount(totalamount);
        orderRepository.save(order);


        shoppingCartService.deleteShoppingCart(shoppingcarts);

    }

    //依訂單編號找訂單
    public Order findOrderById(String orderid) {
        Optional<Order> option = orderRepository.findById(orderid);
        if (option.isPresent()) {
            return option.get();
        }
        return null;
    }

    //找所有訂單
    public List<Order> findAllOrders() {
        return orderRepository.findAll();
    }

    //訂單詳細資料
    public List<OrderDetail> findOrderDetails() {
        return orderDetailRepository.findAll();
    }


    //查詢單筆訂單(依訂單編號)
    public Order findOrderByid(String orderid) {
        Optional<Order> option = orderRepository.findById(orderid);
            return option.get();
        }


    //更改訂單資料
    @Transactional
    public void updateOrderById(Order order) throws IOException {
        Optional<Order> option = orderRepository.findById(order.getOrderid());
        if (option.isPresent()) {
            Order oldOrder = option.get();
//            oldOrder.setOrdercondition(order.getOrdercondition());
        }
    }

    //綠界金流
    public String ecpayCheckout(Order order) {
        String uuId1 = UUID.randomUUID().toString();
        System.out.println(uuId1);
        String uuId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);
        System.out.println(uuId);

        AllInOne all = new AllInOne("");
        AioCheckOutALL obj = new AioCheckOutALL();
        obj.setMerchantID("3002607");
        obj.setMerchantTradeNo(uuId);
        obj.setMerchantTradeDate("2023/05/09 08:05:23");
//        String payamount= order.getTotalamount().toString();
//        obj.setTotalAmount(payamount);
        obj.setTotalAmount(order.getTotalamount().toString());
        obj.setTradeDesc("test Description");
        obj.setItemName("電影院商品");
        obj.setReturnURL("http://211.23.128.214:5000");
        // 交易結果回傳網址，只接受 https 開頭的網站，可以使用 ngrok	obj.setReturnURL("http://211.23.128.214:5000");
        obj.setNeedExtraPaidInfo("N");
        // 商店轉跳網址 (Optional)
        obj.setClientBackURL("http://localhost:8080/meow/product/front/showProducts");
        order.setPaymentcondition("已付款");
        String form = all.aioCheckOut(obj, null);


        return form;
    }

    public Page<Order> getOrdersPage(int page, int pageSize) {
        Pageable pageable = PageRequest.of(page, pageSize);
        return orderRepository.findAll(pageable);
    }


}



