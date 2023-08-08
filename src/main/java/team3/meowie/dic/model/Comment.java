package team3.meowie.dic.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonBackReference;

import team3.meowie.member.model.User;

@Entity
@Table(name = "Comments")
public class Comment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CommentID")
	private Integer commentID;
// 
	@Column(name = "Content", nullable = false, columnDefinition = "VARCHAR(1500)")
	private String content;

//    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
//    @JsonBackReference
	private User user;

//    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PostID")
//    @JsonBackReference
	private Posts post;
//	@ManyToOne(fetch = FetchType.LAZY, cascade =  CascadeType.REMOVE)
//	@JoinColumn(name = "PostID")
//	private Posts post;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CommentDate", columnDefinition = "datetime")
	private Date commentDate;

	@PrePersist
	public void onCreate() {
		if (commentDate == null) {
			commentDate = new Date();
		}
	}

	// Getters and Setters
	public Integer getCommentID() {
		return commentID;
	}

	public void setCommentID(Integer commentID) {
		this.commentID = commentID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Posts getPost() {
		return post;
	}

	public void setPost(Posts post) {
		this.post = post;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
}
