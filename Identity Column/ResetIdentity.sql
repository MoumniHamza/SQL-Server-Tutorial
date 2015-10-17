USE sample2
GO

DBCC CHECKIDENT('tblEmployee', RESEED , 0)
GO