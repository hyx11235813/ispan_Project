package team3.meowie.crawler.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "crawlerMovielist")
public class Movielist {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "moviename", columnDefinition = "nvarchar(200)", nullable = false)
	private String moviename;

	@Column(name = "enmoviename", columnDefinition = "nvarchar(200)", nullable = true)
	private String enmoviename;


	@Column(name = "shortstory", columnDefinition = "nvarchar(max)", nullable = true)
	private String shortstory;

	@Column(name="actor",columnDefinition = "nvarchar(max)",nullable = true)
	private String actor;
	
	@Column(name="img",columnDefinition = "varbinary(max)",nullable = true)
	private byte[]image;
	
	@JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "date",columnDefinition = "datetime",nullable =true)
	private Date comingDate;
	
	@Column(name = "director",columnDefinition = "nvarchar(MAX)")
	private String director;
	
	@Column(name = "length")
	private Integer length;

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public Integer getLength() {
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	public Date getComingDate() {
		return comingDate;
	}

	public void setComingDate(Date comingDate) {
		this.comingDate = comingDate;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMoviename() {
		return moviename;
	}

	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}


	public String getShortstory() {
		return shortstory;
	}

	public void setShortstory(String shortstory) {
		this.shortstory = shortstory;
	}

	public Movielist() {
	}

	public String getEnmoviename() {
		return enmoviename;
	}

	public void setEnmoviename(String enmoviename) {
		this.enmoviename = enmoviename;
	}
	
	
	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}



	@Override
	public String toString() {
		return "Movielist [id=" + id + ", moviename=" + moviename + ", enmoviename=" + enmoviename + ", shortstory="
				+ shortstory +"]";
	}

}
