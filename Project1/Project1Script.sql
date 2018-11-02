-- Wk1 Project 1 Script--
-- 11/02/18 --

-- Used to create database
CREATE DATABASE thproject;
GO

USE thproject;
GO

--Create visitor table:
CREATE TABLE [dbo].[visitor](
[visitor_id] [int] IDENTITY(1,1) NOT NULL,
[visitor_name] [nchar](50) NOT NULL,
[visitor_email] [nchar](50) NOT NULL,
[visitor_msg] [nchar](200) NOT NULL
) ON [PRIMARY]

GO

--Procedure to insert into visitor table--
create procedure InsertVisitor
@visitor_name nchar(50),
@visitor_email nchar(50),
@visitor_msg nchar(200)
as
INSERT INTO [thproject].[dbo].[visitor]
           ([visitor_name]
           ,[visitor_email]
           ,[visitor_msg])
     VALUES
           (@visitor_name
           ,@visitor_email
           ,@visitor_msg)
GO

--Create newsletter table:
CREATE TABLE [dbo].[news](
[visitor_email] [nchar](50) NOT NULL
) ON [PRIMARY]
GO

--Procedure to insert into newsletter table--
create procedure InsertNews
@visitor_email nchar(50)
as
INSERT INTO [thproject].[dbo].[news]           
           ([visitor_email])          
     VALUES
           (@visitor_email)           
GO


--Create user login w/ password for visitor and newsletter table priveleges--
CREATE LOGIN [THApp] WITH PASSWORD='Pa$$w0rd', DEFAULT_DATABASE=[thproject]
go
use thproject
go
CREATE USER [THApp] FOR LOGIN [THApp] WITH DEFAULT_SCHEMA=[dbo]
GO
grant execute on InsertVisitor to THApp
go
grant execute on InsertNews to THApp
go




