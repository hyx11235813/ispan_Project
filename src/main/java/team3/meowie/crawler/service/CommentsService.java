package team3.meowie.crawler.service;

import java.net.http.HttpTimeoutException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team3.meowie.crawler.DAO.CommentsRepository;
import team3.meowie.crawler.model.Comments;
import team3.meowie.crawler.model.TopMovielist;
import team3.meowie.crawler.work.Crawler;
import team3.meowie.crawler.work.Selenium;

@Service
public class CommentsService {
	@Autowired
	private CommentsRepository commentsRepository;
	@Autowired
	private Crawler crawler;
	@Autowired
	private Selenium selenium;
	//執行抓取評論的爬蟲	
	public List<Comments> autoCrawlerCommentsFromYahoo(String moviename)throws HttpTimeoutException {
		return crawler.crawlerCommentFromYahoo(moviename);
	}
	//執行抓取排行榜的爬蟲
	public Map<String,List<Comments>> autoCrawlerTopMovieslistCommentsFromYahoo(List<TopMovielist> topmovielist) throws HttpTimeoutException {
		Map<String,List<Comments>> re = new HashMap<>();
		for (TopMovielist movie : topmovielist) {
			String moviename = movie.getMoviename();
			List<Comments> reComments = autoCrawlerCommentsFromYahoo(moviename);
			re.put(moviename, reComments);
		}
		return re;
	}
	//從資料庫中拿到所有評論
	public List<Comments> findAll(){
		return commentsRepository.findAll();
	}
	public List<Comments> findComments(String moviename){
		return commentsRepository.findByMoviename(moviename);
	}
	public String searchImg(String moviename) {
		return crawler.crawlerImage(moviename);
	}
	public List<Comments> imdbComments(String moviename){
		 selenium.imdbComments(moviename);
		 moviename+="-en";
		 return commentsRepository.findByMoviename(moviename);
		}
	

}
