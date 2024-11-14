package org.example.payservice1.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.payservice1.repository.UserRepository;
import org.example.payservice1.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.example.payservice1.entity.Transaction;
import org.example.payservice1.entity.User;

import java.util.List;
import java.util.Random;

@Slf4j
@Controller
@RequiredArgsConstructor
public class TransactionController {
    @Autowired
    private final UserRepository userRepository;
    private final TransactionService transactionService;

    @GetMapping("/index")
    public ModelAndView index(Authentication authentication) {
        ModelAndView model = new ModelAndView();
        model.setViewName("/index");

        User user = (User) authentication.getPrincipal();
        List<Transaction> usersTransactions = transactionService.getUserAsReceiverTransactions(user);

        model.addObject("transactions", usersTransactions);
        model.addObject("condition", true);
        return model;
    }

    @GetMapping("/send")
    public ModelAndView send(Authentication authentication) {
        ModelAndView model = new ModelAndView();
        setUserFieldsInModel(model, authentication);
        model.addObject("transaction", new Transaction());
        model.setViewName("/sendForm");

        return model;
    }

    @GetMapping("/receive/{id}")
    public ModelAndView receive(Authentication authentication, @PathVariable Long id) {
        ModelAndView model = new ModelAndView();
        setUserFieldsInModel(model, authentication);
        model.addObject("transaction", transactionService.getTransactionById(id));
        model.setViewName("/receiveForm");

        return model;
    }

    @PostMapping(path = "/send", produces = "application/json")
    public ModelAndView send(@ModelAttribute("transaction") Transaction transaction) {
        transactionService.createTransaction(transaction);

        ModelAndView model = new ModelAndView();
        model.addObject("message", "Id of transaction:" +
                transaction.getId() + "\n Confirmation code:: " + transaction.getConfirmationCode());
        model.setViewName("success");

        return model;
    }

    @PostMapping("/receive/{id}")
    public ModelAndView receiveMoney(@ModelAttribute("transaction") Transaction transaction,
                                     @PathVariable Long id) {
        transactionService.commitTransaction(transaction, id);
        ModelAndView model = new ModelAndView();
        model.addObject("message", "Transaction completed");
        model.setViewName("success");

        return model;
    }

    private void setUserFieldsInModel(ModelAndView model, Authentication authentication) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) principal;
            User user = userRepository.loadByUsername(userDetails.getUsername());
            model.addObject("user", user);
        } else {
            throw new ClassCastException("Аутентифицированный пользователь не является экземпляром UserDetails");
        }
    }
}
