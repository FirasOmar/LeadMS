CREATE TABLE [dbo].[SMSTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DefaultLanguage] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_SMSTemplates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[SMSTemplateTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SMSTemplateId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_MSTemplateTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SMSTemplateTranslation]  WITH CHECK ADD  CONSTRAINT [FK_SMSTemplateTranslation_SMSTemplate] FOREIGN KEY([SMSTemplateId])
REFERENCES [dbo].[SMSTemplate] ([Id])
GO

ALTER TABLE [dbo].[SMSTemplateTranslation] CHECK CONSTRAINT [FK_SMSTemplateTranslation_SMSTemplate]
GO


INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (39, N'', N'SMSTemplate', N'View', N'SMS Template', CAST(N'2018-12-10 11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (40, N'', N'SMSTemplate', N'Edit', N'SMS Template', CAST(N'2018-12-10 11:03:30.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (41, N'', N'SMSTemplate', N'Delete', N'SMS Template', CAST(N'2018-12-10 11:03:40.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (42, N'', N'SMSTemplate', N'Create', N'SMS Template', CAST(N'2018-12-10 11:11:59.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO

alter table Sla 
add Send_SMS_Citizen bit null
Go

alter table Sla 
add Send_SMS_Employee bit null
Go

