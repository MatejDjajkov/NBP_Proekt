ALTER TABLE appuser
ADD CONSTRAINT check_PhoneNumber
CHECK (PhoneNumber ~ '^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$');

ALTER TABLE appuser
ADD CONSTRAINT check_valid_email
CHECK (email ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

ALTER TABLE AppUser
ADD CONSTRAINT password_check CHECK
(password ~ '^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$');


