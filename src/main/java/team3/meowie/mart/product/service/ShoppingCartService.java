package team3.meowie.mart.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team3.meowie.mart.product.model.Product;
import team3.meowie.mart.product.model.ProductRepository;
import team3.meowie.mart.product.model.ShoppingCart;
import team3.meowie.mart.product.model.ShoppingCartRepository;
import team3.meowie.member.model.User;

import javax.xml.crypto.Data;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

/**
 * ClassName:ShoppingCartService
 * Description:
 * Create:2023/5/4 上午 07:29
 */
@Service
public class ShoppingCartService {

    @Autowired
    private ShoppingCartRepository shoppingCartRepository;

    @Autowired
    private ProductRepository productRepository;

    public void createShoppingCart(ShoppingCart shoppingCart, Integer userid , Integer productid ) {
        //shoppingCart的user_id

        //取產品id
        Optional<Product> pOption = productRepository.findById(userid);
        Product product = pOption.get();
        shoppingCart.setProduct(product);
        shoppingCart.setUnitPrice(product.getPrice());


        //取ShoppingCart的id
        Date date = new Date();
        String dateString = String.valueOf(date.getTime());
        shoppingCart.setShoppingCartId(dateString);
        // 儲存到資料庫
        shoppingCartRepository.save(shoppingCart);

    }

    public void deleteShoppingCart(List <ShoppingCart> shoppingcarts ) {
        shoppingCartRepository.deleteAll();
    }
    public List<ShoppingCart> findAll() {
        return shoppingCartRepository.findAll();
    }

    public void deleteShoppingCartById(String shopping_cart_id) {
        shoppingCartRepository.deleteById(shopping_cart_id);
    }

    //修改購物車
    @Transactional
    public void editShoppingCartById(ShoppingCart shoppingCart) throws IOException {
        Optional<ShoppingCart> option = shoppingCartRepository.findById(shoppingCart.getShoppingCartId());
        if (option.isPresent()) {
            ShoppingCart sc = option.get();
            sc.setQuantity(shoppingCart.getQuantity());
            shoppingCartRepository.save(sc);
        }
    }
        public void addShoppingCart(Integer productid, User user) {
            Product product = productRepository.findById(productid).get();
            ShoppingCart shoppingCart = new ShoppingCart();
            shoppingCart.setProduct(product);
            shoppingCart.setUser(user);
            shoppingCartRepository.save(shoppingCart);
        }





    }
//    public List<ShoppingCart> findAllbyUserId(User user) {
//        return shoppingCartRepository.findByUserId(user.getId());
//    }

