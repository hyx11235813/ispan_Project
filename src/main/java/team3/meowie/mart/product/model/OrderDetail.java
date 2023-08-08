package team3.meowie.mart.product.model;

import javax.persistence.*;

/**
 * ClassName:OrderDetail
 * Description:
 * Create:2023/5/5 下午 03:02
 */
@Entity
@Table(name = "orderDetail")
public class OrderDetail {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderDetailId;


    @Column(name="unitprice")
    private Integer unitPrice;


    @Column(name="quantity")
    private Integer quantity;


    @ManyToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name="order_id")
    private Order order;

    //雙向多對一
    @ManyToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name="id")
    private Product pOrderDetail;

    public OrderDetail() {
    }


    public OrderDetail(Integer orderDetailId, String userName, String userPhone, Integer unitPrice, String receiveName, String receivePhone, String receiveAddress, Integer quantity, String userEmail, String receiveEmail, Order order, Product pOrderDetail) {
        this.orderDetailId = orderDetailId;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.order = order;
        this.pOrderDetail = pOrderDetail;
    }

    public Integer getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }


    public Integer getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Integer getUnitprice() {
        return unitPrice;
    }

    public void setUnitprice(Integer unitprice) {
        this.unitPrice = unitprice;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getpOrderDetail() {
        return pOrderDetail;
    }

    public void setpOrderDetail(Product pOrderDetail) {
        this.pOrderDetail = pOrderDetail;
    }
}
