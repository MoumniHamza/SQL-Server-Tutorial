USE sample2
GO



CREATE TABLE tblEmployee2 (
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50) NOT NULL ,
AGE  INT NOT NULL,
City NVARCHAR (30) NOT NULL,
SALARY MONEY NOT NULL 
)

GO

-- Some dummy data to work with
INSERT INTO tblEmployee2
VALUES
('rick', 27, 'Portland', 3500),
('sara', 29, 'Vancouver', 4500),
('Jack', 37, 'Portland', 7500),
('Don', 42, 'Salem', 8500),
('Alem', 57, 'Portland', 5500),
('Danny', 67, 'Portland', 9500),
('Rita', 27, 'Hillsboro', 4500)
