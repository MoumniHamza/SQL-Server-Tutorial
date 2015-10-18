USE sample2
GO


ALTER TABLE tblEmployee
ADD CONSTRAINT DF_tblEmployee_GenderID
DEFAULT 3 FOR GenderID
GO