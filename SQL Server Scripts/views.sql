use Conference
go

-- select * from Documents d left join Files f on d.DocumentID = f.DocumentIDRef



select d.DocumentID, d.Title, d.DocumentSummary, s.StatusTextEn, s.StatusTextFa, a.FirstName, a.LastName, a.Email, f.ClientFileName, f.Content
	from dbo.Documents d
		left join dbo.Files f
			on f.DocumentIDRef = d.DocumentID
		left join dbo.Status s
			on d.StatusIDRef = s.StatusID
		left join dbo.Papers p
			join dbo.Authors a
				on p.AuthorIDRef = a.AuthorID
			on p.DocumentIDRef = d.DocumentID


select d.DocumentID, d.Title, d.DocumentSummary, s.StatusTextEn, s.StatusTextFa, a.FirstName, a.LastName, a.Email, f.FileID, f.ClientFileName, f.Content, d.UserName
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
