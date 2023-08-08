package team3.meowie.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team3.meowie.email.model.Email;
import team3.meowie.email.model.EmailRepository;

@Controller
public class SendEmailController {

    @Autowired
    private EmailRepository emailRepository;

    @Autowired
    private JavaMailSender mailSender;

//    @GetMapping("/")
//    public String index(Model model) {
//        model.addAttribute("email", new Email());
//        return "index";
//    }

    @PostMapping("/sendEmail")
    public String sendEmail(@RequestParam String name, @RequestParam String email, @RequestParam String message, @RequestParam String phoneNumber) {
        Email emailObj = new Email();
        emailObj.setName(name);
        emailObj.setEmail(email);
        emailObj.setMessage(message);
        emailObj.setPhoneNumber(phoneNumber);
        // save email to database
        emailRepository.save(emailObj);

        // send email using mailSender
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo("meowiemeow15@gmail.com");
        mailMessage.setSubject("有用戶在Moewie發表了意見,來自: "+ name);
        mailMessage.setText("用戶信箱:"+email+"\n用戶電話:"+phoneNumber+"\n用戶訊息:"+message);
        mailSender.send(mailMessage);

        return "redirect:/contact";
    }


}

