CREATE TABLE Administrator (
  AdminID int4 NOT NULL,
  PRIMARY KEY (AdminID));
CREATE TABLE AppUser (
  UserID      SERIAL NOT NULL,
  Username    varchar(255) NOT NULL UNIQUE,
  email       varchar(255) NOT NULL UNIQUE,
  FirstName   varchar(255) NOT NULL,
  LastName    varchar(255) NOT NULL,
  BirthDate   date NOT NULL,
  Password    varchar(255) NOT NULL,
  PhoneNumber varchar(255) UNIQUE,
  PRIMARY KEY (UserID));
CREATE TABLE Calendar (
  CalendarID        SERIAL NOT NULL,
  ConcertLocationID int4 NOT NULL,
  ConcertID         int4,
  CalendarDate      date NOT NULL,
  TimeSlot          int4 NOT NULL,
  PRIMARY KEY (CalendarID));
CREATE TABLE Concert (
  ConcertID         SERIAL NOT NULL,
  ConcertName       varchar(255) NOT NULL,
  ConcertLocationID int4 NOT NULL,
  ConcertDate       date NOT NULL,
  CONSTRAINT ConcertID
    PRIMARY KEY (ConcertID));
CREATE TABLE ConcertLocation (
  ConcertLocationID SERIAL NOT NULL,
  VenueName         varchar(255) NOT NULL UNIQUE,
  Capacity          int4 NOT NULL,
  Longitude         float8 NOT NULL,
  Latitude          float8 NOT NULL,
  Address           varchar(255) NOT NULL UNIQUE,
  State             varchar(255) NOT NULL,
  City              varchar(255) NOT NULL,
  PRIMARY KEY (ConcertLocationID));
CREATE TABLE ConcertOrganisationCompany (
  CompanyID   SERIAL NOT NULL,
  Address     varchar(255) NOT NULL UNIQUE,
  CompanyName varchar(255) NOT NULL UNIQUE,
  WebSite     varchar(255) NOT NULL UNIQUE,
  PRIMARY KEY (CompanyID));
CREATE TABLE Consumer (
  ConsumerID       int4 NOT NULL,
  RegistrationDate date NOT NULL,
  CONSTRAINT Customer
    PRIMARY KEY (ConsumerID));
CREATE TABLE Employee (
  EmployeeID int4 NOT NULL,
  CompanyID  int4 NOT NULL,
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
  MusicianID  SERIAL NOT NULL,
  FirstName   varchar(255) NOT NULL,
  LastName    varchar(255) NOT NULL,
  StageName   varchar(255) UNIQUE,
  PhoneNumber varchar(255) UNIQUE,
  email       varchar(255) NOT NULL UNIQUE,
  BirthDate   date NOT NULL,
  PRIMARY KEY (MusicianID));
CREATE TABLE Musician_MusicGroup (
  MusicianID   int4 NOT NULL,
  MusicGroupID int4 NOT NULL,
  Joined       date NOT NULL,
  LeftDate     date,
  PRIMARY KEY (MusicianID,
  MusicGroupID));
CREATE TABLE Payment (
  PaymentID     SERIAL NOT NULL,
  ConsumerID    int4 NOT NULL,
  OrderID       int4 NOT NULL,
  PaymentStatus varchar(255) NOT NULL,
  PaymentMethod varchar(255) NOT NULL,
  PaymentDate   date NOT NULL,
  PaymentAmount float8 NOT NULL,
  PRIMARY KEY (PaymentID));
CREATE TABLE PhysicalShop (
  PhysicalShopID SERIAL NOT NULL,
  PhoneNumber    varchar(255) NOT NULL UNIQUE,
  Longitude      float8 NOT NULL,
  Latitude       float8 NOT NULL,
  Address        varchar(255) NOT NULL UNIQUE,
  State          varchar(255) NOT NULL,
  City           varchar(255) NOT NULL,
  PRIMARY KEY (PhysicalShopID));
CREATE TABLE ResaleListing (
  ListingID        SERIAL NOT NULL,
  SellerConsumerID int4 NOT NULL,
  TicketID         int4 NOT NULL,
  ExparationDate   date NOT NULL,
  ResellPrice      float8 NOT NULL,
  Description      varchar(255),
  Status           varchar(255) NOT NULL,
  PRIMARY KEY (ListingID));
CREATE TABLE ResellPayment (
  ResellPaymentID SERIAL NOT NULL,
  BuyerConsumerID int4 NOT NULL,
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
  PhysicalShopID        int4,
  ConcertID             int4 NOT NULL,
  ConcertOrganisationID int4 NOT NULL,
  Price                 float8 NOT NULL,
  Status                varchar(255) NOT NULL,
  ValidUntil            date NOT NULL,
  SeatNo                int4,
  Row                   int4,
  PRIMARY KEY (TicketID));
CREATE TABLE TicketOrder (
  OrderID     SERIAL NOT NULL,
  ConsumerID  int4 NOT NULL,
  OrderDate   date NOT NULL,
  OrderStatus varchar(255) NOT NULL,
  OrderAmount float8 NOT NULL,
  PRIMARY KEY (OrderID));
