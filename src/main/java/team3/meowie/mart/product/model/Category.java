package team3.meowie.mart.product.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * ClassName:Category
 * Description:
 * Create:2023/5/7 上午 11:17
 */
@Entity
@Table(name = "categories")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer cateid;

    @Column(name = "cate_name", columnDefinition = "nvarchar(20)")
    String catename;


    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH-mm-ss")
    @Column(name = "created_at", columnDefinition = "datetime")
    Date createdAt;

    public Category(Integer cateid, String catename) {
        cateid = cateid;
        catename = catename;

    }

    public Category() {

    }

    public Integer getCateid() {
        return cateid;
    }

    public void setCateid(Integer cateid) {
        cateid = cateid;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        catename = catename;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @PrePersist
    public void onCreate() {
        if (createdAt == null) {
            createdAt = new Date();
        }
    }
}
