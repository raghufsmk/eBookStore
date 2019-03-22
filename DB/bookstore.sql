USE bookstore;

CREATE TABLE tbl_author (
    `author_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `date_of_birth` DATE,
    PRIMARY KEY (`author_id`),
    KEY (`name`)
);

CREATE TABLE tbl_orders (
    `order_id` INTEGER NOT NULL AUTO_INCREMENT,
    `order_date` DATETIME,
    `isbn` BIGINT NOT NULL,
    `cust_id` INTEGER NOT NULL,
    `order_status` VARCHAR(40),
    PRIMARY KEY (`order_id`),
    FOREIGN KEY (isbn)
        REFERENCES tbl_book (isbn),
    FOREIGN KEY (cust_id)
        REFERENCES tbl_customer (cust_id)
);

CREATE TABLE tbl_customer (
    `cust_id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstname` VARCHAR(100),
    `lastname` VARCHAR(100),
    `username` VARCHAR(100) UNIQUE,
    `password` VARCHAR(100),
    `email` VARCHAR(100),
    `mobile_no` INTEGER,
    `street` VARCHAR(100),
    `city` VARCHAR(100),
    `state` VARCHAR(100),
    `country` VARCHAR(100),
    `zipcode` INTEGER,
    PRIMARY KEY (`cust_id`)
);

CREATE TABLE tbl_book (
    `author_id` INTEGER NOT NULL,
    `language` VARCHAR(100),
    `supplier` VARCHAR(100),
    `price` FLOAT,
    `isbn` BIGINT NOT NULL,
    `publish_year` DATE,
    `subject` VARCHAR(100),
    `format` VARCHAR(50),
    `keywords` VARCHAR(100),
    `available_copies` INTEGER,
    `publisher` VARCHAR(100),
    `title` VARCHAR(100),
    `image` VARCHAR(100),
    PRIMARY KEY (`isbn`),
    FOREIGN KEY (author_id)
        REFERENCES tbl_author (author_id)
);

CREATE TABLE `tbl_order_details` (
    `order_id` INTEGER NOT NULL,
    `isbn` BIGINT NOT NULL,
    `quantity` INTEGER NOT NULL,
    `ship_date` DATETIME,
    PRIMARY KEY (order_id , isbn),
    FOREIGN KEY (isbn)
        REFERENCES tbl_book (isbn),
    FOREIGN KEY (order_id)
        REFERENCES tbl_orders (order_id)
);

alter table tbl_orders
modify column isbn BIGINT not null

ALTER TABLE tbl_orders
ADD FOREIGN KEY 