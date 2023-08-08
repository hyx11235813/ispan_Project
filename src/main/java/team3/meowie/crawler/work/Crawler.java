package team3.meowie.crawler.work;

import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpTimeoutException;
import java.net.http.HttpClient.Version;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.transaction.Transactional;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import team3.meowie.crawler.DAO.CommentsRepository;
import team3.meowie.crawler.DAO.MovielistRepository;
import team3.meowie.crawler.DAO.ToplistRepository;
import team3.meowie.crawler.model.Comments;
import team3.meowie.crawler.model.MovieCrawlerData;
import team3.meowie.crawler.model.Movielist;
import team3.meowie.crawler.model.TopMovielist;

@Component
public class Crawler {
	@Autowired
	private CommentsRepository commentsRepository;
	@Autowired
	private MovielistRepository movielistRepository;
	@Autowired
	private ToplistRepository toplistRepository;
	@Autowired
	private Selenium selenium;

	public String crawlerImage(String moviename) {
		String src = "";
		try {
			String url = "https://movies.yahoo.com.tw/moviesearch_result.html?keyword=";
			String encodedMovieName = URLEncoder.encode(moviename, "UTF-8");
			url += encodedMovieName;
			HttpClient httpclient = HttpClient.newBuilder().connectTimeout(Duration.ofMillis(3000))
					.followRedirects(HttpClient.Redirect.NORMAL).build();
			HttpRequest.Builder reqBuilder = HttpRequest.newBuilder().version(Version.HTTP_2)
					.timeout(Duration.ofMillis(3500)).header("User-Agent",
							"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44");
			HttpRequest request = reqBuilder.uri(URI.create(url)).build();
			HttpResponse<String> response = null;

			response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
			if (response.statusCode() == 200) {
				String html = response.body();
				Document doc = Jsoup.parse(html);
				if (!doc.select(".release_movie_name a").attr("href").equals("")) {
					url = doc.select(".release_movie_name a").attr("href");
					request = reqBuilder.uri(URI.create(url)).build();
					response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
					if (response.statusCode() == 200) {
						html = response.body();
						doc = Jsoup.parse(html);
						src = doc.select(".movie_intro_foto>img").attr("src");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return src;
	}

	public List<Comments> crawlerCommentFromYahoo(String moviename) throws HttpTimeoutException {
		List<Comments> re = new ArrayList<>();
		try {
			String url = "https://movies.yahoo.com.tw/moviesearch_result.html?keyword=";
			String encodedMovieName = URLEncoder.encode(moviename, "UTF-8");
			url += encodedMovieName;
			int pages = 1;
			String mainurl = null;
			HttpClient httpclient = HttpClient.newBuilder().connectTimeout(Duration.ofMillis(3000))
					.followRedirects(HttpClient.Redirect.NORMAL).build();
			HttpRequest.Builder reqBuilder = HttpRequest.newBuilder().version(Version.HTTP_2)
					.timeout(Duration.ofMillis(3500)).header("User-Agent",
							"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44");
			HttpRequest request = reqBuilder.uri(URI.create(url)).build();
			HttpResponse<String> response = null;
			response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
			if (response.statusCode() == 200) {
				String html = response.body();
				Document doc = Jsoup.parse(html);
				if (!doc.select(".release_movie_name a").attr("href").equals("")) {
					url = doc.select(".release_movie_name a").attr("href");
					request = reqBuilder.uri(URI.create(url)).build();
					response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
					if (response.statusCode() == 200) {
						html = response.body();
						doc = Jsoup.parse(html);
						if (!doc.select(".usercom_more a").attr("href").equals("")) {
							url = doc.select(".usercom_more a").attr("href");
							mainurl = doc.select(".usercom_more a").attr("href");
							request = reqBuilder.uri(URI.create(url)).build();
							response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
							if (response.statusCode() == 200) {
								html = response.body();
								doc = Jsoup.parse(html);
								Elements elements = doc.select(".usercom_inner");
								for (Element e : elements) {
									Comments moviebean = new Comments();
									String regExpComment = RegExpComment(e.select("span").text());
									if (checkComments(regExpComment,moviename)) {
										moviebean.setRating(Integer
												.valueOf(e.getElementsByAttributeValue("name", "score").attr("value")));
										moviebean.setComment(regExpComment);
										moviebean.setMoviename(moviename);
										Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
												.parse(e.select(".user_time").text().substring(5));
										moviebean.setAdded(date);
										moviebean.setUrl(url);
										commentsRepository.save(moviebean);
										re.add(moviebean);
										System.out.println(moviebean);
									}
								}
							}
							if (doc.select(".nexttxt").first() != null) {
								pages = Integer.valueOf(doc.select(".nexttxt").first().previousElementSibling().text());
								if (pages > 1) {
									for (int i = 2; i <= pages; i++) {
										url = mainurl + "?page=" + i;
										request = reqBuilder.uri(URI.create(url)).build();
										response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
										if (response.statusCode() == 200) {
											html = response.body();
											doc = Jsoup.parse(html);
											Elements elements = doc.select(".usercom_inner");
											for (Element e : elements) {
												Comments moviebean = new Comments();
												String regExpComment = RegExpComment(e.select("span").text());
												if (checkComments(regExpComment,moviename)) {
													moviebean.setRating(Integer
															.valueOf(e.getElementsByAttributeValue("name", "score")
																	.attr("value")));
													moviebean.setComment(regExpComment);
													moviebean.setMoviename(moviename);
													Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
															.parse(e.select(".user_time").text().substring(5));
													moviebean.setAdded(date);
													moviebean.setUrl(url);
													commentsRepository.save(moviebean);
													re.add(moviebean);
													System.out.println(moviebean);
												}
											}
										}
									}
								}
							}
						} else {
							return null;
						}
					}
				}
			} else {
				System.out.println("返回狀態200");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	private String RegExpComment(String uncheck) {
		return uncheck.replaceAll("[^\\u4e00-\\u9fa5A-Za-z0-9\\s\\p{P}]+", "");
	}

	@Transactional
	public List<TopMovielist> crawlerTopMovielistFromYahoo() {
		String url = "https://movies.yahoo.com.tw/chart.html";
		int rank = 1;
		HttpResponse<String> response = null;
		String html = null;
		String moviename = null;
		List<TopMovielist> relist = new ArrayList<>();
//		Optional<TopMovielist> check = toplistRepository.findById(1);
//		if (check.isPresent()) {
//			toplistRepository.deleteAll();
//			toplistRepository.resetId();
//		}
		HttpClient httpclient = HttpClient.newBuilder().connectTimeout(Duration.ofMillis(3000))
				.followRedirects(HttpClient.Redirect.NORMAL).build();
		HttpRequest.Builder reqBuilder = HttpRequest.newBuilder().version(Version.HTTP_2)
				.timeout(Duration.ofMillis(3500)).header("User-Agent",
						"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44");
		HttpRequest request = reqBuilder.uri(URI.create(url)).build();
		try {
			response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
			if (response.statusCode() == 200) {
				html = response.body();
				Document doc = Jsoup.parse(html);
				moviename = doc.select("dd>h2").text();
				TopMovielist list1 = new TopMovielist();
				list1.setMoviename(moviename);
				list1.setRank(rank++);
				list1.setHot(selenium.getHot(moviename));
				toplistRepository.save(list1);

				relist.add(list1);
				Elements elements = doc.select(".rank_txt");
				for (Element e : elements) {
					TopMovielist list = new TopMovielist();
					moviename = e.text();
					list.setMoviename(moviename);
					list.setRank(rank++);
					list.setHot(selenium.getHot(moviename));
					toplistRepository.save(list);
					relist.add(list);
				}
			}

		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
		return relist;
	}

	@Transactional
	public List<Movielist> crawlerMovielistComingSoonFromYahoo() {
		String url = "https://movies.yahoo.com.tw/movie_comingsoon.html";
		HttpResponse<String> response = null;
		String html = null;
		String mainurl = url;
		String moviename = null;
		String enmoviename = null;
		Date date = null;
		int pages = 1;
		List<Movielist> relist = new ArrayList<>();
//		Optional<Movielist> check = movielistRepository.findById(1);
//		if (check.isPresent()) {
//			movielistRepository.deleteAll();
//			movielistRepository.resetId();
//		}
		HttpClient httpclient = HttpClient.newBuilder().connectTimeout(Duration.ofMillis(3000))
				.followRedirects(HttpClient.Redirect.NORMAL).build();
		HttpRequest.Builder reqBuilder = HttpRequest.newBuilder().version(Version.HTTP_2)
				.timeout(Duration.ofMillis(3500)).header("User-Agent",
						"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44");
		HttpRequest request = reqBuilder.uri(URI.create(url)).build();
		try {
			response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
			if (response.statusCode() == 200) {
				html = response.body();
				Document doc = Jsoup.parse(html);
				Elements movies = doc.select(".release_info_text");
				for (Element e : movies) {
					moviename = e.select(".release_movie_name>a").text();
					enmoviename = e.select(".en a").text();
					date = new SimpleDateFormat("yyyy-MM-dd")
							.parse(e.select(".release_movie_time").text().substring(5));
					Movielist movie = new Movielist();
					movie.setMoviename(moviename);
					movie.setEnmoviename(enmoviename);
					movie.setComingDate(date);
					if (checkExsisit(moviename, enmoviename)) {
						MovieCrawlerData returndata = crawlerMovieDataFromYahoo(moviename);
						movie.setShortstory(returndata.getShortstory());
						movie.setDirector(returndata.getDirector());
						movie.setLength(returndata.getLength());
						movie.setActor(returndata.getActor());
						movie.setImage(returndata.getImage());
						movielistRepository.save(movie);
						relist.add(movie);
					}
				}
				if (doc.select(".nexttxt").first() != null) {
					pages = Integer.valueOf(doc.select(".nexttxt").first().previousElementSibling().text());
					if (pages > 1) {
						for (int i = 2; i <= pages; i++) {
							url = mainurl + "?page=" + i;
							request = reqBuilder.uri(URI.create(url)).build();
							response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
							if (response.statusCode() == 200) {
								html = response.body();
								doc = Jsoup.parse(html);
								movies = doc.select(".release_info_text");
								for (Element e : movies) {
									moviename = e.select(".release_movie_name>a").text();
									enmoviename = e.select(".en a").text();
									Movielist movie = new Movielist();
									movie.setMoviename(moviename);
									movie.setEnmoviename(enmoviename);
									date = new SimpleDateFormat("yyyy-MM-dd")
											.parse(e.select(".release_movie_time").text().substring(5));
									movie.setComingDate(date);
									if (checkExsisit(moviename, enmoviename)) {

										MovieCrawlerData returndata = crawlerMovieDataFromYahoo(moviename);
										movie.setDirector(returndata.getDirector());
										movie.setLength(returndata.getLength());
										movie.setShortstory(returndata.getShortstory());
										movie.setActor(returndata.getActor());
										movie.setImage(returndata.getImage());
										movielistRepository.save(movie);
										relist.add(movie);
									}
								}
							}
						}
					}

				}
			}
		} catch (IOException | InterruptedException | ParseException e) {
			e.printStackTrace();
		}
		return relist;
	}

	public MovieCrawlerData crawlerMovieDataFromYahoo(String moviename) {

		MovieCrawlerData movieCrawlerData = new MovieCrawlerData();
		try {
			String url = "https://movies.yahoo.com.tw/moviesearch_result.html?keyword=";
			String encodedMovieName = URLEncoder.encode(moviename, "UTF-8");
			url += encodedMovieName;
			HttpClient httpclient = HttpClient.newBuilder().connectTimeout(Duration.ofMillis(3000))
					.followRedirects(HttpClient.Redirect.NORMAL).build();
			HttpRequest.Builder reqBuilder = HttpRequest.newBuilder().version(Version.HTTP_2)
					.timeout(Duration.ofMillis(3500)).header("User-Agent",
							"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44");
			HttpRequest request = reqBuilder.uri(URI.create(url)).build();
			HttpResponse<String> response = null;

			response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
			if (response.statusCode() == 200) {
				String html = response.body();
				Document doc = Jsoup.parse(html);
				if (!doc.select(".release_movie_name a").attr("href").equals("")) {
					url = doc.select(".release_movie_name a").attr("href");
					request = reqBuilder.uri(URI.create(url)).build();
					response = httpclient.send(request, HttpResponse.BodyHandlers.ofString());
					if (response.statusCode() == 200) {
						html = response.body();
						doc = Jsoup.parse(html);
						movieCrawlerData.setShortstory(doc.select("#story").text());
						movieCrawlerData.setImage(changeSrcToByte(doc.select(".movie_intro_foto>img").attr("src")));
						String dir = doc.select(".movie_intro_info_r>span:nth-of-type(4)").text();
						if (checkStringPosition(dir)) {
							movieCrawlerData.setDirector(
									doc.select(".movie_intro_info_r>span:nth-of-type(4)").text().substring(4));
							String len = doc.select(".movie_intro_info_r>span:nth-of-type(2)").text().substring(5);
							movieCrawlerData.setLength(changeStringToInteger(len));
							movieCrawlerData.setActor(doc.select(".movie_intro_info_r>span:nth-of-type(5)").text());
						} else {
							movieCrawlerData.setDirector(
									doc.select(".movie_intro_info_r>span:nth-of-type(5)").text().substring(3));
							String len = doc.select(".movie_intro_info_r>span:nth-of-type(2)").text().substring(5);
							movieCrawlerData.setLength(changeStringToInteger(len));
							movieCrawlerData.setActor(doc.select(".movie_intro_info_r>span:nth-of-type(6)").text());
						}

					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return movieCrawlerData;
	}

	private byte[] changeSrcToByte(String src) {
		RestTemplate restTemplate = new RestTemplate();
		byte[] imageBytes = restTemplate.getForObject(src, byte[].class);
		return imageBytes;
	}

	private boolean checkExsisit(String moviename, String enmoviename) {
		Boolean check = true;
		List<Movielist> rs = movielistRepository.findAll();
		for (Movielist movie : rs) {
			if (movie.getMoviename().equals(moviename) && movie.getEnmoviename().equals(enmoviename)) {
				check = false;
			}
		}
//		System.out.println(check);
		return check;
	}

	private boolean checkComments(String comment,String moviename) {
		Boolean check = true;
		List<Comments> findAll = commentsRepository.findByMoviename(moviename);
		for (Comments c : findAll) {
			if (c.getComment().equals(comment)) {
				check = false;
			}
		}
		return check;
	}

	private Integer changeStringToInteger(String length) {
		Integer len = null;
		System.out.println(length);
		int totalMinutes = 0;
		Pattern pattern = Pattern.compile("(\\d+)時(\\d+)分");
		Matcher matcher = pattern.matcher(length);
		if (matcher.matches()) {
			int hours = Integer.parseInt(matcher.group(1));
			int minutes = Integer.parseInt(matcher.group(2));
			totalMinutes = hours * 60 + minutes;
		}
		len = Integer.valueOf(totalMinutes);
		System.out.println(len);
		return len;
	}

	private boolean checkStringPosition(String uncheck) {
		boolean x = false;
		if (uncheck.trim().matches("(?i)^導演.*")) {
			x = true;
		}
		System.out.println(x);
		return x;
	}

	public Crawler() {
	}

}
