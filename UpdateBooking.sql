DELIMITER $$

CREATE PROCEDURE UpdateBooking (IN bookingid INT, IN date DATE)
BEGIN
  UPDATE bookings
  SET date = date
  WHERE bookingid = bookingid;
END$$

DELIMITER ;
