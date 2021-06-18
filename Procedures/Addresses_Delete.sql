USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[Addresses_Delete]
    @AddressId INT
AS
BEGIN
    DELETE FROM [dbo].[Addresses]
    WHERE [AddressId] = @AddressId
END
GO

EXECUTE [dbo].[Addresses_Delete]
    @AddressId = 1
