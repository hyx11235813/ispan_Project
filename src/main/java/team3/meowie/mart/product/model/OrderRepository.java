package team3.meowie.mart.product.model;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * ClassName:OrderRepository
 * Description:
 * Create:2023/5/5 下午 03:19
 */
public interface OrderRepository extends JpaRepository<Order, String> {
List<Order> findByUserId(Integer id);

List<Order> findByOrderid(String orderid);

}
