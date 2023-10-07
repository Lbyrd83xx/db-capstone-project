DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN bookingid INT)
BEGIN
    DELETE FROM bookings WHERE id = bookingid;
    SELECT CONCAT('Booking with id ', bookingid, ' has been cancelled.') AS 'Status';
END$$
DELIMITER ;
