/*==============================================================================================
Filename = CREATE STORED PROCEDURE PROJECT 1.sql
Programmer: Mongezi Mabuza
Description: This file is where the stored prodecures is created
==============================================================================================*/

USE projectOne
GO

CREATE PROCEDURE spRegister
    @accName VARCHAR(30),
	@accTime INT,
	@accFee INT,
	@playerNo VARCHAR(30)
AS
SELECT *
FROM account
ORDER BY accName
GO

CREATE PROCEDURE spAddTime
   @accName VARCHAR(30),
   @accTime INT

AS
SELECT *
FROM account
ORDER BY accTime
GO

CREATE PROCEDURE spAddItem
   @charName VARCHAR(30),
   @itemName VARCHAR(30)
AS
SELECT *
FROM inventory
ORDER BY itemNo
GO

CREATE PROCEDURE spAddChar
   @accName VARCHAR(30),
   @charName VARCHAR(30)
AS
SELECT *
FROM account
ORDER BY playerNo
GO

CREATE PROCEDURE spSendLetter
    @IncludeNews bit = 0
AS
BEGIN
    --Declare a cursor to iterate over the account
	DECLARE account_cursor CURSOR FOR
	    SELECT a.accName, a.accTime, c.News
		FROM account a
		LEFT JOIN config ON a.accName = c.playerNo
		WHERE a.accTime > 0

	DECLARE @accName VARCHAR(30)
	DECLARE @accTime int
	DECLARE @News VARCHAR(max)

	OPEN account_cursor

	--Fetch the first account
	FETCH NEXT FROM account INTO @accName, @accTime, @News

	WHILE @@FETCH_STATUS = 0
	BEGIN
	    PRINT 'Dear' + @accName + ','

	    PRINT 'You have' + CONVERT(VARCHAR(30), @accTime + 'minutes left.'

		IF @IncludeNews = 1 AND @News IS NOT NULL
		BEGIN
		    PRINT 'Latest News: '+ @News
		END

		PRINT ''

		FETCH NEXT FROM account_cursor INTO @accName,@accTime,@News
		END

		CLOSE account_cursor
		DEALLOCATE account_cursor
END



 