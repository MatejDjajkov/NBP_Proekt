CREATE TABLE Administrator (
  AdminID int4 NOT NULL, 
  PRIMARY KEY (AdminID));
CREATE TABLE Calendar (
  "Date"            date NOT NULL, 
  ConcertLocationID int4 NOT NULL, 
  TimeSlot          int4 NOT NULL, 
  ConcertID         int4, 
  PRIMARY KEY ("Date", 
  ConcertLocationID, 
  TimeSlot));
CREATE TABLE Concert (
  ConcertID         SERIAL NOT NULL, 
  ConcertName       varchar(255) NOT NULL, 
  ConcertLocationID int4 NOT NULL, 
  "Date"            date NOT NULL, 
  CONSTRAINT ConcertID 
    PRIMARY KEY (ConcertID));
CREATE TABLE ConcertLocation (
  LocationID SERIAL NOT NULL, 
  VenueName  varchar(255) NOT NULL UNIQUE, 
  Capacity   int4 NOT NULL, 
  Longitude  float8 NOT NULL, 
  Latitude   float8 NOT NULL, 
  Address    varchar(255) NOT NULL UNIQUE, 
  State      varchar(255) NOT NULL, 
  City       varchar(255) NOT NULL, 
  PRIMARY KEY (LocationID));
CREATE TABLE ConcertOrganisationCompany (
  CompanyID   SERIAL NOT NULL, 
  Adress      varchar(255) NOT NULL UNIQUE, 
  CompanyName varchar(255) NOT NULL UNIQUE, 
  WebSite     varchar(255) NOT NULL UNIQUE, 
  PRIMARY KEY (CompanyID));
CREATE TABLE Customer (
  CustomerID       int4 NOT NULL, 
  RegistrationDate date NOT NULL, 
  CONSTRAINT Customer 
    PRIMARY KEY (CustomerID));
CREATE TABLE Employee (
  EmployeeID int4 NOT NULL, 
  Company    int4 NOT NULL, 
  PRIMARY KEY (EmployeeID));
CREATE TABLE MusicGroup (
  MusicGroupID  SERIAL NOT NULL, 
  GroupName     varchar(255) NOT NULL UNIQUE, 
  FormationDate date NOT NULL, 
  ActiveStatus  varchar(255) NOT NULL, 
  PRIMARY KEY (MusicGroupID));
CREATE TABLE MusicGroup_Concert (
  MusicGroupID int4 NOT NULL, 
  ConcertID    int4 NOT NULL, 
  PRIMARY KEY (MusicGroupID, 
  ConcertID));
CREATE TABLE Musician (
  MusicianID   SERIAL NOT NULL, 
  FirstName    varchar(255) NOT NULL, 
  LastName     varchar(255) NOT NULL, 
  StageName    varchar(255) UNIQUE, 
  MusicGroupID int4, 
  PhoneNumber  varchar(255) NOT NULL, 
  "e-mail"     varchar(255) NOT NULL, 
  BirthDate    date NOT NULL, 
  PRIMARY KEY (MusicianID));
CREATE TABLE Musician_MusicGroup (
  MusicianID   int4 NOT NULL, 
  MusicGroupID int4 NOT NULL, 
  Joined       date NOT NULL, 
  LeftDate     date, 
  PRIMARY KEY (MusicianID, 
  MusicGroupID));
CREATE TABLE "Order" (
  OrderID     SERIAL NOT NULL, 
  CustomerID  int4 NOT NULL, 
  OrderDate   date NOT NULL, 
  OrderStatus varchar(255) NOT NULL, 
  OrderAmount float8 NOT NULL, 
  PRIMARY KEY (OrderID));
CREATE TABLE Payment (
  PaymentID     SERIAL NOT NULL, 
  CustomerID    int4 NOT NULL, 
  OrderOrderID  int4 NOT NULL, 
  PaymentStatus varchar(255) NOT NULL, 
  PaymentMethod varchar(255) NOT NULL, 
  PaymentDate   date NOT NULL, 
  PaymentAmount float8 NOT NULL, 
  PRIMARY KEY (PaymentID));
