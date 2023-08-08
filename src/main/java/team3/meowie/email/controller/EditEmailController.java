package team3.meowie.email.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team3.meowie.email.model.Email;
import team3.meowie.email.model.EmailRepository;
import team3.meowie.email.service.EmailService;

@RestController
@RequestMapping("/emails")
public class EditEmailController {

    @Autowired
    private EmailRepository emailRepository;

    @Autowired
    private EmailService emailService;


    // 全部搜尋
        @GetMapping
        public List<Email> getAllEmails() {
            return emailRepository.findAll();
        }

    // 單個搜尋
    @GetMapping("/{id}")
    public Optional<Email> getEmailById(@PathVariable Long id) {
        return emailRepository.findById(id);
    }

    // 新增
    @PostMapping
    public Email addEmail(@RequestBody Email email) {
        return emailRepository.save(email);
    }

    // 更新
    @PutMapping("/{id}")
    public Email updateEmail(@PathVariable Long id, @RequestBody Email updatedEmail) {
        Email email = emailRepository.findById(id).orElseThrow(() -> new RuntimeException("Email not found"));
        email.setName(updatedEmail.getName());
        email.setEmail(updatedEmail.getEmail());
        email.setMessage(updatedEmail.getMessage());
        return emailRepository.save(email);
    }

    // 刪除
    @DeleteMapping("/{id}")
    public void deleteEmail(@PathVariable Long id) {
        emailRepository.deleteById(id);
    }
   
    public ResponseEntity<Page<Email>> getEmailsByPage(@RequestParam int page, @RequestParam int pageSize) {
        Pageable pageable = PageRequest.of(page - 1, pageSize);
        Page<Email> emails = emailService.findAll(pageable);
        return ResponseEntity.ok(emails);
    }

    @GetMapping("/count")
    public ResponseEntity<Long> getEmailsCount() {
        long count = emailService.count();
        return ResponseEntity.ok(count);
    }
}


