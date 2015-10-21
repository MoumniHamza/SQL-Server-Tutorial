USE sample2
GO


CREATE TRIGGER tr_deleted_employees
ON tblEmployee
for delete
as

begin
declare @ID int 
select @ID = EmployeeID from deleted

INSERT INTO tblTrackEmployee
VALUES ('The employee who has an ID = ' + cast(@ID as nvarchar(5)) + ' has been deleted on ' + cast(GETDATE() as nvarchar(80)))
END

-- Lets delete a record to fire the trigger


delete from tblEmployee
WHERE name = 'Hamza'


-- Lets see the results

select * from tblTrackEmployee