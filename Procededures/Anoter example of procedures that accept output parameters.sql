USE sample2
GO


CREATE PROCEDURE spGetEmployeeByCity
@City NVARCHAR(40),
@TotalEmployee INT OUTPUT

AS

BEGIN 

SELECT @TotalEmployee = COUNT(Name)
FROM tblEmployee2
WHERE CITY = @City

END

DECLARE @Result INT
EXECUTE spGetEmployeeByCity 'Portland', @Result OUT
PRINT @Result