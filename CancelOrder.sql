DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(IN orderId INT)
BEGIN
  DELETE FROM orders WHERE orderid = orderId;
END$$
DELIMITER ;
