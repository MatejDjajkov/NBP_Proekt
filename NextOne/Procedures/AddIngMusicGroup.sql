CREATE or replace PROCEDURE add_music_group(
    gr_name varchar(255),
    musicianIDs INT[]
) AS $$
DECLARE
    new_group_id INT;
BEGIN
    insert into musicgroup(groupname, formationdate, activestatus)
    VALUES (gr_name,current_date,'active')
    returning musicgroupid into new_group_id;

    insert into musician_musicgroup(musicianid, musicgroupid, joined, leftdate)
    values (unnest(musicianIDs),new_group_id,current_date,NULL);

END;
$$ language plpgsql;

call add_music_group('New kids on the block',ARRAY [1,2,3]);

