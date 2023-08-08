package team3.meowie.ticket.controller;

import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import team3.meowie.member.model.User;
import team3.meowie.member.service.UserService;
import team3.meowie.member.tools.EmailMessage;
import team3.meowie.show.model.ShowRepository;
import team3.meowie.show.service.ShowService;
import team3.meowie.ticket.model.Ticket;
import team3.meowie.ticket.model.TicketRepository;
import team3.meowie.ticket.service.TicketService;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@RequestMapping("/booking")//未登入訂票controller
@Controller
public class TicketController {
    @Autowired
    TicketRepository ticketRepository;
    @Autowired
    TicketService ticketService;
    @Autowired
    ShowRepository showRepository;
    @Autowired
    UserService userService;
    @Autowired
    ShowService showService;

    Logger logger = java.util.logging.Logger.getLogger("test");

//    @GetMapping("/")//顯示所有可訂票場次
//    public String booking(Model model) {
//        List<Show> showList = showRepository.findAll();
//        model.addAttribute("showList", showList);
//        return "/booking/AllShows";
//    }

    @GetMapping("/{showId}")//前往座位表
    public String showTickets(Model model, @PathVariable Long showId) {
        User user = null;
        if (userService.isLogin()) {
            user = userService.findUserByUsername(userService.getLoginUsername());
            model.addAttribute("user", user);
        } else {
            user = userService.findUserByUsername("unverifieduser");
            model.addAttribute("user", user);
        }

        model.addAttribute("show", showService.getShowById(showId));
        model.addAttribute("tickets", ticketRepository.findByShowShowId(showId));
        return "/booking/ticket-table";
    }


    @PostMapping("/confirm-ticket")
    public String bookTicket(Model model, @RequestParam("selectedTickets") String selectedTicketIds) {
        logger.info("selectedTickets: " + selectedTicketIds);
        if (!userService.isLogin()) {
            return "redirect:/login";
        }
        User thisUser = userService.findUserByUsername(userService.getLoginUsername());

        ArrayList<Long> ticketIds = new ArrayList<>();
        try {
            JSONArray jsonArray = new JSONArray(selectedTicketIds);
            for (int i = 0; i < jsonArray.length(); i++) {
                Long ticketId = jsonArray.getLong(i);
                ticketIds.add(ticketId);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        List<Ticket> tickets = ticketService.getTicketByIds(ticketIds);
        model.addAttribute("tickets", tickets);
        return "/booking/confirm-ticket-detail";
    }


//    @Autowired
//    private OrderBeanService orderBeanService;
//    @PostMapping("/returnURL")
//    public void returnURL(@RequestParam("MerchantTradeNo") String MerchantTradeNo, @RequestParam("RtnCode") int RtnCode, @RequestParam("TradeAmt") int TradeAmt, HttpServletRequest request) {
//        if ((request.getRemoteAddr().equalsIgnoreCase("175.99.72.1")
//                || request.getRemoteAddr().equalsIgnoreCase("172.99.72.11")
//                || request.getRemoteAddr().equalsIgnoreCase("172.99.72.24")
//                || request.getRemoteAddr().equalsIgnoreCase("172.99.72.28")
//                || request.getRemoteAddr().equalsIgnoreCase("172.99.72.32") && RtnCode == 1)) {
//        }
//        String orderIdStr = MerchantTradeNo.substring(13);
//
//    }

    @Autowired
    EmailMessage emailMessage;
    @Autowired
    JavaMailSender javaMailSender;

    @PostMapping("/confirm-ticket/OK")
    @Transactional
    public String confirmTicket(Model model, @RequestParam("idList") ArrayList<String> idList) {

        logger.info("here");
        if (userService.isLogin()) {
            User thisUser = userService.findUserByUsername(userService.getLoginUsername());
            String email = thisUser.getEmail();

            for (String id : idList) {

                Ticket t = ticketRepository.findByTicketid(Long.parseLong(id));
                emailMessage.qrCodeEmailFormat(email, "您的取票資訊", t.getTicketid());
                t.setPayed(true);
                t.setUser(thisUser);
                ticketRepository.save(t);
            }
        } else {
            User thisUser2 = userService.findUserByUsername("unverifieduser");
            for (String id : idList) {
                logger.info("unverifieduser" + "ticket" + id);
                Ticket t = ticketRepository.findByTicketid(Long.parseLong(id));
                t.setPayed(true);
                t.setUser(thisUser2);
                ticketRepository.save(t);
            }
        }
        return "/booking/confirmed-ticket";
    }

}