CREATE TABLE PhysicalShop (
  LocationID  SERIAL NOT NULL, 
  PhoneNumber varchar(255) NOT NULL UNIQUE, 
  Longitude   float8 NOT NULL, 
  Latitude    float8 NOT NULL, 
  Address     varchar(255) NOT NULL UNIQUE, 
  State       varchar(255) NOT NULL, 
  City        varchar(255) NOT NULL, 
  PRIMARY KEY (LocationID));
CREATE TABLE ResaleListing (
  ListingID        SERIAL NOT NULL, 
  SellerCustomerID int4 NOT NULL, 
  TicketID         int4 NOT NULL, 
  ExparationDate   date NOT NULL, 
  ResellPrice      float8 NOT NULL, 
  Description      varchar(255), 
  Status           varchar(255) NOT NULL, 
  PRIMARY KEY (ListingID));
CREATE TABLE ResellPayment (
  ResellPaymentID SERIAL NOT NULL, 
  BuyerCustomerID int4 NOT NULL, 
  ListingID       int4 NOT NULL, 
  ResellAmount    float8 NOT NULL, 
  ResellStatus    varchar(255) NOT NULL, 
  ResellDate      date NOT NULL, 
  PRIMARY KEY (ResellPaymentID));
CREATE TABLE SoloMusician (
  MusicianID int4 NOT NULL, 
  PRIMARY KEY (MusicianID));
CREATE TABLE SoloMusician_Concert (
  SoloMusicianID int4 NOT NULL, 
  ConcertID      int4 NOT NULL, 
  PRIMARY KEY (SoloMusicianID, 
  ConcertID));
CREATE TABLE Ticket (
  TicketID              SERIAL NOT NULL, 
  OrderID               int4, 
  ShopLocationID        int4, 
  ConcertID             int4 NOT NULL, 
  ConcertOrganisationID int4 NOT NULL, 
  Price                 float8 NOT NULL, 
  Status                varchar(255) NOT NULL, 
  ValidUntil            date NOT NULL, 
  "SeatNo."             int4, 
  Row                   int4, 
  PRIMARY KEY (TicketID));
CREATE TABLE TicketOwnerHistory (
  CustomerID int4 NOT NULL, 
  TicketID   int4 NOT NULL, 
  "From"     date NOT NULL, 
  "To"       date, 
  PRIMARY KEY (CustomerID, 
  TicketID));
CREATE TABLE "User" (
  UserID      SERIAL NOT NULL, 
  Username    varchar(255) NOT NULL UNIQUE, 
  email       varchar(255) NOT NULL UNIQUE, 
  FirstName   varchar(255) NOT NULL, 
  LastName    varchar(255) NOT NULL, 
  BirthDate   date NOT NULL, 
  Password    varchar(255) NOT NULL, 
  PhoneNumber varchar(255), 
  PRIMARY KEY (UserID));
