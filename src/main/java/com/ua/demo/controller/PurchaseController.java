package com.ua.demo.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ua.demo.model.Purchase;
import com.ua.demo.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/kpacs")
public class PurchaseController {

    private final PurchaseService purchaseService;

    private final ObjectMapper objectMapper;

    @Autowired
    public PurchaseController(PurchaseService purchaseService, ObjectMapper objectMapper) {
        this.purchaseService = purchaseService;
        this.objectMapper = objectMapper;
    }

    @GetMapping
    public String purchaseList(Model model) throws JsonProcessingException {
        List<Purchase> purchaseList = purchaseService.findAll();
        String res = objectMapper.writeValueAsString(purchaseList);

        model.addAttribute("purchaseList", res);

        return "purchase-list";
    }

    @PostMapping
    public String add(HttpServletRequest request) {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        LocalDate dateCreated = LocalDate.parse(request.getParameter("date"));

        purchaseService.save(new Purchase(0, title, description, dateCreated));

        return "redirect:/kpacs";
    }

    @PostMapping("/delete")
    public String delete(HttpServletRequest request) {
        int idToDelete = Integer.parseInt(request.getParameter("id"));

        purchaseService.delete(idToDelete);

        return "redirect:/kpacs";
    }

}
