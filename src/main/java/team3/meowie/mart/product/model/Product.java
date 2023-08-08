package team3.meowie.mart.product.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.util.Date;

/**
 * ClassName:Product
 * Description:
 * Create:2023/4/28 上午 11:01
 */
@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name", columnDefinition = "nvarchar(200)", nullable = true)
    private String name;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss EEEE",timezone = "GMT+8")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "added", columnDefinition = "datetime")
    private Date added;

    @Column(name = "price", columnDefinition = "nvarchar(200)", nullable = true)
    private Integer price;

    @Column(name = "description", columnDefinition = "nvarchar(200)", nullable = true)
    private String description;

    @Lob
    @Column(name="coverImage",columnDefinition = "varbinary(max)")
    private byte[] coverImage;

    @Transient
    private MultipartFile imageFile;

//    @Column(name = "category", columnDefinition = "nvarchar(200)", nullable = true)
//    private String category;

    @Column(name = "quantity", columnDefinition = "nvarchar(200)", nullable = true)
    private Integer quantity;

    @ManyToOne
    @JoinColumn(name = "cateid")
    private Category category;



    @PrePersist
    public void onCreated() {
        if(added == null) {
            added = new Date();
        }
    }
    public Product() {
    }


    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public byte[] getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(byte[] coverImage) {
        this.coverImage = coverImage;
    }

    public MultipartFile getImageFile() {
        return imageFile;
    }

    public void setImageFile(MultipartFile imageFile) {
        this.imageFile = imageFile;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getAdded() {
        return added;
    }

    public void setAdded(Date added) {
        this.added = added;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }






}
