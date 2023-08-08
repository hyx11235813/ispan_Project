package team3.meowie.email.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team3.meowie.email.model.SubEmail;
import team3.meowie.email.model.SubEmailRepository;
import team3.meowie.email.service.SubEmailService;

@Controller
public class SubEmailController {
 
    @Autowired
    private SubEmailService subEmailService;
    
    @Autowired
    private JavaMailSender javaMailSender;
    
    @Autowired
    private SubEmailRepository subscriptionRepository;
    
 
    @PostMapping("/subscribe")
    @ResponseBody
    public String subscribe(@RequestParam("email") String email) {
        subEmailService.saveSubscription(email);
        return "success";
    }
    
    @GetMapping("/subEdit")
    public String showAllSub(Model model) {
    	
     	List<SubEmail> subs = subEmailService.getAllSubscriptions();
    	model.addAttribute("subs",subs);
    	return "NewBack/email/AllSubEmail";
    }
    @PostMapping("/send-email")
    public ResponseEntity<?> sendEmail(@RequestBody Map<String, Object> payload) {
      try {
        String emailBody = (String) payload.get("emailBody");
        System.out.println(emailBody);

        // 從資料庫中讀取所有訂閱者的電子郵件地址
        List<String> emailList = subscriptionRepository.findAll().stream()
            .map(SubEmail::getEmail)
            .collect(Collectors.toList());

        // 為每個電子郵件地址發送郵件
        for (String email : emailList) {
          SimpleMailMessage message = new SimpleMailMessage();
          message.setTo(email);
          message.setSubject("[公告]來自MoeWie的信件");
          message.setText("尊敬的客戶，\n\n"+emailBody+"\n祝您一切順利！\n"
          		+ "\n"
          		+ "誠摯地，\n"
          		+ "MoeWie團隊");
          javaMailSender.send(message);
        }

        return ResponseEntity.ok().body(Map.of("success", true));
      } catch (Exception e) {
        e.printStackTrace();
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
            .body(Map.of("success", false, "message", e.getMessage()));
      }
    }

}