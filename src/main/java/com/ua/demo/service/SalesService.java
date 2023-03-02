package com.ua.demo.service;

import com.ua.demo.dao.SalesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalesService {

    private final SalesDao salesDao;

    private final CustomerService customerService;

    @Autowired
    public SalesService(SalesDao salesDao, CustomerService customerService) {
        this.salesDao = salesDao;
        this.customerService = customerService;
    }


    public void save(String username, String[] purchaseIds) {
        if(purchaseIds.length == 0) return;
        int customerId = customerService.findByUsername(username);
        if(customerId != -1) {
            for (int i = 0; i < purchaseIds.length; i++) {
                salesDao.save(customerId, Integer.parseInt(purchaseIds[i]));
            }
        }
    }
}
