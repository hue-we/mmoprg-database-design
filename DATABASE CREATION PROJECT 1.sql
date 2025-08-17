/*=========================================================
Filename: DATABASE CREATION PROJECT 1.sql
Programmer: Mongezi Mabuza
Descrription: This file create the database and tables with the necessary constraints.
=========================================================*/

USE master
GO 

--If the databse exist, we will delete it first
IF EXISTS(SELECT name FROM master.dbo.sysdatabases
          WHERE name = 'projectOne')
BEGIN
        DROP DATABASE projectOne
		
END

CREATE DATABASE projectOne
ON PRIMARY
 (
     NAME = 'Project1_data',
	 FILENAME = 'C:\projectOne\Project1_data.mdf',
	 SIZE = 5MB,
	 FILEGROWTH = 10%
)
LOG ON
(  
     NAME = 'Project1_log',
	 FILENAME = 'C:\projectOne\Project1_log.ldf',
	 SIZE = 5MB,
	 FILEGROWTH = 10%
)
GO
/*Now we will create the tables....*/
USE projectOne
GO

CREATE TABLE player
( 
       playerNum VARCHAR(30) NOT NULL PRIMARY KEY,
	   playerName VARCHAR(30) NOT NULL,
	   playerAddress VARCHAR(30) NULL UNIQUE
)
GO

CREATE TABLE account
(       
       accName VARCHAR(30) NOT NULL,
	   accTime INT NOT NULL check(accTime != 00),
	   accFee INT NOT NULL,
	   PRIMARY KEY(accName),
	   playerNum VARCHAR(30) NOT NULL FOREIGN KEY REFERENCES player(playerNum)

)
GO

CREATE TABLE characters
(
       charID VARCHAR(30) NOT NULL,
	   charName VARCHAR(30) NOT NULL UNIQUE,
	   charSkillLevel VARCHAR(30) NOT NULL,
	   PRIMARY KEY(charID),
	   accName VARCHAR(30) NOT NULL FOREIGN KEY REFERENCES account(accName)
)
GO

CREATE TABLE item
(
       itemNo VARCHAR(30) NOT NULL,
	   itemName VARCHAR(30) NOT NULL,
	   itemDesc VARCHAR(30) NULL,
	   PRIMARY KEY(itemNo)
)
GO

CREATE TABLE inventory
(
       numOfInven INT NOT NULL,
	   charID VARCHAR(30) NOT NULL FOREIGN KEY REFERENCES characters(charID),
	   itemNo VARCHAR(30) NOT NULL FOREIGN KEY REFERENCES item(itemNo)
)
GO

CREATE TABLE error
(
       errID INT NOT NULL PRIMARY KEY,
	   errType VARCHAR(30) NULL DEFAULT 'System error'
)
GO






       



