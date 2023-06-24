drop function insert_ticket_function(concertIDArgument INT, concertOrganisationCompany INT, ticketPrice DECIMAL, NumberOfTickets INT);

CREATE OR REPLACE PROCEDURE insert_ticket_function(
  concertIDArgument INT,
  concertOrganisationCompany INT,
  ticketPrice DECIMAL,
  NumberOfTickets INT
)
 AS
$$
DECLARE
  validUntilDate DATE;
BEGIN
  SELECT concertdate INTO validUntilDate FROM concert WHERE concertid=concertIDArgument;

  INSERT INTO ticket (orderid, physicalshopid, concertid, concertorganisationid, price, status, validuntil)
  SELECT
    NULL AS orderid,
    NULL AS physicalshopid,
    concertIDArgument AS concertid,
    concertOrganisationCompany AS concertorganisationid,
    ticketPrice AS price,
    'available' AS status,
    validUntilDate::date AS validuntil
  FROM generate_series(1, NumberOfTickets);
END;
$$
LANGUAGE plpgsql;