package com.ua.demo.service;

import com.ua.demo.dao.PurchaseDao;
import com.ua.demo.model.Customer;
import com.ua.demo.model.Purchase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PurchaseService {

    private final PurchaseDao purchaseDao;

    @Autowired
    public PurchaseService(PurchaseDao purchaseDao) {
        this.purchaseDao = purchaseDao;
    }

    public List<Purchase> findAll() {
        return purchaseDao.findAll();
    }

    public Purchase findOne(int id) {
        Optional<Purchase> customer = purchaseDao.findOne(id);
        return customer.orElse(null);
    }

    public void save(Purchase purchase) {
        purchaseDao.save(purchase);
    }

    public void update(int id, Purchase purchase) {
        purchaseDao.update(id, purchase);
    }

    public void delete(int id) {
        purchaseDao.delete(id);
    }

    public List<Customer> findAllCustomersByPurchaseId(int id) {
        return purchaseDao.findPurchaseCustomers(id);
    }
}
