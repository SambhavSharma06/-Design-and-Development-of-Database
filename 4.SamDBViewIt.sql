Create view FinalView
as
select TOP 1000
       b.BookingID as [BookingRef],
       b.CustID as CustomerNo,
	   b.HotelID as HotelNo,
	   b.PackageID as PackageName,
	   c.CLastName as SurName,
	   c.CEmail as Email,
	   pd.Duration as TimeLeft

from Bookings as b
inner join Customers c
on c.CustId = b.CustID
--Second Join
inner join PackageDeals pd
on b.PackageID = pd.PackageID
--Add A where Clause
order by BookingID,b.CustID,b.HotelID DESC
go
--Select it Back
Select*From FinalView
go
--Price
Create view Price
as
select TOP 1000
       b.BookingID as [BookingRef],
       b.CustID as CustomerNo,
	   b.HotelID as HotelNo,
	   b.PackageID as PackageName,
	   c.CLastName as SurName,
	   c.CEmail as Email,
	   pd.Duration as TimeLeft,
	   pd.Price as Price

from Bookings as b
inner join Customers c
on c.CustId = b.CustID
--Second Join
inner join PackageDeals pd
on b.PackageID = pd.PackageID
--Add A where Clause
order by BookingID,b.CustID,b.HotelID DESC
go

Select*From Price


