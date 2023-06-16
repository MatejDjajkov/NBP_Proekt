CREATE OR REPLACE FUNCTION addingTicketForResell(
    price DECIMAL,
    IDconsumer INT,
    IDticket INT
) RETURNS void AS $$
DECLARE
    thisDate DATE  := CURRENT_DATE;
    checkConsumer INT=-1;
    expirationDate DATE;
BEGIN

    SELECT consumerid INTO checkConsumer
    FROM ticketownerhistory
    WHERE ticketid = IDticket
        AND dateto IS NULL;

    IF checkConsumer=-1 OR checkConsumer != IDconsumer THEN
        RAISE EXCEPTION 'Invalid Consumer';
    END IF;

    SELECT validuntil INTO expirationDate
    FROM ticket
    WHERE ticketid = IDticket;

    IF expirationDate < thisDate THEN
        RAISE EXCEPTION 'Cannot sell expired ticket';
    END IF;

    INSERT INTO resalelisting (sellerconsumerid, ticketid, exparationdate, resellprice, description, status)
    VALUES (IDconsumer, IDticket, expirationDate, price, NULL, 'available');

END;
$$ LANGUAGE plpgsql;

select addingTicketForResell(80.0,10456,1061760);
