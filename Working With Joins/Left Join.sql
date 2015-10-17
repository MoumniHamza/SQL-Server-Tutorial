USE sample2
GO


SELECT EmployeeID, NAME , Email, AGE, GENDER
FROM tblEmployee LEFT JOIN tblGender
ON tblEmployee.GenderID = tblGender.GenderID