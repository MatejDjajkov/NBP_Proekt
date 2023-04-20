INSERT INTO "User" (Username, email, FirstName, LastName, BirthDate, Password, PhoneNumber)
VALUES
  ('jdoe', 'jdoe@example.com', 'John', 'Doe', '1990-01-01', 'mypassword1', '(123) 555-1234'),
  ('jsmith', 'jsmith@example.com', 'Jane', 'Smith', '1985-02-15', 'mypassword2', NULL),
  ('jkim', 'jkim@example.com', 'Jin', 'Kim', '1995-03-31', 'mypassword3', '(234) 555-4321'),
  ('abrown', 'abrown@example.com', 'Alex', 'Brown', '1980-04-23', 'mypassword4', NULL),
  ('mlee', 'mlee@example.com', 'Mary', 'Lee', '1987-05-10', 'mypassword5', '(345) 555-5678');

INSERT INTO Administrator (AdminID)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5);

INSERT INTO Customer (CustomerID, RegistrationDate)
VALUES
  (1, '2022-01-01'),
  (2, '2022-02-15'),
  (3, '2022-03-31'),
  (4, '2022-04-23'),
  (5, '2022-05-10');

-- ON UPDATE works (change is applied everywhere)
UPDATE "User"
SET UserID = 14
WHERE UserID = 2;
-- ON DELETE works (here the adminID can not be set null on delete bc of NOT NULL constraint)
DELETE FROM "User" WHERE UserId = 4;


INSERT INTO "Order" (CustomerID, OrderDate, OrderStatus, OrderAmount)
VALUES
(3, '2022-01-01', 'Pending', 100.0),
(4, '2022-01-02', 'Shipped', 200.0),
(5, '2022-01-03', 'Delivered', 300.0);

INSERT INTO Payment (CustomerID, OrderOrderID, PaymentStatus, PaymentMethod, PaymentDate, PaymentAmount)
VALUES
  (3, 1, 'Success', 'Credit card', '2023-04-19', 29.99),
  (4, 2, 'Success', 'PayPal', '2023-04-18', 49.99),
  (5, 3, 'Pending', 'Debit Card', '2023-04-17', 99.99);

INSERT INTO ConcertLocation (VenueName, Capacity, Longitude, Latitude, Address, State, City)
VALUES
  ('Madison Square Garden', 20000, -73.9936, 40.7505, '4 Pennsylvania Plaza', 'NY', 'New York'),
  ('Staples Center', 21000, -118.2673, 34.043, '1111 S Figueroa St', 'CA', 'Los Angeles'),
  ('O2 Arena', 20000, -0.0045, 51.5033, 'Peninsula Square', 'London', 'UK');

INSERT INTO Concert (ConcertName, ConcertLocationID, "Date")
VALUES
  ('Rock Fest', 1, '2023-07-15'),
  ('Pop Live', 2, '2023-08-20'),
  ('Jazz Night', 3, '2023-09-10');

INSERT INTO PhysicalShop (PhoneNumber, Longitude, Latitude, Address, State, City)
VALUES
  ('(123) 456-7890', -73.985428, 40.748817, '123 Main St', 'NY', 'New York'),
  ('(234) 567-8901', -118.243683, 34.052235, '456 Elm St', 'CA', 'Los Angeles'),
  ('(345) 678-9012', -87.629799, 41.878114, '789 Oak St', 'IL', 'Chicago');

INSERT INTO ConcertOrganisationCompany (Adress, CompanyName, WebSite)
VALUES
    ('123 Main Street', 'Acme Concerts Inc.', 'https://www.acme-concerts.net/tickets.aspx?event=12345'),
    ('456 Broadway', 'Musical Productions LLC', 'http://subdomain.example.co.uk:8080/path/to/page?query=string'),
    ('789 Elm Street', 'Concerts R Us', 'https://www.concertsrus.com');


INSERT INTO Ticket (OrderID, ShopLocationID, ConcertID, ConcertOrganisationID, Price, Status, ValidUntil, "SeatNo.", Row)
VALUES
  (4, 1, 1, 1, 50.00, 'Valid', '2023-04-30', 12, 4),
  (5, 2, 2, 2, 75.00, 'Valid', '2023-05-15', 6, 2),
  (6, 3, 3, 3, 100.00, 'Valid', '2023-05-31', 20, 8);

-- ON UPDATE works (change is applied everywhere)
UPDATE "Order"
SET OrderID = 20
WHERE OrderID = 5;
-- ON DELETE works
DELETE FROM "Order" WHERE OrderId = 4;