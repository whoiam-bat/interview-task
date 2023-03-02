package com.ua.demo.service;

import com.ua.demo.dao.CustomerDao;
import com.ua.demo.model.Customer;
import com.ua.demo.model.Purchase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerService {

    private final CustomerDao customerDao;

    @Autowired
    public CustomerService(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    public List<Customer> findAll() {
        return customerDao.findAll();
    }

    public Customer findOne(int id) {
        Optional<Customer> customer = customerDao.findOne(id);
        return customer.orElse(null);
    }

    public void save(Customer customer) {
        customerDao.save(customer);
    }

    public void update(int id, Customer customer) {
        customerDao.update(id, customer);
    }

    public void delete(int id) {
        customerDao.delete(id);
    }

    public List<Purchase> findAllPurchasesByCustomerId(int id) {
        return customerDao.findCustomerPurchases(id);
    }

    public int findByUsername(String username) {
        Optional<Customer> temp = customerDao.findByUsername(username);
        return temp.map(Customer::getCustomerId).orElse(-1);
    }
}
