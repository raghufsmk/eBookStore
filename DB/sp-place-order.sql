USE `bookstore`;
DROP PROCEDURE IF EXISTS `sp_place_order`;

DELIMITER $$
USE `bookstore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_place_order`(IN cust_id INT,
IN products JSON,
OUT out_order_details_count INT)
BEGIN
DECLARE var_order_date DATETIME;
DECLARE var_order_id INT;
DECLARE var_current_date DATETIME;
DECLARE var_order_status VARCHAR(40);
DECLARE var_items_count BIGINT UNSIGNED DEFAULT JSON_LENGTH(`products`);
DECLARE var_index BIGINT UNSIGNED DEFAULT 0;
DECLARE var_isbn bigint;

SET var_current_date = CURDATE();
# SELECT CONCAT('Current data:', var_current_date);
SET var_order_status = 'Placed';

# Add Order entry in Order table
INSERT INTO tbl_orders(order_date, cust_id, order_status) VALUES(var_current_date, cust_id, var_order_status);

# Get newly inserted order_id
 SELECT order_id into var_order_id
	 FROM tbl_orders 
     WHERE order_id=(SELECT LAST_INSERT_ID());
     
WHILE var_index < var_items_count DO
    INSERT INTO tbl_order_details (order_id, isbn, quantity)
     VALUES (var_order_id,
     JSON_EXTRACT(`products`, CONCAT('$[', `var_index`, '].isbn')),     
     JSON_EXTRACT(`products`, CONCAT('$[', `var_index`, '].quantity')));
     SET var_index := var_index + 1;
     #set var_isbn= JSON_EXTRACT(`products`, CONCAT('$[', `var_index`, '].isbn')) ;
    END WHILE;
# SELECT CONCAT('ISBN From products:', var_isbn);

SELECT count(*) into out_order_details_count
	 FROM tbl_order_details 
     WHERE order_id=var_order_id;
     
# set out_order_status = true;
     
END$$
DELIMITER ;