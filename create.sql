CREATE DATABASE [CustomerLib_Ivasyuk]
GO

USE [CustomerLib_Ivasyuk]
GO

CREATE TABLE [dbo].[Customers]
(
	[CustomerId] INT IDENTITY(1, 1) NOT NULL,
	[FirstName] NVARCHAR(50) NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[PhoneNumber] VARCHAR(15) NULL,
	[Email] VARCHAR(320) NULL,
	[TotalPurchasesAmount] DECIMAL(15,2) NULL,

	CONSTRAINT [PK_Customers_CustomerId] PRIMARY KEY ([CustomerId]),

	CONSTRAINT [CHK_Customers_PhoneNumber] CHECK([PhoneNumber] LIKE '+[1-9][0-9]%'),
	CONSTRAINT [CHK_Customers_Email] CHECK([Email] LIKE '%_@_%._%'),
)

CREATE TABLE [dbo].[Notes]
(
	[NoteId] INT IDENTITY(1, 1) NOT NULL,
	[Content] NVARCHAR(1000) NOT NULL,
	[CustomerId] INT NOT NULL,

	CONSTRAINT [PK_Notes_NoteId] PRIMARY KEY ([NoteId]),

	CONSTRAINT [FK_Notes_Customers_CustomerId] FOREIGN KEY ([CustomerId])
		REFERENCES [dbo].[Customers] ([CustomerId])
			ON DELETE CASCADE
)
GO

CREATE TABLE [dbo].[AddressTypes]
(
	[AddressTypeId] INT NOT NULL,
	[Type] VARCHAR(8) NOT NULL,

	CONSTRAINT [PK_AddressTypes_AddressTypeId] PRIMARY KEY ([AddressTypeId]),

	CONSTRAINT [UQ_AddressTypes_Type] UNIQUE ([Type]),
)

CREATE TABLE [dbo].[Addresses]
(
	[AddressId] INT IDENTITY(1, 1) NOT NULL,
	[CustomerId] INT NOT NULL,
	[AddressLine] NVARCHAR(100) NOT NULL,
	[AddressLine2] NVARCHAR(100) NULL,
	[AddressTypeId] INT NOT NULL,
	[City] NVARCHAR(50) NOT NULL,
	[PostalCode] VARCHAR(6) NOT NULL,
	[State] NVARCHAR(20) NOT NULL,
	[Country] NVARCHAR(13) NOT NULL,

	CONSTRAINT [PK_Addresses_AddressId] PRIMARY KEY ([AddressId]),

	CONSTRAINT [FK_Addresses_Customers_CustomerId] FOREIGN KEY ([CustomerId]) 
		REFERENCES [dbo].[Customers] ([CustomerId]),

	CONSTRAINT [FK_Addresses_AddressTypes_AddressTypeId] FOREIGN KEY ([AddressTypeId]) 
		REFERENCES [dbo].[AddressTypes] ([AddressTypeId])
			ON UPDATE CASCADE,

	CONSTRAINT [CHK_Addresses_Country] CHECK([Country] in ('United States', 'Canada'))
)
GO
