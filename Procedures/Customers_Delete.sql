USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[Customers_Delete]
    @CustomerId INT
AS
BEGIN
    -- FK
    DELETE FROM [dbo].[Addresses]
	WHERE [CustomerId] = @CustomerId

    DELETE FROM [dbo].[Customers]
    WHERE [CustomerId] = @CustomerId
END
GO

EXECUTE [dbo].[Customers_Delete] 
    @CustomerId = 1
