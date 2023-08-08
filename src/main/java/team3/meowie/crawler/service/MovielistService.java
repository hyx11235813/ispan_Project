package team3.meowie.crawler.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team3.meowie.crawler.DAO.MovielistRepository;
import team3.meowie.crawler.model.Movielist;
import team3.meowie.crawler.work.Crawler;

@Service
public class MovielistService {
	@Autowired
	private MovielistRepository movielistRepository;
	@Autowired
	private Crawler crawler;
	//抓取即將上映電影資料的爬蟲，會回傳全部爬取的電影資料
	public List<Movielist> autoCrawlerMovielistComingSoonFromYahoo() {
		return crawler.crawlerMovielistComingSoonFromYahoo();
	}
	//拿到所有即將上映電影資料
	public List<Movielist> findAll() {
		return movielistRepository.findAll();
	}
	//取得特定id的即將上映電影資料
	public Movielist findoneById(int id) {
		Optional<Movielist> rs = movielistRepository.findById(id);
		if(rs.isPresent()) {
			return rs.get();
		}
		return null;
	}
	
}
