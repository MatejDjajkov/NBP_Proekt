DROP FUNCTION update_concert_ticket_status();

CREATE OR REPLACE PROCEDURE update_concert_ticket_status() AS $$
BEGIN
    UPDATE ticket
    SET status = 'expired'
    WHERE ticket.validuntil < current_date
      AND status = 'available';
END;
$$ LANGUAGE plpgsql;

select update_concert_ticket_status();

select venuename,capacity from concertlocation
