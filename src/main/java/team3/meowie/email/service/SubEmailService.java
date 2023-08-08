package team3.meowie.email.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team3.meowie.email.model.SubEmail;
import team3.meowie.email.model.SubEmailRepository;

@Service
public class SubEmailService {

    @Autowired
    private SubEmailRepository subEmailRepository;

    public SubEmail saveSubscription(String email) {
        SubEmail subscription = new SubEmail();
        subscription.setEmail(email);
        subscription.setCreatedDate(new Date());
        return subEmailRepository.save(subscription);
    }
    public List<SubEmail> getAllSubscriptions() {
        return subEmailRepository.findAll();
    }
}
