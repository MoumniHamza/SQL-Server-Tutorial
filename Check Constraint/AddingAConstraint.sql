USE sample2
GO

--Adding an Age column to our table 
ALTER TABLE tblEmployee
ADD Age INT NOT NULL
GO


ALTER TABLE tblEmployee
ADD CONSTRAINT CK_tblEmployee_Age CHECK ( Age>0 AND Age<150)
GO