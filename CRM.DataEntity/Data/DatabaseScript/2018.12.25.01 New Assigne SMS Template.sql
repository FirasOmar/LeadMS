

SET IDENTITY_INSERT [dbo].[SMSTemplate] ON 
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (17, CAST(N'2018-12-25 14:45:07.377' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[SMSTemplate] OFF
GO

INSERT [dbo].[SMSTemplateTranslation] ( [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (17, N'SMS Template for New Assignee - Employee', N'test', 1, 1)
GO

