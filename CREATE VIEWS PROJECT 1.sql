/*==============================================================================================
Filename: CREATE VIEWS PROJECT 1.sql
Programmer: Mongezi Mabuza
Description: This is the file where the view will be created
==============================================================================================*/

USE projectOne
GO

IF EXISTS (SELECT Table_Name FROM Information_Schema.Views
	       WHERE Table_Name = 'vwBlockedAccounts')
BEGIN
	DROP VIEW vwBlockedAccounts
	PRINT 'vwBlockedAccounts have been deleted'
END
GO

CREATE VIEW vwBlockedAccounts
    AS
	    SELECT accName, accTime
		FROM account
		WHERE accTime = '00'
GO

CREATE VIEW vwTopSkill
    AS
	    SELECT TOP 20
		    c.charID,
		    c.charName,
		    a.accName,
		    a.accFee
		FROM
		    characters c
			INNER JOIN
			account a ON c.accName = a.accName
		ORDER BY
		    c.charSkillLevel
GO

CREATE VIEW vwTopStackedITEMS -- this where the stored procedure for stacking items gets created
    AS
	   WITH ItemsStackedSum AS (
	   SELECT
	       itemNo,
		   SUM(numOfInven) AS totnumOfInven
		FROM 
		   inventory
		GROUP BY
		   itemNo
),
RankedItems
AS
(
    SELECT 
	   itemNo,
	   totnumOfInven,
	   ROW_NUMBER()  OVER (ORDER BY totQuantity DESC) AS rank
	FROM
	   ItemsStackedSum
)
SELECT
   ri.itemNo,
   i.itemName,
   c.charID,
   c.charName,
   inv.numOfInven
FROM
   RankedItems ri
JOIN
   inventory inv ON ri.itemNo = inv.itemNo
JOIN
   characters c ON inv.charID = c.charID
JOIN
   item i ON ri.itemNo = i.itemNo
WHERE
   ri.rank <= 20
GO

CREATE VIEW vwPopItems
    AS
	    WITH ItemPop AS (
		    SELECT
			    itemNo,
			COUNT(DISTINCT  charID) AS charCount
		FROM
		    inventory
		GROUP BY
		    itemNo
),
RankedItems AS (
    SELECT
	    itemNo,
		charCount,
		ROW_NUMBER() OVER (ORDER BY charCount DESC) AS rank
	FROM
	    ItemPop
)
    SELECT
	    r.itemNo,
		i.itemName,
		ri.charCount
	FROM
	    RankedItems ri
	JOIN
	    item i ON ri.itemNo = i.itemNo
	WHERE 
	    ri.rank <= 5


		    


