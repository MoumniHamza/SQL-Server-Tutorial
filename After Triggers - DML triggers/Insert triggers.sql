USE sample2
GO

-- The table that will track the new employees inserted
CREATE TABLE tblTrackEmployee (
ID int Not Null Primary key Identity(1,1),
Description nvarchar(80) )


-- Creating the trigger

CREATE TRIGGER tr_audit_employees
ON tblEmployee
for Insert
AS

BEGIN

Declare @ID int
Select @ID = EmployeeID from Inserted

Insert INTO tblTrackEmployee
Values(' The employee who has an ID = ' + cast(@ID as nvarchar(4)) + ' has been inserted on' + cast(getdate() as nvarchar(50)))  

END

-- Firing the trigger by inserting a row in the table

Insert into tblEmployee
Values ( 10,'hamza','94747@supinfo.com',2,25)

-- Viewing the result

select * from tblTrackEmployee