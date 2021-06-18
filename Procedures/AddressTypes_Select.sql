USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[AddressTypes_Select]
    @AddressTypeId INT
AS
BEGIN
    SELECT *
    FROM [dbo].[AddressTypes]
    WHERE [AddressTypeId] = @AddressTypeId
END
GO

EXECUTE [dbo].[AddressTypes_Select] 
    @AddressTypeId = 1
