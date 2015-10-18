USE sample2
GO

-- CREATING THE PROCEDURE
CREATE PROCEDURE spGetNumberOfEmployeeDependingOnTheirName
@Name NVARCHAR(50),
@Number INT  OUTPUT

AS
BEGIN
SELECT @Number = COUNT(NAME)
FROM tblEmployee
WHERE NAME = @Name 
END
-- Declaring And executing the procedure
DECLARE @Count INT
EXECUTE spGetNumberOfEmployeeDependingOnTheirName 'Hamza', @Count OUT
PRINT @Count