CREATE TABLE TicketOwnerHistory (
  ConsumerID int4 NOT NULL,
  TicketID   int4 NOT NULL,
  DateFrom   date NOT NULL,
  DateTo     date,
  PRIMARY KEY (ConsumerID,
  TicketID));


ALTER TABLE Calendar ADD CONSTRAINT FKCalendar506871 FOREIGN KEY (ConcertLocationID) REFERENCES ConcertLocation (ConcertLocationID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Calendar ADD CONSTRAINT FKCalendar595729 FOREIGN KEY (ConcertID) REFERENCES Concert (ConcertID) ON DELETE SET NULL ON UPDATE CASCADE;

--ON DELETE SET NULL OR CASCADE?
ALTER TABLE Musician_MusicGroup ADD CONSTRAINT FKMusician_M109284 FOREIGN KEY (MusicGroupID) REFERENCES MusicGroup (MusicGroupID);
ALTER TABLE Musician_MusicGroup ADD CONSTRAINT FKMusician_M853110 FOREIGN KEY (MusicianID) REFERENCES Musician (MusicianID);


ALTER TABLE Ticket ADD CONSTRAINT FKTicket966245 FOREIGN KEY (PhysicalShopID) REFERENCES PhysicalShop (PhysicalShopID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Ticket ADD CONSTRAINT FKTicket983979 FOREIGN KEY (ConcertOrganisationID) REFERENCES ConcertOrganisationCompany (CompanyID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Ticket ADD CONSTRAINT FKTicket626163 FOREIGN KEY (OrderID) REFERENCES TicketOrder (OrderID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Ticket ADD CONSTRAINT FKTicket818924 FOREIGN KEY (ConcertID) REFERENCES Concert (ConcertID) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Payment ADD CONSTRAINT FKPayment277293 FOREIGN KEY (OrderID) REFERENCES TicketOrder (OrderID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Payment ADD CONSTRAINT FKPayment668523 FOREIGN KEY (ConsumerID) REFERENCES Consumer (ConsumerID) ON DELETE SET NULL ON UPDATE CASCADE;


--ON DELETE SET NULL OR CASCADE?
ALTER TABLE TicketOwnerHistory ADD CONSTRAINT FKTicketOwne653324 FOREIGN KEY (TicketID) REFERENCES Ticket (TicketID);
ALTER TABLE TicketOwnerHistory ADD CONSTRAINT FKTicketOwne745306 FOREIGN KEY (ConsumerID) REFERENCES Consumer (ConsumerID);

--ON DELETE SET NULL OR CASCADE
ALTER TABLE SoloMusician_Concert ADD CONSTRAINT FKSoloMusici917899 FOREIGN KEY (ConcertID) REFERENCES Concert (ConcertID);
ALTER TABLE SoloMusician_Concert ADD CONSTRAINT FKSoloMusici113269 FOREIGN KEY (SoloMusicianID) REFERENCES SoloMusician (MusicianID);

--ON DELETE SET NULL OR CASCADE
ALTER TABLE MusicGroup_Concert ADD CONSTRAINT FKMusicGroup28142 FOREIGN KEY (ConcertID) REFERENCES Concert (ConcertID);
ALTER TABLE MusicGroup_Concert ADD CONSTRAINT FKMusicGroup413064 FOREIGN KEY (MusicGroupID) REFERENCES MusicGroup (MusicGroupID);

ALTER TABLE SoloMusician ADD CONSTRAINT FKSoloMusici601613 FOREIGN KEY (MusicianID) REFERENCES Musician (MusicianID);


ALTER TABLE ResaleListing ADD CONSTRAINT FKResaleList483985 FOREIGN KEY (TicketID) REFERENCES Ticket (TicketID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE ResaleListing ADD CONSTRAINT FKResaleList45905 FOREIGN KEY (SellerConsumerID) REFERENCES Consumer (ConsumerID) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE ResellPayment ADD CONSTRAINT FKResellPaym698740 FOREIGN KEY (BuyerConsumerID) REFERENCES Consumer (ConsumerID)ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE ResellPayment ADD CONSTRAINT FKResellPaym21857 FOREIGN KEY (ListingID) REFERENCES ResaleListing (ListingID)ON DELETE SET NULL ON UPDATE CASCADE;


ALTER TABLE TicketOrder ADD CONSTRAINT FKTicketOrde993504 FOREIGN KEY (ConsumerID) REFERENCES Consumer (ConsumerID) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Administrator ADD CONSTRAINT FKAdministra677800 FOREIGN KEY (AdminID) REFERENCES AppUser (UserID);


ALTER TABLE Employee ADD CONSTRAINT FKEmployee604061 FOREIGN KEY (CompanyID) REFERENCES ConcertOrganisationCompany (CompanyID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Employee ADD CONSTRAINT FKEmployee778483 FOREIGN KEY (EmployeeID) REFERENCES AppUser (UserID);


ALTER TABLE Consumer ADD CONSTRAINT FKConsumer679603 FOREIGN KEY (ConsumerID) REFERENCES AppUser (UserID);

ALTER TABLE Concert ADD CONSTRAINT FKConcert896129 FOREIGN KEY (ConcertLocationID) REFERENCES ConcertLocation (ConcertLocationID) ON DELETE SET NULL ON UPDATE CASCADE;

