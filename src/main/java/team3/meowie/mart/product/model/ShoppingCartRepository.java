package team3.meowie.mart.product.model;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * ClassName:ShoppingCartRepository
 * Description:
 * Create:2023/5/4 上午 07:43
 */
public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, String> {


//    @Query(value="select * from ShoppingCart where product_id= :id and user_id= :uid",nativeQuery = true)
//    public Optional <ShoppingCart> findByPidandUid(Integer productId, Integer userId);

}
