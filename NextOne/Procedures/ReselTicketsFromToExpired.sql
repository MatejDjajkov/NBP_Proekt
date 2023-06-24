

CREATE OR REPLACE PROCEDURE update_resell_ticket_status()
 AS $$
BEGIN
    UPDATE resalelisting
    SET status = 'expired'
    WHERE resalelisting.exparationdate < current_date
      AND status = 'available';
END;
$$ LANGUAGE plpgsql;