package team3.meowie.crawler.model;

public class MovieCrawlerData {
	private String shortstory;
	private byte[] image;
	private String actor;
	private String director;
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

	public String getShortstory() {
		return shortstory;
	}

	public void setShortstory(String shortstory) {
		this.shortstory = shortstory;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}
}
