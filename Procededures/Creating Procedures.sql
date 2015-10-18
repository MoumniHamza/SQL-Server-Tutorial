USE sample2
GO


-- This is how we create a procedure
CREATE PROCEDURE spGetEmployeesAndThereGender
AS
BEGIN
SELECT E.NAME, E.EMAIL, E.AGE,  G.GENDER
FROM tblEmployee E INNER JOIN tblGender G
ON E.GenderID = G.GenderID
END
GO

-- Here is the first way how you can execute your procedure
EXEC spGetEmployeesAndThereGender
GO

-- Here is the second way you can execute your procedure

EXECUTE spGetEmployeesAndThereGender
GO
-- Here is the third way you can execute your procedure

spGetEmployeesAndThereGender
GO