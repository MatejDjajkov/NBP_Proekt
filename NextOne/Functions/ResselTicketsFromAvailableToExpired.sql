CREATE OR REPLACE FUNCTION update_resell_ticket_status()
RETURNS VOID AS $$
BEGIN
    UPDATE resalelisting
    SET status = 'expired'
    WHERE resalelisting.exparationdate < current_date
      AND status = 'available';
END;
$$ LANGUAGE plpgsql;

select update_resell_ticket_status();

