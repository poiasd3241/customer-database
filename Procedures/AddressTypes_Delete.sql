USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[AddressTypes_Delete]
    @AddressTypeId INT
AS
BEGIN
    DELETE FROM [dbo].[AddressTypes]
    WHERE [AddressTypeId] = @AddressTypeId
END
GO

-- Note: Addresses using the to-be-deleted AddressType
-- have to be assigned a new AddressType before deleting the type in use.
EXECUTE [dbo].[AddressTypes_Delete] 
    @AddressTypeId = 3
