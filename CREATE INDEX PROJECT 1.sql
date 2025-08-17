/*===============================================================================================
Filename: CREATE INDEX PROJECT 1.sql
Programmer: Mongezi Mabuza
Description: This file will create the index
================================================================================================*/

USE projectOne
GO

--Index on all the columns the player table
CREATE INDEX idxplayer_all_columns ON player(playerNum, playerName, playerAddress);
GO

--Index on all the columns the account table
CREATE INDEX idxaccount_all_columns ON account(accName, accTime, accFee, playerNum);
GO

--Index on all the columns the item table
CREATE INDEX idxitem_all_columns ON item(itemNo, itemName, itemDesc);
GO

--Index on all the columns the characters table
CREATE INDEX idxcharacters_all_columns ON characters(charID, charName, charSkillLevel, accName);
GO

--Index on all the columns the inventory table
CREATE INDEX idxinventory_all_columns ON inventory(numOfInven, charID, itemNo);
GO

--Index on all the columns the error table
CREATE INDEX idxerror_all_columns ON error(errID, errDesc);
GO


