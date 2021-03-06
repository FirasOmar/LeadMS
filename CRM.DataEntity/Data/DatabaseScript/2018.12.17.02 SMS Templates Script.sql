USE [Crm_demo]
GO
SET IDENTITY_INSERT [dbo].[SMSTemplate] ON 

GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (1, CAST(N'2018-12-17 10:55:40.740' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (2, CAST(N'2018-12-17 10:56:37.563' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (3, CAST(N'2018-12-17 10:59:16.910' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (4, CAST(N'2018-12-17 10:59:44.117' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (5, CAST(N'2018-12-17 11:00:54.393' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (6, CAST(N'2018-12-17 11:02:09.650' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (7, CAST(N'2018-12-17 11:03:10.860' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (8, CAST(N'2018-12-17 11:04:21.840' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (9, CAST(N'2018-12-17 11:05:26.097' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (10, CAST(N'2018-12-17 11:06:25.803' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (11, CAST(N'2018-12-17 11:07:53.007' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (12, CAST(N'2018-12-17 11:08:44.033' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (13, CAST(N'2018-12-17 11:12:47.573' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (14, CAST(N'2018-12-17 11:13:18.667' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (15, CAST(N'2018-12-17 11:14:37.560' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (16, CAST(N'2018-12-17 11:15:24.500' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[SMSTemplate] OFF
GO
SET IDENTITY_INSERT [dbo].[SMSTemplateTranslation] ON 

GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (1, 1, N'New SMS Template for Citizen', N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:{CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (2, 1, N'New SMS Template for Citizen', N'תודה לך, נטפל בפניה בהקדם. מס'' פניה:{CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (3, 2, N'New SMS Template for Employee', N'تم إدخال طلب جديد, رقم الطلب:{CaseId}
', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (4, 2, N'New SMS Template for Employee', N'התקבלה פניה חדשה, מס'' פניה : {CaseId}
', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (5, 3, N'In Progress SMS Template for Citizen', N' ', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (6, 4, N'In Progress SMS Template for Employee	', N'  ', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (7, 4, N'In Progress SMS Template for Employee	', N' ', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (8, 5, N'Rejected SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (9, 5, N'Rejected SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: 
נדחה
מס'' פניה: : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (10, 6, N'Rejected SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (11, 6, N'Rejected SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: 
נדחה
מס'' פניה: : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (12, 7, N'Duplicated SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (13, 7, N'Duplicated SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: 
כפילות
מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (14, 8, N'Duplicated SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (15, 8, N'Duplicated SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: 
כפילות
מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (16, 9, N'Resolved SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (17, 9, N'Resolved SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: 
טופל
מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (18, 10, N'Resolved SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (19, 10, N'Resolved SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: 
טופל
מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (20, 11, N'Closed SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (21, 11, N'Closed SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: 
סגור
מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (22, 12, N'Closed SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (23, 12, N'Closed SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: 
סגור
מס'' פניה: : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (24, 13, N'Na SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:غير محدد
رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (25, 13, N'Na SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:غير محدد
رقم الطلب : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (26, 14, N'Na SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:غير محدد
رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (27, 14, N'Na SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:غير محدد
رقم الطلب : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (28, 15, N'Sla SMS Template for Citizen', N'هنالك تأخير في معالجة الطلب، سنقوم بتحديثكم حين تتم المعالجة، رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (29, 15, N'Sla SMS Template for Citizen', N'חל איחור בטיפול בפניה, נעדכן אתכם ברגע וזה מטופל, מס'' פניה : {CaseId}', 2, 0)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (30, 16, N'Sla SMS Template for Employee', N'هنالك تأخير في معالجة طلب، رقم الطلب : {CaseId}', 1, 1)
GO
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (31, 16, N'Sla SMS Template for Employee', N'ישנם איחור בטיפול בפניה, מס'' פניה : {CaseId}', 2, 0)
GO
SET IDENTITY_INSERT [dbo].[SMSTemplateTranslation] OFF
GO
