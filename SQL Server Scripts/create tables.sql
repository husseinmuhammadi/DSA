use Conference
go


CREATE TABLE dbo.Images (
	ImageID int NOT NULL IDENTITY(1, 1),
	[Image] varbinary(max) NULL,
	ClientFileName nvarchar(260) null,
	FileExtension nvarchar(30) null,
	ContentType varchar(128) null,
	ContentLength int null,
	ServerFileName nvarchar(260) null,
	ContentTypeByCode varchar(30) null,
	ImageFormat uniqueidentifier null,
	CONSTRAINT PK_Images_ImageID PRIMARY KEY (ImageID ASC)
) textimage_on TextImageFileGroup
go

CREATE TABLE dbo.Authors (
	AuthorID int IDENTITY(1, 1) not null,
	FirstName nvarchar(128) null,
	LastName nvarchar(128) null,
	Email varchar(200) not null,
	AuthorName nvarchar(128) NULL,
	UserName nvarchar(255),
	constraint PK_Authors_AuthorID PRIMARY KEY CLUSTERED (AuthorID ASC),
)
go

--alter table dbo.Authors 
--	add UserName nvarchar(255)

create table [Status] (
	StatusID int identity (1, 1) not null,
	StatusTextEn varchar(40),
	StatusTextFa nvarchar(40),
	constraint PK_Status_StatusID primary key clustered (StatusID asc)
)
go

insert into dbo.[Status] (StatusTextEn) values ('Initial Evaluation')
insert into dbo.[Status] (StatusTextEn) values ('Arbitration')
insert into dbo.[Status] (StatusTextEn) values ('Accepted')
insert into dbo.[Status] (StatusTextEn) values ('Rejected')

--select * from dbo.Status

CREATE TABLE dbo.Documents (
	DocumentID int IDENTITY(1,1) NOT NULL,
	Title nvarchar(128) NOT NULL,
	LanguageLCID int NULL, -- used for full text search, see sys.syslanguages (lcid)
	StatusIDRef int null,
	DocumentSummary nvarchar(max) NULL, --Description
	Link varchar(256) NULL,
	ModifiedDate datetime NOT NULL,
	UserName nvarchar(256),
	CONSTRAINT PK_Document_DocumentID 
		PRIMARY KEY CLUSTERED (DocumentID ASC),
	constraint FK_Documents_Status_StatusID
		foreign key (StatusIDRef)
			references Status(StatusID)
				on delete no action
				on update cascade
) TEXTIMAGE_ON TextImageFileGroup
GO

alter table dbo.Documents
	ADD CONSTRAINT DF_Documents_ModifiedDate 
		DEFAULT getdate() FOR ModifiedDate
go

-- ALTER TABLE dbo.Documents ADD CONSTRAINT UQ_Documents_Content UNIQUE (Content)

CREATE TABLE dbo.Papers (
	PaperID int identity(1, 1) not null,
	DocumentIDRef int NOT NULL,
	AuthorIDRef int NULL,
	UserName nvarchar(256),
	CONSTRAINT PK_Papers_PaperID primary key clustered (PaperID ASC),
	CONSTRAINT FK_Papers_Documents_DocumentIDRef foreign key (DocumentIDRef)
		references Documents(DocumentID)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	CONSTRAINT FK_Documents_Authors_AuthorIDRef FOREIGN KEY (AuthorIDRef)
		REFERENCES Authors(AuthorID)
			ON DELETE SET NULL
			ON UPDATE CASCADE,
	CONSTRAINT UQ_Documents_TitleIDRef_AuthorIDRef unique nonclustered (DocumentIDRef, AuthorIDRef)
) 
go

CREATE TABLE dbo.Files (
	FileID int IDENTITY(1, 1) NOT NULL,
	Content varbinary(max) NOT NULL,
	ClientFileName nvarchar(260), -- Max lenght is 260 as in #define MAX_PATH 260
	FileExtension nvarchar(30),
	ContentType varchar(128), -- MIME type
	ContentLength int,
	DocumentIDRef int null,
	CONSTRAINT PK_Files_DocumentID PRIMARY KEY (FileID ASC),
	-- CONSTRAINT UQ_Files_Content UNIQUE (Content)
	constraint FK_Files_Documents_PaperIDRef
		foreign key (DocumentIDRef) references Documents(DocumentID)
			on update cascade
			on delete set null
) textimage_on TextImageFileGroup
go











