USE sample2
GO

DBCC CHECKIDENT('tblEmployee1', RESEED , 0)
GO