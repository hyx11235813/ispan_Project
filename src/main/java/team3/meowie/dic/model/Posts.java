package team3.meowie.dic.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import team3.meowie.member.model.User;

@Entity
@Table(name = "Posts")

public class Posts implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PostID")
    private Integer postID;


    @Column(name = "Title", nullable = false, columnDefinition = "VARCHAR(150)")
    private String title;

    @Column(name = "Content", nullable = false, columnDefinition = "VARCHAR(1500)")
    private String content;

    @Column(name = "Image", columnDefinition = "VARBINARY(MAX)")
    private byte[] image;


    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;


    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "PostDate", columnDefinition = "datetime")
    private Date postDate;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss ", timezone = "GMT+8")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "EditDate", columnDefinition = "datetime")
    private Date editDate;

    @PrePersist
    @PreUpdate
    public void onCreate() {
        if (postDate == null) {
            postDate = new Date();
        }
        if (editDate != null || editDate == null) {
            editDate = new Date();
        }
    }

    @Transient
    private Integer commentsCount;

    @Transient
    private String base64Image;

    public Integer getCommentsCount() {
        return commentsCount;
    }

    public void setCommentsCount(Integer commentsCount) {
        this.commentsCount = commentsCount;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public Date getEditDate() {
        return editDate;
    }

    public void setEditDate(Date editDate) {
        this.editDate = editDate;
    }

    public Date getAdded() {
        return postDate;
    }

    public void setAdded(Date added) {
        this.postDate = added;
    }

    public Integer getPostID() {
        return postID;
    }

    public void setPostID(Integer postID) {
        this.postID = postID;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    //
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
////
//	public Movie getMovie() {
//		return movie;
//	}
//
//	public void setMovie(Movie movie) {
//		this.movie = movie;
//	}

}