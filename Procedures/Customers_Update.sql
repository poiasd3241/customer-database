USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[Customers_Update]
    @CustomerId INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @PhoneNumber VARCHAR(15),
    @Email VARCHAR(320) ,
    @TotalPurchasesAmount DECIMAL(15,2)
AS
BEGIN
    UPDATE [dbo].[Customers]
    SET [FirstName] = @FirstName,
        [LastName] = @LastName,
        [PhoneNumber] = @PhoneNumber,
        [Email] = @Email,
        [TotalPurchasesAmount] = @TotalPurchasesAmount
    WHERE [CustomerId] = @CustomerId
END
GO

EXECUTE [dbo].[Customers_Update] 
    @CustomerId = 1,
    @FirstName ='Updated first name',
    @LastName = 'Updated last name',
    @PhoneNumber = '+8989898',
    @Email = 'new@update.com',
    @TotalPurchasesAmount = 4444.44
