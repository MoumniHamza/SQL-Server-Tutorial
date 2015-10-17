USE sample2
GO


SELECT EmployeeID, NAME , Email, AGE, GENDER
FROM tblEmployee INNER JOIN tblGender
ON tblEmployee.GenderID = tblGender.GenderID