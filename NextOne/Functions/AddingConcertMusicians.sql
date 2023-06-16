CREATE OR REPLACE FUNCTION add_concert(
    concert_name VARCHAR(255),
    concert_location_id INT,
    concert_date DATE,
    band_ids INT[],
    solo_musician_id INT DEFAULT NULL
) RETURNS VOID AS $$
DECLARE
    new_concert_id INT;
BEGIN
    -- Insert into the concerts table and return the auto-generated concertID
    INSERT INTO concert (concertname, concertlocationid, concertdate)
    VALUES (concert_name, concert_location_id, concert_date)
    RETURNING concertid INTO new_concert_id;

    -- Insert into the many-to-many relationship table (concerts_bands)
    INSERT INTO musicgroup_concert (concertid,musicgroupid)
    SELECT new_concert_id, unnest(band_ids);

    -- Insert solo musician Concert
    IF solo_musician_id IS NOT NULL THEN
        INSERT INTO solomusician_concert (concertid, solomusicianid)
        VALUES (new_concert_id, solo_musician_id);
    END IF;
END;
$$ LANGUAGE plpgsql;

select add_concert('The Best Concert Ever',2,'2023-10-01',ARRAY[1, 2, 3],1);
