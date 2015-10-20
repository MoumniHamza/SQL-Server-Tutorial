USE sample2
GO


CREATE TRIGGER tr_Updated_Employees
ON tblEmployee
for UPDATE
AS

BEGIN
DECLARE @ID int
DECLARE	@oldName nvarchar(50), @newName nvarchar(50)
DECLARE	@oldGenderID int , @newGenderID int
DECLARE	@oldAge int , @newAge int
DECLARE @audit nvarchar(1000)

select * into #TempTable 
FROM inserted

WHILE(EXISTS(SELECT EmployeeID FROM #TempTable))
begin 
	SET @audit = ''
	SELECT TOP 1 @ID = EmployeeID , @newName = NAME,  @newGenderID = GenderID, @newAge = Age
	FROM #TempTable

	SELECT @oldName = Name, @oldGenderID = GenderID ,@oldAge = Age
	FROM deleted where EmployeeID = @ID
	Set @audit = 'Employee with ID = ' + cast(@ID as nvarchar(5)) + 'Changed'
	if(@oldName <> @newName)
	Set @audit =  ' change name from ' + @oldName + 'to ' + @newName 
	if(@oldGenderID <> @newGenderID)
	Set @audit =  ' changed gender ' + @oldGenderID + 'to' + @newGenderID 
	if(@oldAge <> @newAge)
	Set @audit =  ' changed name ' + @oldAge + 'to' + @newAge

	insert into tblTrackEmployee values ( @audit)
	delete from #TempTable where EmployeeID = @ID
	END
	
END