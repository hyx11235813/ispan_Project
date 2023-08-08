package team3.meowie.email.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmailPageController {
	@GetMapping("/emailEdit")
	public String tmdbAPI() {
		return "NewBack/email/BackMessageList";
	}
}
