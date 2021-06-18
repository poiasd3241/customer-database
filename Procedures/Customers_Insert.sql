USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[Customers_Insert]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @PhoneNumber VARCHAR(15),
    @Email VARCHAR(320),
    @TotalPurchasesAmount DECIMAL(15,2)
AS
BEGIN
    INSERT INTO [dbo].[Customers]
        ([FirstName], [LastName], [PhoneNumber], [Email], [TotalPurchasesAmount])
    VALUES
        (@FirstName, @LastName, @PhoneNumber, @Email, @TotalPurchasesAmount)
END
GO

EXECUTE [dbo].[Customers_Insert]
    @FirstName ='New first name',
    @LastName = 'New last name',
    @PhoneNumber = '+56565665',
    @Email = 'new@insert.com',
    @TotalPurchasesAmount = 555.55
