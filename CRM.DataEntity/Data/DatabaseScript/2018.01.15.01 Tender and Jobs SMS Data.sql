
SET IDENTITY_INSERT [dbo].[SMSTemplate] ON 
GO

INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (18, CAST(N'2019-01-15 15:09:04.070' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (19, CAST(N'2019-01-15 15:13:20.593' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (20, CAST(N'2019-01-15 15:15:27.033' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (21, CAST(N'2019-01-15 15:18:25.853' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (22, CAST(N'2019-01-15 15:20:05.617' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (23, CAST(N'2019-01-15 15:21:36.483' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (24, CAST(N'2019-01-15 15:25:41.947' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (25, CAST(N'2019-01-15 15:27:27.363' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (26, CAST(N'2019-01-15 15:29:32.413' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (27, CAST(N'2019-01-15 15:30:29.653' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (28, CAST(N'2019-01-15 15:32:13.950' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (29, CAST(N'2019-01-15 15:33:13.710' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (30, CAST(N'2019-01-15 15:34:38.717' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (31, CAST(N'2019-01-15 15:35:52.340' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (32, CAST(N'2019-01-15 15:37:10.520' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (33, CAST(N'2019-01-15 15:37:57.060' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (34, CAST(N'2019-01-15 15:38:38.973' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (35, CAST(N'2019-01-15 15:39:30.813' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO

SET IDENTITY_INSERT [dbo].[SMSTemplate] OFF
GO


INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (18, N' New Tender SMS Template for Citizen', N'شكرًا لك، تم استلام الطلب  رقم الطلب: {CaseId}	', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (18, N' New Tender SMS Template for Citizen', N'תודה לך, הפניה שלך התקבלה. מס'' פניה: {CaseId}	', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (19, N'New Tender SMS Template for Employee	', N'התקבלה פניה חדשה, מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (19, N'New Tender SMS Template for Employee	', N'تم إدخال الطلب , رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (20, N'Received Tender SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، حالة الطلب:
تم الاستلام
 رقم الطلب: {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (20, N'Received Tender SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה:  התקבל , 
מס'' פניה: {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (21, N'Received Tender SMS Template for Employee	', N'لقد تم التعامل مع الطلب ، حالة الطلب: تم الاستلام
 رقم الطلب: {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (21, N'Received Tender SMS Template for Employee	', N'הפניה שלך טופלה, סטטוס פניה: התקבל,
 מס'' פניה: {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (22, N'InProgress Tender SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، حالة الطلب:
 قيد المعاينة
رقم الطلب: {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (22, N'InProgress Tender SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה:  בטיפול ,
 מס'' פניה: {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (23, N'InProgress Tender SMS Template for Employee', N'لقد تم التعامل مع الطلب ، حالة الطلب: قيد المعاينة
رقم الطلب: {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (23, N'InProgress Tender SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה:  בטיפול ,
 מס'' פניה: {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (24, N'Winner Tender SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: זוכה ,
 מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (24, N'Winner Tender SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، حالة الطلب:
 فائز 
رقم الطلب: {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES ( 25, N'Winner Tender SMS Template for Employee', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز
 رقم الطلب: {CaseId}	', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES ( 25, N'Winner Tender SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: זוכה ,
 מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES ( 26, N'Loser Tender SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: غير فائز
رقم الطلب: {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES ( 26, N'Loser Tender SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: לא זכה , 
מס'' פניה: {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES ( 27, N'Loser Tender SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: לא זכה , 
מס'' פניה: {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES ( 27, N'Loser Tender SMS Template for Employee', N'لقد تم التعامل مع الطلب ، حالة الطلب:
غير فائز
رقم الطلب: {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (28, N'New Job SMS Template for Citizen', N'תודה לך, הפניה שלך התקבלה. מס'' פניה: {CaseId}	', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (28, N'New Job SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، حالة الطلب:
جديد
رقم الطلب: {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (29, N'New Job SMS Template for Employee', N'תודה לך, הפניה שלך התקבלה. מס'' פניה: {CaseId}	', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (29, N'New Job SMS Template for Employee', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: جديد 
رقم الطلب: {CaseId}	', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (30, N'Received Job SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: התקבל,
 מס'' פניה: {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (30, N'Received Job SMS Template for Citizen', N'لقد تم التعامل مع الطلب ،
 حالة الطلب: تم الاستلام 
رقم الطلب: {CaseId}	', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (31, N'Received Job SMS Template for Employee', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: تم الاستلام
 رقم الطلب: {CaseId}	', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (31, N'Received Job SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: התקבל,
 מס'' פניה: {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (32, N'InProgress Job SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה:  בטיפול ,
 מס'' פניה: {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (32, N'InProgress Job SMS Template for Citizen', N'لقد تم التعامل مع الطلب ،
 حالة الطلب: قيد المعاينة
 رقم الطلب: {CaseId}	', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (33, N'InProgress Job SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה:  בטיפול ,
 מס'' פניה: {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (33, N'InProgress Job SMS Template for Employee', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: قيد المعاينة 
رقم الطلب: {CaseId}	', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (34, N'Winner Job SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: זוכה ,
 מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (34, N'Winner Job SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز
 رقم الطلب: {CaseId}	', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (35, N'Winner Job SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: זוכה ,
 מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (35, N'Winner Job SMS Template for Employee', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز 
رقم الطلب: {CaseId}	', 1, 1)
GO