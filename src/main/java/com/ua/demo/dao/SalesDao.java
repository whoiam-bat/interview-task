package com.ua.demo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public SalesDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void save(int customerId, int purchaseId) {
        jdbcTemplate.update("INSERT INTO sales (customer_id, purchase_id) VALUES (?, ?)",
                customerId, purchaseId);
    }
}
