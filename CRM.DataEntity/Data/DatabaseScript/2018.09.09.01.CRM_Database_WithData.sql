USE [master]
GO
/****** Object:  Database [CrmSystem]    Script Date: 9/9/2018 3:40:18 AM ******/
CREATE DATABASE [CrmSystem]
GO
USE [CrmSystem]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/9/2018 3:40:18 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[CommunicationLogs]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[ContactUs]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[DepartmentTranslation]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[DetailsLookup]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[DetailsLookupTranslation]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[MasterLookup]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[MasterLookupTranslation]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[MenuTranslation]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 9/9/2018 3:40:19 AM ******/
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
/****** Object:  Table [dbo].[Sla]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[SlaCaseCount]    Script Date: 9/9/2018 3:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlaCaseCount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SlaId] [int] NOT NULL,
	[SysCaseId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_SlaCaseCount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlaCategories]    Script Date: 9/9/2018 3:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlaCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SlaId] [int] NOT NULL,
 CONSTRAINT [PK_SlaCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlaIgnoredCaseStates]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[SlaTranslation]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[StateHistory]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[StateTransitionsConfiguration]    Script Date: 9/9/2018 3:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateTransitionsConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[StateFrom] [int] NOT NULL,
	[StateTo] [int] NOT NULL,
	[AssigneeId] [int] NULL,
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
/****** Object:  Table [dbo].[SysCaseComments]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[SystemCaseAttachments]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[SystemCases]    Script Date: 9/9/2018 3:40:20 AM ******/
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
	[AssigneeId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Address] [nvarchar](400) NULL,
	[Location] [nvarchar](500) NULL,
	[TypeId] [int] NULL,
	[FormId] [nvarchar](200) NULL,
	[FormName] [nvarchar](500) NULL,
 CONSTRAINT [PK_SystemCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemFile]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[SystemFileTranslation]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[SystemLog]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[SystemSetting]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[SystemSettingTranslation]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[UserProfile]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[UserProfileHolidays]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[UserProfileOffDays]    Script Date: 9/9/2018 3:40:20 AM ******/
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
/****** Object:  Table [dbo].[UserProfileTranslation]    Script Date: 9/9/2018 3:40:21 AM ******/
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
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (3, N'41e29dd1-3974-4ebb-a84c-8e7b201c92bb', N'1')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserRoles] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'136e89fc-6fde-4d6f-bbe5-c084fcbda54e', N'tets@test.com', 0, N'AHT8hMFkYATyMptYJp1M2g2Hm3dcwkwGiZ4JP3IwzOeWRwaGtMAVOBXS/NsDR6gzgg==', N'3cc2c8dc-9b48-4cf6-af6f-9054bb2b9a08', NULL, 0, 0, NULL, 1, 0, N'tets@test.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2d421058-3a7f-4627-b679-0a74825e4aa8', N'salam-from-salam@hotmail.com', 0, N'ABrdABhBgk+AwzMmJbOw4tCnb5MYjguNXHr6Dyw3i1kEEkSxPS6MS8thiJtZZSFiTw==', N'37b9399c-b7a8-43b7-8462-af10bc39fa59', NULL, 0, 0, NULL, 1, 0, N'salam-from-salam@hotmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'41e29dd1-3974-4ebb-a84c-8e7b201c92bb', N'salam-cs@hotmail.com11', 0, N'AOn58AEJRFp4xccnEadjNQ8DajAg14okdoMPenGVyXuC31584XIFtkxhDZyK1Ni5uA==', N'289b6e63-96fc-4a62-ad7b-4f52646f42b1', NULL, 0, 0, NULL, 1, 0, N'salam-cs@hotmail.com11')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7fdbabe8-4613-4083-8e27-fe38b63e4eea', N'xx.test@test.com', 0, N'AFupcOhmDvXPVj+4MfzEYqmSbzOCuwxAorOcI/kHTueloKicpUj8CZP+VTvqVJzudQ==', N'ebf14541-f7cc-431b-bfb5-2ee6372eea88', NULL, 0, 0, NULL, 1, 0, N'xx.test@test.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8b5cc3cc-d782-47b1-8e62-d605c3d49624', N'salam-cs@hotmail.com', 0, N'AOMmPFATIjfDE3YIS/tmcJnLamUkrTvPlAwK2t+V+h9hgQfGhp2JvtE+ggiXKqWBtw==', N'113c8ec3-d92d-4fec-9d16-17364a4aea2b', NULL, 0, 0, NULL, 1, 0, N'salam-cs@hotmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'adf083c4-a486-4eae-aacc-d03fe743acc2', N'test@test.xxx', 0, N'AKjgt9vYWuLjoaPeXKYYAO9/yQZ7LL3Qnkmr/hyiWIZj4zR7uH4PT8cc3zlsmVjcjA==', N'89593ecb-eb7e-437d-9026-3711a412a157', NULL, 0, 0, NULL, 1, 0, N'test@test.xxx')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b44c76ef-3951-446b-a0df-9c68501dc293', N'salam-test1@hotmail.com', 0, N'AFiOK5u7zpR5S5Ax+MgmEIfRvHC7YbPSOzh1YyJwfPR7ED4jFvP6Ek0ymktmfgEm0Q==', N'f981e11f-72ab-48d7-ab41-905e475505bd', NULL, 0, 0, NULL, 1, 0, N'salam-test1@hotmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b875d7d7-d99c-4ede-9efb-a9ffd2f78fd0', N'salam-cs111@hotmail.com11', 0, N'AEdM0twX92OOZezu4zzMED1Jtsi28u7nOITDA3Mttd+UUkGjCmNaks+6tWyxhEZy1Q==', N'9b149127-8ab5-4b30-a39a-7e0bb4f80da8', NULL, 0, 0, NULL, 1, 0, N'salam-cs111@hotmail.com11')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'db722938-a50a-4a17-a03b-895de8d9a0a5', N'salam-c12s@hotmail.com', 0, N'AOBCnFWTyQyCeCde238yAv4GE4V2QCH1QJFJQ7HwtjzT4CFa6NaFal96GsRsiLIZPQ==', N'08b34263-7d53-461d-ac12-cb27e566f774', NULL, 0, 0, NULL, 1, 0, N'salam-c12s@hotmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ebc0e2f2-cbf7-4d69-991a-3892a46e06a6', N'testfromcms@hotmail.com', 0, N'AEIxNPR0iDJoWyT0d135m1t0dO3kvdnlo8EQ6srP1AF0uu50sKPsFF5yD6xGkUJsrg==', N'dbbe520a-d9e1-457e-9c3e-c3ab0f6ca98b', NULL, 0, 0, NULL, 1, 0, N'testfromcms@hotmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f0d48ffe-56e2-4e65-aca1-eb31e965d799', N'salam-test2@hotmail.com', 0, N'AB1XCeFcCQhhhIsRUl4eQEUdZGekyV2Ye7UDFxt/c3+GYz/qW+5Y3FA3wN3EeqWN3A==', N'ce3fba8e-4e69-4870-98d3-6b61d87f604a', NULL, 0, 0, NULL, 1, 0, N'salam-test2@hotmail.com')
GO
SET IDENTITY_INSERT [dbo].[ContactUs] ON 
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Address], [Message], [InsertDate], [Mobile], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, N' 2test', N'salam-cs@hotmail.com', N'test', N'test', CAST(N'2018-08-24T19:18:33.980' AS DateTime), N'test', CAST(N'2018-08-24T19:18:33.980' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-09-03T16:23:04.727' AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Address], [Message], [InsertDate], [Mobile], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, N'test', N'salam-cs@hotmail.com', N'', N'test', CAST(N'2018-09-06T22:19:20.823' AS DateTime), N'7169631596', CAST(N'2018-09-06T22:19:20.823' AS DateTime), N'', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, CAST(N'2018-08-10T23:30:35.403' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
INSERT [dbo].[Department] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, CAST(N'2018-08-10T23:38:59.190' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Department] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, CAST(N'2018-08-23T19:13:33.240' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Department] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, CAST(N'2018-09-03T15:29:17.513' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[DepartmentTranslation] ON 
GO
INSERT [dbo].[DepartmentTranslation] ([Id], [DepartmentId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (1, 3, N'test', N'test', 1, 1)
GO
INSERT [dbo].[DepartmentTranslation] ([Id], [DepartmentId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (2, 4, N'دائرة 1', N'دائرة 1', 1, 1)
GO
INSERT [dbo].[DepartmentTranslation] ([Id], [DepartmentId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (3, 5, N'دائرة 2', N'دائرة 2', 1, 1)
GO
INSERT [dbo].[DepartmentTranslation] ([Id], [DepartmentId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (4, 6, N'دائرة 4', N'دائرة 4', 1, 1)
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
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (41, 14, CAST(N'2018-08-30T22:00:13.453' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (42, 14, CAST(N'2018-08-30T22:00:35.527' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (43, 14, CAST(N'2018-08-30T22:01:01.767' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (44, 14, CAST(N'2018-08-30T22:01:18.660' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (45, 14, CAST(N'2018-08-30T22:01:33.987' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (46, 14, CAST(N'2018-08-30T22:01:45.977' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (47, 14, CAST(N'2018-08-30T22:02:03.837' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (48, 14, CAST(N'2018-08-30T22:02:19.443' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
GO
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (49, 15, CAST(N'2018-09-03T22:51:52.053' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-09-03T22:52:00.573' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[DetailsLookup] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailsLookupTranslation] ON 
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (1, 1, N'ذكر', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (2, 2, N'انثى', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (3, 3, N'متزوج', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (4, 4, N'اعزب', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (9, 9, N'حيفا', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (10, 10, N'تل ابيب', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (11, 11, N'القدس', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (12, 12, N'حيفا', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (13, 13, N'تل ابيب', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (14, 14, N'القدس', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (15, 15, N'الفريديس', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (16, 16, N'test', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (17, 17, N'اللغة العربية', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (18, 18, N'اللغة العبرية', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (19, 19, N'اللغة الانجليزية', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (20, 20, N'السبت', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (21, 21, N'الاحد', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (22, 22, N'الاثنين', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (23, 23, N'الثلاثاء', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (24, 24, N'الاربعاء', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (25, 25, N'الخميس', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (26, 26, N'الجمعة', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (27, 27, N'تسريب مياه', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (28, 28, N'عالية', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (29, 29, N'متوسطة', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (30, 30, N'منخفضة', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (31, 31, N'عالية', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (32, 32, N'متوسطة', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (33, 33, N'منخفضة', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (34, 34, N'جديد', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (35, 35, N'قيد التنفيذ', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (36, 36, N'مرفوض', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (37, 37, N'مكرر', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (38, 38, N'محلول', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (39, 39, N'مغلق', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (40, 40, N'غير محدد', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (41, 41, N'اعمال تخريبيّة', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (42, 42, N'خلل في إنارة الشارع', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (43, 43, N'مصادر إزعاج وضجيج', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (44, 44, N'طلب لإخلاء التقليم', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (45, 45, N'آخر', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (46, 46, N'صيانة الملاجئ', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (47, 47, N'النظافة العامّة', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (48, 48, N'حفرة في الشارع / الرصيف', 1, 1)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (49, 27, N'דליפת מים', 2, 0)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (50, 49, N'test', 1, 1)
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
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (1, 1, N'الجنس', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (2, 2, N'الحالة الاجتماعية', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (3, 3, N'اللغة', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (6, 6, N'المحافظات', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (7, 7, N'المدن', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (8, 8, N'التجمعات', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (9, 9, N'test', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (10, 10, N'اللغات المفضلة', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (11, 11, N'ايام الاسبوع', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (12, 12, N'الشكاوي - الاهمية', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (13, 13, N'الشكاوي - الخطورة', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (14, 14, N'الشكاوي - الفئات', 1, 1)
GO
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (15, 15, N'الشكاوي - الحالات', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[MasterLookupTranslation] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([Id], [Icon], [ParentId], [PageId], [PageUrl], [SortOrder], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, NULL, NULL, NULL, N'http://localhost:61712/Menu/Index', 1, CAST(N'2018-08-11T00:08:39.917' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
INSERT [dbo].[Menu] ([Id], [Icon], [ParentId], [PageId], [PageUrl], [SortOrder], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, NULL, NULL, NULL, NULL, 1, CAST(N'2018-08-24T19:15:05.720' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuTranslation] ON 
GO
INSERT [dbo].[MenuTranslation] ([Id], [MenuId], [LanguageId], [IsDefault], [Title], [Description]) VALUES (1, 1, 1, 1, N'test', N'test')
GO
INSERT [dbo].[MenuTranslation] ([Id], [MenuId], [LanguageId], [IsDefault], [Title], [Description]) VALUES (2, 2, 1, 1, N'test', N'test')
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
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (17, N'', N'Menu', N'Create', N'Create', CAST(N'2018-08-23T21:57:05.897' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (18, N'', N'Menu', N'Edit', N'Edit', CAST(N'2018-08-23T21:57:14.137' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (19, N'', N'Menu', N'Delete', N'Delete', CAST(N'2018-08-23T21:57:22.213' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (20, N'', N'Menu', N'View', N'View', CAST(N'2018-08-23T21:57:29.597' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (21, N'', N'Settings', N'Create', N'Create', CAST(N'2018-08-23T21:58:03.500' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (22, N'', N'Settings', N'Edit', N'Edit', CAST(N'2018-08-23T21:58:12.190' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (23, N'', N'Settings', N'Delete', N'Delete', CAST(N'2018-08-23T21:58:19.717' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (24, N'', N'Settings', N'View', N'View', CAST(N'2018-08-23T21:58:34.550' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (25, N'', N'Roles', N'Create', N'Create', CAST(N'2018-08-23T21:59:13.750' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (26, N'', N'Roles', N'Edit', N'Edit', CAST(N'2018-08-23T21:59:24.120' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (27, N'', N'Roles', N'Delete', N'Delete', CAST(N'2018-08-23T21:59:31.270' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (28, N'', N'Roles', N'View', N'View', CAST(N'2018-08-23T21:59:39.717' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (29, N'', N'Cases', N'Comment', N'Comment', CAST(N'2018-08-24T12:21:33.357' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (30, N'', N'ContactUs', N'View', N'View', CAST(N'2018-08-24T12:29:06.307' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (31, N'', N'ContactUs', N'Delete', N'Delete', CAST(N'2018-08-24T12:29:20.420' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (32, N'', N'ContactUs', N'Edit', N'Edit', CAST(N'2018-08-24T12:29:36.690' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (33, N'', N'Reports', N'View', N'View', CAST(N'2018-09-01T23:20:34.680' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (34, N'', N'Reports', N'ExportToExcel', N'Export To Excel', CAST(N'2018-09-01T23:21:08.063' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (35, N'', N'test', N'test', N'test', CAST(N'2018-09-04T00:36:44.947' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[RolePermissions] ON 
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (913, N'1', 12)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (914, N'1', 13)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (915, N'1', 14)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (916, N'1', 15)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (917, N'1', 16)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (918, N'1', 29)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (919, N'1', 30)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (920, N'1', 31)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (921, N'1', 32)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (922, N'1', 17)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (923, N'1', 18)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (924, N'1', 19)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (925, N'1', 20)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (926, N'1', 33)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (927, N'1', 25)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (928, N'1', 26)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (929, N'1', 27)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (930, N'1', 28)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (931, N'1', 21)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (932, N'1', 22)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (933, N'1', 23)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (934, N'1', 24)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (935, N'1', 8)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (936, N'1', 9)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (937, N'1', 10)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (938, N'1', 11)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (939, N'1', 2)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (940, N'1', 3)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (941, N'1', 4)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (942, N'1', 5)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (943, N'1', 34)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (944, N'2', 30)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (945, N'2', 32)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (946, N'2', 31)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (947, N'2', 13)
GO
SET IDENTITY_INSERT [dbo].[RolePermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Sla] ON 
GO
INSERT [dbo].[Sla] ([Id], [WorkingDaysIncludingHolidays], [HoursPerState], [NotifyBefore], [NotificationCount], [PropogateToManager], [CcAssignee], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, 1, 12, 6, NULL, 1, 1, CAST(N'2018-08-22T23:03:20.557' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
INSERT [dbo].[Sla] ([Id], [WorkingDaysIncludingHolidays], [HoursPerState], [NotifyBefore], [NotificationCount], [PropogateToManager], [CcAssignee], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, 1, 36, 40, NULL, 1, 1, CAST(N'2018-08-24T11:23:08.650' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[Sla] ([Id], [WorkingDaysIncludingHolidays], [HoursPerState], [NotifyBefore], [NotificationCount], [PropogateToManager], [CcAssignee], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, 1, 20, 20, 6, 0, 1, CAST(N'2018-08-24T12:44:49.793' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
INSERT [dbo].[Sla] ([Id], [WorkingDaysIncludingHolidays], [HoursPerState], [NotifyBefore], [NotificationCount], [PropogateToManager], [CcAssignee], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, 0, 20, 20, 5, 0, 1, CAST(N'2018-08-24T12:47:06.113' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
INSERT [dbo].[Sla] ([Id], [WorkingDaysIncludingHolidays], [HoursPerState], [NotifyBefore], [NotificationCount], [PropogateToManager], [CcAssignee], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, 1, 30, 2, 10, 1, 1, CAST(N'2018-09-03T23:55:55.557' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sla] OFF
GO
SET IDENTITY_INSERT [dbo].[SlaCaseCount] ON 
GO
INSERT [dbo].[SlaCaseCount] ([Id], [SlaId], [SysCaseId], [CreatedOn], [CreatedBy], [Count]) VALUES (1, 1, 1, CAST(N'2018-09-05T00:00:00.000' AS DateTime), N'admin', 1)
GO
SET IDENTITY_INSERT [dbo].[SlaCaseCount] OFF
GO
SET IDENTITY_INSERT [dbo].[SlaIgnoredCaseStates] ON 
GO
INSERT [dbo].[SlaIgnoredCaseStates] ([Id], [SlaId], [IgnoredCaseStateId]) VALUES (3, 1, 34)
GO
INSERT [dbo].[SlaIgnoredCaseStates] ([Id], [SlaId], [IgnoredCaseStateId]) VALUES (4, 1, 39)
GO
INSERT [dbo].[SlaIgnoredCaseStates] ([Id], [SlaId], [IgnoredCaseStateId]) VALUES (13, 2, 34)
GO
INSERT [dbo].[SlaIgnoredCaseStates] ([Id], [SlaId], [IgnoredCaseStateId]) VALUES (14, 2, 38)
GO
INSERT [dbo].[SlaIgnoredCaseStates] ([Id], [SlaId], [IgnoredCaseStateId]) VALUES (15, 2, 39)
GO
INSERT [dbo].[SlaIgnoredCaseStates] ([Id], [SlaId], [IgnoredCaseStateId]) VALUES (16, 2, 40)
GO
SET IDENTITY_INSERT [dbo].[SlaIgnoredCaseStates] OFF
GO
SET IDENTITY_INSERT [dbo].[SlaTranslation] ON 
GO
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (1, 1, N'test', N'test', 1, 1)
GO
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (2, 1, N'test', N'test', 0, 0)
GO
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (3, 2, N'Sla test', N'Sla test', 1, 1)
GO
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (4, 2, N'Sla test', N'Sla test', 0, 0)
GO
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (5, 3, N'test', N'test', 1, 1)
GO
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (6, 4, N'test', N'test', 1, 1)
GO
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (7, 5, N'test', N'test', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[SlaTranslation] OFF
GO
SET IDENTITY_INSERT [dbo].[StateHistory] ON 
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, 8, 40, 34, CAST(N'2018-08-24T00:01:20.133' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, 8, 34, 35, CAST(N'2018-08-24T00:11:30.487' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, 8, 35, 36, CAST(N'2018-08-24T16:58:58.350' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, 2, 40, 34, CAST(N'2018-08-24T19:02:13.347' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, 8, 36, 35, CAST(N'2018-08-24T21:28:54.270' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, 8, 35, 36, CAST(N'2018-08-24T22:14:26.393' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (7, 8, 36, 35, CAST(N'2018-08-24T22:16:04.087' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (9, 9, 40, 34, CAST(N'2018-08-25T12:49:34.510' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (10, 9, 34, 35, CAST(N'2018-08-26T19:41:40.050' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (11, 5, 40, 38, CAST(N'2018-09-01T00:12:43.820' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (13, 18, 40, 35, CAST(N'2018-09-03T00:34:52.217' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (14, 17, 40, 35, CAST(N'2018-09-05T00:36:05.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (15, 25, 40, 34, CAST(N'2018-09-08T20:12:08.443' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (16, 26, 40, 34, CAST(N'2018-09-08T20:55:27.960' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (17, 27, 40, 34, CAST(N'2018-09-09T00:33:50.413' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (18, 28, 40, 34, CAST(N'2018-09-09T00:37:35.210' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (19, 29, 40, 34, CAST(N'2018-09-09T03:00:29.067' AS DateTime), N'', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[StateHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[StateTransitionsConfiguration] ON 
GO
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, 27, 40, 34, 2, CAST(N'2018-08-23T15:01:42.710' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, 41, 34, 35, 2, CAST(N'2018-09-04T00:16:06.857' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-09-04T00:16:20.643' AS DateTime))
GO
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, 27, 34, 34, 2, CAST(N'2018-09-04T00:17:42.120' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-09-04T00:18:36.493' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[StateTransitionsConfiguration] OFF
GO
SET IDENTITY_INSERT [dbo].[SysCaseComments] ON 
GO
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, N'براء مش شاطر لانه ما قلي', 8, CAST(N'2018-08-23T23:27:21.037' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, N'test test tet sssssssssssss aaaaaaaaaaaaaa ttttttttt dddddddddddd dddddddddd', 9, CAST(N'2018-08-26T19:47:44.923' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, N'32145 sfddhj ruiuuuuuuuu kkkkkkkkkk llllllllllllll', 9, CAST(N'2018-08-26T19:47:58.593' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (7, N'test tests etestests stset stsets tset', 18, CAST(N'2018-09-06T22:36:09.847' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[SysCaseComments] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemCaseAttachments] ON 
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (1, 3, 2)
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
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (12, 20, 1)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (13, 21, 1)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (14, 22, 1)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (15, 23, 1)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (16, 24, 9)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (17, 25, 10)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (18, 26, 10)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (19, 27, 16)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (20, 28, 16)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (21, 29, 17)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (22, 30, 17)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (23, 31, 17)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (24, 32, 17)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (25, 33, 17)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (26, 34, 17)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (27, 35, 17)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (28, 36, 17)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (29, 37, 18)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (30, 38, 18)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (31, 39, 20)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (32, 40, 21)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (33, 41, 22)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (34, 42, 23)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (35, 43, 24)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (36, 44, 25)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (37, 45, 26)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (38, 46, 27)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (39, 47, 28)
GO
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (40, 48, 29)
GO
SET IDENTITY_INSERT [dbo].[SystemCaseAttachments] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemCases] ON 
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (1, N'da9aab39-e6ca-4217-9d44-b33a683362e9', 27, 28, 32, N'test 4', N'test 4', NULL, N'test 55', CAST(N'2018-08-18T15:48:15.467' AS DateTime), N'salam-cs@hotmail.com', 2, NULL, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (2, N'5f589507-3c63-4018-ac8d-ae614ed05b71', 27, 28, 32, N'test', N'test', NULL, N'test', CAST(N'2018-08-18T20:36:09.327' AS DateTime), N'salam-cs@hotmail.com', 2, NULL, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (3, N'eba8be49-4e9c-42cb-bb36-450fd6e5eda5', 27, 29, 32, N'test test', N'test', NULL, N'test test', CAST(N'2018-08-18T21:56:11.927' AS DateTime), N'salam-cs@hotmail.com', 2, NULL, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (4, N'c6bee608-545c-4237-9a50-70f5c1247b52', 27, 28, 32, N'test 1', N'test 1', NULL, N'test', CAST(N'2018-08-21T22:14:55.407' AS DateTime), N'salam-cs@hotmail.com', 2, NULL, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (5, N'94da0ac5-6b00-40e8-a107-3dd40be06921', 27, 28, 32, N'test 2', N'test 2', 2, N'test 2', CAST(N'2018-08-21T22:24:03.510' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'test', N'test', 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (6, N'df771004-c22d-4c48-b4fb-cfa12afd0d98', 27, 28, 32, N'test 2', N'test 2', 2, N'test 2', CAST(N'2018-08-21T22:39:43.010' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'test', N'test', 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (7, N'ae794b82-0de5-48e9-a640-a52f1d70a941', 27, 28, 32, N'test 2', N'test 2', 2, N'test 2', CAST(N'2018-08-21T22:43:41.370' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'test', N'tett', 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (8, N'b5bafff7-1ae5-4c7e-bb2f-0a0e4d5cc997', 41, 28, 32, N'test 4', N'test 4', 2, N'test 4', CAST(N'2018-08-21T22:52:12.487' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'test', N'test', 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (9, N'afd123cd-1ebd-4dcc-9ff5-661ec36cacb3', 27, 28, 31, N'test 312', N'test 312', 1005, N'test 312', CAST(N'2018-08-25T12:49:03.537' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'test 312', N'test 312', 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (10, N'099ea1a0-d858-427b-8fa3-8c499db9ace4', 27, 28, 32, N'test 4', N'test 4', NULL, N'test 4', CAST(N'2018-08-31T19:41:28.660' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (16, N'3e3ab9f7-ff4b-4220-82c7-e34c384fcbae', 27, 28, 32, N'test 4', N'test 4', 2, N'test 4 from api', CAST(N'2018-09-02T00:22:09.117' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (17, N'3fac3d78-27e6-4762-9563-d95ad600e3cd', 27, 28, 32, N'test 4', N'test 4', 2, N'test 5 from api', CAST(N'2018-09-02T00:31:02.477' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'test 4', N'test 4', 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (18, N'f7db86db-c6ad-403a-adc5-7ba5d2b0c890', 41, 28, 32, N'test 11', N'test 11', 1003, N'test 11', CAST(N'2018-09-03T00:20:41.097' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'test 11', N'test 11', 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (19, N'b85207cc-84f1-4412-80d0-1c69cbd15f66', NULL, NULL, NULL, N'test 4', N'', NULL, N'test 4', CAST(N'2018-09-08T02:43:11.863' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'test', N'tets', 1, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (20, N'c92e6bb1-f649-430f-af3c-01186faacad0', NULL, NULL, NULL, N'test 4', N'', NULL, N'test 4', CAST(N'2018-09-08T02:54:15.167' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'test', N'tets', 2, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (21, N'd6e09462-cf23-4f98-b94b-48b61154b9ca', 27, NULL, NULL, N'test', NULL, NULL, N'test', CAST(N'2018-09-08T03:29:39.630' AS DateTime), N'xx.test@test.com', 1, NULL, N'test', N'test', 2, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (22, N'534dadbf-4990-42ea-a038-b565b0282c1f', 27, NULL, NULL, N'test', NULL, NULL, N'test', CAST(N'2018-09-08T13:10:58.487' AS DateTime), N'salam-from-salam@hotmail.com', 1, NULL, N'test', N'tst', 3, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (23, N'f7fb7ec4-80cb-42e0-9adc-89a9f64606d5', 0, NULL, NULL, N'test', NULL, NULL, N'test', CAST(N'2018-09-08T13:11:50.170' AS DateTime), N'salam-from-salam@hotmail.com', 1, NULL, N'7 Cobham Drive, 7 Cobham Drive', N'', 3, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (24, N'23279cff-f562-4e76-b3fd-38dd1075466d', 0, NULL, NULL, N'Salam', NULL, NULL, N'test', CAST(N'2018-09-08T13:13:37.137' AS DateTime), N'salam-from-salam@hotmail.com', 1, NULL, N'7 Cobham Drive, 7 Cobham Drive', N'', 4, NULL, NULL)
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (25, N'fbf74c92-92ba-4fdc-83d0-ebd961e2f9d7', 1014, NULL, NULL, N'اعتراض على احتساب ضريبة الأرنونا', NULL, NULL, N'<p>اعتراض على احتساب ضريبة الأرنونا<br></p>', CAST(N'2018-09-08T20:12:08.400' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'', N'', 4, N'1068', N'اعتراض على احتساب ضريبة الأرنونا')
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (26, N'bb83b75d-c34f-409d-adf3-811d752aef2f', 1014, NULL, NULL, N'اعتراض على احتساب ضريبة الأرنونا', NULL, NULL, N'<p>اعتراض على احتساب ضريبة الأرنونا<br></p>', CAST(N'2018-09-08T20:55:27.907' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'', N'', 5, N'1068', N'اعتراض على احتساب ضريبة الأرنونا')
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (27, N'f004c10b-611c-4b5d-823d-63357b8a5465', 27, 28, 31, N'test from cms', N'test', 2, N'test from cms', CAST(N'2018-09-09T00:33:50.363' AS DateTime), N'testfromcms@hotmail.com', 1, NULL, N'test from cms', N'test from cms', 1, N'', N'')
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (28, N'bc3bc264-508c-4f85-a8f8-64a14ffee1c5', 0, NULL, NULL, N'test', NULL, NULL, N'test from cms', CAST(N'2018-09-09T00:37:35.193' AS DateTime), N'testfromcms@hotmail.com', 1, NULL, N'7 Cobham Drive, 7 Cobham Drive', N'', 2, N'', N'')
GO
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [PriorityId], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (29, N'615d1021-68e7-4d32-a09e-1138e582adad', 1014, NULL, NULL, N'نموذج طلب للجنة التخفيضات للحصول على تخفيض في الأرنونا لـ"مصلحة تجارية" للسنة المالية 2018', NULL, NULL, N'<h4 class="bold text-center" style="text-align: right; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; font-size: 18px; color: rgb(51, 51, 51);">نموذج طلب للجنة التخفيضات للحصول على تخفيض في الأرنونا لـ"مصلحة تجارية" للسنة المالية 2018</h4>', CAST(N'2018-09-09T03:00:18.993' AS DateTime), N'testfromcms@hotmail.com', 1, NULL, NULL, NULL, 5, N'1097', N'نموذج طلب للجنة التخفيضات للحصول على تخفيض في الأرنونا لـ"مصلحة تجارية" للسنة المالية 2018')
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
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (20, 2, N'http://localhost:61712//Document/2/20.jpg', CAST(N'2018-08-24T16:16:13.010' AS DateTime), N'', CAST(N'2018-08-24T16:16:13.010' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (21, 2, N'http://localhost:61712//Document/2/21.jpg', CAST(N'2018-08-24T16:16:13.067' AS DateTime), N'', CAST(N'2018-08-24T16:16:13.067' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (22, 2, N'http://localhost:61712//Document/2/22.jpg', CAST(N'2018-08-24T16:16:41.750' AS DateTime), N'', CAST(N'2018-08-24T16:16:41.750' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (23, 2, N'http://localhost:61712//Document/2/23.jpg', CAST(N'2018-08-24T16:16:41.780' AS DateTime), N'', CAST(N'2018-08-24T16:16:41.780' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (24, 2, N'http://localhost:61712//Document/2/24.jpg', CAST(N'2018-08-25T12:49:01.620' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-08-25T12:49:01.620' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (25, 2, N'http://localhost:61712//Document/2/25.png', CAST(N'2018-08-31T19:41:28.713' AS DateTime), N'', CAST(N'2018-08-31T19:41:28.713' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (26, 2, N'http://localhost:61712//Document/2/26.jpg', CAST(N'2018-08-31T19:41:28.847' AS DateTime), N'', CAST(N'2018-08-31T19:41:28.847' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (27, 2, N'http://localhost:61712//Document/2/27.png', CAST(N'2018-09-02T00:22:09.130' AS DateTime), N'', CAST(N'2018-09-02T00:22:09.130' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (28, 2, N'http://localhost:61712//Document/2/28.jpg', CAST(N'2018-09-02T00:22:09.203' AS DateTime), N'', CAST(N'2018-09-02T00:22:09.203' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (29, 2, N'http://localhost:61712//Document/2/29.png', CAST(N'2018-09-02T00:31:02.530' AS DateTime), N'', CAST(N'2018-09-02T00:31:02.533' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (30, 2, N'http://localhost:61712//Document/2/30.jpg', CAST(N'2018-09-02T00:31:02.693' AS DateTime), N'', CAST(N'2018-09-02T00:31:02.693' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (31, 2, N'http://localhost:61712//Document/2/31.png', CAST(N'2018-09-02T00:31:31.493' AS DateTime), N'', CAST(N'2018-09-02T00:31:31.493' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (32, 2, N'http://localhost:61712//Document/2/32.jpg', CAST(N'2018-09-02T00:31:31.510' AS DateTime), N'', CAST(N'2018-09-02T00:31:31.510' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (33, 2, N'http://localhost:61712//Document/2/33.png', CAST(N'2018-09-02T00:39:39.853' AS DateTime), N'', CAST(N'2018-09-02T00:39:39.853' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (34, 2, N'http://localhost:61712//Document/2/34.jpg', CAST(N'2018-09-02T00:39:40.080' AS DateTime), N'', CAST(N'2018-09-02T00:39:40.080' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (35, 2, N'http://localhost:61712//Document/2/35.png', CAST(N'2018-09-02T00:40:34.713' AS DateTime), N'', CAST(N'2018-09-02T00:40:34.713' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (36, 2, N'http://localhost:61712//Document/2/36.jpg', CAST(N'2018-09-02T00:40:34.740' AS DateTime), N'', CAST(N'2018-09-02T00:40:34.740' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (37, 2, N'http://localhost:61712//Document/2/37.jpg', CAST(N'2018-09-03T00:20:36.787' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-09-03T00:20:36.787' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (38, 2, N'http://localhost:61712//Document/2/38.jpg', CAST(N'2018-09-03T00:23:09.957' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-09-03T00:23:09.957' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (39, 2, N'http://185.70.250.58:127/Document/9/1402.jpg', CAST(N'2018-09-08T02:54:15.173' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-09-08T02:54:15.173' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (40, 2, N'http://185.70.250.58:127/Document/9/1405.jpg', CAST(N'2018-09-08T03:29:39.680' AS DateTime), N'xx.test@test.com', CAST(N'2018-09-08T03:29:39.683' AS DateTime), N'xx.test@test.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (41, 2, N'http://185.70.250.58:127/Document/9/1406.jpg', CAST(N'2018-09-08T13:10:58.517' AS DateTime), N'salam-from-salam@hotmail.com', CAST(N'2018-09-08T13:10:58.517' AS DateTime), N'salam-from-salam@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (42, 2, N'', CAST(N'2018-09-08T13:11:50.177' AS DateTime), N'salam-from-salam@hotmail.com', CAST(N'2018-09-08T13:11:50.177' AS DateTime), N'salam-from-salam@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (43, 2, N'', CAST(N'2018-09-08T13:13:50.723' AS DateTime), N'salam-from-salam@hotmail.com', CAST(N'2018-09-08T13:13:50.780' AS DateTime), N'salam-from-salam@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (44, 2, N'http://localhost:49410/Document/pdf/1.pdf', CAST(N'2018-09-08T20:12:08.427' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-09-08T20:12:08.427' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (45, 2, N'http://185.70.250.58:127/Document/pdf/1.pdf', CAST(N'2018-09-08T20:55:27.937' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-09-08T20:55:27.937' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (46, 2, N'http://185.70.250.58:127/Document/9/1407.jpg', CAST(N'2018-09-09T00:33:50.383' AS DateTime), N'testfromcms@hotmail.com', CAST(N'2018-09-09T00:33:50.383' AS DateTime), N'testfromcms@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (47, 2, N'', CAST(N'2018-09-09T00:37:35.200' AS DateTime), N'testfromcms@hotmail.com', CAST(N'2018-09-09T00:37:35.200' AS DateTime), N'testfromcms@hotmail.com', 1, NULL)
GO
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (48, 2, N'http://185.70.250.58:127/Document/pdf/84.pdf', CAST(N'2018-09-09T03:00:29.033' AS DateTime), N'testfromcms@hotmail.com', CAST(N'2018-09-09T03:00:29.033' AS DateTime), N'testfromcms@hotmail.com', 1, NULL)
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
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (20, 20, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (21, 21, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (22, 22, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (23, 23, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (24, 24, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (25, 25, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (26, 26, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (27, 27, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (28, 28, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (29, 29, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (30, 30, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (31, 31, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (32, 32, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (33, 33, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (34, 34, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (35, 35, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (36, 36, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (37, 37, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (38, 38, 1, 1, N'', N'', NULL)
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (39, 39, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (40, 40, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (41, 41, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (42, 42, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (43, 43, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (44, 44, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (45, 45, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (46, 46, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (47, 47, 1, 1, N'', N'', N'')
GO
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (48, 48, 1, 1, N'', N'', N'')
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
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (13, N'Object reference not set to an instance of an object.', N'Error While editing Sla (Post)', N'InnerException: , StackTrace:    at CRM.Web.Controllers.SlaController.EditSla(SlaViewModel sla) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\SlaController.cs:line 257', CAST(N'2018-08-24T20:51:52.280' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (14, N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required. Learn more at', N'Error while Changing State 36 for case id 8', N'InnerException: , StackTrace:    at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at System.Dynamic.UpdateDelegates.UpdateAndExecuteVoid2[T0,T1](CallSite site, T0 arg0, T1 arg1)
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 61
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 218
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 141
   at CRM.Workflow.Complaint.Reject() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 90
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 413', CAST(N'2018-08-24T21:41:10.930' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (15, N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required. Learn more at', N'Error while Changing State 36 for case id 8', N'InnerException: , StackTrace:    at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at System.Dynamic.UpdateDelegates.UpdateAndExecuteVoid2[T0,T1](CallSite site, T0 arg0, T1 arg1)
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 63
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 225
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 141
   at CRM.Workflow.Complaint.Reject() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 90
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 413', CAST(N'2018-08-24T21:48:05.157' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (16, N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required. Learn more at', N'Error while Changing State 36 for case id 8', N'InnerException: , StackTrace:    at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at System.Dynamic.UpdateDelegates.UpdateAndExecuteVoid2[T0,T1](CallSite site, T0 arg0, T1 arg1)
   at CRM.Core.Helpers.EmailHelper.SendSmtpEmail(String messageId, Object mailMessage) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 93
   at System.Dynamic.UpdateDelegates.UpdateAndExecuteVoid3[T0,T1,T2](CallSite site, T0 arg0, T1 arg1, T2 arg2)
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 52
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 208
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 141
   at CRM.Workflow.Complaint.Reject() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 90
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 413', CAST(N'2018-08-24T21:52:24.873' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (17, N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required. Learn more at', N'Error while Changing State 36 for case id 8', N'InnerException: , StackTrace:    at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at CRM.Core.Helpers.EmailHelper.SendSmtpEmail(String messageId, Object mailMessage) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 93
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 52
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 208
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 141
   at CRM.Workflow.Complaint.Reject() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 90
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 413', CAST(N'2018-08-24T21:56:01.510' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (18, N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Must issue a STARTTLS command first. e25-v6sm3757097edd.35 - gsmtp', N'Error while Changing State 36 for case id 8', N'InnerException: , StackTrace:    at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at CRM.Core.Helpers.EmailHelper.SendSmtpEmail(String messageId, Object mailMessage) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 93
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 52
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 208
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 141
   at CRM.Workflow.Complaint.Reject() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 90
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 413', CAST(N'2018-08-24T22:00:42.827' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (19, N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required. Learn more at', N'Error while Changing State 36 for case id 8', N'InnerException: , StackTrace:    at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at CRM.Core.Helpers.EmailHelper.SendSmtpEmail(String messageId, Object mailMessage) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 93
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 52
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 208
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 141
   at CRM.Workflow.Complaint.Reject() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 90
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 413', CAST(N'2018-08-24T22:08:20.897' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (20, N'An error occurred while updating the entries. See the inner exception for details.', N'Error While adding new case', N'InnerException: System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The INSERT statement conflicted with the FOREIGN KEY constraint "FK_StateHistory_SystemCases". The conflict occurred in database "CrmSystem", table "dbo.SystemCases", column ''Id''.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges(), StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.ManageCasesController.AddCase(CaseViewModel sysCase) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 198', CAST(N'2018-08-25T12:49:03.590' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (21, N'One or more errors occurred.', N'Error while register', N'InnerException: System.ArgumentNullException: Value cannot be null.
Parameter name: password
   at Microsoft.AspNet.Identity.UserManager`2.<CreateAsync>d__d.MoveNext(), StackTrace:    at System.Threading.Tasks.Task`1.GetResultCore(Boolean waitCompletionNotification)
   at CRM.Web.Controllers.APIs.AccountController.Register(ProfileViewModel registerModel) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\AccountController.cs:line 243', CAST(N'2018-08-25T18:20:58.207' AS DateTime), N'System', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (22, N'One or more errors occurred.', N'Error while register', N'InnerException: System.ArgumentNullException: Value cannot be null.
Parameter name: password
   at Microsoft.AspNet.Identity.UserManager`2.<CreateAsync>d__d.MoveNext(), StackTrace:    at System.Threading.Tasks.Task`1.GetResultCore(Boolean waitCompletionNotification)
   at CRM.Web.Controllers.APIs.AccountController.Register(ProfileViewModel registerModel) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\AccountController.cs:line 243', CAST(N'2018-08-25T18:22:06.713' AS DateTime), N'System', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (23, N'An error occurred while updating the entries. See the inner exception for details.', N'Error while uploading complaint', N'InnerException: System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The INSERT statement conflicted with the FOREIGN KEY constraint "FK_SystemCases_UserProfile". The conflict occurred in database "CrmSystem", table "dbo.UserProfile", column ''Id''.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges(), StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaint() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 58', CAST(N'2018-09-02T00:07:17.297' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (24, N'An error occurred while updating the entries. See the inner exception for details.', N'Error while uploading complaint', N'InnerException: System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The INSERT statement conflicted with the FOREIGN KEY constraint "FK_SystemCases_UserProfile". The conflict occurred in database "CrmSystem", table "dbo.UserProfile", column ''Id''.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges(), StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaint() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 58', CAST(N'2018-09-02T00:08:41.983' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (25, N'An error occurred while updating the entries. See the inner exception for details.', N'Error while uploading complaint', N'InnerException: System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The INSERT statement conflicted with the FOREIGN KEY constraint "FK_SystemCases_UserProfile". The conflict occurred in database "CrmSystem", table "dbo.UserProfile", column ''Id''.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges(), StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaint() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 58', CAST(N'2018-09-02T00:12:26.100' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (26, N'An error occurred while updating the entries. See the inner exception for details.', N'Error while uploading complaint', N'InnerException: System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The INSERT statement conflicted with the FOREIGN KEY constraint "FK_SystemCases_UserProfile". The conflict occurred in database "CrmSystem", table "dbo.UserProfile", column ''Id''.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges(), StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaint() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 58', CAST(N'2018-09-02T00:18:12.143' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (27, N'An error occurred while updating the entries. See the inner exception for details.', N'Error while uploading complaint', N'InnerException: System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The INSERT statement conflicted with the FOREIGN KEY constraint "FK_SystemCases_UserProfile". The conflict occurred in database "CrmSystem", table "dbo.UserProfile", column ''Id''.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges(), StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaint() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 58', CAST(N'2018-09-02T00:21:58.383' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (28, N'An error occurred while updating the entries. See the inner exception for details.', N'Error While adding new case', N'InnerException: System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: The INSERT statement conflicted with the FOREIGN KEY constraint "FK_StateHistory_SystemCases". The conflict occurred in database "CrmSystem", table "dbo.SystemCases", column ''Id''.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- End of inner exception stack trace ---
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges(), StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.ManageCasesController.AddCase(CaseViewModel sysCase) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 204', CAST(N'2018-09-03T00:20:41.380' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (29, N'Value cannot be null.
Parameter name: addresses', N'Error while Changing State 35 for case id 18', N'InnerException: , StackTrace:    at System.Net.Mail.MailAddressCollection.Add(String addresses)
   at System.Dynamic.UpdateDelegates.UpdateAndExecuteVoid2[T0,T1](CallSite site, T0 arg0, T1 arg1)
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 43
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 208
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 144
   at CRM.Workflow.Complaint.InProgress() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 114
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 446', CAST(N'2018-09-03T00:25:22.643' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (30, N'Value cannot be null.
Parameter name: addresses', N'Error while Changing State 35 for case id 18', N'InnerException: , StackTrace:    at System.Net.Mail.MailAddressCollection.Add(String addresses)
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 43
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 208
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 144
   at CRM.Workflow.Complaint.InProgress() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 114
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 446', CAST(N'2018-09-03T00:26:53.577' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (31, N'Value cannot be null.
Parameter name: addresses', N'Error while Changing State 35 for case id 18', N'InnerException: , StackTrace:    at System.Net.Mail.MailAddressCollection.Add(String addresses)
   at System.Dynamic.UpdateDelegates.UpdateAndExecuteVoid2[T0,T1](CallSite site, T0 arg0, T1 arg1)
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 43
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 208
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 144
   at CRM.Workflow.Complaint.InProgress() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 114
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 446', CAST(N'2018-09-03T00:28:42.937' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (32, N'Value cannot be null.
Parameter name: addresses', N'Error while Changing State 36 for case id 18', N'InnerException: , StackTrace:    at System.Net.Mail.MailAddressCollection.Add(String addresses)
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 43
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 208
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 144
   at CRM.Workflow.Complaint.Reject() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 93
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 437', CAST(N'2018-09-03T00:31:16.697' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (33, N'Value cannot be null.
Parameter name: addresses', N'Error while Changing State 35 for case id 18', N'InnerException: , StackTrace:    at System.Net.Mail.MailAddressCollection.Add(String addresses)
   at CRM.Core.Helpers.EmailHelper.SendMail(String messageId, List`1 toAddress, String subject, String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 43
   at CRM.Core.Helpers.EmailHelper.SendCaseEmail(String message, String title, String email, String username, List`1 emailsList) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Core\Helpers\EmailHelper.cs:line 208
   at CRM.Workflow.Complaint.SendEmailToAssignee(String message) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 144
   at CRM.Workflow.Complaint.InProgress() in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Workflow\Complaint.cs:line 114
   at CRM.Web.Controllers.ManageCasesController.ChangeState(Int32 caseId, Int32 stateId, Int32 prevState) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageCasesController.cs:line 446', CAST(N'2018-09-03T00:33:33.550' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (34, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While Updating profile', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.ManageController.Index(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageController.cs:line 157', CAST(N'2018-09-06T22:57:30.553' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (35, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While Updating profile', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.ManageController.Index(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageController.cs:line 157', CAST(N'2018-09-06T22:57:35.053' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (36, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While Updating profile', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.ManageController.Index(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageController.cs:line 159', CAST(N'2018-09-06T23:02:46.993' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (37, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While Updating profile', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.ManageController.Index(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageController.cs:line 159', CAST(N'2018-09-06T23:04:18.527' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (38, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While Updating profile', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.ManageController.Index(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageController.cs:line 159', CAST(N'2018-09-06T23:04:54.560' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (39, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While Updating profile', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at CRM.Web.Controllers.ManageController.Index(ProfileViewModel profile) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\ManageController.cs:line 160', CAST(N'2018-09-06T23:07:25.107' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (40, N'Object reference not set to an instance of an object.', N'Error while register', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.AccountController.Register(ProfileViewModel registerModel) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\AccountController.cs:line 297', CAST(N'2018-09-07T13:25:46.760' AS DateTime), N'System', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (41, N'Object reference not set to an instance of an object.', N'Error while register', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.AccountController.Register(ProfileViewModel registerModel) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\AccountController.cs:line 297', CAST(N'2018-09-07T13:28:56.073' AS DateTime), N'System', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (42, N'Object reference not set to an instance of an object.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(CaseViewModel complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 163', CAST(N'2018-09-08T01:33:23.443' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (43, N'Object reference not set to an instance of an object.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(CaseViewModel complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 163', CAST(N'2018-09-08T01:34:06.700' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (44, N'Object reference not set to an instance of an object.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(CaseViewModel complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 164', CAST(N'2018-09-08T02:19:22.310' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (45, N'Object reference not set to an instance of an object.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(CaseViewModel complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 164', CAST(N'2018-09-08T02:26:47.983' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (46, N'Object reference not set to an instance of an object.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(CaseViewModel complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 164', CAST(N'2018-09-08T02:28:23.157' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (47, N'Object reference not set to an instance of an object.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(CaseViewModel complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 164', CAST(N'2018-09-08T02:31:09.733' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (48, N'Object reference not set to an instance of an object.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(CaseViewModel complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 164', CAST(N'2018-09-08T02:39:15.253' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (49, N'Object reference not set to an instance of an object.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(CaseViewModel complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 164', CAST(N'2018-09-08T02:57:06.497' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (50, N'Non-static method requires a target.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at System.Reflection.RuntimeMethodInfo.CheckConsistency(Object target)
   at System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimePropertyInfo.GetValue(Object obj, Object[] index)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryGetFieldOrPropertyValue(MemberExpression me, Object instance, Object& memberValue)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryEvaluatePath(Expression expression, ConstantExpression& constantExpression)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.EvaluateParameter(Object[] arguments)
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 197', CAST(N'2018-09-08T20:02:13.127' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (51, N'Non-static method requires a target.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at System.Reflection.RuntimeMethodInfo.CheckConsistency(Object target)
   at System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimePropertyInfo.GetValue(Object obj, Object[] index)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryGetFieldOrPropertyValue(MemberExpression me, Object instance, Object& memberValue)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryEvaluatePath(Expression expression, ConstantExpression& constantExpression)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.EvaluateParameter(Object[] arguments)
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 197', CAST(N'2018-09-09T01:42:18.060' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (52, N'Non-static method requires a target.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at System.Reflection.RuntimeMethodInfo.CheckConsistency(Object target)
   at System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimePropertyInfo.GetValue(Object obj, Object[] index)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryGetFieldOrPropertyValue(MemberExpression me, Object instance, Object& memberValue)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryEvaluatePath(Expression expression, ConstantExpression& constantExpression)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.EvaluateParameter(Object[] arguments)
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 197', CAST(N'2018-09-09T01:53:15.620' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (53, N'Non-static method requires a target.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at System.Reflection.RuntimeMethodInfo.CheckConsistency(Object target)
   at System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimePropertyInfo.GetValue(Object obj, Object[] index)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryGetFieldOrPropertyValue(MemberExpression me, Object instance, Object& memberValue)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryEvaluatePath(Expression expression, ConstantExpression& constantExpression)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.EvaluateParameter(Object[] arguments)
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 197', CAST(N'2018-09-09T01:55:15.727' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (54, N'Non-static method requires a target.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at System.Reflection.RuntimeMethodInfo.CheckConsistency(Object target)
   at System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimePropertyInfo.GetValue(Object obj, Object[] index)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryGetFieldOrPropertyValue(MemberExpression me, Object instance, Object& memberValue)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryEvaluatePath(Expression expression, ConstantExpression& constantExpression)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.EvaluateParameter(Object[] arguments)
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 197', CAST(N'2018-09-09T02:08:56.303' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (55, N'Non-static method requires a target.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at System.Reflection.RuntimeMethodInfo.CheckConsistency(Object target)
   at System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimePropertyInfo.GetValue(Object obj, Object[] index)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryGetFieldOrPropertyValue(MemberExpression me, Object instance, Object& memberValue)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryEvaluatePath(Expression expression, ConstantExpression& constantExpression)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.EvaluateParameter(Object[] arguments)
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 197', CAST(N'2018-09-09T02:18:58.510' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (56, N'Non-static method requires a target.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at System.Reflection.RuntimeMethodInfo.CheckConsistency(Object target)
   at System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimePropertyInfo.GetValue(Object obj, Object[] index)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryGetFieldOrPropertyValue(MemberExpression me, Object instance, Object& memberValue)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryEvaluatePath(Expression expression, ConstantExpression& constantExpression)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.EvaluateParameter(Object[] arguments)
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 197', CAST(N'2018-09-09T02:38:20.430' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (57, N'Non-static method requires a target.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at System.Reflection.RuntimeMethodInfo.CheckConsistency(Object target)
   at System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimePropertyInfo.GetValue(Object obj, Object[] index)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryGetFieldOrPropertyValue(MemberExpression me, Object instance, Object& memberValue)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryEvaluatePath(Expression expression, ConstantExpression& constantExpression)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.EvaluateParameter(Object[] arguments)
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 197', CAST(N'2018-09-09T02:38:54.270' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (58, N'Non-static method requires a target.', N'Error while uploading complaint', N'InnerException: , StackTrace:    at System.Reflection.RuntimeMethodInfo.CheckConsistency(Object target)
   at System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimePropertyInfo.GetValue(Object obj, Object[] index)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryGetFieldOrPropertyValue(MemberExpression me, Object instance, Object& memberValue)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.TryEvaluatePath(Expression expression, ConstantExpression& constantExpression)
   at System.Data.Entity.Core.Objects.ELinq.QueryParameterExpression.EvaluateParameter(Object[] arguments)
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at CRM.Web.Controllers.APIs.ComplaintsController.AddComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 197', CAST(N'2018-09-09T02:51:48.153' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (59, N'Object reference not set to an instance of an object.', N'Error while getting complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.GetCustomerCmsFormByCustomerIdAndFormsIds(GetCustomerCmsFormByCustomerIdAndFormsIdsRequest request) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 1052', CAST(N'2018-09-09T03:15:10.387' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (60, N'Object reference not set to an instance of an object.', N'Error while getting complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.GetCustomerCmsFormByCustomerIdAndFormsIds(GetCustomerCmsFormByCustomerIdAndFormsIdsRequest request) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 1052', CAST(N'2018-09-09T03:15:49.113' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (61, N'Object reference not set to an instance of an object.', N'Error while getting complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.GetCustomerCmsFormByCustomerIdAndFormsIds(GetCustomerCmsFormByCustomerIdAndFormsIdsRequest request) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 1053', CAST(N'2018-09-09T03:18:44.053' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (62, N'Object reference not set to an instance of an object.', N'Error while getting complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.GetCustomerCmsFormByCustomerIdAndFormsIds(GetCustomerCmsFormByCustomerIdAndFormsIdsRequest request) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 1053', CAST(N'2018-09-09T03:25:32.430' AS DateTime), N'MobileUser', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (63, N'Object reference not set to an instance of an object.', N'Error while getting complaint', N'InnerException: , StackTrace:    at CRM.Web.Controllers.APIs.ComplaintsController.GetCustomerCmsFormByCustomerIdAndFormsIds(GetCustomerCmsFormByCustomerIdAndFormsIdsRequest request) in C:\Users\Pro-Laptop\documents\visual studio 2015\Projects\CRM.Web\CRM.Web\Controllers\APIs\ComplaintsController.cs:line 1053', CAST(N'2018-09-09T03:25:51.140' AS DateTime), N'MobileUser', 0, NULL)
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
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1008, CAST(N'2018-08-24T21:35:30.127' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1009, CAST(N'2018-08-24T21:35:30.157' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1010, CAST(N'2018-08-24T21:35:30.163' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1011, CAST(N'2018-08-24T21:35:30.170' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1012, CAST(N'2018-08-24T21:35:30.177' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1013, CAST(N'2018-08-24T21:35:30.183' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1014, CAST(N'2018-08-24T21:35:30.190' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1015, CAST(N'2018-08-25T19:30:37.490' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1016, CAST(N'2018-09-02T19:47:36.457' AS DateTime), N'System', 1, NULL)
GO
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1017, CAST(N'2018-09-06T22:23:01.767' AS DateTime), N'System', 1, NULL)
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
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1008, 1008, 1, 1, N'System_Emails_Source_Email', N'furidistest@gmail.com')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1009, 1009, 1, 1, N'System_Emails_Error_Email', N'furidistest@gmail.com')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1010, 1010, 1, 1, N'System_Emails_SmtpClient', N'smtp.gmail.com')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1011, 1011, 1, 1, N'System_Emails_Reset_Password', N'Furidis@123')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1012, 1012, 1, 1, N'System_Emails_ReplyTo', N'furidistest@gmail.com')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1013, 1013, 1, 1, N'System_Emails_SmtpPort', N'587')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1014, 1014, 1, 1, N'System_Emails_EnableSsl', N'true')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1015, 1015, 1, 1, N'System_Emails_Source_Email_Name', N'Crm Test')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1016, 1016, 1, 1, N'Background_Image_login_page', N'/Content/assets/img/hero.jpg')
GO
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1017, 1017, 1, 1, N'Background_Image_ForgotPassword_page', N'/Content/assets/img/hero.jpg')
GO
SET IDENTITY_INSERT [dbo].[SystemSettingTranslation] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (2, N'salam-cs@hotmail.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-08-09T23:14:19.483' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1003, 17, N'salam-cs@hotmail.com')
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1002, N'salam-test1@hotmail.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-08-11T13:59:59.293' AS DateTime), 2, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 18, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1003, N'salam-test2@hotmail.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-08-11T16:36:38.987' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, 17, N'salam.modallal@gmail.com')
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1004, N'salam-cs@hotmail.com11', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-08-25T18:23:24.287' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1003, 17, N'salam-cs@hotmail.com11')
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1005, N'tets@test.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-08-25T19:30:37.243' AS DateTime), 2, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL)
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1006, N'test@test.xxx', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-09-06T22:31:45.170' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, N'test@test.xxx')
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1007, N'salam-cs111@hotmail.com11', N'', N'', NULL, NULL, 1, NULL, CAST(N'2018-09-07T01:41:58.997' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, N'salam-cs111@hotmail.com11')
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1008, N'salam-c12s@hotmail.com', N'', N'', N'', NULL, NULL, NULL, CAST(N'2018-09-07T13:30:38.660' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'salam-c12s@hotmail.com')
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1009, N'xx.test@test.com', N'', N'', N'', NULL, NULL, NULL, CAST(N'2018-09-07T13:39:21.330' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'xx.test@test.com')
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1010, N'salam-from-salam@hotmail.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-09-08T12:32:21.167' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 17, N'salam-from-salam@hotmail.com')
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email]) VALUES (1011, N'testfromcms@hotmail.com', N'', N'', N'', NULL, NULL, NULL, CAST(N'2018-09-09T00:30:54.437' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'testfromcms@hotmail.com')
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
INSERT [dbo].[UserProfileHolidays] ([Id], [UserProfileId], [HolidayDate], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, 1004, CAST(N'2018-09-28T00:00:00.000' AS DateTime), N'test 2', CAST(N'2018-09-02T23:39:30.400' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserProfileHolidays] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfileOffDays] ON 
GO
INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (17, 2, N'20', CAST(N'2018-08-23T16:01:36.647' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (18, 2, N'26', CAST(N'2018-08-23T16:01:36.650' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (19, 1003, N'25', CAST(N'2018-09-03T00:34:24.103' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (20, 1003, N'26', CAST(N'2018-09-03T00:34:24.107' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (21, 1010, N'22', CAST(N'2018-09-08T12:34:52.037' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (22, 1010, N'26', CAST(N'2018-09-08T12:34:52.040' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
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
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1004, 1, 1, 1004, NULL, NULL, N'Salam Modallal', N'')
GO
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1005, 1, 1, 1005, NULL, NULL, N'test', N'')
GO
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1006, 1, 1, 1006, NULL, NULL, N'test test', N'')
GO
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1007, 1, 1, 1007, NULL, NULL, N'Salam Modallal', NULL)
GO
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1008, 1, 1, 1008, NULL, NULL, N'Salam', N'')
GO
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1009, 1, 1, 1009, NULL, NULL, N'Salam Modallal', N'')
GO
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1010, 1, 1, 1010, NULL, NULL, N' 1Test From Salam', N'')
GO
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1011, 1, 1, 1011, NULL, NULL, N'test from cms', N'')
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
ALTER TABLE [dbo].[SlaCaseCount]  WITH CHECK ADD  CONSTRAINT [FK_SlaCaseCount_SystemCases] FOREIGN KEY([SysCaseId])
REFERENCES [dbo].[SystemCases] ([Id])
GO
ALTER TABLE [dbo].[SlaCaseCount] CHECK CONSTRAINT [FK_SlaCaseCount_SystemCases]
GO
ALTER TABLE [dbo].[SlaCategories]  WITH CHECK ADD  CONSTRAINT [FK_SlaCategories_DetailsLookup] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[DetailsLookup] ([Id])
GO
ALTER TABLE [dbo].[SlaCategories] CHECK CONSTRAINT [FK_SlaCategories_DetailsLookup]
GO
ALTER TABLE [dbo].[SlaCategories]  WITH CHECK ADD  CONSTRAINT [FK_SlaCategories_Sla] FOREIGN KEY([SlaId])
REFERENCES [dbo].[Sla] ([Id])
GO
ALTER TABLE [dbo].[SlaCategories] CHECK CONSTRAINT [FK_SlaCategories_Sla]
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
ALTER TABLE [dbo].[StateTransitionsConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_StateTransitionsConfiguration_UserProfile] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[StateTransitionsConfiguration] CHECK CONSTRAINT [FK_StateTransitionsConfiguration_UserProfile]
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
ALTER TABLE [dbo].[SystemCases]  WITH CHECK ADD  CONSTRAINT [FK_SystemCases_UserProfile] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[SystemCases] CHECK CONSTRAINT [FK_SystemCases_UserProfile]
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
