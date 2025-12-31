-- CREATE TABLES

CREATE TABLE [Customers] (
  [CustId] Int Identity(100,1),
  [CFirstName] Varchar(50),
  [CLastName] Varchar(50),
  [CPhoneNo] Varchar(20),
  [CEmail] Varchar(100),
  PRIMARY KEY ([CustId])
);

CREATE TABLE [Hotels] (
  [HotelId] Int Identity(200,1),
  [HName] Varchar(100),
  [StreetAddr] Varchar(255),
  [HPhoneNo] Varchar(20),
  PRIMARY KEY ([HotelId])
);

CREATE TABLE [PaymentMethod] (
  [PaymentMethodID] int identity(1,1),
  [MethodType] varchar(20),
  [MethodName] varchar(20),
  PRIMARY KEY ([PaymentMethodID])
);

CREATE TABLE [PackageDeals] (
  [PackageID] char(12),
  [PackageName] varchar(255),
  [Price] float,
  [Duration] varchar(50),
  [Description] varchar(255),
  PRIMARY KEY ([PackageID])
);

CREATE TABLE [Bookings] (
  [BookingID] int identity(1,1),
  [CustID] int,
  [HotelID] int,
  [PackageID] char(12),
  [BookingDate] datetime,
  [PaymentStatus] varchar(20),
  PRIMARY KEY ([BookingID]),
  CONSTRAINT [FK_Bookings_HotelID] FOREIGN KEY ([HotelID])
    REFERENCES [Hotels]([HotelId]),
  CONSTRAINT [FK_Bookings_CustID] FOREIGN KEY ([CustID])
    REFERENCES [Customers]([CustId]),
  CONSTRAINT [FK_Bookings_PackageID] FOREIGN KEY ([PackageID])
    REFERENCES [PackageDeals]([PackageID]) ON DELETE CASCADE
);

CREATE TABLE [Payments] (
  [PaymentID] int identity(1,1),
  [BookingID] int,
  [PaymentMethodID] int,
  [Amount] float,
  [PaymentDate] datetime,
  PRIMARY KEY ([PaymentID]),
  CONSTRAINT [FK_Payments_PaymentMethodID] FOREIGN KEY ([PaymentMethodID])
    REFERENCES [PaymentMethod]([PaymentMethodID]),
  CONSTRAINT [FK_Payments_BookingID] FOREIGN KEY ([BookingID])
    REFERENCES [Bookings]([BookingID])
);
