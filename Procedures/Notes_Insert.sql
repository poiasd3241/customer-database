USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[Notes_Insert]
    @CustomerId INT,
    @Content NVARCHAR(1000)
AS
BEGIN
    INSERT INTO [dbo].[Notes]
        ([CustomerId], [Content])
    VALUES
        (@CustomerId, @Content)
END
GO

EXECUTE [dbo].[Notes_Insert] 
    @CustomerId = 1,
    @Content = 'New note'
