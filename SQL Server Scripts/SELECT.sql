use Conference
go


select * from sys.database_principals

select * from dbo.Users
select * from dbo.aspnet_Users
select * from dbo.aspnet_Paths
select * from dbo.aspnet_Membership
select * from dbo.aspnet_Roles
select * from dbo.aspnet_Applications
select * from dbo.aspnet_Paths
select * from dbo.aspnet_Users
select * from dbo.aspnet_Profile

exec sp_helpconstraint 'dbo.aspnet_users'


select * from dbo.Files

select * from dbo.Status


insert into dbo.Status (StatusTextEn) values ('Enter')
insert into dbo.Status (StatusTextEn) values ('Progress')
insert into dbo.Status (StatusTextEn) values ('Regected')
insert into dbo.Status (StatusTextEn) values ('Confirm')





select * from dbo.DatabaseLog 
where event like 'create_table'
order by PostTime desc

select * from dbo.Files

select * from sys.syslanguages
select * from Documents

alter login sa enable
alter login sa with password = '14894'

use Conference
go


select * from documents

select * from Authors

select * from dbo.Status


select d.DocumentID, d.Title, d.DocumentSummary, s.StatusTextEn, s.StatusTextFa, a.FirstName, a.LastName, a.Email, f.ClientFileName, f.Content, d.UserName
	from dbo.Documents d
		left join dbo.Files f
			on f.DocumentIDRef = d.DocumentID
		left join dbo.Status s
			on d.StatusIDRef = s.StatusID
		left join dbo.Papers p
			join dbo.Authors a
				on p.AuthorIDRef = a.AuthorID
			on p.DocumentIDRef = d.DocumentID
where d.UserName = 1

