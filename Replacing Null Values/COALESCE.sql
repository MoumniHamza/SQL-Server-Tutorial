USE sample2
GO



SELECT E.Name AS Employee ,  COALESCE(M.Name, 'NO MANAGER') AS Manager
FROM EMP E LEFT JOIN EMP M
ON E.EmployeeID = M.ManagerID
GO