DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN bookingid INT, IN customerid INT, IN bookingdate DATE, IN tablenumber INT)
BEGIN

INSERT INTO bookings (bookingid, customerid, bookingdate, tablenumber) 
VALUES (bookingid, customerid, bookingdate, tablenumber);

END$$
DELIMITER ;
