package com.ua.demo.dao;

import com.ua.demo.model.Customer;
import com.ua.demo.model.Purchase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class CustomerDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public CustomerDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Customer> findAll() {
        return jdbcTemplate.query("SELECT * FROM customer ORDER BY customer_id;", new BeanPropertyRowMapper<>(Customer.class));
    }

    public Optional<Customer> findOne(int id) {
        return jdbcTemplate.query("SELECT * FROM customer WHERE customer_id=? ORDER BY customer_id", new Object[]{id},
                new BeanPropertyRowMapper<>(Customer.class)).stream().findFirst();
    }

    public void save(Customer customer) {
        jdbcTemplate.update("INSERT INTO customer (username) VALUES (?)", customer.getUsername());
    }

    public void update(int id, Customer customerToUpdate) {
        jdbcTemplate.update("UPDATE customer SET username=? WHERE customer_id=?", customerToUpdate.getUsername(), id);
    }

    public void delete(int id) {
        jdbcTemplate.update("DELETE FROM customer WHERE customer_id=?", id);
    }

    public List<Purchase> findCustomerPurchases(int customerId) {
        return jdbcTemplate
                .query("SELECT  s.purchase_id, p.title, p.description, p.date_created " +
                                "FROM sales AS s LEFT JOIN purchase AS p ON s.purchase_id = p.purchase_id WHERE s.customer_id=?" +
                                " ORDER BY purchase_id",
                        new Object[]{customerId},
                        new BeanPropertyRowMapper<>(Purchase.class));
    }

    public Optional<Customer> findByUsername(String username) {
        return jdbcTemplate.query("SELECT customer_id FROM customer WHERE username=? ORDER BY customer_id",
                new Object[]{username}, new BeanPropertyRowMapper<>(Customer.class)).stream().findFirst();
    }
}
