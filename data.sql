USE [CustomerLib_Ivasyuk]
GO

-- Populate address types.
INSERT INTO [dbo].[AddressTypes]
VALUES
    (1, 'Shipping'),
    (2, 'Billing')
GO


-- Valid - optioanl columns are not null.

-- Customers.
INSERT INTO [dbo].[Customers]
    ([FirstName], [LastName], [PhoneNumber], [Email], [TotalPurchasesAmount])
VALUES
    ('First1', 'Last1', '+11111', 'first@one.com', 111.11),
    ('First2', 'Last2', '+22222', 'second@two.com', 222.22),
    ('First3', 'Last3', '+33333', 'third@three.com', 333.33)
GO

-- Notes.
INSERT INTO [dbo].[Notes]
    ([CustomerId], [Content])
VALUES
    (1, 'first note'),
    (2, 'second note #1'),
    (2, 'second note #2'),
    (3, 'third note #1'),
    (3, 'third note #2'),
    (3, 'third note #3')
GO

-- Addresses.
INSERT INTO [dbo].[Addresses]
    ([CustomerId], [AddressLine], [AddressLine2], [AddressTypeId], [City],
    [PostalCode], [State], [Country])
VALUES
    (1, 'line one', 'line2 one', 1, 'City1', '111111', 'State1', 'United States'),
    (2, 'line two #1', 'line2 two #1', 1, 'City2', '222221', 'State2', 'United States'),
    (2, 'line two #2', 'line2 two #2', 2, 'City2', '222222', 'State2', 'United States'),
    (3, 'line three', 'line2 three', 2, 'City3', '333333', 'State3', 'Canada');
GO


-- Valid - optioanl columns are null.

-- Customers
INSERT INTO [dbo].[Customers]
    ([FirstName], [LastName], [PhoneNumber], [Email], [TotalPurchasesAmount])
VALUES
    (NULL, 'Last4', NULL, NULL, NULL),
    (NULL, 'Last5', NULL, NULL, NULL),
    (NULL, 'Last6', NULL, NULL, NULL)

GO

-- Notes.
INSERT INTO [dbo].[Notes]
    ([CustomerId], [Content])
VALUES
    (4, 'fourth note'),
    (5, 'fifth note'),
    (6, 'sixth note')
GO

-- Addresses.
INSERT INTO [dbo].[Addresses]
    ([CustomerId], [AddressLine], [AddressLine2], [AddressTypeId], [City],
    [PostalCode], [State], [Country])
VALUES
    (4, 'line four', NULL, 1, 'City4', '444444', 'State4', 'United States'),
    (5, 'line five', NULL, 1, 'City5', '555555', 'State5', 'Canada'),
    (6, 'line six', NULL, 2, 'City6', '666666', 'State6', 'Canada')
GO


-- Invalid.

-- AddressTypes

-- Unique type violation.
INSERT INTO [dbo].[AddressTypes]
VALUES
    (3, 'Shipping')
GO

-- Customers.

-- Required columns are null: [LastName].
INSERT INTO [dbo].[Customers]
    ([FirstName], [LastName], [PhoneNumber], [Email], [TotalPurchasesAmount])
VALUES
    ('asd', NULL, NULL, NULL, NULL)
GO

-- Invalid phone number format.
INSERT INTO [dbo].[Customers]
    ([FirstName], [LastName], [PhoneNumber], [Email], [TotalPurchasesAmount])
VALUES
    (NULL, 'LastX', '+012345', 'good@email.com', NULL)
GO

-- Invalid email format.
INSERT INTO [dbo].[Customers]
    ([FirstName], [LastName], [PhoneNumber], [Email], [TotalPurchasesAmount])
VALUES
    (NULL, 'LastX', '+12345', 'bad@email', NULL)
GO

-- Notes.

-- Required columns are null: [CustomerId], [Content].
INSERT INTO [dbo].[Notes]
    ([CustomerId], [Content])
VALUES
    (NULL , NULL)
GO

-- Bad FK value: [CustomerId].
INSERT INTO [dbo].[Notes]
    ([CustomerId], [Content])
VALUES
    (0, 'note X')
GO

-- Addresses.

-- Required columns are null:
--     [CustomerId], [AddressLine], [AddressTypeId], [City], [PostalCode], [State], [Country].
INSERT INTO [dbo].[Addresses]
    ([CustomerId], [AddressLine], [AddressLine2], [AddressTypeId], [City],
    [PostalCode], [State], [Country])
VALUES
    (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

-- Bad FK value: [CustomerId].
INSERT INTO [dbo].[Addresses]
    ([CustomerId], [AddressLine], [AddressLine2], [AddressTypeId], [City],
    [PostalCode], [State], [Country])
VALUES
    (0, 'line X', NULL, 1, 'CityX', '111111', 'StateX', 'Canada')
GO

-- Bad FK value: [AddressTypeId].
INSERT INTO [dbo].[Addresses]
    ([CustomerId], [AddressLine], [AddressLine2], [AddressTypeId], [City],
    [PostalCode], [State], [Country])
VALUES
    (1, 'line X', NULL, 0, 'CityX', '111111', 'StateX', 'Canada')
GO

-- Bad value: [Country]
INSERT INTO [dbo].[Addresses]
    ([CustomerId], [AddressLine], [AddressLine2], [AddressTypeId], [City],
    [PostalCode], [State], [Country])
VALUES
    (1, 'line X', NULL, 1, 'CityX', '111111', 'StateX', 'Japan')
GO
