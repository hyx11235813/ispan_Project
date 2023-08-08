package team3.meowie.ticket.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class OrderBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long orderid;
@Column
    private Integer TotalPrice;

    public Long getOrderid() {
        return orderid;
    }
    public Integer getTotalPrice() {
        return TotalPrice;
    }
    public void  setTotalPrice(Integer totalPrice) {
        TotalPrice = totalPrice;
    }

}
