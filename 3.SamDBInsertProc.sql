--Insert Proc
create proc InsertPayment
--List parameters Here Should be same order and datatype as the table
@BookingID int, --FK
@PaymentMethodID int, --FK
@Amount float,
@PaymentDate datetime
As
Begin Try
INSERT INTO Payments (BookingID, PaymentMethodID, Amount, PaymentDate)
values(@BookingID,@PaymentMethodID,@Amount,@PaymentDate)
End Try
Begin Catch
           select ERROR_MESSAGE() as ErrMsg,
		          ERROR_PROCEDURE() as ErrProcName,
				  ERROR_LINE() as ErrLineNo
End Catch
go
--Run it as a Check
exec InsertPayments 5, 5, 600,'2025-04-10'
select * from Payments
--Make it Error
exec InsertPayments 1003, 1, 200.99,'2025-04-10'
go
--Delete Proc
--Going to use Package as there is a CASCADE with FK in Booking
create proc DeletePackages
@PackageID char(12)
As
Begin try	
  delete from PackageDeals
  where PackageID = @PackageID

End Try
Begin Catch
           select ERROR_MESSAGE() as ErrMsg,
		          ERROR_PROCEDURE() as ErrProcName,
				  ERROR_LINE() as ErrLineNo
End Catch
go
--Run it 
--Data Before Delete
select * from PackageDeals
select * from Bookings

exec DeletePackages'PACK0000154'

--Data After Delete
select * from PackageDeals
select * from Bookings
go

--Between To Data
create proc SearchBetweenD
@Date1 DateTime,
@Date2 DateTime
As
    Select BookingID,
	CustID,
	HotelID,
	PackageID,
	BookingDate,
	PaymentStatus
	From Bookings
	WHERE BookingDate between @Date1 and @Date2
	go
	--Run it
	exec SearchBetweenD '2025-04-10 00:11:15.720' , '2025-04-10 00:11:15.720'
	--No rows
	exec SearchBetweenD '2025-04-25 00:11:15.720' , '2025-04-20  00:11:15.720'
	go
	--Like Proc with a string and 1 char
	Create proc SearchCustNameStrings
	@SearchChar varchar(10)
	As
	select CFirstName,
	CLastName,
	CEmail
	from Customers
	where CFirstName like '_' + @SearchChar + '%'
	go
	exec SearchCustNameStrings 'amb'
	go
