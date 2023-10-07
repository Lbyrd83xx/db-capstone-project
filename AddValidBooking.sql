DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddValidBooking`(IN bookingdate DATE, IN tablenumber INT)
BEGIN
	DECLARE tablebooked INT;
	DECLARE fullname VARCHAR(50);
	
	START TRANSACTION;
	
	SELECT tablebooked, fullname
	INTO tablebooked, fullname
	FROM bookings
	WHERE bookingdate = bookingdate AND tablenumber = tablenumber;
	
	IF tablebooked IS NOT NULL THEN
		ROLLBACK;
		SELECT CONCAT('Table ', tablenumber, ' is already booked by ', fullname, ' on ', bookingdate, '. Please select another table.') AS message;
	ELSE
		INSERT INTO bookings (bookingdate, tablenumber) VALUES (bookingdate, tablenumber);
		COMMIT;
		SELECT CONCAT('Table ', tablenumber, ' confirmed for booking on ', bookingdate, '.') AS message;
	END IF;
	
END$$
DELIMITER ;
