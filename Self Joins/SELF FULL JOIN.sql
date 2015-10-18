USE sample2
GO


SELECT E.Name AS Employee ,  M.Name AS Manager
FROM EMP E FULL JOIN EMP M
ON E.EmployeeID = M.ManagerID
GO