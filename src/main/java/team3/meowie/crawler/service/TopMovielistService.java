package team3.meowie.crawler.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team3.meowie.crawler.DAO.ToplistRepository;
import team3.meowie.crawler.model.TopMovielist;
import team3.meowie.crawler.work.Crawler;

@Service
public class TopMovielistService {
	@Autowired
	private ToplistRepository toplistRepository;
	@Autowired
	private Crawler crawler;

	// 爬取排行榜電影資料
	public List<TopMovielist> autoCrawlerTopMovielistFromYahoo() {
		return crawler.crawlerTopMovielistFromYahoo();
	}

	// 拿到所有已爬取電影資料
	public List<TopMovielist> getTopMovielistAll() {
		return toplistRepository.findAll();
	}
	
	public List<TopMovielist> todayTopMovielist(){
		LocalDate localdate = LocalDate.now();
		Date date = Date.from(localdate.atStartOfDay(ZoneId.systemDefault()).toInstant());
		return toplistRepository.findByAdded(date);
	}

	// 拿到過去?天所有天數
	private List<LocalDate> getRecntDate(int days) {
		LocalDate endDate = LocalDate.now();
		LocalDate starDate = endDate.minusDays(days);
		List<LocalDate> dateList = new ArrayList<>();
		LocalDate date = starDate;
		while (!date.isAfter(endDate)) {
			dateList.add(date);
			date = date.plusDays(1);
		}
		System.out.println("yes");
		return dateList;
	}
	//回傳?天的排行榜資料
	public Map<LocalDate, Map<String, Integer>> getNewRank(int days){
		List<LocalDate> recntDate = getRecntDate(days);
		Map<LocalDate, Map<String, Integer>> toJson = new HashMap<>();
		for(LocalDate localdate : recntDate) {
			Date date = Date.from(localdate.atStartOfDay(ZoneId.systemDefault()).toInstant());
			List<TopMovielist> findByAdded = toplistRepository.findByAdded(date);
			Map<String, Integer> recommendMovieList = recommendMovieList(findByAdded);
			toJson.put(localdate, recommendMovieList);
		}
		return toJson;
	}
	
	private Map<String, Integer> recommendMovieList(List<TopMovielist> movielist) {
		Map<String, Integer> movieMap = new HashMap<>();
		int n = 0;
		TreeMap<String, Integer> list = new TreeMap<>();
		TreeMap<String, Integer> unmath = new TreeMap<>();
		for (TopMovielist x : movielist) {
			list.put(x.getMoviename(), x.getRank());
		}
		Map<String, Integer> newRankHot = newRankHot(movielist);
		for (Map.Entry<String, Integer> entry : list.entrySet()) {
			n = entry.getValue() + newRankHot.get(entry.getKey());
			n = n / 2;
			unmath.put(entry.getKey(), n);
		}
		List<Map.Entry<String, Integer>> math = new ArrayList<>(unmath.entrySet());
		Collections.sort(math, Map.Entry.comparingByValue());
		int index = 1;
		for (Map.Entry<String, Integer> entry : math) {
			movieMap.put(entry.getKey(), index++);
		}
		System.out.println(movieMap);
		return movieMap;
	}

	private Map<String, Integer> newRankHot(List<TopMovielist> list) {
		List<Integer> remake = new ArrayList<>();
		List<String> temp = new ArrayList<>();
		List<String> tempnull = new ArrayList<>();
		Map<String, Integer> rerankhot = new TreeMap<>();
		TreeMap<Integer, String> tempmap = new TreeMap<>();
		for (TopMovielist movie : list) {
			if (movie.getHot() == null) {
				tempnull.add(movie.getMoviename());
			} else {
				remake.add(movie.getHot());
				tempmap.put(movie.getHot(), movie.getMoviename());
			}
		}
		Collections.sort(remake);
		for (Integer x : remake) {
			temp.add(tempmap.get(x));
		}
		for (String x : temp)
			rerankhot.put(x, temp.indexOf(x) + 1);

		for (String x : tempnull) {
			rerankhot.put(x, list.size() + 1);
		}
		return rerankhot;
	}
}
