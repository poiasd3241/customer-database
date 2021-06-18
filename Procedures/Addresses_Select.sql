USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[Addresses_Select]
    @AddressId INT
AS
BEGIN
    SELECT *
    FROM [dbo].[Addresses]
    WHERE [AddressId] = @AddressId
END
GO

EXECUTE [dbo].[Addresses_Select]
    @AddressId = 1
