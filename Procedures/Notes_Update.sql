USE [CustomerLib_Ivasyuk]
GO

CREATE PROCEDURE [dbo].[Notes_Update]
    @NoteId INT,
    @Content NVARCHAR(1000)
AS
BEGIN
    UPDATE [dbo].[Notes] 
    SET [Content] = @Content
    WHERE [NoteId] = @NoteId
END
GO

EXECUTE [dbo].[Notes_Update] 
    @NoteId = 1,
    @Content = 'Updated note'
