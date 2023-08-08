package team3.meowie.crawler.work;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team3.meowie.crawler.DAO.CommentsRepository;
import team3.meowie.crawler.model.Comments;

@Component
public class Selenium {
	@Autowired
	private CommentsRepository commentsRepository;

	public Selenium() {
	};

	public Integer getHot(String moviename) {
		String popularity;
		System.setProperty("webdriver.chrome.driver","C:\\Program Files\\Google\\Chrome\\Application\\chromedriver.exe");
		// System.setProperty("webdriver.edge.driver", "C:\\Program Files
		// (x86)\\Microsoft\\Edge\\Application\\msedgedriver.exe");
		ChromeOptions options = new ChromeOptions();
//		options.setHeadless(true);
		options.addArguments("--remote-allow-origins=*");
//		options.addArguments("--disable-extensions", "--disable-notifications", "--disable-popup-blocking", "--disable-gpu", "--no-sandbox");
//		options.addArguments("--start-maximized");
//		options.addArguments("--disable-infobars");
//		options.addArguments("--disable-gpu"); // 禁用 GPU 加速
//		options.addArguments("--no-sandbox"); // 禁用沙盒模式
//		options.addArguments("--disable-dev-shm-usage"); // 禁用共享內存使用
		WebDriver driver = new ChromeDriver(options);
//		driver.manage().window().setPosition(new Point(-2000, 0));
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
		driver.navigate().to("https://www.imdb.com/?ref_=nv_home");
//		System.out.println(driver.getTitle());
		wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(".imdb-header-search__input")));
		WebElement input = driver.findElement(By.cssSelector(".imdb-header-search__input"));
		input.sendKeys(moviename);
		input.submit();
		try {
			wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector(
					"section[data-testid=\"find-results-section-title\"] li.find-result-item:first-of-type a")));
			driver.findElement(By.cssSelector(
					"section[data-testid=\"find-results-section-title\"] li.find-result-item:first-of-type a")).click();
			wait.until(ExpectedConditions.presenceOfElementLocated(
					By.cssSelector("div[data-testid=\"hero-rating-bar__popularity__score\"]")));
			WebElement findElements = driver
					.findElement(By.cssSelector("div[data-testid=\"hero-rating-bar__popularity__score\"]"));
			popularity = findElements.getAttribute("textContent");
		} catch (TimeoutException e) {
			driver.quit();
			return null;
		}
//		System.out.println(popularity);
//		System.out.println("end");
		driver.quit();
		popularity = popularity.replace(",", "");
		return Integer.valueOf(popularity);
	}

	public List<Comments> imdbComments(String moviename) {
		List<Comments> re = new ArrayList<>();
		System.setProperty("webdriver.chrome.driver",
				"C:\\Program Files\\Google\\Chrome\\Application\\chromedriver.exe");
		ChromeOptions options = new ChromeOptions();
		options.addArguments("--remote-allow-origins=*");
		WebDriver driver = new ChromeDriver(options);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
		driver.navigate().to("https://www.imdb.com/?ref_=nv_home");
		wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(".imdb-header-search__input")));
		WebElement input = driver.findElement(By.cssSelector(".imdb-header-search__input"));
		input.sendKeys(moviename);
		input.submit();
		try {
			wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector(
					"section[data-testid=\"find-results-section-title\"] li.find-result-item:first-of-type a")));
			driver.findElement(By.cssSelector(
					"section[data-testid=\"find-results-section-title\"] li.find-result-item:first-of-type a")).click();
			wait.until(ExpectedConditions
					.presenceOfElementLocated(By.cssSelector("div[data-testid='reviews-header']>div>a")));
			String src = driver.findElement(By.cssSelector("div[data-testid='reviews-header']>div>a"))
					.getAttribute("href");
			driver.navigate().to(src);
			wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector("#load-more-trigger")));
			while (driver.findElement(By.cssSelector("#load-more-trigger")) != null) {
				driver.findElement(By.cssSelector("#load-more-trigger")).click();
				try {
					wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector("#load-more-trigger")));
				} catch (TimeoutException e) {
					break;
				}
			}
			List<WebElement> elements = driver.findElements(By.cssSelector(".lister-item-content"));
			moviename += "-en";
			System.out.println(elements.size());
			for (WebElement element : elements) {
				Comments comment = new Comments();
				String rating = null;
				String comm = element.findElement(By.cssSelector(".show-more__control.text"))
						.getAttribute("textContent");
				if (checkComments(comm, moviename)) {
					comment.setComment(comm);
					try {
						element.findElement(By.cssSelector("div>span svg+span")).getAttribute("textContent");
						rating = element.findElement(By.cssSelector("div>span svg+span")).getAttribute("textContent");
						comment.setRating(Integer.valueOf(rating));
					} catch (Exception e) {
						comment.setRating(null);
					}
//				String text = element.findElement(By.cssSelector("div>span svg+span")).getText();
//				System.out.println(text); 
//				element.findElement(By.cssSelector("span.rating-other-user-rating span:first-of-type")).getText();
					comment.setUrl(src);
					String date = element.findElement(By.cssSelector(".review-date")).getAttribute("textContent");
					comment.setAdded(changeDate(date));
					comment.setMoviename(moviename);
//				System.out.println(comm);
					commentsRepository.save(comment);
					re.add(comment);
					Thread.sleep(100);
				}
			}

		} catch (TimeoutException | InterruptedException e) {
			driver.quit();
			return null;
		}
		return re;
	}

	private Date changeDate(String date) {
		Date re = null;
		SimpleDateFormat inputDateFormat = new SimpleDateFormat("d MMM yyyy", Locale.ENGLISH);
		Date date1 = null;
		try {
			date1 = inputDateFormat.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = outputDateFormat.format(date1);
		try {
			re = outputDateFormat.parse(formattedDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return re;
	}

	private boolean checkComments(String comment, String moviename) {
		Boolean check = true;
		List<Comments> findAll = commentsRepository.findByMoviename(moviename);
		for (Comments c : findAll) {
			if (c.getComment().equals(comment)) {
				check = false;
			}
		}
		return check;
	}
}