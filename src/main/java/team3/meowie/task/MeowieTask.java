package team3.meowie.task;

import java.time.Instant;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import team3.meowie.crawler.work.Crawler;
import team3.meowie.member.repository.ResetPasswordTokenRepository;
import team3.meowie.member.repository.VerificationTokenRepository;

@Component
public class MeowieTask {
	
	@Autowired
	private VerificationTokenRepository verificationTokenRepository;
	
	@Autowired
	private ResetPasswordTokenRepository resetPasswordTokenRepository;
	
	@Autowired
	private Crawler crawler;
	
	@Scheduled(cron = "0 0 18 ? * *")
	public void cleanExpiredToken() {
		Date now = Date.from(Instant.now());
		verificationTokenRepository.deleteExpiredDate(now);
		resetPasswordTokenRepository.deleteExpiredDate(now);
		
	}
	
	@Scheduled(cron = "0 30 0 * * *")
	public void updateCrawlerData() {
		crawler.crawlerMovielistComingSoonFromYahoo();
		crawler.crawlerTopMovielistFromYahoo();
	}
}
