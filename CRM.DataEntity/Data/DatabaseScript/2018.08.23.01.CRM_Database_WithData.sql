USE [master]
GO
/****** Object:  Database [CrmSystem]    Script Date: 8/23/2018 7:22:28 PM ******/
CREATE DATABASE [CrmSystem]
GO
USE [CrmSystem]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/23/2018 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[FriendlyName] [nvarchar](256) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunicationLogs]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunicationLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[LogText] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_CommunicationLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[InsertDate] [datetime] NULL,
	[Mobile] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentTranslation]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_DepartmentTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailsLookup]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailsLookup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Code] [nvarchar](300) NULL,
 CONSTRAINT [PK_DetailsLookup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailsLookupTranslation]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailsLookupTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DetailsLookupId] [int] NOT NULL,
	[Value] [nvarchar](200) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_DetailsLookupTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterLookup]    Script Date: 8/23/2018 7:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterLookup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_MasterLookup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterLookupTranslation]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterLookupTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterLookupId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_MasterLookupTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Icon] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[PageId] [int] NULL,
	[PageUrl] [nvarchar](max) NULL,
	[SortOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuTranslation]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_MenuTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PageUrl] [nvarchar](max) NOT NULL,
	[PageName] [nvarchar](300) NULL,
	[PermissionKey] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sla]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkingDaysIncludingHolidays] [bit] NOT NULL,
	[HoursPerState] [int] NOT NULL,
	[NotifyBefore] [int] NOT NULL,
	[NotificationCount] [int] NULL,
	[PropogateToManager] [bit] NOT NULL,
	[CcAssignee] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Sla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlaIgnoredCaseStates]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlaIgnoredCaseStates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SlaId] [int] NOT NULL,
	[IgnoredCaseStateId] [int] NOT NULL,
 CONSTRAINT [PK_IgnoredCaseStates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlaTranslation]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlaTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SlaId] [int] NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_SlaTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateHistory]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CaseId] [int] NOT NULL,
	[PreviousState] [int] NOT NULL,
	[CurrentState] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_StateHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateTransitionsConfiguration]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateTransitionsConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[StateFrom] [int] NOT NULL,
	[StateTo] [int] NOT NULL,
	[AssigneeDepId] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_CaseStateTransitionsConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysCaseComments]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysCaseComments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[CaseId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_SysCaseComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemCaseAttachments]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemCaseAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileId] [int] NOT NULL,
	[CaseId] [int] NOT NULL,
 CONSTRAINT [PK_SystemCaseAttachments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemCases]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[CategoryId] [int] NULL,
	[SeverityId] [int] NULL,
	[PriorityId] [int] NULL,
	[Title] [nvarchar](300) NULL,
	[Tags] [nvarchar](max) NULL,
	[AssigneeDepartmentId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_SystemCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemFile]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NULL,
	[FileUrl] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_SystemFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemFileTranslation]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemFileTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemFileId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[DisplayName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[AltText] [nvarchar](max) NULL,
 CONSTRAINT [PK_SystemFileTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemLog]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Component] [nvarchar](200) NOT NULL,
	[StackTrace] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_SystemLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemSetting]    Script Date: 8/23/2018 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_SystemSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemSettingTranslation]    Script Date: 8/23/2018 7:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemSettingTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SettingId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SystemSettingTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 8/23/2018 7:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](256) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[IdNumber] [nvarchar](50) NOT NULL,
	[Fax] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[GenderLookupId] [int] NULL,
	[MartialStatusLookupId] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Mobile] [nvarchar](100) NULL,
	[LastLogin] [datetime] NULL,
	[ProfilePhoto] [nvarchar](max) NULL,
	[IntegrationId] [nvarchar](100) NULL,
	[ProvinceId] [int] NULL,
	[CityId] [int] NULL,
	[RegionId] [int] NULL,
	[DepartmentId] [int] NULL,
	[ManagerId] [int] NULL,
	[PreferedLanguageId] [int] NULL,
	[Email] [nvarchar](256) NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfileHolidays]    Script Date: 8/23/2018 7:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfileHolidays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserProfileId] [int] NULL,
	[HolidayDate] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_UserProfileHolidays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfileOffDays]    Script Date: 8/23/2018 7:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfileOffDays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserProfileId] [int] NULL,
	[WeekDay] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_UserProfileOffDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfileTranslation]    Script Date: 8/23/2018 7:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfileTranslation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[UserProfileId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[FullName] [nvarchar](100) NULL,
	[Address] [nvarchar](300) NULL,
 CONSTRAINT [PK_UserProfileTranslation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [FriendlyName], [Description]) VALUES (N'1', N'Administrator', N'Admin', N'System Admin')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [FriendlyName], [Description]) VALUES (N'2', N'User', N'User', N'User')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserRoles] ON 
