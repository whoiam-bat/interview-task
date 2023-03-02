/*
DATABASE CREATION
*/
DROP DATABASE IF EXISTS sales;
CREATE DATABASE IF NOT EXISTS sales;
USE sales;

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS purchase;

/*
USERS TABLE CREATION
*/
CREATE TABLE IF NOT EXISTS customer
(
    customer_id int PRIMARY KEY AUTO_INCREMENT,
    username    varchar(250) NOT NULL
);

/*
ORDERS TABLE CREATION
*/
CREATE TABLE IF NOT EXISTS purchase
(
    purchase_id int           NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title       varchar(250)  NOT NULL,
    description varchar(2000) NOT NULL,
    date_created date          NOT NULL
);

/*
JOIN TABLE CREATION
*/
CREATE TABLE IF NOT EXISTS sales
(
    sales_id    int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id int NOT NULL,
    purchase_id int NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (purchase_id) REFERENCES purchase (purchase_id) ON DELETE CASCADE ON UPDATE CASCADE 
);