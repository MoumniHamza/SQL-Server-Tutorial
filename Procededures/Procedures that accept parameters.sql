USE sample2
GO

-- This how you declare the procedure that accept parameters
ALTER PROCEDURE spGetEmployeesAndThereGender
@GenderID int -- The variable need the be of the same datatype
AS
BEGIN
SELECT E.NAME, E.EMAIL, E.AGE,  G.GENDER
FROM tblEmployee E INNER JOIN tblGender G
ON E.GenderID = G.GenderID
WHERE E.GenderID = @GenderID  -- here you pass the variable
END
GO

spGetEmployeesAndThereGender 3 -- 3 is the supplied variable 