/*





-- drop table dbo.Person
CREATE TABLE dbo.Persons (
	PersonID int NOT NULL IDENTITY(1, 1),
	FirstName nvarchar(30),
	LastName nvarchar(40),
	BornDate date,
	CONSTRAINT PK_Persons_PersonID PRIMARY KEY (PersonID ASC))
	
CREATE TABLE Accounts (
	AccountID int identity(1, 1) not null,
	Active bit,
	PersonIDRef int,
	UserIDRef int,
	constraint PK_Accounts_AccountID primary key (AccountID asc),
	constraint FK_Accounts_Users_UserID foreign key (UserIDRef)
		references Users(UserID)
			on update cascade
			on delete set null,
	CONSTRAINT FK_Accounts_Persons_PersonIDRef foreign key (PersonIDRef)
		REFERENCES Persons(PersonID)
			ON UPDATE CASCADE
			ON DELETE NO ACTION)
			
alter table Accounts add UserIDRef int
alter table Accounts drop column UserIDRef 
alter table Accounts add constraint FK_Accounts_Users_UserID 
	foreign key (UserIDRef)
		references Users(UserID)
			on update cascade
			on delete set null
	
create table eMails (
	eMail varchar(100) not null,
	AccountIDRef int,
	constraint PK_eMails_eMail primary key (eMail),
	constraint FK_eMails_Accounts_AccountIDRef foreign key (AccountIDRef)
		references Accounts(AccountID)
			on update cascade
			on delete no action)	
	
CREATE TABLE dbo.UserProfiles (
	UserProfileID int NOT NULL IDENTITY(1, 1),
	AccoutIDRef int not null,
	FirstName nvarchar(30),
	LastName nvarchar(40),
	Picture varbinary(max),
	CONSTRAINT PK_UserProfiles_UserProfileID PRIMARY KEY (UserProfileID ASC),
	CONSTRAINT FK_UserProfile_AccoutIDRef FOREIGN KEY (AccoutIDRef)
		REFERENCES Accounts(AccountID) 
			ON UPDATE CASCADE
			ON DELETE NO ACTION)

-- drop table dbo.Users 
CREATE TABLE dbo.Users (
	UserID int identity(1, 1) not null, -- constraint DF_Users_UserID default NEWID(),
	Username varchar(128) NOT NULL,
	Password char(40) not null,
	IsActive bit not null constraint DF_Users_Active default 1,
	DateCreation datetime CONSTRAINT DF_Users_DateCreation default getdate(),
	CONSTRAINT PK_Users_UserID PRIMARY KEY (UserID ASC))

CREATE TABLE dbo.Roles (
	RoleID int identity(1, 1) not null, -- constraint DF_Users_UserID default NEWID(),
	Rolename varchar(128) NOT NULL,
	IsActive bit not null constraint DF_Roles_Active default 1,
	DateCreation datetime CONSTRAINT DF_Roles_DateCreation default getdate(),
	CONSTRAINT PK_Roles_RoleID PRIMARY KEY (RoleID ASC))

create table UserRole (
	UserRoleID int identity(1, 1) not null,
	UserIdRef int not null,
	RoleIdRef int not null,
	constraint PK_UserRole_UserRoleID primary key (UserRoleID asc),
	constraint FK_UserRole_Users_UserIdRef foreign key (UserIdRef)
		references Users(UserId)
			on update cascade
			on delete cascade,
	constraint FK_UserRole_Roles_RoleIDRef foreign key (RoleIDRef)
		references Roles(RoleIDRef)
			on update cascade
			on delete cascade)
			
create table Entities (
	EntityID int identity (1, 1) not null,
	EntityName varchar(128) not null,
	EntityTypeIDRef int,
	SID uniqueidentifier,
	constraint PK_Entities_EntityID primary key (EntityID asc),
	constraint FK_Entities_EntityTypes_EntityTypeIDRef foreign key (EntityTypeIDRef)
		references EntityTypes(EntityTypeID)
			on update cascade
			on delete no action,
	constraint FK_Entities_Securables_SID
		references Securables(SID)
			on update cascade
			on delete no action)

create table Securables (
	SID uniqueidentifier not null constraint DF_Securables_SID default newid(),
	


CREATE TABLE Pricipals
principalid 
sid uniqueidentifier newid
useridref
securableidref

use Conference
go




*/

















