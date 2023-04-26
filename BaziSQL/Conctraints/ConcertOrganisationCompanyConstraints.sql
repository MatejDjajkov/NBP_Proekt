ALTER TABLE ConcertOrganisationCompany
ADD CONSTRAINT check_website
CHECK (WebSite ~* '^((http|https):\/\/)?(www\.[a-zA-Z0-9\-]+\.[a-zA-Z]{2,})(:[0-9]{1,5})?(\/([a-zA-Z0-9#!:.?+=&%@!\-\/_])*)?$
');

