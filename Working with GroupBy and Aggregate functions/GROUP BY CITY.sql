USE sample2
GO


SELECT City, SUM(SALARY) 
FROM tblEmployee2
GROUP BY City
GO