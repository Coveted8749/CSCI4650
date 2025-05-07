create database cloudcuisine;
use cloudcuisine;
show tables;

SET foreign_key_checks = 0;
DROP TABLE IF EXISTS reviews_address;
DROP TABLE IF EXISTS reviews_store;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS reviews_review;
DROP TABLE IF EXISTS reviews_menuitem;
SET foreign_key_checks = 1;

CREATE TABLE IF NOT EXISTS reviews_address (
    address_id INT PRIMARY KEY,
    street_address VARCHAR(255),
    city VARCHAR(100),
    state CHAR(2),
    zip VARCHAR(10),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6)
);

CREATE TABLE IF NOT EXISTS reviews_store (
    store_id INT PRIMARY KEY,
    address_id INT,
    store_name VARCHAR(255),
    FOREIGN KEY (address_id) REFERENCES reviews_address(address_id)
);

CREATE TABLE IF NOT EXISTS customer (
    customer_id INT PRIMARY KEY,
    customername VARCHAR(50) UNIQUE,
    password VARCHAR(128),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    number_of_reviews INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS reviews_review (
    store_id INT,
    customer_id INT,
    review_timestamp TIMESTAMP,
    number_of_stars INT CHECK (number_of_stars BETWEEN 1 AND 5),
    review_text TEXT,
    PRIMARY KEY (customer_id, review_timestamp),
    FOREIGN KEY (store_id) REFERENCES reviews_store(store_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE IF NOT EXISTS reviews_menuitem (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    price DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES reviews_store(store_id)
);
