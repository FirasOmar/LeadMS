INSERT [dbo].[Permission] ([PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn])
 VALUES (N'', N'ArticleDescription', N'View', N'Article Description', CAST(N'2018-12-10 11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO

CREATE TABLE [dbo].[Mapping_Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableId] [int] NOT NULL,
	TableValue int not null,
	ArticleId int not null,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Mapping_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO