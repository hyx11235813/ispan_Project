package team3.meowie.crawler.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "crawlerComments")
public class Comments {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	@Column(name = "moviename")
	private String moviename;

	@Column(name = "comment", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String comment;

	@Column(name = "rating")
	private Integer rating;

	@Column(name = "url", nullable = false)
	private String url;

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss EEEE", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "added", columnDefinition = "datetime")
	private Date added;


	@PrePersist
	public void onCreate() {
		if (added == null) {
			added = new Date();
		}
	}



	public String getMoviename() {
		return moviename;
	}



	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}

	public Comments() {

	}

	@Override
	public String toString() {
		return "Comments [id=" + id + ", comment=" + comment + ", rating=" + rating + ", url=" + url + ", added="
				+ added + ", movielist=" + "]";
	}

}
