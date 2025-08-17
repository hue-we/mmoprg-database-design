/*==================================================================================================
Filename: CREATE TWO TRIGGERS PROJECT 1.sql
Programmer: Mongezi Mabuza
Description: This file is where the triggers will be created
==================================================================================================*/

USE projectOne
GO

CREATE TRIGGER tr_InsertAccount
ON account
AFTER INSERT
AS
BEGIN
    DECLARE @accName VARCHAR(30);
	DECLARE @playerNo VARCHAR(30);
	
	-- Get the inserted values
	SELECT @accName = @accName, @playerNo = @playerNo FROM inserted;

	--Send a notification
	PRINT 'Notification: A new account has been created for player: ,' + @playerNo + 'with account name: ' + @accName;
END;
GO

CREATE TRIGGER tr_InsertCharacter
ON characters
AFTER INSERT
AS
BEGIN
    DECLARE @charName VARCHAR(30);
	DECLARE @accName VARCHAR(30);
    
	-- Get the inserted values
	SELECT @charName = @charName, @accName = @accName FROM inserted;
      
    --Send a notification
	PRINT 'Notification: A new character is named' + 'has been created for account' + @accName
END;
GO

