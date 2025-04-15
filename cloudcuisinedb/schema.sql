create database cloudcuisine;
use cloudcuisine;
show tables;

CREATE TABLE address (
    street_address VARCHAR(255),
    city VARCHAR(100),
    state CHAR(2),
    zip VARCHAR(10),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    PRIMARY KEY (street_address, zip)
);


CREATE TABLE store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(255),
    street_address VARCHAR(255),
    zip VARCHAR(5),
    FOREIGN KEY (street_address, zip) REFERENCES address(street_address, zip)
);

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    number_of_reviews INT DEFAULT 0
);

CREATE TABLE review (
    store_id INT,
    user_id INT,
    review_timestamp TIMESTAMP,
    number_of_stars INT CHECK (number_of_stars BETWEEN 1 AND 5),
    review_text TEXT,
    PRIMARY KEY (user_id, review_timestamp),
    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE menu_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    price DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);




