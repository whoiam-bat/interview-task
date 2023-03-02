package com.ua.demo.dao;

import com.ua.demo.model.Customer;
import com.ua.demo.model.Purchase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;
import java.util.Optional;

@Repository
public class PurchaseDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public PurchaseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Purchase> findAll() {
        return jdbcTemplate.query("SELECT * FROM purchase ORDER BY purchase_id;", new BeanPropertyRowMapper<>(Purchase.class));
    }

    public Optional<Purchase> findOne(int id) {
        return jdbcTemplate.query("SELECT * FROM purchase WHERE purchase_id=? ORDER BY purchase_id", new Object[]{id},
                new BeanPropertyRowMapper<>(Purchase.class)).stream().findFirst();
    }

    public void save(Purchase purchase) {
        jdbcTemplate.update("INSERT INTO purchase (title, description, date_created) VALUES (?, ?, ?)",
                purchase.getTitle(), purchase.getDescription(), purchase.getDateCreated());
    }

    public void update(int id, Purchase purchaseToUpdate) {
        jdbcTemplate.update("UPDATE purchase SET title=?, description=?, date_created=? WHERE purchase_id=?",
                purchaseToUpdate.getTitle(), purchaseToUpdate.getDescription(), purchaseToUpdate.getDateCreated(), id);
    }

    public void delete(int id) {
        jdbcTemplate.update("DELETE FROM purchase WHERE purchase_id=?", id);
    }

    public List<Customer> findPurchaseCustomers(int purchaseId) {
        return jdbcTemplate
                .query("SELECT  s.customer_id, c.username " +
                                "FROM sales AS s LEFT JOIN customer AS c ON s.customer_id = c.customer_id WHERE s.purchase_id=? " +
                                "ORDER BY customer_id",
                        new Object[]{purchaseId},
                        new BeanPropertyRowMapper<>(Customer.class));
    }
}
