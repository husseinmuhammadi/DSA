/*
CREATE DATABASE TEMPLATE 

Version 1.2.1.10
Monday, Nov 29 2010

To create your own database 
	1. Replcace database name with database_name
	2. execute 'select * from sys.database_files' to get path for database

select convert(varchar(128), getdate(), 109)
*/

use master
go

/*
if exists(select name from master.dbo.sysdatabases where name = 'database_name')
	drop database database_name
go 
*/

/*
exec sp_configure 'show advanced option', '1'
reconfigure

exec sp_configure 'xp_cmdshell', '1'
reconfigure

exec xp_cmdshell 'md "C:\Program Files\Microsoft SQL Server\MSSQL.5\MSSQL\DATA\database_name"'
go

exec sp_configure 'xp_cmdshell', '0'
exec sp_configure 'show advanced option', '0'
reconfigure
*/

DECLARE @device_directory NVARCHAR(520);
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
	FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1;

DECLARE @database_path NVARCHAR(520);
SET @database_path = @device_directory + N'Conference';
PRINT 'Datebase is created on '+ @database_path;

BEGIN TRY
	CREATE DATABASE Conference
	on PRIMARY
	(
		NAME = N'ConferenceMasterDataFile',
		FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Conference\ConferenceMasterDataFile.mdf', 
		SIZE = 2,
		MAXSIZE = UNLIMITED,
		FILEGROWTH = 2
	),
	filegroup DefaultFileGroup
	(
		name = N'ConferenceSecondaryDataFile',
		filename = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Conference\ConferenceSecondaryDataFile.ndf',
		size = 2,
		maxsize = unlimited,
		filegrowth = 2
	),
	filegroup TextImageFileGroup
	(
		name = N'ConferenceTextImageFile',
		filename = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Conference\ConferenceTextImageFile.ndf',
		size = 2,
		maxsize = unlimited,
		filegrowth = 2
	)
	LOG ON
	(
		NAME = N'ConferenceLogFile', 
		FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Conference\ConferenceLogFile.ldf',
		SIZE = 2,
		MAXSIZE = UNLIMITED,
		FILEGROWTH = 2
	)
	PRINT 'Database Conference was created successfully.'
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO


--Added on: Mar  1 2009  4:11:48:547PM
ALTER DATABASE Conference
SET RECOVERY FULL
go

PRINT 'Setting database Conference recovery mode full'


--No update on: Mar  1 2009  4:11:48:547PM
alter database Conference
modify filegroup DefaultFileGroup default
go

--------------------------------------------------------------------------------
use Conference
go

CREATE TABLE [dbo].[DatabaseLog](
	[DatabaseLogID] [int] IDENTITY(1,1) NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[DatabaseUser] [sysname] NOT NULL,
	[Event] [sysname] NOT NULL,
	[Schema] [sysname] NULL,
	[Object] [sysname] NULL,
	[TSQL] [nvarchar](max) NOT NULL,
	[XmlEvent] [xml] NOT NULL,
 CONSTRAINT [PK_DatabaseLog_DatabaseLogID] PRIMARY KEY NONCLUSTERED ([DatabaseLogID] ASC)) --on [primary]
go

PRINT 'Table DatabaseLog was created succesfully.'
go

CREATE TRIGGER [ddlDatabaseTriggerLog] 
ON DATABASE 
FOR DDL_DATABASE_LEVEL_EVENTS 
AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @data XML;
    DECLARE @schema sysname;
    DECLARE @object sysname;
    DECLARE @eventType sysname;

    SET @data = EVENTDATA();
    SET @eventType = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    SET @schema = @data.value('(/EVENT_INSTANCE/SchemaName)[1]', 'sysname');
    SET @object = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname') 

    IF @object IS NOT NULL
        PRINT '  ' + @eventType + ' - ' + @schema + '.' + @object;
    ELSE
        PRINT '  ' + @eventType + ' - ' + @schema;

    IF @eventType IS NULL
        PRINT CONVERT(nvarchar(max), @data);

    INSERT [dbo].[DatabaseLog] (
        [PostTime], 
        [DatabaseUser], 
        [Event], 
        [Schema], 
        [Object], 
        [TSQL], 
        [XmlEvent]) 
    VALUES (
        GETDATE(), 
        CONVERT(sysname, CURRENT_USER), 
        @eventType, 
        CONVERT(sysname, @schema), 
        CONVERT(sysname, @object), 
        @data.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(max)'), 
        @data);
END;
go

PRINT 'Trigger ddlDatabaseTriggerLog was created successfully.'

