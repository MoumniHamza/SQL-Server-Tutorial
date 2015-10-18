USE sample2
GO


SELECT EmployeeID, NAME , Email, AGE, GENDER
FROM tblEmployee CROSS JOIN tblGender
z