ALTER TABLE Calendar ADD CONSTRAINT FKCalendar127966 FOREIGN KEY (ConcertLocationID) REFERENCES ConcertLocation (LocationID);
ALTER TABLE Musician_MusicGroup ADD CONSTRAINT FKMusician_M109284 FOREIGN KEY (MusicGroupID) REFERENCES MusicGroup (MusicGroupID);
ALTER TABLE Musician_MusicGroup ADD CONSTRAINT FKMusician_M853110 FOREIGN KEY (MusicianID) REFERENCES Musician (MusicianID);
ALTER TABLE Ticket ADD CONSTRAINT FKTicket512321 FOREIGN KEY (ShopLocationID) REFERENCES PhysicalShop (LocationID);
ALTER TABLE Payment ADD CONSTRAINT FKPayment617515 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE TicketOwnerHistory ADD CONSTRAINT FKTicketOwne653324 FOREIGN KEY (TicketID) REFERENCES Ticket (TicketID);
ALTER TABLE TicketOwnerHistory ADD CONSTRAINT FKTicketOwne203685 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE SoloMusician_Concert ADD CONSTRAINT FKSoloMusici917899 FOREIGN KEY (ConcertID) REFERENCES Concert (ConcertID);
ALTER TABLE SoloMusician_Concert ADD CONSTRAINT FKSoloMusici113269 FOREIGN KEY (SoloMusicianID) REFERENCES SoloMusician (MusicianID);
ALTER TABLE MusicGroup_Concert ADD CONSTRAINT FKMusicGroup28142 FOREIGN KEY (ConcertID) REFERENCES Concert (ConcertID);
ALTER TABLE MusicGroup_Concert ADD CONSTRAINT FKMusicGroup413064 FOREIGN KEY (MusicGroupID) REFERENCES MusicGroup (MusicGroupID);
ALTER TABLE SoloMusician ADD CONSTRAINT FKSoloMusici601613 FOREIGN KEY (MusicianID) REFERENCES Musician (MusicianID);
ALTER TABLE ResaleListing ADD CONSTRAINT FKResaleList483985 FOREIGN KEY (TicketID) REFERENCES Ticket (TicketID);
ALTER TABLE ResaleListing ADD CONSTRAINT FKResaleList96913 FOREIGN KEY (SellerCustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE ResellPayment ADD CONSTRAINT FKResellPaym749748 FOREIGN KEY (BuyerCustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE ResellPayment ADD CONSTRAINT FKResellPaym21857 FOREIGN KEY (ListingID) REFERENCES ResaleListing (ListingID);
ALTER TABLE Payment ADD CONSTRAINT FKPayment215011 FOREIGN KEY (OrderOrderID) REFERENCES "Order" (OrderID);
ALTER TABLE Ticket ADD CONSTRAINT FKTicket983979 FOREIGN KEY (ConcertOrganisationID) REFERENCES ConcertOrganisationCompany (CompanyID);
ALTER TABLE "Order" ADD CONSTRAINT FKOrder835009 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE Administrator ADD CONSTRAINT FKAdministra775053 FOREIGN KEY (AdminID) REFERENCES "User" (UserID);
ALTER TABLE Calendar ADD CONSTRAINT FKCalendar595729 FOREIGN KEY (ConcertID) REFERENCES Concert (ConcertID);
ALTER TABLE Employee ADD CONSTRAINT FKEmployee377756 FOREIGN KEY (Company) REFERENCES ConcertOrganisationCompany (CompanyID);
ALTER TABLE Employee ADD CONSTRAINT FKEmployee95854 FOREIGN KEY (EmployeeID) REFERENCES "User" (UserID);
ALTER TABLE Customer ADD CONSTRAINT FKCustomer418898 FOREIGN KEY (CustomerID) REFERENCES "User" (UserID);
ALTER TABLE Ticket ADD CONSTRAINT FKTicket554930 FOREIGN KEY (OrderID) REFERENCES "Order" (OrderID);
ALTER TABLE Ticket ADD CONSTRAINT FKTicket818924 FOREIGN KEY (ConcertID) REFERENCES Concert (ConcertID);
ALTER TABLE Concert ADD CONSTRAINT FKConcert232883 FOREIGN KEY (ConcertLocationID) REFERENCES ConcertLocation (LocationID);

ALTER TABLE Musician
ADD CONSTRAINT check_PhoneNumber
CHECK (PhoneNumber LIKE '(___) ___-____');

ALTER TABLE PhysicalShop
ADD CONSTRAINT check_PhoneNumber
CHECK (PhoneNumber LIKE '(___) ___-____');

ALTER TABLE User
ADD CONSTRAINT check_PhoneNumber
CHECK (PhoneNumber LIKE '(___) ___-____');

ALTER TABLE User
ADD CONSTRAINT check_valid_email
CHECK (email ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

ALTER TABLE MusicGroup
ADD CONSTRAINT check_ActiveStatus
CHECK (ActiveStatus IN ('active', 'disbanded'));

ALTER TABLE Calendar
ADD CONSTRAINT check_TimeSlot
CHECK (TimeSlot >= 0 AND TimeSlot <= 23);

ALTER TABLE ConcertLocation
ADD CONSTRAINT check_lat_long
CHECK (latitude BETWEEN -90 and 90 AND longitude BETWEEN -180 and 180);
