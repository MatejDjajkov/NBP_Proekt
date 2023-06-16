-- Create the function
CREATE OR REPLACE FUNCTION EmployeeRegisration(
    p_username VARCHAR(255),
    p_email VARCHAR(255),
    p_firstname VARCHAR(255),
    p_lastname VARCHAR(255),
    p_birthdate DATE,
    p_password VARCHAR(255),
    p_phone_number VARCHAR(255),
    theCompanyID INTEGER

)
RETURNS INT AS $$
DECLARE
    registration_id INT;
BEGIN
    -- Insert the registration data into the table
    INSERT INTO appuser (username, email, firstname, lastname, birthdate, password, phonenumber)
    VALUES (p_username, p_email, p_firstname, p_lastname, p_birthdate, p_password, p_phone_number)
    RETURNING userid INTO registration_id;

    insert into employee(appuserid, companyid)
    values (registration_id,theCompanyID);


    -- Return the registration ID
    RETURN registration_id;
END;
$$ LANGUAGE plpgsql;

SELECT proname AS function_name,
       pg_get_function_result(oid) AS return_type,
       pg_get_function_arguments(oid) AS argument_list
FROM pg_proc
WHERE pronamespace = 'public'::regnamespace;
