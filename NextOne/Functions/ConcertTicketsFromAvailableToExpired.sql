CREATE OR REPLACE FUNCTION update_concert_ticket_status() RETURNS VOID AS $$
BEGIN
    UPDATE ticket
    SET status = 'expired'
    WHERE ticket.validuntil < current_date
      AND status = 'available';
END;
$$ LANGUAGE plpgsql;

select update_concert_ticket_status();

