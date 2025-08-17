/*=========================================================
Filename:SAMPLE DATA INSERTS PROJECT 1.sql
Programmer: Mongezi Mabuza
Descrption: We will be inserting data
=========================================================*/

USE projectOne
GO

INSERT INTO player(playerNum, playerName, playerAddress)
VALUES  ('1','Khensani','khensani467@gmail.com'),
        ('2', 'Dora', 'doralee67@gmail.com'),
        ('3', 'Thato', 'thatobosiu111@gmail.com'),
		('4', 'Rea', 'reaxumalo55@gmail.com'),
		('5', 'Masike', 'sikes29@gmail.com'),
		('6', 'Mpho', 'mphomonethi44@gmail.com'),
		('7', 'Mlungsi', 'mlungsingoeni09@gmail.com'),
		('8', 'Fenius',NULL)
GO

INSERT INTO account(accName,accTime, accFee, playerNum)
VALUES  ('Syae', 0111, 90, '1'),
        ('D-Lady', 0245, 76, '2'),
		('One-Shot', 0345, 57, '3'),
		('Mf-Groove', 0967, 32, '4'),
		('Sikes', 0367, 55, '5'),
		('Tk', 0223, 23, '6'),
		('Mlu', 0446, 78, '7'),
		('Fenzo', 0578, 62, '8')

GO
INSERT INTO characters(charID, charName, charSkillLevel, accName)
VALUES  ('1', 'love.syae', '777 ELO', 'Syae'),
        ('2', 'doraaa', '883 ELO', 'D-Lady'),
		('3', 'twisttt', '999 ELO', 'One-Shot'),
		('4', 'groovy', '245 ELO', 'Mf-Groove'),
		('5', 'shotbysikes', '2000 ELO', 'Sikes'),
		('6', 'turfkid', '400 ELO', 'Tk'),
		('7', 'showerboy', '532 ELO', 'Mlu'),
		('8', 'fen', '3211 ELO', 'Fenzo')

GO
INSERT INTO item(itemNo, itemName, itemDesc)
VALUES  ('1', 'Super Speed', 'Increases speed'),
        ('2', 'Arrow Boost', 'Boosts the power of the arrow'),
		('3', 'Health Boost', 'Inreases the health of the player'),
		('4', 'Vision Inreaser', 'Helps with the vision'),
		('5', 'Super Speed', 'Increases speed'),
		('6', 'Arrow Boost', 'Boosts the power of the arrow'),
		('7', 'Health Boost', 'Increases the health of the player'),
		('8', 'Power Boost', 'Doubles the power of each hit')
GO
INSERT INTO inventory(numOfInven,charID,itemNo)
VALUES  (3, '1', '1'),
        (6, '2', '2'),
		(4, '3', '3'),
		(3, '4', '4'),
		(8, '5', '5'),
		(4, '6', '6'),
		(0, '7', '7'),
		(6, '8', '8')
GO
INSERT INTO error(errID, errType)
VALUES (1, 'Loggin Error'),
       (2, 'Sign-In Error'),
	   (3, 'Timeout Error'),
	   (4, 'Downtime Error'),
	   (5, 'Sign-In Error'),
	   (6, 'Logigin Error'),
	   (7, NULL),
	   (8, 'Error 404')
GO
        



		