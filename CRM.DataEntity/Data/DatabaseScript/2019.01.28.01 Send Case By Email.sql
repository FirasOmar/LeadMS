INSERT [dbo].[Permission] ( [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (N'', N'Cases', N'SendByEmail', N'Send by email', CAST(N'2018-12-13 11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ( [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (N'', N'CasesSentAsEmail', N'View', N'Cases Sent by Email', CAST(N'2018-12-13 11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO

CREATE TABLE [dbo].[CasesByEmail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
	EmailDescription [nvarchar] (max) Not NULL,
	SentTo [nvarchar](max) Not Null
 CONSTRAINT [PK_CasesByEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

Alter table CasesByEmail
add FilePath nvarchar(250) Null
Go
