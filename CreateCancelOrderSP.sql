DELIMITER //
CREATE PROCEDURE CancelOrder (IN orderId INT)
BEGIN
  DELETE FROM orders WHERE order_id = orderId;
END //
DELIMITER ;