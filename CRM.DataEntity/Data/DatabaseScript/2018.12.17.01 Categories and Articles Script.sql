CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[CategoryTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_CategoryTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[CategoryTranslation]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTranslation_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO

ALTER TABLE [dbo].[CategoryTranslation] CHECK CONSTRAINT [FK_CategoryTranslation_Category]
GO


INSERT [dbo].[Permission] ( [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (N'', N'Category', N'View', N'Category', CAST(N'2018-12-13 11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ( [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (N'', N'Category', N'Edit', N'Category', CAST(N'2018-12-13 11:03:30.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO						    
INSERT [dbo].[Permission] ( [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (N'', N'Category', N'Delete', N'Category', CAST(N'2018-12-13 11:03:40.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO						    
INSERT [dbo].[Permission] ( [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (N'', N'Category', N'Create', N'Category', CAST(N'2018-12-13 11:11:59.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO


CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	CategoryId [int] Not Null,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Article] WITH CHECK ADD  CONSTRAINT [FK_Article_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO

ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Category]
GO

CREATE TABLE [dbo].[ArticleTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_ArticleTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[ArticleTranslation]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTranslation_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([Id])
GO

ALTER TABLE [dbo].[ArticleTranslation] CHECK CONSTRAINT [FK_ArticleTranslation_Article]
GO


INSERT [dbo].[Permission] ( [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (N'', N'Article', N'View', N'Category', CAST(N'2018-12-13 11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ( [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (N'', N'Article', N'Edit', N'Category', CAST(N'2018-12-13 11:03:30.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO						    
INSERT [dbo].[Permission] ( [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (N'', N'Article', N'Delete', N'Category', CAST(N'2018-12-13 11:03:40.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO						    
INSERT [dbo].[Permission] ( [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (N'', N'Article', N'Create', N'Category', CAST(N'2018-12-13 11:11:59.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO

