package team3.meowie.dic.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class PostDto {
	private Integer userID;

	private Integer postID;

	private String title;

	private String content;

	private MultipartFile image;

	private String imageBase64;

	private String username;

	private String postDate;

	public PostDto(Integer postId, String content, String username, String title, String postDate, String imageBase64) {
		this.postID = postId;
		this.content = content;
		this.username = username;
		this.title = title;
		this.postDate = postDate;
		this.imageBase64 = imageBase64;
	}

	public PostDto() {
	}

	public String getImageBase64() {
		return imageBase64;
	}

	public void setImageBase64(String imageBase64) {
		this.imageBase64 = imageBase64;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public Integer getUserID() {
		return userID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public Integer getPostID() {
		return postID;
	}

	public void setPostID(Integer postID) {
		this.postID = postID;
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

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

}
