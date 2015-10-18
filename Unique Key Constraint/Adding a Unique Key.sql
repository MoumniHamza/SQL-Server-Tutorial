USE sample2
GO


ALTER TABLE tblEmployee
ADD CONSTRAINT UQ_tblEmployee_Email UNIQUE(Email)
GO