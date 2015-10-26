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

UPDATE PRODUCT SET available_product = 100 WHERE productID =1
-- Let's create our procedure that will start showing our sales and updating our products

CREATE PROCEDURE Total_Sales
@prodID int,
@productsales int
as
BEGIN
DECLARE @productavailable int
SELECT @productavailable = available_product
from PRODUCT
WHERE productID = @prodID

IF (@productavailable < @productsales)
BEGIN
RAISERROR ('TRANSACTION FAILED',16,1)
END
ELSE 
	BEGIN
		BEGIN TRY
		BEGIN TRAN
	UPDATE PRODUCT SET available_product = (available_product - @productsales)
	WHERE productID = @prodID
	DECLARE @maxproductsaleID int
	select @maxproductsaleID = case when max(saleID) IS NULL then 0 ELSE max(saleID) END  from SALES

	SET @maxproductsaleID = @maxproductsaleID +1
	INSERT INTO SALES VALUES ( @maxproductsaleID,@prodID,@productsales)
		
		COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			SELECT 
			ERROR_LINE(),
			ERROR_NUMBER(),
			ERROR_MESSAGE(),
			ERROR_NUMBER(),
			ERROR_SEVERITY()
		END CATCH
	END
END

Total_Sales 1, 100
