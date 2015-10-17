USE sample2
GO


SELECT EmployeeID, NAME , Email, AGE, GENDER
FROM tblEmployee Full JOIN tblGender
ON tblEmployee.GenderID = tblGender.GenderID