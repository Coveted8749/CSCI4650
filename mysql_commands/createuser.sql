    CREATE USER 'user'@'localhost' IDENTIFIED BY '12345678';
    CREATE DATABASE cloudcuisine;
    GRANT ALL PRIVILEGES ON cloudcuisine.* TO 'user'@'localhost';
    FLUSH PRIVILEGES;
    EXIT;