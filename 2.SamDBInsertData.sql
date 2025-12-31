--Do the table with only PK.
--If identity is used no value for PK,But need for FK
--Insert Data
sp_help Customers
-- Insert Customers
insert into Customers(CFirstName, CLastName, CPhoneNo, CEmail)
values('Jennie', 'Byrne', '+3345654', 'jennie@gmail.com'),
    ('Sambhav', 'Sharma', '+08268722', 'Sambhav@gmail.com'),
    ('Pushkal', 'Real', '+089268754', 'Aman@gmail.com'),
    ('Emmanuel', 'Cooker', '+1234567', 'Emmanuel@gmail.com'),
    ('Asahi', 'Ji', '+3123456', 'Asahi@gmail.com')

-- Check the data in Customers
select*from Customers


sp_help Hotels

-- Insert Hotels
insert into Hotels (HName, StreetAddr, HPhoneNo)
values
    ('Grand Plaza Hotel', '123 Main St, New York, NY', '‪‪+1 212-555-7890‬‬'),
    ('Sunset Resort', '456 Beach Ave, Miami, FL', '‪‪+1 305-555-1234‬‬'),
    ('Mountain View Inn', '789 Hill Rd, Denver, CO', '‪‪+1 303-555-5678‬‬'),
    ('Royal Palace Hotel', '321 King St, Los Angeles, CA', '‪‪+1 310-555-9012‬‬'),
    ('Lakeside Retreat', '654 Lakeview Dr, Chicago, IL', '‪‪+1 312-555-3456‬‬')

-- Check the data in Hotels
select*from Hotels


sp_help PaymentMethod

-- Insert PaymentMethos
insert into PaymentMethod (MethodType, MethodName)
values
    ('Instalment', 'Credit Card'),
    ('Instalment', 'Credit Card'),
    ('Full', 'Google Pay'),
    ('Full', 'Credit Card'),
    ('Instalment', 'PayPal')

-- Check the data in PaymentMethod
select*from PaymentMethod

sp_help Payments

-- Insert Payments
insert into Payments (BookingID, PaymentMethodID, Amount, PaymentDate)
values
    (1, 1, 200.00, GETDATE()),
    (2, 2, 300.00, GETDATE()),
    (3, 3, 400.00, GETDATE()),
    (4, 4, 500.00, GETDATE()),
    (5, 5, 600.00, GETDATE())

-- Check the data in Payments
select*from Payments

sp_help PackageDeals

-- Insert PackageDeals
insert into PackageDeals (PackageID, PackageName, Price, Duration, Description)
values
    ('PACK00000010', 'Delexue package', 200.99, '21 Days', 'Luxury 21-day vacation package'),
    ('PACK0000384', 'Normal package', 99.99, '14 Days', 'Luxury 14-day vacation package'),
    ('PACK0000154', 'Luxurary package', 2800.99, '49 Days', 'Luxury 49-day vacation package'),
    ('PACK0000264', 'Meta package', 1000.99, '28 Days', 'Luxury 28-day vacation package'),
    ('PACK0000376', 'Elite package', 1200.99, '35 Days', 'Luxury 35-day vacation package')

-- Check the data in PackageDeals
select*from PackageDeals


sp_help Bookings


select CustId FROM Customers
select HotelId FROM Hotels
select PackageID FROM PackageDeals


--Insert Bookings
insert into Bookings (CustID, HotelID, PackageID, BookingDate, PaymentStatus)
values
    (100, 200, 'PACK00000010', GETDATE(), 'Pending'),
    (101, 201, 'PACK0000384', GETDATE(), 'Completed'),
    (102, 202, 'PACK0000154', GETDATE(), 'Pending'),
    (103, 203, 'PACK0000264', GETDATE(), 'Completed'),
    (104, 204, 'PACK0000376', GETDATE(), 'Pending')

-- Check the data in Bookings
select*from Bookings

