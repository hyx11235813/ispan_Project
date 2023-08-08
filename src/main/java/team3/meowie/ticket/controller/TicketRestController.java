package team3.meowie.ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team3.meowie.ticket.model.Ticket;
import team3.meowie.ticket.service.TicketService;

import java.util.HashMap;
import java.util.Map;


@RestController
@RequestMapping("/tickets")
public class TicketRestController {

    @Autowired
    private TicketService ticketService;
@Transactional
    @PostMapping("/update-price")
    public ResponseEntity<Map<String, Object>> updateTicketPrice(@RequestBody Map<String, String> request) {
        long ticketId = Long.parseLong(request.get("ticketId"));
        String ticketType = request.get("ticketType");
        Ticket ticket = ticketService.findById(ticketId);
        if ("full".equals(ticketType)) {
            ticket.setPrice(250);
        } else if ("child".equals(ticketType)) {
            ticket.setPrice(400);
        }
        ticketService.saveTicket(ticket);
        Map<String, Object> response = new HashMap<>();
        response.put("newPrice", ticket.getPrice());
        return ResponseEntity.ok(response);
    }
}