GO
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (1, N'8b5cc3cc-d782-47b1-8e62-d605c3d49624', N'1')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserRoles] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8b5cc3cc-d782-47b1-8e62-d605c3d49624', N'salam-cs@hotmail.com', 0, N'AOMmPFATIjfDE3YIS/tmcJnLamUkrTvPlAwK2t+V+h9hgQfGhp2JvtE+ggiXKqWBtw==', N'113c8ec3-d92d-4fec-9d16-17364a4aea2b', NULL, 0, 0, NULL, 1, 0, N'salam-cs@hotmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b44c76ef-3951-446b-a0df-9c68501dc293', N'salam-test1@hotmail.com', 0, N'AFiOK5u7zpR5S5Ax+MgmEIfRvHC7YbPSOzh1YyJwfPR7ED4jFvP6Ek0ymktmfgEm0Q==', N'f981e11f-72ab-48d7-ab41-905e475505bd', NULL, 0, 0, NULL, 1, 0, N'salam-test1@hotmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f0d48ffe-56e2-4e65-aca1-eb31e965d799', N'salam-test2@hotmail.com', 0, N'AB1XCeFcCQhhhIsRUl4eQEUdZGekyV2Ye7UDFxt/c3+GYz/qW+5Y3FA3wN3EeqWN3A==', N'ce3fba8e-4e69-4870-98d3-6b61d87f604a', NULL, 0, 0, NULL, 1, 0, N'salam-test2@hotmail.com')
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, CAST(N'2018-08-10T23:30:35.403' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
INSERT [dbo].[Department] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, CAST(N'2018-08-10T23:38:59.190' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Department] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, CAST(N'2018-08-23T19:13:33.240' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[DepartmentTranslation] ON 
GO
INSERT [dbo].[DepartmentTranslation] ([Id], [DepartmentId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (1, 3, N'test', N'test', 1, 1)
GO
INSERT [dbo].[DepartmentTranslation] ([Id], [DepartmentId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (2, 4, N'????? 1', N'????? 1', 1, 1)
GO
INSERT [dbo].[DepartmentTranslation] ([Id], [DepartmentId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (3, 5, N'????? 2', N'????? 2', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[DepartmentTranslation] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailsLookup] ON 
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (1, 1, CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (2, 1, CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (3, 2, CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (4, 2, CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (9, 6, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (10, 6, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (11, 6, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (12, 7, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (13, 7, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (14, 7, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (15, 8, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (16, 1, CAST(N'2018-07-03T23:37:07.483' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-08-11T12:56:48.847' AS DateTime), NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (17, 10, CAST(N'2018-08-10T22:03:10.343' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (18, 10, CAST(N'2018-08-10T22:03:18.807' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (19, 10, CAST(N'2018-08-10T22:03:31.510' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (20, 11, CAST(N'2018-08-12T19:55:31.913' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (21, 11, CAST(N'2018-08-12T19:55:38.760' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (22, 11, CAST(N'2018-08-12T19:56:21.317' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (23, 11, CAST(N'2018-08-12T19:56:30.190' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (24, 11, CAST(N'2018-08-12T19:57:19.807' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (25, 11, CAST(N'2018-08-12T19:59:21.057' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (26, 11, CAST(N'2018-08-12T19:59:38.817' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (27, 14, CAST(N'2018-08-18T15:32:10.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (28, 13, CAST(N'2018-08-18T15:32:29.647' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (29, 13, CAST(N'2018-08-18T15:32:36.467' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (30, 13, CAST(N'2018-08-18T15:32:48.977' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (31, 12, CAST(N'2018-08-18T15:33:09.903' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (32, 12, CAST(N'2018-08-18T15:33:17.020' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (33, 12, CAST(N'2018-08-18T15:33:23.553' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (34, 15, CAST(N'2018-08-22T23:11:58.293' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (35, 15, CAST(N'2018-08-22T23:12:06.033' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (36, 15, CAST(N'2018-08-22T23:12:15.300' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (37, 15, CAST(N'2018-08-22T23:12:29.850' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (38, 15, CAST(N'2018-08-22T23:12:47.133' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (39, 15, CAST(N'2018-08-22T23:12:52.553' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (40, 15, CAST(N'2018-08-23T14:26:58.000' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[DetailsLookup] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailsLookupTranslation] ON 
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (1, 1, N'???', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (2, 2, N'????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (3, 3, N'?????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (4, 4, N'????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (9, 9, N'????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (10, 10, N'?? ????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (11, 11, N'?????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (12, 12, N'????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (13, 13, N'?? ????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (14, 14, N'?????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (15, 15, N'????????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (16, 16, N'test', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (17, 17, N'????? ???????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (18, 18, N'????? ???????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (19, 19, N'????? ??????????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (20, 20, N'?????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (21, 21, N'?????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (22, 22, N'???????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (23, 23, N'????????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (24, 24, N'????????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (25, 25, N'??????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (26, 26, N'??????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (27, 27, N'????? ??????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (28, 28, N'?????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (29, 29, N'??????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (30, 30, N'??????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (31, 31, N'?????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (32, 32, N'??????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (33, 33, N'??????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (34, 34, N'????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (35, 35, N'??? ???????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (36, 36, N'?????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (37, 37, N'????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (38, 38, N'?????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (39, 39, N'????', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (40, 40, N'??? ????', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[DetailsLookupTranslation] OFF
GO
SET IDENTITY_INSERT [dbo].[MasterLookup] ON 
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (7, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (8, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (9, CAST(N'2018-07-03T23:37:23.980' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (10, CAST(N'2018-08-10T22:02:47.960' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (11, CAST(N'2018-08-12T19:54:26.943' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (12, CAST(N'2018-08-18T15:17:36.687' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (13, CAST(N'2018-08-18T15:18:00.980' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (14, CAST(N'2018-08-18T15:18:19.670' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (15, CAST(N'2018-08-22T23:11:31.173' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[MasterLookup] OFF
GO
SET IDENTITY_INSERT [dbo].[MasterLookupTranslation] ON 
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (1, 1, N'?????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (2, 2, N'?????? ??????????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (3, 3, N'?????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (6, 6, N'?????????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (7, 7, N'?????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (8, 8, N'????????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (9, 9, N'test', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (10, 10, N'?????? ???????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (11, 11, N'???? ???????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (12, 12, N'??????? - ???????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (13, 13, N'??????? - ???????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (14, 14, N'??????? - ??????', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (15, 15, N'??????? - ???????', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[MasterLookupTranslation] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([Id], [Icon], [ParentId], [PageId], [PageUrl], [SortOrder], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, NULL, NULL, NULL, N'http://localhost:61712/Menu/Index', 1, CAST(N'2018-08-11T00:08:39.917' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuTranslation] ON 
GO
INSERT [dbo].[MenuTranslation] ([Id], [MenuId], [LanguageId], [IsDefault], [Title], [Description]) VALUES (1, 1, 1, 1, N'test', N'test')
GO
SET IDENTITY_INSERT [dbo].[MenuTranslation] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, N'', N'Users', N'Create', N'test', CAST(N'2018-08-14T22:57:37.310' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, N'', N'Users', N'Edit', N'Edit', CAST(N'2018-08-23T19:16:45.123' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, N'', N'Users', N'Delete', N'Delete', CAST(N'2018-08-23T19:17:01.993' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, N'', N'Users', N'View', N'View', CAST(N'2018-08-23T19:17:17.627' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (8, N'', N'Sla', N'Create', N'Create', CAST(N'2018-08-23T19:18:26.560' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (9, N'', N'Sla', N'Edit', N'Edit', CAST(N'2018-08-23T19:18:54.460' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (10, N'', N'Sla', N'Delete', N'Create', CAST(N'2018-08-23T19:19:01.267' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (11, N'', N'Sla', N'View', N'View', CAST(N'2018-08-23T19:19:11.527' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (12, N'', N'Cases', N'Create', N'Create', CAST(N'2018-08-23T19:20:24.273' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (13, N'', N'Cases', N'Edit', N'Create', CAST(N'2018-08-23T19:20:31.690' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (14, N'', N'Cases', N'Delete', N'Delete', CAST(N'2018-08-23T19:20:41.070' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (15, N'', N'Cases', N'View', N'View', CAST(N'2018-08-23T19:21:02.197' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (16, N'', N'Cases', N'Assign', N'Assign', CAST(N'2018-08-23T19:21:13.123' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Sla] ON 
GO
INSERT [dbo].[Sla] ([Id], [WorkingDaysIncludingHolidays], [HoursPerState], [NotifyBefore], [NotificationCount], [PropogateToManager], [CcAssignee], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, 1, 12, 6, NULL, 1, 1, CAST(N'2018-08-22T23:03:20.557' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sla] OFF
GO
SET IDENTITY_INSERT [dbo].[SlaIgnoredCaseStates] ON 
GO
INSERT [dbo].[SlaIgnoredCaseStates] ([Id], [SlaId], [IgnoredCaseStateId]) VALUES (3, 1, 34)
GO
INSERT [dbo].[SlaIgnoredCaseStates] ([Id], [SlaId], [IgnoredCaseStateId]) VALUES (4, 1, 39)
GO
SET IDENTITY_INSERT [dbo].[SlaIgnoredCaseStates] OFF
GO
SET IDENTITY_INSERT [dbo].[SlaTranslation] ON 
GO
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (1, 1, N'test', N'test', 1, 1)
GO
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (2, 1, N'test', N'test', 0, 0)
GO
SET IDENTITY_INSERT [dbo].[SlaTranslation] OFF
GO
SET IDENTITY_INSERT [dbo].[StateTransitionsConfiguration] ON 
GO
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeDepId], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, 27, 40, 34, 4, CAST(N'2018-08-23T15:01:42.710' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[StateTransitionsConfiguration] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemCaseAttachments] ON 
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (1, 3, 2)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (2, 4, 2)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (3, 9, 2)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (4, 10, 2)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (5, 11, 3)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (6, 12, 3)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (7, 13, 3)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (8, 16, 7)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (9, 17, 7)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (10, 18, 8)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (11, 19, 8)
GO
SET IDENTITY_INSERT [dbo].[SystemCaseAttachments] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemCases] ON 
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeDepartmentId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, N'da9aab39-e6ca-4217-9d44-b33a683362e9', 27, 29, 31, N'test', N'test', 4, N'test', CAST(N'2018-08-18T15:48:15.467' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeDepartmentId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, N'5f589507-3c63-4018-ac8d-ae614ed05b71', 27, 28, 32, N'test', N'test', 4, N'test', CAST(N'2018-08-18T20:36:09.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeDepartmentId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, N'eba8be49-4e9c-42cb-bb36-450fd6e5eda5', 27, 29, 32, N'test test', N'test', 4, N'test test', CAST(N'2018-08-18T21:56:11.927' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeDepartmentId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, N'c6bee608-545c-4237-9a50-70f5c1247b52', 27, 28, 32, N'test 1', N'test 1', 4, N'test', CAST(N'2018-08-21T22:14:55.407' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeDepartmentId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, N'94da0ac5-6b00-40e8-a107-3dd40be06921', 27, 28, 32, N'test 2', N'test 2', 4, N'test 2', CAST(N'2018-08-21T22:24:03.510' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeDepartmentId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, N'df771004-c22d-4c48-b4fb-cfa12afd0d98', 27, 28, 32, N'test 2', N'test 2', 4, N'test 2', CAST(N'2018-08-21T22:39:43.010' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeDepartmentId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (7, N'ae794b82-0de5-48e9-a640-a52f1d70a941', 27, 28, 32, N'test 2', N'test 2', 4, N'test 2', CAST(N'2018-08-21T22:43:41.370' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeDepartmentId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (8, N'b5bafff7-1ae5-4c7e-bb2f-0a0e4d5cc997', 27, 28, 32, N'test 4', N'test 4', 4, N'test 4', CAST(N'2018-08-21T22:52:12.487' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[SystemCases] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemFile] ON 
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (1, 2, N'http://localhost:61712//Document/2/1.png', CAST(N'2018-08-18T20:33:42.800' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T20:33:42.843' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (2, 2, N'http://localhost:61712//Document/2/2.jpg', CAST(N'2018-08-18T20:34:11.260' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T20:34:11.307' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (3, 2, N'http://localhost:61712//Document/2/3.jpg', CAST(N'2018-08-18T21:15:04.670' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T21:15:04.670' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (4, 2, N'http://localhost:61712//Document/2/4.jpg', CAST(N'2018-08-18T21:15:04.797' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T21:15:04.797' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (5, 2, N'http://localhost:61712//Document/2/5.jpg', CAST(N'2018-08-18T21:23:54.930' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T21:23:54.930' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (6, 2, N'http://localhost:61712//Document/2/6.jpg', CAST(N'2018-08-18T21:23:55.067' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T21:23:55.067' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (7, 2, N'http://localhost:61712//Document/2/7.jpg', CAST(N'2018-08-18T21:27:39.617' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T21:27:39.617' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (8, 2, N'http://localhost:61712//Document/2/8.jpg', CAST(N'2018-08-18T21:27:39.670' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T21:27:39.670' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (9, 2, N'http://localhost:61712//Document/2/9.jpg', CAST(N'2018-08-18T21:30:31.750' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T21:30:31.750' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (10, 2, N'http://localhost:61712//Document/2/10.jpg', CAST(N'2018-08-18T21:30:31.877' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T21:30:31.877' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (11, 2, N'http://localhost:61712//Document/2/11.jpg', CAST(N'2018-08-18T21:55:58.470' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T21:55:58.470' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (12, 2, N'http://localhost:61712//Document/2/12.csv', CAST(N'2018-08-18T21:55:58.510' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-18T21:55:58.510' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (13, 2, N'http://localhost:61712//Document/2/13.jpg', CAST(N'2018-08-20T01:19:07.217' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-20T01:19:07.217' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (14, 2, N'http://localhost:61712//Documents/2/14.jpg', CAST(N'2018-08-21T22:26:51.387' AS DateTime), N'', CAST(N'2018-08-21T22:26:51.387' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (15, 2, N'http://localhost:61712//Document/2/15.jpg', CAST(N'2018-08-21T22:39:43.057' AS DateTime), N'', CAST(N'2018-08-21T22:39:43.057' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (16, 2, N'http://localhost:61712//Document/2/16.jpg', CAST(N'2018-08-21T22:43:41.543' AS DateTime), N'', CAST(N'2018-08-21T22:43:41.543' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (17, 2, N'http://localhost:61712//Document/2/17.jpg', CAST(N'2018-08-21T22:43:41.717' AS DateTime), N'', CAST(N'2018-08-21T22:43:41.717' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (18, 2, N'http://localhost:61712//Document/2/18.jpg', CAST(N'2018-08-21T22:52:12.527' AS DateTime), N'', CAST(N'2018-08-21T22:52:12.527' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (19, 2, N'http://localhost:61712//Document/2/19.jpg', CAST(N'2018-08-21T22:52:12.597' AS DateTime), N'', CAST(N'2018-08-21T22:52:12.597' AS DateTime), N'', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[SystemFile] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemFileTranslation] ON 
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (1, 1, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (2, 2, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (3, 3, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (4, 4, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (5, 5, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (6, 6, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (7, 7, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (8, 8, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (9, 9, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (10, 10, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (11, 11, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (12, 12, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (13, 13, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (14, 14, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (15, 15, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (16, 16, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (17, 17, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (18, 18, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (19, 19, 1, 1, N'', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[SystemFileTranslation] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemLog] ON 
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While adding new Department', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.DepartmentController.AddDepartment(DepartmentViewModel department) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\DepartmentController.cs:line 107', CAST(N'2018-08-10T23:23:39.100' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While editing profile (Post)', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.UserProfileController.EditProfile(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\UserProfileController.cs:line 283', CAST(N'2018-08-11T14:00:36.040' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While editing profile (Post)', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.UserProfileController.EditProfile(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\UserProfileController.cs:line 283', CAST(N'2018-08-11T14:16:57.593' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, N'An error occurred while updating the entries. See the inner exception for details.', N'Error While editing profile (Post)', N'InnerException: System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The UPDATE statement conflicted with the FOREIGN KEY constraint "FK_UserProfile_Department". The conflict occurred in database "CrmSystem", table "dbo.Department", column ''Id''.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.NonQuery(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges(), StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.UserProfileController.EditProfile(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\UserProfileController.cs:line 282', CAST(N'2018-08-11T14:25:00.960' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, N'An error occurred while updating the entries. See the inner exception for details.', N'Error While editing profile (Post)', N'InnerException: System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The UPDATE statement conflicted with the FOREIGN KEY constraint "FK_UserProfile_Department". The conflict occurred in database "CrmSystem", table "dbo.Department", column ''Id''.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.NonQuery(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges(), StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.UserProfileController.EditProfile(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\UserProfileController.cs:line 282', CAST(N'2018-08-11T14:26:36.340' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, N'An error occurred while updating the entries. See the inner exception for details.', N'Error While editing profile (Post)', N'InnerException: System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The UPDATE statement conflicted with the FOREIGN KEY constraint "FK_UserProfile_Department". The conflict occurred in database "CrmSystem", table "dbo.Department", column ''Id''.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.NonQuery(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges(), StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.UserProfileController.EditProfile(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\UserProfileController.cs:line 282', CAST(N'2018-08-11T14:27:39.513' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (7, N'Object reference not set to an instance of an object.', N'Error While editing profile (Post)', N'InnerException: , StackTrace:    at CRM.Web.Controllers.UserProfileController.EditProfile(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\UserProfileController.cs:line 325', CAST(N'2018-08-12T21:59:26.903' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (8, N'LINQ to Entities does not recognize the method ''Int32 Parse(System.String)'' method, and this method cannot be translated into a store expression.', N'Error While editing profile (Get)', N'InnerException: , StackTrace:    at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.UserProfileController.EditProfile(Int32 id, Int32 languageId) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\UserProfileController.cs:line 247', CAST(N'2018-08-12T22:12:34.343' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (9, N'LINQ to Entities does not recognize the method ''Int32 Parse(System.String)'' method, and this method cannot be translated into a store expression.', N'Error While editing profile (Get)', N'InnerException: , StackTrace:    at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.UserProfileController.EditProfile(Int32 id, Int32 languageId) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\UserProfileController.cs:line 247', CAST(N'2018-08-12T22:12:55.847' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (10, N'LINQ to Entities does not recognize the method ''Int32 Parse(System.String)'' method, and this method cannot be translated into a store expression.', N'Error While editing profile (Get)', N'InnerException: , StackTrace:    at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.UserProfileController.EditProfile(Int32 id, Int32 languageId) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\UserProfileController.cs:line 247', CAST(N'2018-08-12T22:13:58.287' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (11, N'LINQ to Entities does not recognize the method ''Int32 Parse(System.String)'' method, and this method cannot be translated into a store expression.', N'Error While editing profile (Get)', N'InnerException: , StackTrace:    at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.UserProfileController.EditProfile(Int32 id, Int32 languageId) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\UserProfileController.cs:line 247', CAST(N'2018-08-12T22:14:06.310' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (12, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While adding new sla', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.SlaController.AddSla(SlaViewModel slaVm) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\SlaController.cs:line 92', CAST(N'2018-08-22T22:50:46.550' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[SystemLog] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemSetting] ON 
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, CAST(N'2018-08-09T16:52:56.183' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, CAST(N'2018-08-09T16:52:56.320' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, CAST(N'2018-08-09T16:52:56.400' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, CAST(N'2018-08-09T23:20:36.073' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1002, CAST(N'2018-08-10T21:53:46.560' AS DateTime), N'System', 2, CAST(N'2018-08-11T15:17:11.247' AS DateTime))
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1003, CAST(N'2018-08-18T20:33:46.447' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1004, CAST(N'2018-08-21T20:04:39.117' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1005, CAST(N'2018-08-21T20:04:39.153' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1006, CAST(N'2018-08-21T22:15:40.127' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1007, CAST(N'2018-08-21T22:15:42.090' AS DateTime), N'System', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[SystemSetting] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemSettingTranslation] ON 
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1, 1, 1, 1, N'System_Google_Map_Key', N'AIzaSyASbUiCGYwyz0MsCk0hMrFzR6a1ksha2A8')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (2, 2, 1, 1, N'System_Google_Tag_Manager_Key', N'')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (3, 3, 1, 1, N'Tracking_Id_Google_Analytics', N'UA-87284465-2')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (5, 5, 1, 1, N'System_ControlPanel_PageSize', N'10')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1002, 1002, 1, 1, N'Static_Menu', N'/Home/ManageHome,/Menu,/Event,/Category,/Page,/Service,/Forms,/FormQuestionType,/FormUserProfileField,/Gallery,/Slider,/NewsLetters,/ContactUs,/UserProfile,/Permission,/MasterLookups,/SystemSettings,/Faqs')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1003, 1003, 1, 1, N'WebsiteUrl', N'http://localhost:61712/')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1004, 1004, 1, 1, N'Crm_Integration_Api_Username', N'Integration')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1005, 1005, 1, 1, N'Crm_Integration_Api_Password', N'C@rm@123')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1006, 1006, 1, 1, N'FileMaxSize', N'5')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1007, 1007, 1, 1, N'AllowedFilesForUpload', N'.jpg,.gif,.png,.txt,.pdf')
GO
SET IDENTITY_INSERT [dbo].[SystemSettingTranslation] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (2, N'salam-cs@hotmail.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-08-09T23:14:19.483' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1003, 17, N'salam-cs@hotmail.com')
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1002, N'salam-test1@hotmail.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-08-11T13:59:59.293' AS DateTime), 2, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 18, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1003, N'salam-test2@hotmail.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-08-11T16:36:38.987' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, 17, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfileHolidays] ON 
GO
INSERT [dbo].[UserProfileHolidays] ([Id], [UserProfileId], [HolidayDate], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, 2, CAST(N'2018-10-31T00:00:00.000' AS DateTime), N'Salam BirthDay', CAST(N'2018-08-12T00:00:00.000' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[UserProfileHolidays] ([Id], [UserProfileId], [HolidayDate], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, 2, CAST(N'2018-09-30T00:00:00.000' AS DateTime), N'test 3', CAST(N'2018-08-14T12:07:38.147' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
INSERT [dbo].[UserProfileHolidays] ([Id], [UserProfileId], [HolidayDate], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, 1003, CAST(N'2018-08-18T00:00:00.000' AS DateTime), N'test 2', CAST(N'2018-08-16T20:50:28.177' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserProfileHolidays] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfileOffDays] ON 
GO
INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (13, 1003, N'25', CAST(N'2018-08-12T22:46:57.760' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (14, 1003, N'26', CAST(N'2018-08-12T22:46:57.760' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (17, 2, N'20', CAST(N'2018-08-23T16:01:36.647' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (18, 2, N'26', CAST(N'2018-08-23T16:01:36.650' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserProfileOffDays] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfileTranslation] ON 
GO
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (2, 1, 1, 2, NULL, NULL, N'Salam Modallal', N'')
GO
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1002, 1, 1, 1002, NULL, NULL, N'test', N'')
GO
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1003, 1, 1, 1003, NULL, NULL, N'Salam Modallal', N'')
GO
SET IDENTITY_INSERT [dbo].[UserProfileTranslation] OFF
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[DepartmentTranslation]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentTranslation_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[DepartmentTranslation] CHECK CONSTRAINT [FK_DepartmentTranslation_Department]
GO
ALTER TABLE [dbo].[DetailsLookup]  WITH CHECK ADD  CONSTRAINT [FK_DetailsLookup_MasterLookup] FOREIGN KEY([MasterId])
REFERENCES [dbo].[MasterLookup] ([Id])
GO
ALTER TABLE [dbo].[DetailsLookup] CHECK CONSTRAINT [FK_DetailsLookup_MasterLookup]
GO
ALTER TABLE [dbo].[DetailsLookupTranslation]  WITH CHECK ADD  CONSTRAINT [FK_DetailsLookupTranslation_DetailsLookup] FOREIGN KEY([DetailsLookupId])
REFERENCES [dbo].[DetailsLookup] ([Id])
GO
ALTER TABLE [dbo].[DetailsLookupTranslation] CHECK CONSTRAINT [FK_DetailsLookupTranslation_DetailsLookup]
GO
ALTER TABLE [dbo].[MasterLookupTranslation]  WITH CHECK ADD  CONSTRAINT [FK_MasterLookupTranslation_MasterLookup] FOREIGN KEY([MasterLookupId])
REFERENCES [dbo].[MasterLookup] ([Id])
GO
ALTER TABLE [dbo].[MasterLookupTranslation] CHECK CONSTRAINT [FK_MasterLookupTranslation_MasterLookup]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Menu] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Menu]
GO
ALTER TABLE [dbo].[MenuTranslation]  WITH CHECK ADD  CONSTRAINT [FK_MenuTranslation_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[MenuTranslation] CHECK CONSTRAINT [FK_MenuTranslation_Menu]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_AspNetRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_AspNetRoles]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Permission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([Id])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Permission]
GO
ALTER TABLE [dbo].[SlaIgnoredCaseStates]  WITH CHECK ADD  CONSTRAINT [FK_IgnoredCaseStates_DetailsLookup] FOREIGN KEY([IgnoredCaseStateId])
REFERENCES [dbo].[DetailsLookup] ([Id])
GO
ALTER TABLE [dbo].[SlaIgnoredCaseStates] CHECK CONSTRAINT [FK_IgnoredCaseStates_DetailsLookup]
GO
ALTER TABLE [dbo].[SlaIgnoredCaseStates]  WITH CHECK ADD  CONSTRAINT [FK_IgnoredCaseStates_Sla] FOREIGN KEY([SlaId])
REFERENCES [dbo].[Sla] ([Id])
GO
ALTER TABLE [dbo].[SlaIgnoredCaseStates] CHECK CONSTRAINT [FK_IgnoredCaseStates_Sla]
GO
ALTER TABLE [dbo].[SlaTranslation]  WITH CHECK ADD  CONSTRAINT [FK_SlaTranslation_Sla] FOREIGN KEY([SlaId])
REFERENCES [dbo].[Sla] ([Id])
GO
ALTER TABLE [dbo].[SlaTranslation] CHECK CONSTRAINT [FK_SlaTranslation_Sla]
GO
ALTER TABLE [dbo].[StateHistory]  WITH CHECK ADD  CONSTRAINT [FK_StateHistory_SystemCases] FOREIGN KEY([CaseId])
REFERENCES [dbo].[SystemCases] ([Id])
GO
ALTER TABLE [dbo].[StateHistory] CHECK CONSTRAINT [FK_StateHistory_SystemCases]
GO
ALTER TABLE [dbo].[StateTransitionsConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_CaseStateTransitionsConfiguration_Department] FOREIGN KEY([AssigneeDepId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[StateTransitionsConfiguration] CHECK CONSTRAINT [FK_CaseStateTransitionsConfiguration_Department]
GO
ALTER TABLE [dbo].[SysCaseComments]  WITH CHECK ADD  CONSTRAINT [FK_SysCaseComments_SystemCases] FOREIGN KEY([CaseId])
REFERENCES [dbo].[SystemCases] ([Id])
GO
ALTER TABLE [dbo].[SysCaseComments] CHECK CONSTRAINT [FK_SysCaseComments_SystemCases]
GO
ALTER TABLE [dbo].[SystemCaseAttachments]  WITH CHECK ADD  CONSTRAINT [FK_SystemCaseAttachments_SystemCases] FOREIGN KEY([CaseId])
REFERENCES [dbo].[SystemCases] ([Id])
GO
ALTER TABLE [dbo].[SystemCaseAttachments] CHECK CONSTRAINT [FK_SystemCaseAttachments_SystemCases]
GO
ALTER TABLE [dbo].[SystemCaseAttachments]  WITH CHECK ADD  CONSTRAINT [FK_SystemCaseAttachments_SystemFile] FOREIGN KEY([FileId])
REFERENCES [dbo].[SystemFile] ([Id])
GO
ALTER TABLE [dbo].[SystemCaseAttachments] CHECK CONSTRAINT [FK_SystemCaseAttachments_SystemFile]
GO
ALTER TABLE [dbo].[SystemFileTranslation]  WITH CHECK ADD  CONSTRAINT [FK_SystemFileTranslation_SystemFile] FOREIGN KEY([SystemFileId])
REFERENCES [dbo].[SystemFile] ([Id])
GO
ALTER TABLE [dbo].[SystemFileTranslation] CHECK CONSTRAINT [FK_SystemFileTranslation_SystemFile]
GO
ALTER TABLE [dbo].[SystemSettingTranslation]  WITH CHECK ADD  CONSTRAINT [FK_SystemSettingTranslation_SystemSetting] FOREIGN KEY([SettingId])
REFERENCES [dbo].[SystemSetting] ([Id])
GO
ALTER TABLE [dbo].[SystemSettingTranslation] CHECK CONSTRAINT [FK_SystemSettingTranslation_SystemSetting]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Department]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_UserProfile] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_UserProfile]
GO
ALTER TABLE [dbo].[UserProfileHolidays]  WITH CHECK ADD  CONSTRAINT [FK_UserProfileHolidays_UserProfile] FOREIGN KEY([UserProfileId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[UserProfileHolidays] CHECK CONSTRAINT [FK_UserProfileHolidays_UserProfile]
GO
ALTER TABLE [dbo].[UserProfileOffDays]  WITH CHECK ADD  CONSTRAINT [FK_UserProfileOffDays_UserProfile] FOREIGN KEY([UserProfileId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[UserProfileOffDays] CHECK CONSTRAINT [FK_UserProfileOffDays_UserProfile]
GO
ALTER TABLE [dbo].[UserProfileTranslation]  WITH CHECK ADD  CONSTRAINT [FK_UserProfileTranslation_UserProfile] FOREIGN KEY([UserProfileId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[UserProfileTranslation] CHECK CONSTRAINT [FK_UserProfileTranslation_UserProfile]
GO
USE [master]
GO
ALTER DATABASE [CrmSystem] SET  READ_WRITE 
GO
