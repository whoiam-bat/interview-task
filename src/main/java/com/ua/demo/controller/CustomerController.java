package com.ua.demo.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ua.demo.model.Customer;
import com.ua.demo.model.Purchase;
import com.ua.demo.service.CustomerService;
import com.ua.demo.service.PurchaseService;
import com.ua.demo.service.SalesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/sets")
public class CustomerController {

    private final CustomerService customerService;

    private final PurchaseService purchaseService;

    private final SalesService salesService;

    private final ObjectMapper objectMapper;

    @Autowired
    public CustomerController(CustomerService customerService, PurchaseService purchaseService, SalesService salesService, ObjectMapper objectMapper) {
        this.customerService = customerService;
        this.purchaseService = purchaseService;
        this.salesService = salesService;
        this.objectMapper = objectMapper;
    }

    @GetMapping
    public String customerList(Model model) throws JsonProcessingException {
        List<Customer> customers = customerService.findAll();

        String resCustomers = objectMapper.writeValueAsString(customers);

        model.addAttribute("customerList", resCustomers);
        model.addAttribute("purchaseList", purchaseService.findAll());

        return "customer-list";
    }

    @PostMapping
    public String add(HttpServletRequest request) {
        String[] purchaseIds = request.getParameterValues("plist");
        String username = request.getParameter("username");

        customerService.save(new Customer(0, username));
        salesService.save(username, purchaseIds);

        return "redirect:/sets";
    }

    @PostMapping("/delete")
    public String delete(HttpServletRequest request) {
        int idToDelete = Integer.parseInt(request.getParameter("id"));

        customerService.delete(idToDelete);

        return "redirect:/sets";
    }

    @GetMapping("/set/{id}")
    public String getOneSet(@PathVariable("id") int id, Model model) throws JsonProcessingException {
        Customer customer = customerService.findOne(id);
        List<Purchase> customerPurchases = customerService.findAllPurchasesByCustomerId(id);
        String res = objectMapper.writeValueAsString(customerPurchases);

        model.addAttribute("customer", customer);
        model.addAttribute("customerPurchases", res);

        return "customer";
    }
}
