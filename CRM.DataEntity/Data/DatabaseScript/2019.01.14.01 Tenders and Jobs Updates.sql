Drop table FormOwner
Go

SET IDENTITY_INSERT [dbo].[MasterLookup] ON 
GO

INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (22, CAST(N'2019-01-13 09:47:59.360' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (23, CAST(N'2019-01-13 09:53:42.247' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO

SET IDENTITY_INSERT [dbo].[MasterLookup] OFF
GO

SET IDENTITY_INSERT [dbo].[MasterLookupTranslation] ON 
GO

INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (23, 22, N'المناقصات - الحالات', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (24, 23, N'الوظائف - الحالات', 1, 1)
GO

SET IDENTITY_INSERT [dbo].[MasterLookupTranslation] OFF
GO



SET IDENTITY_INSERT [dbo].[DetailsLookup] ON 
GO

INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (65, 22, CAST(N'2019-01-13 09:48:39.040' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (66, 22, CAST(N'2019-01-13 09:49:14.787' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (67, 22, CAST(N'2019-01-13 09:51:22.130' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (68, 22, CAST(N'2019-01-13 09:51:40.167' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (69, 22, CAST(N'2019-01-13 09:51:49.703' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (70, 23, CAST(N'2019-01-13 09:53:58.010' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (71, 23, CAST(N'2019-01-13 09:54:12.213' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (72, 23, CAST(N'2019-01-13 09:54:28.237' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (73, 23, CAST(N'2019-01-13 09:54:40.897' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[DetailsLookup] OFF
GO

SET IDENTITY_INSERT [dbo].[DetailsLookupTranslation] ON 
GO

INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (66, 65, N'جديد', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (67, 66, N'تم الاستلام', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (68, 67, N'قيد المعاينة', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (69, 68, N'فائز', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (70, 69, N'غير فائز', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (71, 70, N'جديد', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (72, 71, N'تم الاستلام', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (73, 72, N'قيد المعاينة', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (74, 73, N'فائز', 1, 1)
GO

SET IDENTITY_INSERT [dbo].[DetailsLookupTranslation] OFF
GO


