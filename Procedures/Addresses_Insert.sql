USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[Addresses_Insert]
    @CustomerId INT,
    @AddressLine NVARCHAR(100),
    @AddressLine2 NVARCHAR(100),
    @AddressTypeId INT,
    @City NVARCHAR(50),
    @PostalCode VARCHAR(6),
    @State NVARCHAR(20),
    @Country NVARCHAR(13)
AS
BEGIN
    INSERT INTO [dbo].[Addresses]
        ([CustomerId], [AddressLine], [AddressLine2], [AddressTypeId], [City],
        [PostalCode], [State], [Country])
    VALUES
        (@CustomerId, @AddressLine, @AddressLine2, @AddressTypeId, @City,
            @PostalCode, @State, @Country)
END
GO

EXECUTE [dbo].[Addresses_Insert]
    @CustomerId = 1,
    @AddressLine = 'new line 1',
    @AddressLine2 = 'new line 2',
    @AddressTypeId = 1,
    @City = 'City Z',
    @PostalCode = '123456',
    @State = 'State Z',
    @Country = 'Canada'
