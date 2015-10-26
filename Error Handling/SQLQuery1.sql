Use sample2
GO


-- CREATING THE PRODUCT TABLE

CREATE TABLE PRODUCT ( productID int NOT NULL PRIMARY KEY IDENTITY(1,1),
product_name nvarchar(40) NOT NULL,
available_product int not null)

alter table PRODUCT ALTER COLUMN available_product int NULL 

-- Inserting data into the product table

Insert into PRODUCT values ('Desktop' , 100),('Phones', 200),('Cars' , 35) 

-- Creating the Sales table

CREATE TABLE SALES ( saleID int NOT NULL PRIMARY KEY,
productID int NOT NULL,
Total_sale int NOT NULL,
CONSTRAINT fk_sales_productID foreign key (productID) references PRODUCT(productID))

alter table SALES ALTER COLUMN Total_sale int NULL 

INSERT INTO SALES  VALUES ( 1, 1, 10)

-- At this point the sales table is empty and the product table has 3 rows

select * from SALES
select * from PRODUCT


-- Let's create our procedure that will start showing our sales and updating our products

CREATE PROCEDURE TotalSales
@prodID int
@productsales int
as
BEGIN
DECLARE @productavailable int
SELECT @productavailable = available_prod
from PRODUCT
