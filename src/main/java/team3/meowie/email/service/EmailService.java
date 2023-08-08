package team3.meowie.email.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import team3.meowie.email.model.Email;
import team3.meowie.email.model.EmailRepository;

    @Service
    public class EmailService {

        @Autowired
        private EmailRepository emailRepository;

        public List<Email> getAllEmails() {
            return emailRepository.findAll();
        }

        public Email getEmailById(Long id) {
            return emailRepository.findById(id).orElse(null);
        }

        public Email addEmail(Email email) {
            return emailRepository.save(email);
        }

        public Email updateEmail(Long id, Email email) {
            Email existingEmail = emailRepository.findById(id).orElse(null);
            if (existingEmail != null) {
                existingEmail.setName(email.getName());
                existingEmail.setEmail(email.getEmail());
                existingEmail.setMessage(email.getMessage());
                return emailRepository.save(existingEmail);
            }
            return null;
        }

        public void deleteEmail(Long id) {
            emailRepository.deleteById(id);
        }

        public Page<Email> findAll(Pageable pageable) {
            return emailRepository.findAll(pageable);
        }

        public long count() {
            return emailRepository.count();
        }


    }

   


