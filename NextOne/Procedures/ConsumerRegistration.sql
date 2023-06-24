-- Create the function

CREATE OR REPLACE PROCEDURE InsertRegistration(
    p_username VARCHAR(255),
    p_email VARCHAR(255),
    p_firstname VARCHAR(255),
    p_lastname VARCHAR(255),
    p_birthdate DATE,
    p_password VARCHAR(255),
    p_phone_number VARCHAR(255)
)
AS $$
DECLARE
    registration_id INT;
    registrationUserDate DATE;
BEGIN
    -- Insert the registration data into the table
    INSERT INTO appuser (username, email, firstname, lastname, birthdate, password, phonenumber)
    VALUES (p_username, p_email, p_firstname, p_lastname, p_birthdate, p_password, p_phone_number)
    RETURNING userid INTO registration_id;

    registrationUserDate = CURRENT_DATE;
    insert into consumer(appuserid, registrationdate)
    values (registration_id,registrationUserDate);



END;
$$ LANGUAGE plpgsql;

SELECT InsertRegistration('MatejDzajkov','dzajkoc@gmail.com','Matej','Djajkov','2021-05-01','LeleLele12@3',NULL);


