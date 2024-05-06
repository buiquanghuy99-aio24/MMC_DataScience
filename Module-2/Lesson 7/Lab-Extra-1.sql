-- Active: 1714660276272@@127.0.0.1@3306@sale_management
CREATE DATABASE Sale_Management;
USE Sale_Management;
CREATE TABLE Customers(
    customer_id             INT,
    first_name              VARCHAR(50), 
    last_name               VARCHAR(50),
    email_address           VARCHAR(50),
    number_of_complaints    INT
);

CREATE TABLE Sales(
    purchase_number         INT,
    date_of_purchase        DATE,
    customer_id             INT,
    item_code               VARCHAR(5)
);

CREATE TABLE Items(
    item_code                   VARCHAR(5),
    item                        CHAR(15),
    unit_price_usd              INT,
    company_id                  INT,
    company                     CHAR(15),
    headquarters_phone_number   VARCHAR(20)
);