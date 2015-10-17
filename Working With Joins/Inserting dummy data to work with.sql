USE sample2
GO

--I needed to drop the constraint from before to modify the column
ALTER TABLE tblEmployee
DROP CONSTRAINT FK__tblEmploy__Gende__1273C1CD
GO

ALTER TABLE tblEmployee ALTER COLUMN GenderID INT NULL

-- Recreated the constraint
ALTER TABLE tblEmployee
ADD CONSTRAINT FK_tblEmployee_GenderID FOREIGN KEY (GenderID) REFERENCES tblGender (GenderID)
GO

-- Inserted some dummy data
INSERT INTO tblEmployee
VALUES 
(3, 'Mike', 'mike@com', 3, 21),
(4, 'Adam', 'adam@com', NULL, 22),
(5, 'Yass', 'yass@com', 3, 27),
(6, 'Miky', 'miky@com', NULL, 28),
(7, 'Spike', 'Spike@com', 3, 29),
(8, 'Lina', 'lina@com', NULL, 23)