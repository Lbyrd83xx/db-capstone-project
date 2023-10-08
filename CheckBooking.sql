DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN bookingdate DATE, IN tablenumber INT)
BEGIN
    DECLARE status VARCHAR(10);
    SELECT status INTO status FROM orderdeliverystatus WHERE DeliveryDate = bookingdate AND tablenumber = tablenumber;
    IF (status = 'booked') THEN
        SELECT 'Table ' + CAST(tablenumber AS CHAR) + ' is already booked on ' + CAST(bookingdate AS CHAR) AS 'Booking Status';
    ELSE
        SELECT 'Table ' + CAST(tablenumber AS CHAR) + ' is available for booking on ' + CAST(bookingdate AS CHAR) AS 'Booking Status';
    END IF;
END$$
DELIMITER ;
