package team3.meowie.mart.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team3.meowie.mart.product.model.OrderDetail;
import team3.meowie.mart.product.model.OrderDetailRepository;

/**
 * ClassName:OrderDetailService
 * Description:
 * Create:2023/5/6 下午 11:41
 */
@Service
public class OrderDetailService {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private ShoppingCartService shoppingCartService;


    @Transactional
    public void createOrderDetail(OrderDetail orderDetail) {

        orderDetailRepository.save(orderDetail);

    }
}
