USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[AddressTypes_Insert]
    @AddressTypeId INT,
    @Type VARCHAR(8)
AS
BEGIN
    INSERT INTO [dbo].[AddressTypes]
        ([AddressTypeId], [Type])
    VALUES
        (@AddressTypeId, @Type)
END
GO

EXECUTE [dbo].[AddressTypes_Insert] 
    @AddressTypeId = 3,
    @Type = 'Whatever'
