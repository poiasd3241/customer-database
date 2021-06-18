USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[Customers_Select]
    @CustomerId INT
AS
BEGIN
    SELECT *
    FROM [dbo].[Customers]
    WHERE [CustomerId] = @CustomerId
END
GO

EXECUTE [dbo].[Customers_Select] 
    @CustomerId = 1
