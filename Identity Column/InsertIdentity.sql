USE sample2
GO


CREATE TABLE tblEmployee1 (
ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,  -- Identity(1,1) means each time we insert a record the id column is incremented by 1 starting at 1
Name NVARCHAR(50) NOT NULL
)