package team3.meowie.mart.product.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import team3.meowie.member.model.User;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * ClassName:Order
 * Description:
 * Create:2023/5/5 下午 02:41
 */
@Entity
@Table(name = "orders")
public class Order {


    @Id
    @Column(name = "order_id",nullable = false)
    private String orderid;


    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss EEEE",timezone = "GMT+8")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "order_date", columnDefinition = "datetime", nullable = false)
    private Date orderdate;


    @Column(name="payment",columnDefinition = "nvarchar(30)")
    private String payment;


    @Column(name="payment_condition",columnDefinition = "nvarchar(20)")
    private String paymentcondition;

    @Column(name="total_amount")
    private Integer totalamount;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name="user_id")
    private User user;

    //訂單明細
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private Set<OrderDetail> orderDetails = new HashSet<>();

    public void setOrderDetails(Set<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }


    public Order(String orderid, Date orderdate, String payment, String paymentcondition, Integer totalamount, User user, Set<OrderDetail> orderDetails) {
        this.orderid = orderid;
        this.orderdate = orderdate;
        this.payment = payment;
        this.paymentcondition = paymentcondition;
        this.totalamount = totalamount;
        this.user = user;
        this.orderDetails = orderDetails;
    }

    public Order() {

    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getPaymentcondition() {
        return paymentcondition;
    }

    public void setPaymentcondition(String paymentcondition) {
        this.paymentcondition = paymentcondition;
    }

    public Integer getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(Integer totalamount) {
        this.totalamount = totalamount;
    }
}
