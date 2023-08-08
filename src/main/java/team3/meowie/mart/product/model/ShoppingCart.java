package team3.meowie.mart.product.model;

import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import team3.meowie.member.model.User;

import javax.persistence.*;
import java.util.Date;

/**
 * ClassName:CartItem
 * Description:
 * Create:2023/5/4 上午 04:54
 */
@Entity
@Table(name = "shoppingCart")
public class ShoppingCart {

    @Id
    @Column(name = "shopping_cart_id")
    private String shoppingCartId;


    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "unit_price")
    private Integer unitPrice;

    @ManyToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name = "id")
    private Product product;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name="user_id")
    private User user;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "settime", columnDefinition = "datetime", nullable = false)
    private Date settime;

    @PrePersist
    public void onCreate() {
        if(settime  == null) {
            settime = new Date();
        }
    }

    public ShoppingCart() {
    }



    public String getShoppingCartId() {
        return shoppingCartId;
    }

    public void setShoppingCartId(String shoppingCartId) {
        this.shoppingCartId = shoppingCartId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Date getSettime() {
        return settime;
    }

    public void setSettime(Date settime) {
        this.settime = settime;
    }

    public ShoppingCart(String shoppingCartId, Integer quantity, Integer unitPrice, Product product, Date settime) {
        this.shoppingCartId = shoppingCartId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.product = product;
        this.settime = settime;
    }
}
