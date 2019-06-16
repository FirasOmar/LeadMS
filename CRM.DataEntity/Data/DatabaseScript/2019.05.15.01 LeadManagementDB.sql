USE [master]
GO
/****** Object:  Database [Crm_dev]    Script Date: 5/14/2019 10:45:32 AM ******/
CREATE DATABASE [Crm_dev]
 CONTAINMENT = NONE
 

ALTER DATABASE [Crm_dev] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Crm_dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Crm_dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Crm_dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Crm_dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Crm_dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Crm_dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [Crm_dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Crm_dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Crm_dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Crm_dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Crm_dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Crm_dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Crm_dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Crm_dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Crm_dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Crm_dev] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Crm_dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Crm_dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Crm_dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Crm_dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Crm_dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Crm_dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Crm_dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Crm_dev] SET RECOVERY FULL 
GO
ALTER DATABASE [Crm_dev] SET  MULTI_USER 
GO
ALTER DATABASE [Crm_dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Crm_dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Crm_dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Crm_dev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Crm_dev] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Crm_dev', N'ON'
GO
ALTER DATABASE [Crm_dev] SET QUERY_STORE = OFF
GO
USE [Crm_dev]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 5/14/2019 10:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[ArticleTranslation]    Script Date: 5/14/2019 10:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/14/2019 10:45:33 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/14/2019 10:45:33 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/14/2019 10:45:33 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/14/2019 10:45:33 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/14/2019 10:45:33 AM ******/
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
/****** Object:  Table [dbo].[Campaigns]    Script Date: 5/14/2019 10:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaigns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasesByEmail]    Script Date: 5/14/2019 10:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasesByEmail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[EmailDescription] [nvarchar](max) NOT NULL,
	[SentTo] [nvarchar](max) NOT NULL,
	[FilePath] [nvarchar](250) NULL,
 CONSTRAINT [PK_CasesByEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/14/2019 10:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[CategoryTranslation]    Script Date: 5/14/2019 10:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[CommunicationLogs]    Script Date: 5/14/2019 10:45:33 AM ******/
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
/****** Object:  Table [dbo].[ContactUs]    Script Date: 5/14/2019 10:45:33 AM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 5/14/2019 10:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Address] [text] NULL,
	[Language] [nvarchar](50) NULL,
	[Website] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/14/2019 10:45:33 AM ******/
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
/****** Object:  Table [dbo].[DepartmentTranslation]    Script Date: 5/14/2019 10:45:33 AM ******/
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
/****** Object:  Table [dbo].[DetailsLookup]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[DetailsLookupTranslation]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[Lead_Activity]    Script Date: 5/14/2019 10:45:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead_Activity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Activity_Type] [int] NULL,
	[Activity_Status] [int] NULL,
	[Activity_Date] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
	[Lead_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leads]    Script Date: 5/14/2019 10:45:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone_Number] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Notes] [text] NULL,
	[AssigneeId] [int] NULL,
	[CampaignId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mapping_Article]    Script Date: 5/14/2019 10:45:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mapping_Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableId] [int] NOT NULL,
	[TableValue] [int] NOT NULL,
	[ArticleId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Mapping_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterLookup]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[MasterLookupTranslation]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[MenuTranslation]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[Sla]    Script Date: 5/14/2019 10:45:34 AM ******/
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
	[Send_SMS_Citizen] [bit] NULL,
	[Send_SMS_Employee] [bit] NULL,
 CONSTRAINT [PK_Sla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlaCaseCount]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[SlaCategories]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[SlaIgnoredCaseStates]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[SlaTranslation]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[SMSTemplate]    Script Date: 5/14/2019 10:45:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[SMSTemplateTranslation]    Script Date: 5/14/2019 10:45:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[StateHistory]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[StateTransitionsConfiguration]    Script Date: 5/14/2019 10:45:34 AM ******/
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
	[CategoryType] [int] NOT NULL,
 CONSTRAINT [PK_CaseStateTransitionsConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysCaseComments]    Script Date: 5/14/2019 10:45:34 AM ******/
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
	[ForCitizen] [bit] NULL,
	[FilePath] [nvarchar](500) NULL,
 CONSTRAINT [PK_SysCaseComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemCaseAttachments]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[SystemCases]    Script Date: 5/14/2019 10:45:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[CategoryId] [int] NULL,
	[SeverityId] [int] NULL,
	[SeverityValue] [int] NULL,
	[PriorityId] [int] NULL,
	[PriorityValue] [int] NULL,
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
/****** Object:  Table [dbo].[SystemFile]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[SystemFileTranslation]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[SystemLog]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[SystemSetting]    Script Date: 5/14/2019 10:45:34 AM ******/
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
/****** Object:  Table [dbo].[SystemSettingTranslation]    Script Date: 5/14/2019 10:45:35 AM ******/
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
/****** Object:  Table [dbo].[UserProfile]    Script Date: 5/14/2019 10:45:35 AM ******/
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
	[StatusEditDescription] [nvarchar](300) NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfileHolidays]    Script Date: 5/14/2019 10:45:35 AM ******/
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
/****** Object:  Table [dbo].[UserProfileOffDays]    Script Date: 5/14/2019 10:45:35 AM ******/
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
/****** Object:  Table [dbo].[UserProfileTranslation]    Script Date: 5/14/2019 10:45:35 AM ******/
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
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([Id], [CategoryId], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, 1, CAST(N'2018-12-25T12:51:13.813' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[ArticleTranslation] ON 

INSERT [dbo].[ArticleTranslation] ([Id], [ArticleId], [Title], [Description], [LanguageId], [IsDefault]) VALUES (1, 1, N'وصف المعرفةض', N'مرحبا هلا هلا
', 1, 1)
SET IDENTITY_INSERT [dbo].[ArticleTranslation] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name], [FriendlyName], [Description]) VALUES (N'1', N'Administrator', N'Admin', N'System Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [FriendlyName], [Description]) VALUES (N'2', N'User', N'User', N'User')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [FriendlyName], [Description]) VALUES (N'3', N'citizen', N'Citizen', N'Citizen')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [FriendlyName], [Description]) VALUES (N'4', N'CrmEmployer', N'CRM', N'crm')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [FriendlyName], [Description]) VALUES (N'5', N'DepartmentManager', N'Department Manager', N'Department Manager')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [FriendlyName], [Description]) VALUES (N'6', N'DepartmentTeam', N'Department Team', N'Department Team')
SET IDENTITY_INSERT [dbo].[AspNetUserRoles] ON 

INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (53, N'8b5cc3cc-d782-47b1-8e62-d605c3d49624', N'1')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (56, N'5ca69b98-5d6a-455d-9d72-41ed60d778c2', N'5')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (57, N'1733a35f-c5f0-4627-b16f-9113af59ca87', N'6')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (59, N'6e7cfc16-a2e7-4af2-ad19-fba59cb2ef7d', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (60, N'1d134fa0-1458-48d2-a90f-0bc7697d3d8b', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (61, N'db7d60c0-7443-4179-a23d-b9b4e281e779', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (63, N'479b2043-1541-4e7f-a1af-04df3d7781d8', N'1')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (66, N'2fef2879-6b18-4c35-820b-21ec24d004db', N'1')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (67, N'3fc52880-d464-4dbe-8d3c-65fbfbba698a', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (68, N'cbccc950-0171-423d-94db-3558b9c030ad', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (70, N'aad6631f-8105-4191-8927-b79c7d3853c5', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (71, N'f6fc33f2-c361-41ac-bb81-647a657161bb', N'2')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (72, N'40873d7e-79c4-4cd3-ad6c-c37f1c67364e', N'2')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (76, N'7df2f26e-8e8c-4c1e-b5e7-581254558acd', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (77, N'45ca5b40-9a6d-4f1c-bd8d-b8a92e757142', N'2')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (78, N'e8efbfb7-aeea-4481-b99e-5ab08ceed84d', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (80, N'7e65dae1-be70-4c0d-b0b8-ffed00e4a822', N'1')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (81, N'7e65dae1-be70-4c0d-b0b8-ffed00e4a822', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (82, N'ed8a3e8c-5467-4d20-acad-1a39a6d0ef36', N'2')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (83, N'a3e5cbe1-84f1-4bb9-9f82-a4dabf0a20b8', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (85, N'9b4d70c9-5933-4694-b0f5-605af76f220f', N'1')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (88, N'bfebd2cd-c517-4e06-ad0e-af83ca33bdf6', N'3')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (89, N'7cf873a6-ee1e-498c-a9a6-3e4c77d0bd77', N'1')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (90, N'aca3a106-d0eb-49a5-987f-9e2f6bf6d67c', N'4')
INSERT [dbo].[AspNetUserRoles] ([Id], [UserId], [RoleId]) VALUES (91, N'1b6b952d-71bc-4dab-850b-67edc080563a', N'3')
SET IDENTITY_INSERT [dbo].[AspNetUserRoles] OFF
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'121b1b1c-2aed-4c05-b32e-dc4252ad84b4', N'qasemhatem1@hotmail.com', 1, N'AOKTHCqGomTCIj3XCjpeA9heRY9NHlc1u7w7jSfuGixPdcHI2PgnaLQbvbAm4lFxzg==', N'7a5189d2-f9aa-4081-9cdd-0c21b3966730', NULL, 0, 0, NULL, 1, 0, N'qasemhatem1@hotmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1733a35f-c5f0-4627-b16f-9113af59ca87', N'watermanfirstman@gmail.com', 1, N'AKbapO2pWEdQUYB7t2/FhbHI71GgfOZFTLEU7DjV89K8+SQFMyP28OCdvdiyeS6jeg==', N'24ce079f-8d2f-4670-9843-8bf307daa377', NULL, 0, 0, NULL, 1, 0, N'watermanfirstman@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1b6b952d-71bc-4dab-850b-67edc080563a', N't@t.com', 0, N'AM5x7/+olqNo1ibg5lPJJ037s6OcOtPjyyHRnas7oRC+9aJFgyx5FzAJbJO2A+uIxA==', N'b6b1236b-58ad-4f0d-a58c-3d2ba116d30c', NULL, 0, 0, NULL, 1, 0, N't@t.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1d134fa0-1458-48d2-a90f-0bc7697d3d8b', N'mowaten2@outlook.com', 0, N'ADTy1Oqs11MdnirduoVcTkps+ek6iN56FwGaz9qfWV5EYaRNEjupXFCy1LUAkr9rfA==', N'526bdcf0-dcab-4ea6-b206-10932c1624f2', NULL, 0, 0, NULL, 1, 0, N'mowaten2@outlook.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2097b7ae-b6c3-443b-913a-04b894a6ed5f', N'farajh@3-sectors.co.il', 1, N'AMIQG8+meEIhfHWppPRbMxV1fOibojvaVHJ+2Nf+c+AATa57wo82FpLhOHwSKch/YA==', N'd13e9426-244c-4011-9a64-5558f2828432', NULL, 0, 0, NULL, 1, 0, N'farajh@3-sectors.co.il')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2fef2879-6b18-4c35-820b-21ec24d004db', N'majadly@3-sectors.co.il', 1, N'AHjeJIhGsCpi5pusSbFKn4iisKIWiEW6ag8PPRBHlMaxUSqn1Cs+nDsC/TFENhxwGA==', N'2583e23e-8453-42f2-97f7-708c319fdc5a', NULL, 0, 0, NULL, 1, 0, N'majadly@3-sectors.co.il')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3fc52880-d464-4dbe-8d3c-65fbfbba698a', N'maram.sh.22@hotmail.com', 0, N'AFoXPPFalwesRZbfTTknCzgrZufzW4P7/0w4UmzjCHGkNouBzw9GJp8dPGGyupGvJQ==', N'fbd1cb71-3590-4e96-9d4d-119a309d20ef', NULL, 0, 0, NULL, 1, 0, N'maram.sh.22@hotmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'40873d7e-79c4-4cd3-ad6c-c37f1c67364e', N'muhammad.maj@gmail.com', 0, N'AHDfpBLyicNCmZb4vBI26+lahQFVo5X4D3DjJaMwaOw7Ek1gB1HbA8J+poNv+UDImw==', N'd0805196-4377-4021-8d45-6f7b3ed87d2a', NULL, 0, 0, NULL, 1, 0, N'muhammad.maj@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'45ca5b40-9a6d-4f1c-bd8d-b8a92e757142', N'adham.hassadiyeh@gmail.com', 0, N'AOuqB+I60Rbi7y75KLJXb/Ea/JUvU4QPY2SjDD7T22pPqv8gYjNka1XfsNBrBrQZkA==', N'37b32e86-7342-493d-824d-94f509a5c5dd', NULL, 0, 0, NULL, 1, 0, N'adham.hassadiyeh@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'479b2043-1541-4e7f-a1af-04df3d7781d8', N'crmemployer@gmail.com', 1, N'ABJ3BlfuUTNW/JZjhN/dhfPQPBgeX9BDcHl8VKu33YNl8o3426LpwIx2dWZVUsb55g==', N'e8285281-7e2d-4198-ad65-89f71d49c482', NULL, 0, 0, NULL, 1, 0, N'crmemployer@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5ca69b98-5d6a-455d-9d72-41ed60d778c2', N'watermanmoder@gmail.com', 0, N'AHwIyjG9zro7RQ9CzScm0g5QYRQWx9l9qJy4tuDLNVBRoEti7x0oXJGXjeYJiabU2A==', N'f678784b-adc5-4ff2-a6bb-777481b74ef6', NULL, 0, 0, NULL, 1, 0, N'watermanmoder@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6e7cfc16-a2e7-4af2-ad19-fba59cb2ef7d', N'linam@3-sectors.co.il', 1, N'AMj111rizXCbKOCTkLBJ6jv82CU73GYbMSz07MP11132hmLQjhKPw7yE2noR4jTkFg==', N'bf4798ad-7cad-4f54-8448-ae4783ea3e31', NULL, 0, 0, NULL, 1, 0, N'linam@3-sectors.co.il')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7cf873a6-ee1e-498c-a9a6-3e4c77d0bd77', N'admin@smsm-it.com', 1, N'ANMPQN0ZoUsdj3G5pB4YJSCr5kN1lD3o9BwLvFsLQtSGmXzU4NnPwoGq/HhtJnodSA==', N'2ac82d5d-0dbd-4702-b406-de2495903878', NULL, 0, 0, NULL, 1, 0, N'admin@smsm-it.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7df2f26e-8e8c-4c1e-b5e7-581254558acd', N'MetanesF@3-sectors.co.il', 1, N'AI+qet+l/KSNQJQnEH2MCb9h5NJLIw0WAQ5zshZGs4a65vfskg4edYq+PdR0Zw9KNg==', N'366bfc6b-5e10-4d02-8643-f8f659f7cc5f', NULL, 0, 0, NULL, 1, 0, N'MetanesF@3-sectors.co.il')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7e65dae1-be70-4c0d-b0b8-ffed00e4a822', N'demo1@smsm-it.com', 0, N'AJjBfKTt69nRfbx/RlfZL61H47YD+JmhthrlCYafadjyL7UpUp0dt5n+NP7nYs7zqA==', N'968a99e9-fd0f-40af-9e03-92b386c0452d', NULL, 0, 0, NULL, 1, 0, N'demo1@smsm-it.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8b5cc3cc-d782-47b1-8e62-d605c3d49624', N'salam-cs@hotmail.com', 1, N'AOMmPFATIjfDE3YIS/tmcJnLamUkrTvPlAwK2t+V+h9hgQfGhp2JvtE+ggiXKqWBtw==', N'113c8ec3-d92d-4fec-9d16-17364a4aea2b', NULL, 0, 0, NULL, 1, 0, N'salam-cs@hotmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9b4d70c9-5933-4694-b0f5-605af76f220f', N'smsmit2018@hotmail.com', 0, N'AAaXLwVlc8iKh7RuHOVvPRdP0t6LOUQ6XWDEFm/QpEnZnkyMZQI7U2upn6Kp7eBFHA==', N'5f877620-e0f3-4b10-bc44-baa6a4a80c30', NULL, 0, 0, NULL, 1, 0, N'smsmit2018@hotmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a3e5cbe1-84f1-4bb9-9f82-a4dabf0a20b8', N'visitor214@hotmail.com', 0, N'ABDy/aJ6i02tnH52JU9S6bRmYVMAssdTWLFqckns/m/dFN6dO3Paad1h9sau575pJg==', N'6bfe59fe-db84-4034-95e4-66682086cd8c', NULL, 0, 0, NULL, 1, 0, N'visitor214@hotmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'aad6631f-8105-4191-8927-b79c7d3853c5', N'mowaten100@hotmail.com', 1, N'AJrYQLuFv4sfoy172TX7xiFh/iiNltsL2shQP7b6trP09tvcfLk2xvGfWmzAKh+BgQ==', N'bfa6bb0f-7b25-4c42-846e-c87a9e2ef373', NULL, 0, 0, NULL, 1, 0, N'mowaten100@hotmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'aca3a106-d0eb-49a5-987f-9e2f6bf6d67c', N'emp@smsm-it.com', 1, N'APXOccZYiP657ZoUXIzybyrTIH5jIJdZIJBlQT4LhhGUg3JgfVIv+bBCfpj585bbEg==', N'87cdf8be-9628-4ec3-941d-2b3eb4809f0c', NULL, 0, 0, NULL, 1, 0, N'emp@smsm-it.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'be10793e-381e-4469-bbf9-e5124833d278', N'qasem@oyounmedia.com', 1, N'AHCsmcbjOovR4i4Aom9DC9RZWtlplry0qXl3K3dojyal5pvbPwRH/U8u5ZBADT1zYw==', N'ad90e30c-5477-4a0e-a0f3-4bb37e7f702b', NULL, 0, 0, NULL, 1, 0, N'qasem@oyounmedia.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bfebd2cd-c517-4e06-ad0e-af83ca33bdf6', N'citizen@smsm-it.com', 1, N'ADWQGC1HO7Be8OeO7M0ALsTm07/E1mm1DHWp1Rcpc3JqutpuRt5Drie9CsTzir1o3Q==', N'adf2c0c3-8f2c-4ab7-8b77-d5c64a775235', NULL, 0, 0, NULL, 1, 0, N'citizen@smsm-it.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cbccc950-0171-423d-94db-3558b9c030ad', N'ahmad.maharma@gmail.com', 0, N'AHu7KRamtpp2GEYwxm/KTv9zVjj+ktqhn/beLaNWYK6ekMXywWyBGgGwXchZQnU+Hw==', N'd8677ace-c1df-4252-b1f4-9b96c0ea5e56', NULL, 0, 0, NULL, 1, 0, N'ahmad.maharma@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'db7d60c0-7443-4179-a23d-b9b4e281e779', N'qasemhatem@oyounmedai.com', 0, N'AAvhUKAyqYUcePCISZ+5UxT/hWVYP3kRHFtc1SI3gYkjhkoofBHu86Unk4luf7tidw==', N'4202be30-3a93-40c7-acf1-ae37f2ae92e9', NULL, 0, 0, NULL, 1, 0, N'qasemhatem@oyounmedai.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e8efbfb7-aeea-4481-b99e-5ab08ceed84d', N'irahav@013.net.il', 0, N'AOSMkeurODvxpvW0JUY3KOf5OxE4cr5tclI4WkKr/oqIJQoBmu6AsU/og5zrDXe5Ng==', N'0d7e5b07-73b4-41e0-9d12-8df5c9f1be0e', NULL, 0, 0, NULL, 1, 0, N'irahav@013.net.il')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ed8a3e8c-5467-4d20-acad-1a39a6d0ef36', N'visitor212@hotmail.com', 0, N'APhoAG0jHFnTrbBY/G0CAvYp82E7bFMHHRxTp/G/nBpvF4WDZ0PLGAsTS+aOpzmcyA==', N'adcd00e4-ea53-4934-8505-798324060e84', NULL, 0, 0, NULL, 1, 0, N'visitor212@hotmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f6fc33f2-c361-41ac-bb81-647a657161bb', N'mowathaf100@hotmail.com', 0, N'APHaNkSuKRNzVlGcqOfVEOmwilBb1+7Zp/T4O6DxfArNPbuTDvbhTGV3EfpMhAuRAA==', N'52c4a8eb-e0f2-48ed-a78d-46950831fcd2', NULL, 0, 0, NULL, 1, 0, N'mowathaf100@hotmail.com')
SET IDENTITY_INSERT [dbo].[Campaigns] ON 

INSERT [dbo].[Campaigns] ([Id], [Name], [StartDate], [EndDate]) VALUES (1, N'test', CAST(N'2019-05-12' AS Date), CAST(N'2019-06-30' AS Date))
INSERT [dbo].[Campaigns] ([Id], [Name], [StartDate], [EndDate]) VALUES (2, N'test#2', CAST(N'2019-05-31' AS Date), CAST(N'2019-07-31' AS Date))
INSERT [dbo].[Campaigns] ([Id], [Name], [StartDate], [EndDate]) VALUES (3, N'test3', CAST(N'2019-05-14' AS Date), CAST(N'2019-05-17' AS Date))
SET IDENTITY_INSERT [dbo].[Campaigns] OFF
SET IDENTITY_INSERT [dbo].[CasesByEmail] ON 

INSERT [dbo].[CasesByEmail] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [EmailDescription], [SentTo], [FilePath]) VALUES (1, CAST(N'2019-01-29T09:21:30.343' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'test', N'qasemhatem1@hotmail.com', N'/Document/CasesAsPDFEmail/129201992127AM.pdf')
INSERT [dbo].[CasesByEmail] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [EmailDescription], [SentTo], [FilePath]) VALUES (2, CAST(N'2019-01-29T09:28:03.057' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'he', N'qasemhatem1@hotmail.com', N'/Document/CasesAsPDFEmail/129201992800AM.pdf')
SET IDENTITY_INSERT [dbo].[CasesByEmail] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, CAST(N'2018-12-25T12:49:57.873' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CategoryTranslation] ON 

INSERT [dbo].[CategoryTranslation] ([Id], [CategoryId], [Title], [Description], [LanguageId], [IsDefault]) VALUES (1, 1, N'التربية والتعليم ', N'تالتال', 1, 1)
SET IDENTITY_INSERT [dbo].[CategoryTranslation] OFF
SET IDENTITY_INSERT [dbo].[CommunicationLogs] ON 

INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:1', CAST(N'2018-12-24T15:10:00.377' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, 1, N'تم إدخال طلب جديد, رقم الطلب:1
', CAST(N'2018-12-24T15:10:00.657' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:1', CAST(N'2018-12-24T15:14:57.767' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, 1, N'تم إدخال طلب جديد, رقم الطلب:1
', CAST(N'2018-12-24T15:14:57.890' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 6', CAST(N'2018-12-25T11:41:22.660' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 6', CAST(N'2018-12-25T11:41:22.817' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (7, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 7', CAST(N'2018-12-25T11:57:49.313' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (8, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 7', CAST(N'2018-12-25T11:57:49.433' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (9, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 7', CAST(N'2018-12-25T11:59:23.567' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (10, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 7', CAST(N'2018-12-25T11:59:23.830' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (11, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:7', CAST(N'2018-12-25T12:00:11.587' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (12, 1, N'تم إدخال طلب جديد, رقم الطلب:7
', CAST(N'2018-12-25T12:00:11.750' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (13, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 9', CAST(N'2018-12-25T13:44:36.293' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (14, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 9', CAST(N'2018-12-25T13:44:36.407' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (15, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 10', CAST(N'2018-12-25T14:23:39.573' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (16, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 10', CAST(N'2018-12-25T14:23:39.677' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (17, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 15', CAST(N'2018-12-25T15:35:27.187' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (18, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 15', CAST(N'2018-12-25T15:35:27.320' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (19, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 15', CAST(N'2018-12-25T15:35:28.957' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (20, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 15', CAST(N'2018-12-25T15:35:30.677' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (21, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 16', CAST(N'2018-12-25T15:40:10.877' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (22, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 16', CAST(N'2018-12-25T15:40:10.977' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (23, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 16', CAST(N'2018-12-25T15:40:12.703' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (24, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 16', CAST(N'2018-12-25T15:40:14.500' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (25, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 17	', CAST(N'2018-12-25T16:07:35.713' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (26, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 17', CAST(N'2018-12-25T16:07:36.017' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (27, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 17	', CAST(N'2018-12-25T16:07:37.833' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (28, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 17', CAST(N'2018-12-25T16:07:39.497' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (29, 1, N'لقد تم تعيين طلب عليك : رقم الطلب 17	', CAST(N'2018-12-25T16:08:18.280' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (30, 1, N'لقد تم تعيين طلب عليك : رقم الطلب 20	', CAST(N'2018-12-25T16:19:20.307' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (31, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 20	', CAST(N'2018-12-25T16:21:20.207' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (32, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 20', CAST(N'2018-12-25T16:21:20.387' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (33, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 20	', CAST(N'2018-12-25T16:21:22.057' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (34, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 20', CAST(N'2018-12-25T16:21:23.687' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (35, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 20	', CAST(N'2018-12-25T16:21:24.623' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (36, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 20', CAST(N'2018-12-25T16:21:24.763' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (37, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 20	', CAST(N'2018-12-25T16:21:26.577' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (38, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 20', CAST(N'2018-12-25T16:21:28.240' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (39, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 20', CAST(N'2018-12-25T16:25:28.280' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (40, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 20', CAST(N'2018-12-25T16:25:28.387' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (41, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 20', CAST(N'2018-12-25T16:25:30.047' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (42, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 20', CAST(N'2018-12-25T16:25:31.773' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (43, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:21', CAST(N'2018-12-25T19:52:35.537' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (44, 1, N'تم إدخال طلب جديد, رقم الطلب:21
', CAST(N'2018-12-25T19:52:35.653' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (45, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:21', CAST(N'2018-12-25T19:52:37.307' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (46, 2, N'تم إدخال طلب جديد, رقم الطلب:21
', CAST(N'2018-12-25T19:52:39.030' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (47, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 21	', CAST(N'2018-12-25T19:55:58.160' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (48, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 21', CAST(N'2018-12-25T19:55:58.277' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (49, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 21	', CAST(N'2018-12-25T19:55:59.860' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (50, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 21', CAST(N'2018-12-25T19:56:01.480' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (51, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 21', CAST(N'2018-12-25T19:56:21.387' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (52, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 21', CAST(N'2018-12-25T19:56:21.537' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (53, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 21', CAST(N'2018-12-25T19:56:23.267' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (54, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 21', CAST(N'2018-12-25T19:56:24.910' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (55, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:22', CAST(N'2018-12-25T19:58:34.143' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (56, 1, N'تم إدخال طلب جديد, رقم الطلب:22
', CAST(N'2018-12-25T19:58:34.260' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (57, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:22', CAST(N'2018-12-25T19:58:35.893' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (58, 2, N'تم إدخال طلب جديد, رقم الطلب:22
', CAST(N'2018-12-25T19:58:37.687' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (59, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 22	', CAST(N'2018-12-25T19:59:57.407' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (60, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 22', CAST(N'2018-12-25T19:59:57.520' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (61, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 22	', CAST(N'2018-12-25T19:59:59.153' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (62, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 22', CAST(N'2018-12-25T20:00:00.840' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (63, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 22', CAST(N'2018-12-25T20:02:08.307' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (64, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 22', CAST(N'2018-12-25T20:02:08.420' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (65, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 22', CAST(N'2018-12-25T20:02:10.137' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (66, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 22', CAST(N'2018-12-25T20:02:11.767' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (67, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 22', CAST(N'2018-12-25T20:02:25.170' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (68, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 22', CAST(N'2018-12-25T20:02:25.293' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (69, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 22', CAST(N'2018-12-25T20:02:27.070' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (70, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 22', CAST(N'2018-12-25T20:02:28.747' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (71, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:23', CAST(N'2018-12-25T20:07:47.140' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (72, 1, N'تم إدخال طلب جديد, رقم الطلب:23
', CAST(N'2018-12-25T20:07:47.250' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (73, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:23', CAST(N'2018-12-25T20:07:48.930' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (74, 2, N'تم إدخال طلب جديد, رقم الطلب:23
', CAST(N'2018-12-25T20:07:50.567' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (75, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:24', CAST(N'2018-12-25T20:10:20.293' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (76, 1, N'تم إدخال طلب جديد, رقم الطلب:24
', CAST(N'2018-12-25T20:10:20.433' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (77, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:24', CAST(N'2018-12-25T20:10:22.100' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (78, 2, N'تم إدخال طلب جديد, رقم الطلب:24
', CAST(N'2018-12-25T20:10:23.747' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (79, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:25', CAST(N'2018-12-25T20:11:30.807' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (80, 1, N'تم إدخال طلب جديد, رقم الطلب:25
', CAST(N'2018-12-25T20:11:30.927' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (81, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:25', CAST(N'2018-12-25T20:11:32.613' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (82, 2, N'تم إدخال طلب جديد, رقم الطلب:25
', CAST(N'2018-12-25T20:11:34.300' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (83, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:26', CAST(N'2018-12-25T20:12:22.220' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (84, 1, N'تم إدخال طلب جديد, رقم الطلب:26
', CAST(N'2018-12-25T20:12:22.327' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (85, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:26', CAST(N'2018-12-25T20:12:23.997' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (86, 2, N'تم إدخال طلب جديد, رقم الطلب:26
', CAST(N'2018-12-25T20:12:25.693' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (87, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:27', CAST(N'2018-12-25T20:12:58.097' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (88, 1, N'تم إدخال طلب جديد, رقم الطلب:27
', CAST(N'2018-12-25T20:12:58.267' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (89, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:27', CAST(N'2018-12-25T20:12:59.890' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (90, 2, N'تم إدخال طلب جديد, رقم الطلب:27
', CAST(N'2018-12-25T20:13:01.623' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (91, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:28', CAST(N'2018-12-25T20:13:04.023' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (92, 1, N'تم إدخال طلب جديد, رقم الطلب:28
', CAST(N'2018-12-25T20:13:04.140' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (93, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:28', CAST(N'2018-12-25T20:13:05.803' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (94, 2, N'تم إدخال طلب جديد, رقم الطلب:28
', CAST(N'2018-12-25T20:13:07.383' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (95, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:29', CAST(N'2018-12-25T20:13:56.237' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (96, 1, N'تم إدخال طلب جديد, رقم الطلب:29
', CAST(N'2018-12-25T20:13:56.347' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (97, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:29', CAST(N'2018-12-25T20:13:58.037' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (98, 2, N'تم إدخال طلب جديد, رقم الطلب:29
', CAST(N'2018-12-25T20:13:59.703' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (99, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:30', CAST(N'2018-12-25T20:15:16.070' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (100, 1, N'تم إدخال طلب جديد, رقم الطلب:30
', CAST(N'2018-12-25T20:15:16.190' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (101, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:30', CAST(N'2018-12-25T20:15:17.837' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (102, 2, N'تم إدخال طلب جديد, رقم الطلب:30
', CAST(N'2018-12-25T20:15:19.467' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (103, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:31', CAST(N'2018-12-25T20:16:05.383' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (104, 1, N'تم إدخال طلب جديد, رقم الطلب:31
', CAST(N'2018-12-25T20:16:05.487' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (105, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:31', CAST(N'2018-12-25T20:16:07.140' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (106, 2, N'تم إدخال طلب جديد, رقم الطلب:31
', CAST(N'2018-12-25T20:16:08.987' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (107, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:32', CAST(N'2018-12-25T20:16:44.437' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (108, 1, N'تم إدخال طلب جديد, رقم الطلب:32
', CAST(N'2018-12-25T20:16:44.570' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (109, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:32', CAST(N'2018-12-25T20:16:46.243' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (110, 2, N'تم إدخال طلب جديد, رقم الطلب:32
', CAST(N'2018-12-25T20:16:47.833' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (111, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:33', CAST(N'2018-12-25T20:17:33.767' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (112, 1, N'تم إدخال طلب جديد, رقم الطلب:33
', CAST(N'2018-12-25T20:17:33.870' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (113, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:33', CAST(N'2018-12-25T20:17:35.537' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (114, 2, N'تم إدخال طلب جديد, رقم الطلب:33
', CAST(N'2018-12-25T20:17:37.103' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (115, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:34', CAST(N'2018-12-25T20:18:10.447' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (116, 1, N'تم إدخال طلب جديد, رقم الطلب:34
', CAST(N'2018-12-25T20:18:10.607' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (117, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:34', CAST(N'2018-12-25T20:18:12.337' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (118, 2, N'تم إدخال طلب جديد, رقم الطلب:34
', CAST(N'2018-12-25T20:18:13.997' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (119, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:35', CAST(N'2018-12-25T20:19:06.977' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (120, 1, N'تم إدخال طلب جديد, رقم الطلب:35
', CAST(N'2018-12-25T20:19:07.080' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (121, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:35', CAST(N'2018-12-25T20:19:08.753' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (122, 2, N'تم إدخال طلب جديد, رقم الطلب:35
', CAST(N'2018-12-25T20:19:10.447' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (123, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:36', CAST(N'2018-12-25T20:24:11.707' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (124, 1, N'تم إدخال طلب جديد, رقم الطلب:36
', CAST(N'2018-12-25T20:24:11.813' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (125, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:36', CAST(N'2018-12-25T20:24:13.423' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (126, 2, N'تم إدخال طلب جديد, رقم الطلب:36
', CAST(N'2018-12-25T20:24:15.013' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (127, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:37', CAST(N'2018-12-25T20:35:06.550' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (128, 1, N'تم إدخال طلب جديد, رقم الطلب:37
', CAST(N'2018-12-25T20:35:06.687' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (129, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:37', CAST(N'2018-12-25T20:35:08.403' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (130, 2, N'تم إدخال طلب جديد, رقم الطلب:37
', CAST(N'2018-12-25T20:35:10.103' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (131, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:40', CAST(N'2018-12-26T09:12:01.700' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (132, 1, N'تم إدخال طلب جديد, رقم الطلب:40
', CAST(N'2018-12-26T09:12:01.793' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (133, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:40', CAST(N'2018-12-26T09:12:03.727' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (134, 2, N'تم إدخال طلب جديد, رقم الطلب:40
', CAST(N'2018-12-26T09:12:05.537' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (135, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:41', CAST(N'2018-12-26T09:23:02.133' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (136, 1, N'تم إدخال طلب جديد, رقم الطلب:41
', CAST(N'2018-12-26T09:23:02.227' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (137, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:41', CAST(N'2018-12-26T09:23:03.923' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (138, 2, N'تم إدخال طلب جديد, رقم الطلب:41
', CAST(N'2018-12-26T09:23:05.693' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (139, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 41	', CAST(N'2018-12-26T09:26:24.110' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (140, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 41', CAST(N'2018-12-26T09:26:24.207' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (141, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 41	', CAST(N'2018-12-26T09:26:25.917' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (142, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 41', CAST(N'2018-12-26T09:26:27.753' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (143, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 41', CAST(N'2018-12-26T09:29:41.357' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (144, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 41', CAST(N'2018-12-26T09:29:41.487' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (145, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 41', CAST(N'2018-12-26T09:29:43.197' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (146, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 41', CAST(N'2018-12-26T09:29:44.903' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (147, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 41', CAST(N'2018-12-26T10:04:15.157' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (148, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 41', CAST(N'2018-12-26T10:04:15.270' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (149, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 41', CAST(N'2018-12-26T10:04:17.047' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (150, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 41', CAST(N'2018-12-26T10:04:18.830' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (151, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:42', CAST(N'2018-12-26T10:13:49.470' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (152, 1, N'تم إدخال طلب جديد, رقم الطلب:42
', CAST(N'2018-12-26T10:13:49.767' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (153, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:42', CAST(N'2018-12-26T10:13:51.503' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (154, 2, N'تم إدخال طلب جديد, رقم الطلب:42
', CAST(N'2018-12-26T10:13:53.197' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (155, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:43', CAST(N'2018-12-26T10:48:55.307' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (156, 1, N'تم إدخال طلب جديد, رقم الطلب:43
', CAST(N'2018-12-26T10:48:55.413' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (157, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:43', CAST(N'2018-12-26T10:48:57.180' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (158, 2, N'تم إدخال طلب جديد, رقم الطلب:43
', CAST(N'2018-12-26T10:48:58.817' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (159, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 43	', CAST(N'2018-12-26T10:49:32.153' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (160, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 43', CAST(N'2018-12-26T10:49:32.257' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (161, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 43	', CAST(N'2018-12-26T10:49:34.010' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (162, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 43', CAST(N'2018-12-26T10:49:35.737' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (163, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 43', CAST(N'2018-12-26T10:54:18.967' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (164, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 43', CAST(N'2018-12-26T10:54:19.107' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (165, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 43', CAST(N'2018-12-26T10:54:20.857' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (166, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 43', CAST(N'2018-12-26T10:54:22.557' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (167, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:44', CAST(N'2018-12-26T11:08:03.423' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (168, 1, N'تم إدخال طلب جديد, رقم الطلب:44
', CAST(N'2018-12-26T11:08:03.540' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (169, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:44', CAST(N'2018-12-26T11:08:05.270' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (170, 2, N'تم إدخال طلب جديد, رقم الطلب:44
', CAST(N'2018-12-26T11:08:06.947' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (171, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:45', CAST(N'2018-12-26T11:09:10.557' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (172, 1, N'تم إدخال طلب جديد, رقم الطلب:45
', CAST(N'2018-12-26T11:09:10.693' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (173, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:45', CAST(N'2018-12-26T11:09:12.413' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (174, 2, N'تم إدخال طلب جديد, رقم الطلب:45
', CAST(N'2018-12-26T11:09:14.240' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (175, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:47', CAST(N'2018-12-26T11:22:14.833' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (176, 1, N'تم إدخال طلب جديد, رقم الطلب:47
', CAST(N'2018-12-26T11:22:14.947' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (177, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:47', CAST(N'2018-12-26T11:22:16.737' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (178, 2, N'تم إدخال طلب جديد, رقم الطلب:47
', CAST(N'2018-12-26T11:22:18.577' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (179, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:48', CAST(N'2018-12-26T11:35:27.687' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (180, 1, N'تم إدخال طلب جديد, رقم الطلب:48
', CAST(N'2018-12-26T11:35:27.790' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (181, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:48', CAST(N'2018-12-26T11:35:29.513' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (182, 2, N'تم إدخال طلب جديد, رقم الطلب:48
', CAST(N'2018-12-26T11:35:31.323' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (183, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:49', CAST(N'2018-12-26T11:38:07.197' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (184, 1, N'تم إدخال طلب جديد, رقم الطلب:49
', CAST(N'2018-12-26T11:38:07.317' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (185, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:49', CAST(N'2018-12-26T11:38:09.090' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (186, 2, N'تم إدخال طلب جديد, رقم الطلب:49
', CAST(N'2018-12-26T11:38:10.867' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (187, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 49	', CAST(N'2018-12-26T11:39:07.597' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (188, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 49', CAST(N'2018-12-26T11:39:07.713' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (189, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 49	', CAST(N'2018-12-26T11:39:09.447' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (190, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 49', CAST(N'2018-12-26T11:39:11.103' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (191, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:50', CAST(N'2018-12-26T11:47:17.553' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (192, 1, N'تم إدخال طلب جديد, رقم الطلب:50
', CAST(N'2018-12-26T11:47:17.657' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (193, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:50', CAST(N'2018-12-26T11:47:19.450' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (194, 2, N'تم إدخال طلب جديد, رقم الطلب:50
', CAST(N'2018-12-26T11:47:21.127' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (195, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 50	', CAST(N'2018-12-26T11:48:03.520' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (196, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 50', CAST(N'2018-12-26T11:48:03.643' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (197, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 50	', CAST(N'2018-12-26T11:48:05.393' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (198, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 50', CAST(N'2018-12-26T11:48:07.120' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (199, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:51', CAST(N'2018-12-26T12:56:28.157' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (200, 1, N'تم إدخال طلب جديد, رقم الطلب:51
', CAST(N'2018-12-26T12:56:28.273' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (201, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:51', CAST(N'2018-12-26T12:56:30.020' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (202, 2, N'تم إدخال طلب جديد, رقم الطلب:51
', CAST(N'2018-12-26T12:56:31.733' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (203, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:48', CAST(N'2018-12-26T13:10:57.167' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (204, 1, N'تم إدخال طلب جديد, رقم الطلب:48
', CAST(N'2018-12-26T13:10:57.287' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (205, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:48', CAST(N'2018-12-26T13:10:59.107' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (206, 2, N'تم إدخال طلب جديد, رقم الطلب:48
', CAST(N'2018-12-26T13:11:00.717' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (207, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 48	', CAST(N'2018-12-26T13:11:53.967' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (208, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 48', CAST(N'2018-12-26T13:11:54.087' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (209, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 48	', CAST(N'2018-12-26T13:11:55.827' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (210, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 48', CAST(N'2018-12-26T13:11:57.647' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (211, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:52', CAST(N'2018-12-26T13:16:12.703' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (212, 1, N'تم إدخال طلب جديد, رقم الطلب:52
', CAST(N'2018-12-26T13:16:12.870' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (213, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:52', CAST(N'2018-12-26T13:16:14.547' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (214, 2, N'تم إدخال طلب جديد, رقم الطلب:52
', CAST(N'2018-12-26T13:16:16.333' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (215, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 52	', CAST(N'2018-12-26T13:16:45.180' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (216, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 52', CAST(N'2018-12-26T13:16:45.290' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (217, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 52	', CAST(N'2018-12-26T13:16:47.073' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (218, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 52', CAST(N'2018-12-26T13:16:48.923' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (219, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:52', CAST(N'2018-12-26T13:19:54.987' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (220, 1, N'تم إدخال طلب جديد, رقم الطلب:52
', CAST(N'2018-12-26T13:19:55.113' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (221, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:52', CAST(N'2018-12-26T13:19:56.873' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (222, 2, N'تم إدخال طلب جديد, رقم الطلب:52
', CAST(N'2018-12-26T13:19:58.743' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (223, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 52	', CAST(N'2018-12-26T13:20:14.317' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (224, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 52', CAST(N'2018-12-26T13:20:14.423' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (225, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 52	', CAST(N'2018-12-26T13:20:16.130' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (226, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 52', CAST(N'2018-12-26T13:20:17.817' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (227, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:53', CAST(N'2018-12-26T13:57:50.417' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (228, 1, N'تم إدخال طلب جديد, رقم الطلب:53
', CAST(N'2018-12-26T13:57:50.533' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (229, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:53', CAST(N'2018-12-26T13:57:52.227' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (230, 2, N'تم إدخال طلب جديد, رقم الطلب:53
', CAST(N'2018-12-26T13:57:53.987' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (231, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:54', CAST(N'2018-12-26T14:02:06.190' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (232, 1, N'تم إدخال طلب جديد, رقم الطلب:54
', CAST(N'2018-12-26T14:02:06.313' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (233, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:54', CAST(N'2018-12-26T14:02:07.980' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (234, 2, N'تم إدخال طلب جديد, رقم الطلب:54
', CAST(N'2018-12-26T14:02:09.730' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (235, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 54	', CAST(N'2018-12-26T14:04:22.550' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (236, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 54', CAST(N'2018-12-26T14:04:22.800' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (237, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 54	', CAST(N'2018-12-26T14:04:24.577' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (238, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 54', CAST(N'2018-12-26T14:04:26.217' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (239, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:55', CAST(N'2018-12-26T14:14:16.747' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (240, 1, N'تم إدخال طلب جديد, رقم الطلب:55
', CAST(N'2018-12-26T14:14:16.883' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (241, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:55', CAST(N'2018-12-26T14:14:18.623' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (242, 2, N'تم إدخال طلب جديد, رقم الطلب:55
', CAST(N'2018-12-26T14:14:20.387' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (243, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:56', CAST(N'2018-12-26T14:38:04.113' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (244, 1, N'تم إدخال طلب جديد, رقم الطلب:56
', CAST(N'2018-12-26T14:38:04.283' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (245, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:56', CAST(N'2018-12-26T14:38:06.060' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (246, 2, N'تم إدخال طلب جديد, رقم الطلب:56
', CAST(N'2018-12-26T14:38:07.757' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (247, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 56', CAST(N'2018-12-26T14:44:09.983' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (248, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 56', CAST(N'2018-12-26T14:44:17.087' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (249, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 56', CAST(N'2018-12-26T14:44:19.023' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (250, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 56', CAST(N'2018-12-26T14:44:20.673' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (251, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 56', CAST(N'2018-12-26T14:48:59.837' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (252, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 56', CAST(N'2018-12-26T14:48:59.963' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (253, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 56', CAST(N'2018-12-26T14:49:01.837' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (254, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 56', CAST(N'2018-12-26T14:49:03.640' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (255, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:57', CAST(N'2018-12-26T15:10:21.337' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (256, 1, N'تم إدخال طلب جديد, رقم الطلب:57
', CAST(N'2018-12-26T15:10:21.443' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (257, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:57', CAST(N'2018-12-26T15:10:23.363' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (258, 2, N'تم إدخال طلب جديد, رقم الطلب:57
', CAST(N'2018-12-26T15:10:25.060' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (259, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 57	', CAST(N'2018-12-26T15:10:57.257' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (260, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 57', CAST(N'2018-12-26T15:10:57.373' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (261, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 57	', CAST(N'2018-12-26T15:10:59.133' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (262, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 57', CAST(N'2018-12-26T15:11:00.833' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (263, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 57', CAST(N'2018-12-26T15:11:53.900' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (264, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 57', CAST(N'2018-12-26T15:11:54.007' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (265, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 57', CAST(N'2018-12-26T15:11:55.850' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (266, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 57', CAST(N'2018-12-26T15:11:57.610' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (267, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:58', CAST(N'2018-12-26T15:15:22.013' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (268, 1, N'تم إدخال طلب جديد, رقم الطلب:58
', CAST(N'2018-12-26T15:15:22.127' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (269, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:58', CAST(N'2018-12-26T15:15:24.013' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (270, 2, N'تم إدخال طلب جديد, رقم الطلب:58
', CAST(N'2018-12-26T15:15:25.757' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (271, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 58	', CAST(N'2018-12-26T15:16:12.730' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (272, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 58', CAST(N'2018-12-26T15:16:15.333' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (273, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 58	', CAST(N'2018-12-26T15:16:17.057' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (274, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 58', CAST(N'2018-12-26T15:16:18.767' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (275, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 58', CAST(N'2018-12-26T15:17:12.147' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (276, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 58', CAST(N'2018-12-26T15:17:12.253' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (277, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 58', CAST(N'2018-12-26T15:17:13.960' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (278, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 58', CAST(N'2018-12-26T15:17:15.810' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (279, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:58', CAST(N'2018-12-26T15:29:13.060' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (280, 1, N'تم إدخال طلب جديد, رقم الطلب:58
', CAST(N'2018-12-26T15:29:13.170' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (281, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:58', CAST(N'2018-12-26T15:29:14.933' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (282, 2, N'تم إدخال طلب جديد, رقم الطلب:58
', CAST(N'2018-12-26T15:29:16.583' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (283, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 58	', CAST(N'2018-12-26T15:29:24.363' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (284, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 58', CAST(N'2018-12-26T15:29:24.473' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (285, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 58	', CAST(N'2018-12-26T15:29:26.300' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (286, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 58', CAST(N'2018-12-26T15:29:28.160' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (287, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 58', CAST(N'2018-12-26T15:29:58.260' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (288, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 58', CAST(N'2018-12-26T15:29:58.370' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (289, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 58', CAST(N'2018-12-26T15:30:00.047' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (290, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 58', CAST(N'2018-12-26T15:30:01.840' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (291, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:60', CAST(N'2018-12-26T22:10:00.143' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (292, 1, N'تم إدخال طلب جديد, رقم الطلب:60
', CAST(N'2018-12-26T22:10:00.277' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (293, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:60', CAST(N'2018-12-26T22:10:02.090' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (294, 2, N'تم إدخال طلب جديد, رقم الطلب:60
', CAST(N'2018-12-26T22:10:03.793' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (295, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:61', CAST(N'2018-12-26T22:10:31.507' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (296, 1, N'تم إدخال طلب جديد, رقم الطلب:61
', CAST(N'2018-12-26T22:10:31.627' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (297, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:61', CAST(N'2018-12-26T22:10:33.233' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (298, 2, N'تم إدخال طلب جديد, رقم الطلب:61
', CAST(N'2018-12-26T22:10:34.890' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (299, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:62', CAST(N'2018-12-26T22:11:54.560' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (300, 1, N'تم إدخال طلب جديد, رقم الطلب:62
', CAST(N'2018-12-26T22:11:54.660' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (301, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:62', CAST(N'2018-12-26T22:11:56.277' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (302, 2, N'تم إدخال طلب جديد, رقم الطلب:62
', CAST(N'2018-12-26T22:11:57.933' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (303, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:63', CAST(N'2018-12-26T22:22:21.713' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (304, 1, N'تم إدخال طلب جديد, رقم الطلب:63
', CAST(N'2018-12-26T22:22:21.953' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (305, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:63', CAST(N'2018-12-26T22:22:23.647' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (306, 2, N'تم إدخال طلب جديد, رقم الطلب:63
', CAST(N'2018-12-26T22:22:25.230' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (307, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:64', CAST(N'2018-12-27T06:15:17.690' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (308, 1, N'تم إدخال طلب جديد, رقم الطلب:64
', CAST(N'2018-12-27T06:15:17.793' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (309, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:64', CAST(N'2018-12-27T06:15:19.450' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (310, 2, N'تم إدخال طلب جديد, رقم الطلب:64
', CAST(N'2018-12-27T06:15:21.130' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (311, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 64', CAST(N'2018-12-27T06:15:49.040' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (312, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 64', CAST(N'2018-12-27T06:15:49.137' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (313, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 64', CAST(N'2018-12-27T06:15:50.830' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (314, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 64', CAST(N'2018-12-27T06:15:52.423' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (315, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:65', CAST(N'2018-12-27T09:11:03.637' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (316, 1, N'تم إدخال طلب جديد, رقم الطلب:65
', CAST(N'2018-12-27T09:11:03.760' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (317, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:65', CAST(N'2018-12-27T09:11:05.473' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (318, 2, N'تم إدخال طلب جديد, رقم الطلب:65
', CAST(N'2018-12-27T09:11:07.190' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (319, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 65', CAST(N'2018-12-27T09:11:54.870' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (320, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 65', CAST(N'2018-12-27T09:11:54.983' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (321, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 65', CAST(N'2018-12-27T09:11:56.650' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (322, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 65', CAST(N'2018-12-27T09:11:58.347' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (323, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 65	', CAST(N'2018-12-27T09:12:02.457' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (324, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 65', CAST(N'2018-12-27T09:12:02.573' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (325, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 65	', CAST(N'2018-12-27T09:12:04.287' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (326, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 65', CAST(N'2018-12-27T09:12:05.940' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (327, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:66', CAST(N'2018-12-27T09:36:44.333' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (328, 1, N'تم إدخال طلب جديد, رقم الطلب:66
', CAST(N'2018-12-27T09:36:44.683' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (329, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:66', CAST(N'2018-12-27T09:36:46.487' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (330, 2, N'تم إدخال طلب جديد, رقم الطلب:66
', CAST(N'2018-12-27T09:36:48.140' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (331, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:67', CAST(N'2018-12-27T09:45:06.747' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (332, 1, N'تم إدخال طلب جديد, رقم الطلب:67
', CAST(N'2018-12-27T09:45:07.153' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (333, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:67', CAST(N'2018-12-27T09:45:08.927' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (334, 2, N'تم إدخال طلب جديد, رقم الطلب:67
', CAST(N'2018-12-27T09:45:10.557' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (335, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 67	', CAST(N'2018-12-27T09:46:48.260' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (336, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 67', CAST(N'2018-12-27T09:46:48.370' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (337, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 67	', CAST(N'2018-12-27T09:46:50.160' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (338, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 67', CAST(N'2018-12-27T09:46:51.887' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (339, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:68', CAST(N'2018-12-27T09:52:31.740' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (340, 1, N'تم إدخال طلب جديد, رقم الطلب:68
', CAST(N'2018-12-27T09:52:33.190' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (341, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:68', CAST(N'2018-12-27T09:52:34.860' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (342, 2, N'تم إدخال طلب جديد, رقم الطلب:68
', CAST(N'2018-12-27T09:52:36.520' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (343, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:69', CAST(N'2018-12-27T09:57:41.180' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (344, 1, N'تم إدخال طلب جديد, رقم الطلب:69
', CAST(N'2018-12-27T09:57:41.287' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (345, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:69', CAST(N'2018-12-27T09:57:43.003' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (346, 2, N'تم إدخال طلب جديد, رقم الطلب:69
', CAST(N'2018-12-27T09:57:44.687' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (347, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:70', CAST(N'2018-12-31T11:35:55.100' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (348, 1, N'تم إدخال طلب جديد, رقم الطلب:70
', CAST(N'2018-12-31T11:35:55.233' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (349, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:70', CAST(N'2018-12-31T11:35:56.877' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (350, 2, N'تم إدخال طلب جديد, رقم الطلب:70
', CAST(N'2018-12-31T11:35:58.570' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (351, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 70	', CAST(N'2018-12-31T11:36:25.923' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (352, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 70', CAST(N'2018-12-31T11:36:26.050' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (353, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 70	', CAST(N'2018-12-31T11:36:27.643' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (354, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 70', CAST(N'2018-12-31T11:36:29.237' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (355, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 68', CAST(N'2019-01-01T21:37:38.123' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (356, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 68', CAST(N'2019-01-01T21:37:38.237' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (357, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 68', CAST(N'2019-01-01T21:37:39.887' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (358, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 68', CAST(N'2019-01-01T21:37:41.373' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (359, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 70', CAST(N'2019-01-01T21:39:44.563' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (360, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 70', CAST(N'2019-01-01T21:39:44.667' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (361, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 70', CAST(N'2019-01-01T21:39:46.317' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (362, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 70', CAST(N'2019-01-01T21:39:47.917' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (363, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:71', CAST(N'2019-01-01T22:04:29.017' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (364, 1, N'تم إدخال طلب جديد, رقم الطلب:71
', CAST(N'2019-01-01T22:04:29.133' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (365, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:71', CAST(N'2019-01-01T22:04:31.037' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (366, 2, N'تم إدخال طلب جديد, رقم الطلب:71
', CAST(N'2019-01-01T22:04:32.620' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (367, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:72', CAST(N'2019-01-02T11:58:18.333' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (368, 1, N'تم إدخال طلب جديد, رقم الطلب:72
', CAST(N'2019-01-02T11:58:18.437' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (369, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:72', CAST(N'2019-01-02T11:58:21.157' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (370, 2, N'تم إدخال طلب جديد, رقم الطلب:72
', CAST(N'2019-01-02T11:58:22.900' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (371, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 72	', CAST(N'2019-01-02T11:59:09.177' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (372, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 72', CAST(N'2019-01-02T11:59:09.287' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (373, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 72	', CAST(N'2019-01-02T11:59:10.927' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (374, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 72', CAST(N'2019-01-02T11:59:12.550' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (375, 1, N'لقد تم تعيين طلب عليك : رقم الطلب 72	', CAST(N'2019-01-02T12:00:59.303' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (376, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 70	', CAST(N'2019-01-02T12:36:12.240' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (377, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 70', CAST(N'2019-01-02T12:36:12.360' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (378, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 70	', CAST(N'2019-01-02T12:36:14.080' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (379, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 70', CAST(N'2019-01-02T12:36:15.820' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (380, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:73', CAST(N'2019-01-02T12:48:26.500' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (381, 1, N'تم إدخال طلب جديد, رقم الطلب:73
', CAST(N'2019-01-02T12:48:26.610' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (382, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:73', CAST(N'2019-01-02T12:48:28.283' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (383, 2, N'تم إدخال طلب جديد, رقم الطلب:73
', CAST(N'2019-01-02T12:48:29.900' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (384, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 73	', CAST(N'2019-01-02T12:49:34.367' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (385, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 73', CAST(N'2019-01-02T12:49:34.467' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (386, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 73	', CAST(N'2019-01-02T12:49:36.173' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (387, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 73', CAST(N'2019-01-02T12:49:37.827' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (388, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 73', CAST(N'2019-01-02T12:49:43.777' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (389, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 73', CAST(N'2019-01-02T12:49:43.933' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (390, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 73', CAST(N'2019-01-02T12:49:45.597' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (391, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 73', CAST(N'2019-01-02T12:49:47.413' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (392, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:74', CAST(N'2019-01-03T10:39:22.377' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (393, 1, N'تم إدخال طلب جديد, رقم الطلب:74
', CAST(N'2019-01-03T10:39:22.520' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (394, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:74', CAST(N'2019-01-03T10:39:24.627' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (395, 2, N'تم إدخال طلب جديد, رقم الطلب:74
', CAST(N'2019-01-03T10:39:26.223' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (396, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 69', CAST(N'2019-01-06T09:37:32.667' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (397, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 69', CAST(N'2019-01-06T09:37:32.800' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (398, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 69', CAST(N'2019-01-06T09:37:34.357' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (399, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 69', CAST(N'2019-01-06T09:37:36.013' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (400, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 66	', CAST(N'2019-01-06T12:22:35.117' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (401, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 66', CAST(N'2019-01-06T12:22:35.227' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (402, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 66	', CAST(N'2019-01-06T12:22:37.077' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (403, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 66', CAST(N'2019-01-06T12:22:38.657' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (404, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:75', CAST(N'2019-01-06T12:24:24.140' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (405, 1, N'تم إدخال طلب جديد, رقم الطلب:75
', CAST(N'2019-01-06T12:24:24.277' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (406, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:75', CAST(N'2019-01-06T12:24:25.863' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (407, 2, N'تم إدخال طلب جديد, رقم الطلب:75
', CAST(N'2019-01-06T12:24:27.530' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (408, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:68', CAST(N'2019-01-06T12:26:02.080' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (409, 1, N'تم إدخال طلب جديد, رقم الطلب:68
', CAST(N'2019-01-06T12:26:02.400' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (410, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:68', CAST(N'2019-01-06T12:26:04.007' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (411, 2, N'تم إدخال طلب جديد, رقم الطلب:68
', CAST(N'2019-01-06T12:26:05.533' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (412, 1, N'لقد تم تعيين طلب عليك : رقم الطلب 73	', CAST(N'2019-01-09T10:17:57.103' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (413, 1, N'لقد تم تعيين طلب عليك : رقم الطلب 66	', CAST(N'2019-01-09T10:18:28.747' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (414, 1, N'لقد تم تعيين طلب عليك : رقم الطلب 64	', CAST(N'2019-01-09T10:19:44.923' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (415, 1, N'لقد تم تعيين طلب عليك : رقم الطلب 65	', CAST(N'2019-01-09T10:23:33.177' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (416, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 65', CAST(N'2019-01-09T10:23:45.297' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (417, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 65', CAST(N'2019-01-09T10:23:45.423' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (418, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 65', CAST(N'2019-01-09T10:23:47.157' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (419, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 65', CAST(N'2019-01-09T10:23:48.760' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (420, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:79', CAST(N'2019-01-13T11:17:12.913' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (421, 1, N'تم إدخال طلب جديد, رقم الطلب:79
', CAST(N'2019-01-13T11:17:13.047' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (422, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:79', CAST(N'2019-01-13T11:17:15.230' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (423, 2, N'تم إدخال طلب جديد, رقم الطلب:79
', CAST(N'2019-01-13T11:17:16.950' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (424, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 75	', CAST(N'2019-01-17T11:45:01.033' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (425, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 75', CAST(N'2019-01-17T11:45:01.157' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (426, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 75	', CAST(N'2019-01-17T11:45:02.737' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (427, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 75', CAST(N'2019-01-17T11:45:04.377' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (428, 1, N'لقد تم التعامل مع الطلب ، حالة الطلب:
تم الاستلام
 رقم الطلب: 82', CAST(N'2019-01-21T16:27:11.350' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (429, 2, N'لقد تم التعامل مع الطلب ، حالة الطلب:
تم الاستلام
 رقم الطلب: 82', CAST(N'2019-01-21T16:27:13.313' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (430, 1, N'لقد تم التعامل مع الطلب ، حالة الطلب:
تم الاستلام
 رقم الطلب: 87', CAST(N'2019-01-21T16:28:16.840' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (431, 2, N'لقد تم التعامل مع الطلب ، حالة الطلب:
تم الاستلام
 رقم الطلب: 87', CAST(N'2019-01-21T16:28:18.540' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (432, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 88	', CAST(N'2019-01-21T16:31:09.003' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (433, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 88', CAST(N'2019-01-21T16:31:09.117' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (434, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 88	', CAST(N'2019-01-21T16:31:10.813' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (435, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 88', CAST(N'2019-01-21T16:31:12.447' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (436, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 89	', CAST(N'2019-01-21T16:43:10.253' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (437, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 89', CAST(N'2019-01-21T16:43:10.360' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (438, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 89	', CAST(N'2019-01-21T16:43:12.157' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (439, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 89', CAST(N'2019-01-21T16:43:13.823' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (440, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 68	', CAST(N'2019-01-21T16:45:57.787' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (441, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 68', CAST(N'2019-01-21T16:45:57.907' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (442, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 68	', CAST(N'2019-01-21T16:45:59.557' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (443, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 68', CAST(N'2019-01-21T16:46:01.213' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (444, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 84	', CAST(N'2019-01-21T16:47:57.320' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (445, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 84', CAST(N'2019-01-21T16:47:57.427' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (446, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 84	', CAST(N'2019-01-21T16:47:59.037' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (447, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 84', CAST(N'2019-01-21T16:48:00.737' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (448, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 46	', CAST(N'2019-01-21T16:53:44.140' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (449, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 46	', CAST(N'2019-01-21T16:53:45.877' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (450, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 89', CAST(N'2019-01-21T16:56:22.467' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (451, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 89', CAST(N'2019-01-21T16:56:22.610' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (452, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 89', CAST(N'2019-01-21T16:56:24.263' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (453, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 89', CAST(N'2019-01-21T16:56:26.217' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (454, 1, N'لقد تم التعامل مع الطلب ،
 حالة الطلب: تم الاستلام 
رقم الطلب: 90	', CAST(N'2019-01-21T17:03:09.313' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (455, 2, N'لقد تم التعامل مع الطلب ،
 حالة الطلب: تم الاستلام 
رقم الطلب: 90	', CAST(N'2019-01-21T17:03:11.137' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (456, 1, N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز
 رقم الطلب: 90	', CAST(N'2019-01-21T17:03:39.137' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (457, 2, N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز
 رقم الطلب: 90	', CAST(N'2019-01-21T17:03:40.863' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (458, 1, N'لقد تم التعامل مع الطلب ، حالة الطلب:
تم الاستلام
 رقم الطلب: 91', CAST(N'2019-01-21T17:05:45.877' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (459, 2, N'لقد تم التعامل مع الطلب ، حالة الطلب:
تم الاستلام
 رقم الطلب: 91', CAST(N'2019-01-21T17:05:47.507' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (460, 1, N'لقد تم التعامل مع الطلب ، 
حالة الطلب: غير فائز
رقم الطلب: 91', CAST(N'2019-01-21T17:06:01.370' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (461, 2, N'لقد تم التعامل مع الطلب ، 
حالة الطلب: غير فائز
رقم الطلب: 91', CAST(N'2019-01-21T17:06:03.060' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (462, 1, N'لقد تم التعامل مع الطلب ، حالة الطلب:
 فائز 
رقم الطلب: 82', CAST(N'2019-01-21T17:51:44.780' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (463, 1, N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز
 رقم الطلب: 82	', CAST(N'2019-01-21T17:51:44.907' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (464, 2, N'لقد تم التعامل مع الطلب ، حالة الطلب:
 فائز 
رقم الطلب: 82', CAST(N'2019-01-21T17:51:47.013' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (465, 2, N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز
 رقم الطلب: 82	', CAST(N'2019-01-21T17:51:48.697' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (466, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 66', CAST(N'2019-01-21T17:52:02.843' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (467, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 66', CAST(N'2019-01-21T17:52:02.967' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (468, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 66', CAST(N'2019-01-21T17:52:04.637' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (469, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 66', CAST(N'2019-01-21T17:52:06.240' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (470, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:68', CAST(N'2019-01-21T17:56:55.307' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (471, 1, N'تم إدخال طلب جديد, رقم الطلب:68
', CAST(N'2019-01-21T17:56:55.420' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (472, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:68', CAST(N'2019-01-21T17:56:57.030' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (473, 2, N'تم إدخال طلب جديد, رقم الطلب:68
', CAST(N'2019-01-21T17:56:58.693' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (474, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:89', CAST(N'2019-01-22T06:10:00.713' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (475, 1, N'تم إدخال طلب جديد, رقم الطلب:89
', CAST(N'2019-01-22T06:10:00.830' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (476, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:89', CAST(N'2019-01-22T06:10:02.657' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (477, 2, N'تم إدخال طلب جديد, رقم الطلب:89
', CAST(N'2019-01-22T06:10:04.623' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (478, 1, N'شكرًا لك، تم استلام الطلب  رقم الطلب: 82	', CAST(N'2019-01-22T10:56:23.843' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (479, 1, N'تم إدخال الطلب , رقم الطلب : 82', CAST(N'2019-01-22T10:56:23.970' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (480, 2, N'شكرًا لك، تم استلام الطلب  رقم الطلب: 82	', CAST(N'2019-01-22T10:56:25.760' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (481, 1, N'شكرًا لك، تم استلام الطلب  رقم الطلب: 82	', CAST(N'2019-01-22T10:56:26.423' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (482, 1, N'تم إدخال الطلب , رقم الطلب : 82', CAST(N'2019-01-22T10:56:26.547' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (483, 2, N'تم إدخال الطلب , رقم الطلب : 82', CAST(N'2019-01-22T10:56:27.453' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (484, 2, N'شكرًا لك، تم استلام الطلب  رقم الطلب: 82	', CAST(N'2019-01-22T10:56:28.307' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (485, 1, N'شكرًا لك، تم استلام الطلب  رقم الطلب: 82	', CAST(N'2019-01-22T10:56:29.950' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (486, 1, N'تم إدخال الطلب , رقم الطلب : 82', CAST(N'2019-01-22T10:56:30.073' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (487, 2, N'تم إدخال الطلب , رقم الطلب : 82', CAST(N'2019-01-22T10:56:30.090' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (488, 2, N'شكرًا لك، تم استلام الطلب  رقم الطلب: 82	', CAST(N'2019-01-22T10:56:31.900' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (489, 2, N'تم إدخال الطلب , رقم الطلب : 82', CAST(N'2019-01-22T10:56:33.627' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (490, 1, N'لقد تم التعامل مع الطلب ، حالة الطلب:
تم الاستلام
 رقم الطلب: 82', CAST(N'2019-01-22T10:56:41.910' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (491, 1, N'لقد تم التعامل مع الطلب ، حالة الطلب: تم الاستلام
 رقم الطلب: 82', CAST(N'2019-01-22T10:56:42.023' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (492, 2, N'لقد تم التعامل مع الطلب ، حالة الطلب:
تم الاستلام
 رقم الطلب: 82', CAST(N'2019-01-22T10:56:43.773' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (493, 2, N'لقد تم التعامل مع الطلب ، حالة الطلب: تم الاستلام
 رقم الطلب: 82', CAST(N'2019-01-22T10:56:45.573' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (494, 1, N'لقد تم التعامل مع الطلب ، حالة الطلب:
 قيد المعاينة
رقم الطلب: 82', CAST(N'2019-01-22T10:57:04.757' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (495, 1, N'لقد تم التعامل مع الطلب ، حالة الطلب: قيد المعاينة
رقم الطلب: 82', CAST(N'2019-01-22T10:57:04.867' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (496, 2, N'لقد تم التعامل مع الطلب ، حالة الطلب:
 قيد المعاينة
رقم الطلب: 82', CAST(N'2019-01-22T10:57:06.627' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (497, 2, N'لقد تم التعامل مع الطلب ، حالة الطلب: قيد المعاينة
رقم الطلب: 82', CAST(N'2019-01-22T10:57:08.443' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (498, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:92', CAST(N'2019-01-22T11:39:27.360' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (499, 1, N'تم إدخال طلب جديد, رقم الطلب:92
', CAST(N'2019-01-22T11:39:28.787' AS DateTime), N'', 1, NULL)
GO
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (500, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:92', CAST(N'2019-01-22T11:39:30.537' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (501, 2, N'تم إدخال طلب جديد, رقم الطلب:92
', CAST(N'2019-01-22T11:39:32.470' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (502, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:93', CAST(N'2019-01-26T19:54:02.317' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (503, 1, N'تم إدخال طلب جديد, رقم الطلب:93
', CAST(N'2019-01-26T19:54:02.427' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (504, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:93', CAST(N'2019-01-26T19:54:04.160' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (505, 2, N'تم إدخال طلب جديد, رقم الطلب:93
', CAST(N'2019-01-26T19:54:05.857' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (506, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 93	', CAST(N'2019-01-29T16:02:37.363' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (507, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 93', CAST(N'2019-01-29T16:02:37.477' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (508, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 93	', CAST(N'2019-01-29T16:02:39.140' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (509, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 93', CAST(N'2019-01-29T16:02:40.873' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (510, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:94', CAST(N'2019-01-31T10:03:04.867' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (511, 1, N'تم إدخال طلب جديد, رقم الطلب:94
', CAST(N'2019-01-31T10:03:04.987' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (512, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:94', CAST(N'2019-01-31T10:03:06.747' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (513, 2, N'تم إدخال طلب جديد, رقم الطلب:94
', CAST(N'2019-01-31T10:03:08.390' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (514, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:95', CAST(N'2019-01-31T11:15:33.013' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (515, 1, N'تم إدخال طلب جديد, رقم الطلب:95
', CAST(N'2019-01-31T11:15:33.143' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (516, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:96', CAST(N'2019-01-31T11:15:34.240' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (517, 1, N'تم إدخال طلب جديد, رقم الطلب:96
', CAST(N'2019-01-31T11:15:34.493' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (518, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:95', CAST(N'2019-01-31T11:15:35.027' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (519, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:96', CAST(N'2019-01-31T11:15:36.430' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (520, 2, N'تم إدخال طلب جديد, رقم الطلب:95
', CAST(N'2019-01-31T11:15:37.360' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (521, 2, N'تم إدخال طلب جديد, رقم الطلب:96
', CAST(N'2019-01-31T11:15:38.373' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (522, 1, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:97', CAST(N'2019-01-31T11:16:51.713' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (523, 1, N'تم إدخال طلب جديد, رقم الطلب:97
', CAST(N'2019-01-31T11:16:51.840' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (524, 2, N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:97', CAST(N'2019-01-31T11:16:53.883' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (525, 2, N'تم إدخال طلب جديد, رقم الطلب:97
', CAST(N'2019-01-31T11:16:55.743' AS DateTime), N'', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (526, 1, N'لقد تم التعامل مع الطلب ،
 حالة الطلب: تم الاستلام 
رقم الطلب: 86	', CAST(N'2019-01-31T11:23:20.970' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (527, 2, N'لقد تم التعامل مع الطلب ،
 حالة الطلب: تم الاستلام 
رقم الطلب: 86	', CAST(N'2019-01-31T11:23:22.667' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (528, 1, N'لقد تم التعامل مع الطلب ،
 حالة الطلب: قيد المعاينة
 رقم الطلب: 86	', CAST(N'2019-01-31T11:23:22.910' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (529, 1, N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز
 رقم الطلب: 86	', CAST(N'2019-01-31T11:23:24.373' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (530, 2, N'لقد تم التعامل مع الطلب ،
 حالة الطلب: قيد المعاينة
 رقم الطلب: 86	', CAST(N'2019-01-31T11:23:24.563' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (531, 2, N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز
 رقم الطلب: 86	', CAST(N'2019-01-31T11:23:26.127' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (532, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 97', CAST(N'2019-03-07T14:19:47.993' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (533, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 97', CAST(N'2019-03-07T14:19:48.133' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (534, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 97', CAST(N'2019-03-07T14:19:48.267' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (535, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 97', CAST(N'2019-03-07T14:19:48.373' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (536, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 97', CAST(N'2019-03-07T14:19:48.587' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (537, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 97', CAST(N'2019-03-07T14:19:49.950' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (538, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 97', CAST(N'2019-03-07T14:19:49.963' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (539, 1, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 97	', CAST(N'2019-03-07T14:19:49.980' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (540, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 97', CAST(N'2019-03-07T14:19:50.220' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (541, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 97', CAST(N'2019-03-07T14:19:50.260' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (542, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 97', CAST(N'2019-03-07T14:19:50.530' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (543, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 97', CAST(N'2019-03-07T14:19:51.057' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (544, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 97', CAST(N'2019-03-07T14:19:51.893' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (545, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 97', CAST(N'2019-03-07T14:19:52.190' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (546, 2, N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 97	', CAST(N'2019-03-07T14:19:52.647' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (547, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : 97', CAST(N'2019-03-07T14:19:53.407' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (548, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : 97', CAST(N'2019-03-07T14:19:53.843' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (549, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : 97', CAST(N'2019-03-07T14:19:54.643' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (550, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 97', CAST(N'2019-03-07T14:19:54.953' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (551, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : 97', CAST(N'2019-03-07T14:19:55.610' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (552, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 8', CAST(N'2019-03-18T13:23:55.580' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (553, 1, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 8', CAST(N'2019-03-18T13:23:57.317' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (554, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 8', CAST(N'2019-03-18T13:23:59.243' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[CommunicationLogs] ([Id], [TypeId], [LogText], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (555, 2, N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : 8', CAST(N'2019-03-18T13:24:01.233' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[CommunicationLogs] OFF
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Address], [Message], [InsertDate], [Mobile], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, N'muhammad majdalawi', N'muhammad.maj@gmail', N'', N'لبلبل', CAST(N'2019-01-26T18:54:02.417' AS DateTime), N'434343', CAST(N'2019-01-26T18:54:02.413' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Address], [Message], [InsertDate], [Mobile], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, N'sdfs', N'fiar@gmail.com', N'', N'trest', CAST(N'2019-03-14T12:26:37.407' AS DateTime), N'3433434', CAST(N'2019-03-14T12:26:37.407' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Mobile], [Address], [Language], [Website], [Status]) VALUES (1, N'Test', N'fiar@gmail.com', N'123123', N'123213213', N'ramallah', N'arabic', N'no', 2)
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Mobile], [Address], [Language], [Website], [Status]) VALUES (2, N'Test#2', N'', NULL, N'111111', NULL, NULL, NULL, 3)
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Mobile], [Address], [Language], [Website], [Status]) VALUES (3, N'Test#3', N'', NULL, N'33333', NULL, NULL, NULL, 2)
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Mobile], [Address], [Language], [Website], [Status]) VALUES (4, N'firas', N'firas@mail.com', N'2323244', N'66666', N'aaa', N'arabic', N'no website ', 1)
SET IDENTITY_INSERT [dbo].[DetailsLookup] ON 

INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (1, 1, CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (2, 1, CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (3, 2, CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (4, 2, CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (9, 6, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (10, 6, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (11, 6, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (12, 7, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (13, 7, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (14, 7, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (15, 8, CAST(N'2018-05-19T20:52:11.933' AS DateTime), N'admin', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (16, 1, CAST(N'2018-07-03T23:37:07.483' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-08-11T12:56:48.847' AS DateTime), NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (17, 10, CAST(N'2018-08-10T22:03:10.343' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (18, 10, CAST(N'2018-08-10T22:03:18.807' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (19, 10, CAST(N'2018-08-10T22:03:31.510' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (20, 11, CAST(N'2018-08-12T19:55:31.913' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (21, 11, CAST(N'2018-08-12T19:55:38.760' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (22, 11, CAST(N'2018-08-12T19:56:21.317' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (23, 11, CAST(N'2018-08-12T19:56:30.190' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (24, 11, CAST(N'2018-08-12T19:57:19.807' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (25, 11, CAST(N'2018-08-12T19:59:21.057' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (26, 11, CAST(N'2018-08-12T19:59:38.817' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (27, 14, CAST(N'2018-08-18T15:32:10.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (28, 13, CAST(N'2018-08-18T15:32:29.647' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (29, 13, CAST(N'2018-08-18T15:32:36.467' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (30, 13, CAST(N'2018-08-18T15:32:48.977' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (31, 12, CAST(N'2018-08-18T15:33:09.903' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (32, 12, CAST(N'2018-08-18T15:33:17.020' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (33, 12, CAST(N'2018-08-18T15:33:23.553' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (34, 15, CAST(N'2018-08-22T23:11:58.293' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (35, 15, CAST(N'2018-08-22T23:12:06.033' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (36, 15, CAST(N'2018-08-22T23:12:15.300' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (37, 15, CAST(N'2018-08-22T23:12:29.850' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (38, 15, CAST(N'2018-08-22T23:12:47.133' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (39, 15, CAST(N'2018-08-22T23:12:52.553' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (40, 15, CAST(N'2018-08-23T14:26:58.000' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (41, 14, CAST(N'2018-08-30T22:00:13.453' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (42, 14, CAST(N'2018-08-30T22:00:35.527' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (43, 14, CAST(N'2018-08-30T22:01:01.767' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (44, 14, CAST(N'2018-08-30T22:01:18.660' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (45, 14, CAST(N'2018-08-30T22:01:33.987' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (46, 14, CAST(N'2018-08-30T22:01:45.977' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (47, 14, CAST(N'2018-08-30T22:02:03.837' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (48, 14, CAST(N'2018-08-30T22:02:19.443' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (49, 15, CAST(N'2018-09-03T22:51:52.053' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-09-03T22:52:00.573' AS DateTime), NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (50, 16, CAST(N'2018-09-14T02:06:16.533' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (51, 16, CAST(N'2018-09-14T02:06:40.043' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (52, 16, CAST(N'2018-09-14T02:06:55.717' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (53, 16, CAST(N'2018-09-14T02:07:08.423' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (54, 17, CAST(N'2018-09-15T11:58:52.023' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (55, 17, CAST(N'2018-09-15T11:59:16.443' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (56, 17, CAST(N'2018-09-15T11:59:35.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (57, 17, CAST(N'2018-09-15T12:00:24.627' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (58, 17, CAST(N'2018-09-15T12:00:41.593' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (59, 17, CAST(N'2018-09-15T12:00:50.683' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (60, 17, CAST(N'2018-09-15T12:01:01.780' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (61, 17, CAST(N'2018-09-15T12:01:12.033' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (62, 18, CAST(N'2018-09-15T12:01:59.247' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (63, 19, CAST(N'2018-09-15T12:02:14.107' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (64, 21, CAST(N'2018-09-17T18:59:06.080' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (65, 22, CAST(N'2019-01-13T09:48:39.040' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (66, 22, CAST(N'2019-01-13T09:49:14.787' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (67, 22, CAST(N'2019-01-13T09:51:22.130' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (68, 22, CAST(N'2019-01-13T09:51:40.167' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (69, 22, CAST(N'2019-01-13T09:51:49.703' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (70, 23, CAST(N'2019-01-13T09:53:58.010' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (71, 23, CAST(N'2019-01-13T09:54:12.213' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (72, 23, CAST(N'2019-01-13T09:54:28.237' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
INSERT [dbo].[DetailsLookup] ([Id], [MasterId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Code]) VALUES (73, 23, CAST(N'2019-01-13T09:54:40.897' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DetailsLookup] OFF
SET IDENTITY_INSERT [dbo].[DetailsLookupTranslation] ON 

INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (1, 1, N'ذكر', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (2, 2, N'انثى', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (3, 3, N'متزوج', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (4, 4, N'اعزب', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (9, 9, N'حيفا', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (10, 10, N'تل ابيب', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (11, 11, N'القدس', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (12, 12, N'حيفا', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (13, 13, N'تل ابيب', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (14, 14, N'القدس', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (15, 15, N'الفريديس', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (16, 16, N'test', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (17, 17, N'اللغة العربية', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (18, 18, N'اللغة العبرية', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (19, 19, N'اللغة الانجليزية', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (20, 20, N'السبت', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (21, 21, N'الاحد', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (22, 22, N'الاثنين', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (23, 23, N'الثلاثاء', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (24, 24, N'الاربعاء', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (25, 25, N'الخميس', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (26, 26, N'الجمعة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (27, 27, N'تسريب مياه', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (28, 28, N'عالية', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (29, 29, N'متوسطة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (30, 30, N'منخفضة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (31, 31, N'عالية', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (32, 32, N'متوسطة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (33, 33, N'منخفضة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (34, 34, N'جديد', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (35, 35, N'قيد التنفيذ', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (36, 36, N'مرفوض', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (37, 37, N'مكرر', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (38, 38, N'محلول', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (39, 39, N'مغلق', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (40, 40, N'غير محدد', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (41, 41, N'اعمال تخريبيّة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (42, 42, N'خلل في إنارة الشارع', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (43, 43, N'مصادر إزعاج وضجيج', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (44, 44, N'طلب لإخلاء التقليم', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (45, 45, N'آخر', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (46, 46, N'صيانة الملاجئ', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (47, 47, N'النظافة العامّة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (48, 48, N'حفرة في الشارع / الرصيف', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (49, 27, N'דליפת מים', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (50, 49, N'test', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (51, 50, N'الاسم', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (52, 51, N'رقم الهوية', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (53, 52, N'البريد الالكتروني', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (54, 53, N'الهاتف (الموبايل)', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (55, 54, N'الارنونا', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (56, 55, N'تراخيص البناء', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (57, 56, N'المعارف', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (58, 57, N'المواصلات و البنية التحتية', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (59, 58, N'تخطيط المدينة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (60, 59, N'جودة البيئة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (61, 60, N'قضايا الجمهور و استعلامات 106', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (62, 61, N'المواقف البلدية', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (63, 62, N'الوظائف', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (64, 63, N'المناقصات', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (65, 64, N'الطوارئ', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (66, 34, N'חדש', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (67, 35, N'בטיפול', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (68, 36, N'נדחה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (69, 37, N'כפילות', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (70, 38, N'טופל', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (71, 39, N'סגור', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (72, 40, N'לא מוגדר', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (73, 30, N'נמוכה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (74, 29, N'בינונית', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (75, 28, N'גובהה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (76, 33, N'נמוכה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (77, 32, N'בינונית', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (78, 31, N'גובהה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (79, 41, N'מעשה חבלה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (80, 42, N'תקלת תאורה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (81, 43, N'מקור רעש', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (82, 44, N'פינוי גזם', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (83, 47, N'נקיון כללי', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (84, 48, N'בור בכביש', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (85, 46, N'פעולות תחזוקה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (86, 50, N'שם', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (87, 51, N'מס'' ת.ז', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (88, 52, N'דוא"ל', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (89, 53, N'מס'' נייד', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (90, 65, N'جديد', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (91, 66, N'تم الاستلام', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (92, 67, N'قيد المعاينة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (93, 68, N'فائز', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (94, 69, N'غير فائز', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (95, 70, N'جديد', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (96, 71, N'تم الاستلام', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (97, 72, N'قيد المعاينة', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (98, 73, N'فائز', 1, 1)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (99, 2, N'נקבה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (100, 1, N'זכר', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (101, 65, N'חדש', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (102, 66, N'התקבל', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (103, 67, N'בטיפול', 2, 0)
GO
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (104, 68, N'זוכה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (105, 69, N'לא זוכה', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (106, 70, N'חדש', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (107, 71, N'התקבל', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (108, 72, N'בטיפול', 2, 0)
INSERT [dbo].[DetailsLookupTranslation] ([Id], [DetailsLookupId], [Value], [LanguageId], [IsDefault]) VALUES (109, 73, N'זוכה', 2, 0)
SET IDENTITY_INSERT [dbo].[DetailsLookupTranslation] OFF
SET IDENTITY_INSERT [dbo].[Leads] ON 

INSERT [dbo].[Leads] ([Id], [Name], [Address], [Email], [Phone_Number], [Status], [Created_Date], [Notes], [AssigneeId], [CampaignId]) VALUES (2, N'test', N'aaa', N'testemail@gmail.com', N'232323', 1, CAST(N'2019-05-13T13:00:14.273' AS DateTime), N'4', 2, 2)
INSERT [dbo].[Leads] ([Id], [Name], [Address], [Email], [Phone_Number], [Status], [Created_Date], [Notes], [AssigneeId], [CampaignId]) VALUES (3, N'sdfs', N'aaa', N'firas@mail.com', N'2323232', 2, CAST(N'2019-05-13T14:20:55.557' AS DateTime), NULL, 1071, 2)
INSERT [dbo].[Leads] ([Id], [Name], [Address], [Email], [Phone_Number], [Status], [Created_Date], [Notes], [AssigneeId], [CampaignId]) VALUES (4, N'1111', N'111', N'firas@mail.com', N'1111111', 3, CAST(N'2019-05-13T14:21:48.050' AS DateTime), NULL, 1053, 3)
SET IDENTITY_INSERT [dbo].[Leads] OFF
SET IDENTITY_INSERT [dbo].[Mapping_Article] ON 

INSERT [dbo].[Mapping_Article] ([Id], [TableId], [TableValue], [ArticleId], [CreatedOn], [CreatedBy], [DeletedOn]) VALUES (1, 2, 27, 1, CAST(N'2018-12-25T12:51:13.853' AS DateTime), N'salam-cs@hotmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Mapping_Article] OFF
SET IDENTITY_INSERT [dbo].[MasterLookup] ON 

INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (7, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (8, CAST(N'2018-03-31T00:00:00.000' AS DateTime), N'Integration', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (9, CAST(N'2018-07-03T23:37:23.980' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (10, CAST(N'2018-08-10T22:02:47.960' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (11, CAST(N'2018-08-12T19:54:26.943' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (12, CAST(N'2018-08-18T15:17:36.687' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (13, CAST(N'2018-08-18T15:18:00.980' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (14, CAST(N'2018-08-18T15:18:19.670' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (15, CAST(N'2018-08-22T23:11:31.173' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (16, CAST(N'2018-09-14T02:05:22.727' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (17, CAST(N'2018-09-15T11:52:13.497' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (18, CAST(N'2018-09-15T11:53:21.987' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (19, CAST(N'2018-09-15T11:53:45.477' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (20, CAST(N'2018-09-15T11:59:44.687' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-09-15T12:00:11.570' AS DateTime))
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (21, CAST(N'2018-09-17T18:58:51.730' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (22, CAST(N'2019-01-13T09:47:59.360' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[MasterLookup] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (23, CAST(N'2019-01-13T09:53:42.247' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[MasterLookup] OFF
SET IDENTITY_INSERT [dbo].[MasterLookupTranslation] ON 

INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (1, 1, N'الجنس', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (2, 2, N'الحالة الاجتماعية', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (3, 3, N'اللغة', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (6, 6, N'المحافظات', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (7, 7, N'المدن', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (8, 8, N'التجمعات', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (9, 9, N'test', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (10, 10, N'اللغات المفضلة', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (11, 11, N'ايام الاسبوع', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (12, 12, N'الشكاوي - الاهمية', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (13, 13, N'الشكاوي - الخطورة', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (14, 14, N'الشكاوي - الفئات', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (15, 15, N'الشكاوي - الحالات', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (16, 16, N'معلومات المستخدم - نوع البحث', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (17, 17, N'النماذج - الفئات', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (18, 18, N'الوظائف - الفئات', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (19, 19, N'المناقصات - الفئات', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (20, 20, N'المواصلات و البنية التحتية', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (21, 21, N'الطوارئ - الفئات', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (23, 22, N'المناقصات - الحالات', 1, 1)
INSERT [dbo].[MasterLookupTranslation] ([Id], [MasterLookupId], [Name], [LanguageId], [IsDefault]) VALUES (24, 23, N'الوظائف - الحالات', 1, 1)
SET IDENTITY_INSERT [dbo].[MasterLookupTranslation] OFF
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, N'', N'Users', N'Create', N'test', CAST(N'2018-08-14T22:57:37.310' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, N'', N'Users', N'Edit', N'Edit', CAST(N'2018-08-23T19:16:45.123' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, N'', N'Users', N'Delete', N'Delete', CAST(N'2018-08-23T19:17:01.993' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, N'', N'Users', N'View', N'View', CAST(N'2018-08-23T19:17:17.627' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (8, N'', N'Sla', N'Create', N'Create', CAST(N'2018-08-23T19:18:26.560' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (9, N'', N'Sla', N'Edit', N'Edit', CAST(N'2018-08-23T19:18:54.460' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (10, N'', N'Sla', N'Delete', N'Create', CAST(N'2018-08-23T19:19:01.267' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (11, N'', N'Sla', N'View', N'View', CAST(N'2018-08-23T19:19:11.527' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (12, N'', N'Cases', N'Create', N'Create', CAST(N'2018-08-23T19:20:24.273' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (13, N'', N'Cases', N'Edit', N'Create', CAST(N'2018-08-23T19:20:31.690' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (14, N'', N'Cases', N'Delete', N'Delete', CAST(N'2018-08-23T19:20:41.070' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (15, N'', N'Cases', N'View', N'View', CAST(N'2018-08-23T19:21:02.197' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (16, N'', N'Cases', N'Assign', N'Assign', CAST(N'2018-08-23T19:21:13.123' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (17, N'', N'Menu', N'Create', N'Create', CAST(N'2018-08-23T21:57:05.897' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (18, N'', N'Menu', N'Edit', N'Edit', CAST(N'2018-08-23T21:57:14.137' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (19, N'', N'Menu', N'Delete', N'Delete', CAST(N'2018-08-23T21:57:22.213' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (20, N'', N'Menu', N'View', N'View', CAST(N'2018-08-23T21:57:29.597' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (21, N'', N'Settings', N'Create', N'Create', CAST(N'2018-08-23T21:58:03.500' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (22, N'', N'Settings', N'Edit', N'Edit', CAST(N'2018-08-23T21:58:12.190' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (23, N'', N'Settings', N'Delete', N'Delete', CAST(N'2018-08-23T21:58:19.717' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (24, N'', N'Settings', N'View', N'View', CAST(N'2018-08-23T21:58:34.550' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (25, N'', N'Roles', N'Create', N'Create', CAST(N'2018-08-23T21:59:13.750' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (26, N'', N'Roles', N'Edit', N'Edit', CAST(N'2018-08-23T21:59:24.120' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (27, N'', N'Roles', N'Delete', N'Delete', CAST(N'2018-08-23T21:59:31.270' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (28, N'', N'Roles', N'View', N'View', CAST(N'2018-08-23T21:59:39.717' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (29, N'', N'Cases', N'Comment', N'Comment', CAST(N'2018-08-24T12:21:33.357' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (30, N'', N'ContactUs', N'View', N'View', CAST(N'2018-08-24T12:29:06.307' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (31, N'', N'ContactUs', N'Delete', N'Delete', CAST(N'2018-08-24T12:29:20.420' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (32, N'', N'ContactUs', N'Edit', N'Edit', CAST(N'2018-08-24T12:29:36.690' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (33, N'', N'Reports', N'View', N'View', CAST(N'2018-09-01T23:20:34.680' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (34, N'', N'Reports', N'ExportToExcel', N'Export To Excel', CAST(N'2018-09-01T23:21:08.063' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (35, N'', N'test', N'test', N'test', CAST(N'2018-09-04T00:36:44.947' AS DateTime), N'salam-cs@hotmail.com', 2, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (36, N'', N'PersonInformation', N'List', N'Person Information', CAST(N'2018-11-16T17:03:20.453' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (37, N'', N'PersonInformation', N'View', N'Person Information View', CAST(N'2018-11-16T17:03:48.677' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (38, N'', N'PersonInformation', N'Edit', N'Person Information Edit', CAST(N'2018-11-16T17:04:17.480' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (39, N'', N'ArticleDescription', N'View', N'Article Description', CAST(N'2018-12-10T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (40, N'', N'SMSTemplate', N'Edit', N'SMS Template', CAST(N'2018-12-10T11:03:30.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (41, N'', N'SMSTemplate', N'Delete', N'SMS Template', CAST(N'2018-12-10T11:03:40.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (42, N'', N'SMSTemplate', N'Create', N'SMS Template', CAST(N'2018-12-10T11:11:59.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (43, N'', N'SMSTemplate', N'View', N'SMS Template', CAST(N'2018-12-10T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (44, N'', N'Category', N'View', N'Category', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (45, N'', N'Category', N'Edit', N'Category', CAST(N'2018-12-13T11:03:30.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (46, N'', N'Category', N'Delete', N'Category', CAST(N'2018-12-13T11:03:40.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (47, N'', N'Category', N'Create', N'Category', CAST(N'2018-12-13T11:11:59.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (48, N'', N'Article', N'View', N'Category', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (49, N'', N'Article', N'Edit', N'Category', CAST(N'2018-12-13T11:03:30.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (50, N'', N'Article', N'Delete', N'Category', CAST(N'2018-12-13T11:03:40.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (51, N'', N'Article', N'Create', N'Category', CAST(N'2018-12-13T11:11:59.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (52, N'', N'Cases', N'ExportToExcel', N'Export to Excel', CAST(N'2018-12-10T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (54, N'', N'StateTransitions', N'View', N'Category', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (55, N'', N'StateTransitions', N'Edit', N'Category', CAST(N'2018-12-13T11:03:30.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (56, N'', N'StateTransitions', N'Delete', N'Category', CAST(N'2018-12-13T11:03:40.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (57, N'', N'StateTransitions', N'Create', N'Category', CAST(N'2018-12-13T11:11:59.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (58, N'', N'RolesPermissions', N'View', N'Category', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (59, N'', N'RolesPermissions', N'Edit', N'Category', CAST(N'2018-12-13T11:03:30.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (60, N'', N'RolesPermissions', N'Delete', N'Category', CAST(N'2018-12-13T11:03:40.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (61, N'', N'RolesPermissions', N'Create', N'Category', CAST(N'2018-12-13T11:11:59.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (62, N'', N'StateHistory', N'View', N'Category', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (63, N'', N'StateHistory', N'Edit', N'Category', CAST(N'2018-12-13T11:03:30.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (64, N'', N'StateHistory', N'Delete', N'Category', CAST(N'2018-12-13T11:03:40.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (65, N'', N'StateHistory', N'Create', N'Category', CAST(N'2018-12-13T11:11:59.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (66, N'', N'MasterLookups', N'View', N'Category', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (67, N'', N'MasterLookups', N'Edit', N'Category', CAST(N'2018-12-13T11:03:30.003' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (68, N'', N'MasterLookups', N'Delete', N'Category', CAST(N'2018-12-13T11:03:40.883' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (69, N'', N'MasterLookups', N'Create', N'Category', CAST(N'2018-12-13T11:11:59.327' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (70, N'', N'FullCaseReport', N'View', N'View', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (71, N'', N'CasesDaysByCategory', N'View', N'View', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (72, N'', N'CasesSlaByCategory', N'View', N'View', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (73, N'', N'ClosedCasesReport', N'View', N'View', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (74, N'', N'PercentageOfResolvedCase', N'View', N'View', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (75, N'', N'Cases', N'SendByEmail', N'Send by email', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[Permission] ([Id], [PageUrl], [PageName], [PermissionKey], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (76, N'', N'CasesSentAsEmail', N'View', N'Cases Sent by Email', CAST(N'2018-12-13T11:03:18.590' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[RolePermissions] ON 

INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (973, N'5', 12)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (974, N'5', 13)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (975, N'5', 15)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (976, N'5', 16)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (977, N'5', 29)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (978, N'5', 34)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (979, N'5', 33)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (980, N'5', 2)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (981, N'5', 3)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (982, N'5', 4)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (983, N'5', 5)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (992, N'2', 12)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (993, N'2', 13)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (994, N'2', 14)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (995, N'2', 15)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (996, N'2', 16)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (997, N'2', 29)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (998, N'2', 30)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (999, N'2', 31)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1000, N'2', 32)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1035, N'6', 12)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1036, N'6', 13)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1037, N'6', 15)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1038, N'6', 16)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1039, N'6', 29)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1040, N'6', 30)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1041, N'6', 32)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1042, N'6', 5)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1043, N'6', 37)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1114, N'4', 48)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1115, N'4', 49)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1116, N'4', 50)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1117, N'4', 51)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1118, N'4', 39)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1119, N'4', 12)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1120, N'4', 13)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1121, N'4', 14)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1122, N'4', 15)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1123, N'4', 16)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1124, N'4', 29)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1125, N'4', 30)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1126, N'4', 31)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1127, N'4', 32)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1128, N'4', 33)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1129, N'4', 34)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1248, N'1', 29)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1249, N'1', 71)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1250, N'1', 72)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1251, N'1', 73)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1252, N'1', 66)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1253, N'1', 67)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1254, N'1', 68)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1255, N'1', 69)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1256, N'1', 74)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1257, N'1', 26)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1258, N'1', 27)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1259, N'1', 28)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1260, N'1', 58)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1261, N'1', 59)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1262, N'1', 60)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1263, N'1', 61)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1264, N'1', 62)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1265, N'1', 63)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1266, N'1', 64)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1267, N'1', 65)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1268, N'1', 54)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1269, N'1', 55)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1270, N'1', 56)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1271, N'1', 57)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1272, N'1', 48)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1273, N'1', 50)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1274, N'1', 51)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1275, N'1', 49)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1276, N'1', 39)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1277, N'1', 12)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1278, N'1', 13)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1279, N'1', 14)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1280, N'1', 15)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1281, N'1', 16)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1282, N'1', 52)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1283, N'1', 75)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1284, N'1', 76)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1285, N'1', 44)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1286, N'1', 45)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1287, N'1', 46)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1288, N'1', 47)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1289, N'1', 30)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1290, N'1', 31)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1291, N'1', 32)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1292, N'1', 70)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1293, N'1', 17)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1294, N'1', 19)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1295, N'1', 18)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1296, N'1', 20)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1297, N'1', 36)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1298, N'1', 37)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1299, N'1', 38)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1300, N'1', 33)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1301, N'1', 34)
GO
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1302, N'1', 25)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1303, N'1', 21)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1304, N'1', 22)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1305, N'1', 24)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1306, N'1', 23)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1307, N'1', 8)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1308, N'1', 11)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1309, N'1', 10)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1310, N'1', 9)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1311, N'1', 40)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1312, N'1', 41)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1313, N'1', 42)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1314, N'1', 43)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1315, N'1', 2)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1316, N'1', 3)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1317, N'1', 4)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1318, N'1', 5)
SET IDENTITY_INSERT [dbo].[RolePermissions] OFF
SET IDENTITY_INSERT [dbo].[Sla] ON 

INSERT [dbo].[Sla] ([Id], [WorkingDaysIncludingHolidays], [HoursPerState], [NotifyBefore], [NotificationCount], [PropogateToManager], [CcAssignee], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Send_SMS_Citizen], [Send_SMS_Employee]) VALUES (1, 0, 12, 60, 3, 0, 0, CAST(N'2018-12-25T09:20:18.927' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 1, 0)
INSERT [dbo].[Sla] ([Id], [WorkingDaysIncludingHolidays], [HoursPerState], [NotifyBefore], [NotificationCount], [PropogateToManager], [CcAssignee], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Send_SMS_Citizen], [Send_SMS_Employee]) VALUES (2, 0, 36, 60, 3, 0, 0, CAST(N'2018-12-25T09:20:59.543' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Sla] OFF
SET IDENTITY_INSERT [dbo].[SlaCategories] ON 

INSERT [dbo].[SlaCategories] ([Id], [CategoryId], [SlaId]) VALUES (1, 27, 2)
INSERT [dbo].[SlaCategories] ([Id], [CategoryId], [SlaId]) VALUES (2, 27, 1)
SET IDENTITY_INSERT [dbo].[SlaCategories] OFF
SET IDENTITY_INSERT [dbo].[SlaTranslation] ON 

INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (1, 1, N'شكوى جديدة لدائرة المياه', N'المرحلة الأولى', 1, 1)
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (2, 2, N'شكوى قيد التنفيذ لدائرة المياه', N'المرحلة الثانية', 1, 1)
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (3, 2, N'شكوى قيد التنفيذ لدائرة المياه', N'المرحلة الثانية', 0, 0)
INSERT [dbo].[SlaTranslation] ([Id], [SlaId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (4, 1, N'شكوى جديدة لدائرة المياه', N'المرحلة الأولى', 0, 0)
SET IDENTITY_INSERT [dbo].[SlaTranslation] OFF
SET IDENTITY_INSERT [dbo].[SMSTemplate] ON 

INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (1, CAST(N'2018-12-17T10:55:40.740' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (2, CAST(N'2018-12-17T10:56:37.563' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (3, CAST(N'2018-12-17T10:59:16.910' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (4, CAST(N'2018-12-17T10:59:44.117' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (5, CAST(N'2018-12-17T11:00:54.393' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (6, CAST(N'2018-12-17T11:02:09.650' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (7, CAST(N'2018-12-17T11:03:10.860' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (8, CAST(N'2018-12-17T11:04:21.840' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (9, CAST(N'2018-12-17T11:05:26.097' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (10, CAST(N'2018-12-17T11:06:25.803' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (11, CAST(N'2018-12-17T11:07:53.007' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (12, CAST(N'2018-12-17T11:08:44.033' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (13, CAST(N'2018-12-17T11:12:47.573' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (14, CAST(N'2018-12-17T11:13:18.667' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (15, CAST(N'2018-12-17T11:14:37.560' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (16, CAST(N'2018-12-17T11:15:24.500' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (17, CAST(N'2018-12-25T14:45:07.377' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (18, CAST(N'2019-01-15T15:09:04.070' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (19, CAST(N'2019-01-15T15:13:20.593' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (20, CAST(N'2019-01-15T15:15:27.033' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (21, CAST(N'2019-01-15T15:18:25.853' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (22, CAST(N'2019-01-15T15:20:05.617' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (23, CAST(N'2019-01-15T15:21:36.483' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (24, CAST(N'2019-01-15T15:25:41.947' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (25, CAST(N'2019-01-15T15:27:27.363' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (26, CAST(N'2019-01-15T15:29:32.413' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (27, CAST(N'2019-01-15T15:30:29.653' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (28, CAST(N'2019-01-15T15:32:13.950' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (29, CAST(N'2019-01-15T15:33:13.710' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (30, CAST(N'2019-01-15T15:34:38.717' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (31, CAST(N'2019-01-15T15:35:52.340' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (32, CAST(N'2019-01-15T15:37:10.520' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (33, CAST(N'2019-01-15T15:37:57.060' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (34, CAST(N'2019-01-15T15:38:38.973' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
INSERT [dbo].[SMSTemplate] ([Id], [CreatedOn], [CreatedBy], [Status], [DefaultLanguage], [DeletedOn]) VALUES (35, CAST(N'2019-01-15T15:39:30.813' AS DateTime), N'salam-cs@hotmail.com', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[SMSTemplate] OFF
SET IDENTITY_INSERT [dbo].[SMSTemplateTranslation] ON 

INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (1, 1, N'New SMS Template for Citizen', N'شكرًا لك، سوف نقوم بمعالجة الأمر في أسرع وقت
رقم الطلب:{CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (2, 1, N'New SMS Template for Citizen', N'תודה לך, נטפל בפניה בהקדם. מס'' פניה:{CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (3, 2, N'New SMS Template for Employee', N'تم إدخال طلب جديد, رقم الطلب:{CaseId}
', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (4, 2, N'New SMS Template for Employee', N'התקבלה פניה חדשה, מס'' פניה : {CaseId}
', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (5, 3, N'In Progress SMS Template for Citizen', N' لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : {CaseId}	', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (6, 4, N'In Progress SMS Template for Employee	', N'  ', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (7, 4, N'In Progress SMS Template for Employee	', N'لقد تم التعامل مع الطلب، حالة الطلب:قيد التنفيذ رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (8, 5, N'Rejected SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (9, 5, N'Rejected SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: 
נדחה
מס'' פניה: : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (10, 6, N'Rejected SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:مرفوض
رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (11, 6, N'Rejected SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: 
נדחה
מס'' פניה: : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (12, 7, N'Duplicated SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (13, 7, N'Duplicated SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: 
כפילות
מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (14, 8, N'Duplicated SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:مكرر
رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (15, 8, N'Duplicated SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: 
כפילות
מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (16, 9, N'Resolved SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (17, 9, N'Resolved SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: 
טופל
מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (18, 10, N'Resolved SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:محلول
رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (19, 10, N'Resolved SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: 
טופל
מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (20, 11, N'Closed SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (21, 11, N'Closed SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: 
סגור
מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (22, 12, N'Closed SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:مغلق
رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (23, 12, N'Closed SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: 
סגור
מס'' פניה: : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (24, 13, N'Na SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:غير محدد
رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (25, 13, N'Na SMS Template for Citizen', N'لقد تم التعامل مع الطلب، حالة الطلب:غير محدد
رقم الطلب : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (26, 14, N'Na SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:غير محدد
رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (27, 14, N'Na SMS Template for Employee', N'لقد تم التعامل مع الطلب، حالة الطلب:غير محدد
رقم الطلب : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (28, 15, N'Sla SMS Template for Citizen', N'هنالك تأخير في معالجة الطلب، سنقوم بتحديثكم حين تتم المعالجة، رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (29, 15, N'Sla SMS Template for Citizen', N'חל איחור בטיפול בפניה, נעדכן אתכם ברגע וזה מטופל, מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (30, 16, N'Sla SMS Template for Employee', N'هنالك تأخير في معالجة طلب، رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (31, 16, N'Sla SMS Template for Employee', N'ישנם איחור בטיפול בפניה, מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (32, 17, N'SMS Template for New Assignee - Employee', N'لقد تم تعيين طلب عليك : رقم الطلب {CaseId}	', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (33, 18, N' New Tender SMS Template for Citizen', N'شكرًا لك، تم استلام الطلب  رقم الطلب: {CaseId}	', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (34, 18, N' New Tender SMS Template for Citizen', N'תודה לך, הפניה שלך התקבלה. מס'' פניה: {CaseId}	', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (35, 19, N'New Tender SMS Template for Employee	', N'התקבלה פניה חדשה, מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (36, 19, N'New Tender SMS Template for Employee	', N'تم إدخال الطلب , رقم الطلب : {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (37, 20, N'Received Tender SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، حالة الطلب:
تم الاستلام
 رقم الطلب: {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (38, 20, N'Received Tender SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה:  התקבל , 
מס'' פניה: {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (39, 21, N'Received Tender SMS Template for Employee	', N'لقد تم التعامل مع الطلب ، حالة الطلب: تم الاستلام
 رقم الطلب: {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (40, 21, N'Received Tender SMS Template for Employee	', N'הפניה שלך טופלה, סטטוס פניה: התקבל,
 מס'' פניה: {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (41, 22, N'InProgress Tender SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، حالة الطلب:
 قيد المعاينة
رقم الطلب: {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (42, 22, N'InProgress Tender SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה:  בטיפול ,
 מס'' פניה: {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (43, 23, N'InProgress Tender SMS Template for Employee', N'لقد تم التعامل مع الطلب ، حالة الطلب: قيد المعاينة
رقم الطلب: {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (44, 23, N'InProgress Tender SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה:  בטיפול ,
 מס'' פניה: {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (45, 24, N'Winner Tender SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: זוכה ,
 מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (46, 24, N'Winner Tender SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، حالة الطلب:
 فائز 
رقم الطلب: {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (47, 25, N'Winner Tender SMS Template for Employee', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز
 رقم الطلب: {CaseId}	', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (48, 25, N'Winner Tender SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: זוכה ,
 מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (49, 26, N'Loser Tender SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: غير فائز
رقم الطلب: {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (50, 26, N'Loser Tender SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: לא זכה , 
מס'' פניה: {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (51, 27, N'Loser Tender SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: לא זכה , 
מס'' פניה: {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (52, 27, N'Loser Tender SMS Template for Employee', N'لقد تم التعامل مع الطلب ، حالة الطلب:
غير فائز
رقم الطلب: {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (53, 28, N'New Job SMS Template for Citizen', N'תודה לך, הפניה שלך התקבלה. מס'' פניה: {CaseId}	', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (54, 28, N'New Job SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، حالة الطلب:
جديد
رقم الطلب: {CaseId}', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (55, 29, N'New Job SMS Template for Employee', N'תודה לך, הפניה שלך התקבלה. מס'' פניה: {CaseId}	', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (56, 29, N'New Job SMS Template for Employee', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: جديد 
رقم الطلب: {CaseId}	', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (57, 30, N'Received Job SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: התקבל,
 מס'' פניה: {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (58, 30, N'Received Job SMS Template for Citizen', N'لقد تم التعامل مع الطلب ،
 حالة الطلب: تم الاستلام 
رقم الطلب: {CaseId}	', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (59, 31, N'Received Job SMS Template for Employee', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: تم الاستلام
 رقم الطلب: {CaseId}	', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (60, 31, N'Received Job SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: התקבל,
 מס'' פניה: {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (61, 32, N'InProgress Job SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה:  בטיפול ,
 מס'' פניה: {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (62, 32, N'InProgress Job SMS Template for Citizen', N'لقد تم التعامل مع الطلب ،
 حالة الطلب: قيد المعاينة
 رقم الطلب: {CaseId}	', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (63, 33, N'InProgress Job SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה:  בטיפול ,
 מס'' פניה: {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (64, 33, N'InProgress Job SMS Template for Employee', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: قيد المعاينة 
رقم الطلب: {CaseId}	', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (65, 34, N'Winner Job SMS Template for Citizen', N'הפניה שלך טופלה, סטטוס פניה: זוכה ,
 מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (66, 34, N'Winner Job SMS Template for Citizen', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز
 رقم الطلب: {CaseId}	', 1, 1)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (67, 35, N'Winner Job SMS Template for Employee', N'הפניה שלך טופלה, סטטוס פניה: זוכה ,
 מס'' פניה : {CaseId}', 2, 0)
INSERT [dbo].[SMSTemplateTranslation] ([Id], [SMSTemplateId], [Name], [Description], [LanguageId], [IsDefault]) VALUES (68, 35, N'Winner Job SMS Template for Employee', N'لقد تم التعامل مع الطلب ، 
حالة الطلب: فائز 
رقم الطلب: {CaseId}	', 1, 1)
SET IDENTITY_INSERT [dbo].[SMSTemplateTranslation] OFF
SET IDENTITY_INSERT [dbo].[StateHistory] ON 

INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, 1, 40, 34, CAST(N'2018-12-24T15:14:57.893' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, 2, 40, 34, CAST(N'2018-12-25T10:34:26.563' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, 3, 40, 34, CAST(N'2018-12-25T10:47:26.857' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, 4, 40, 34, CAST(N'2018-12-25T11:11:22.120' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, 5, 40, 34, CAST(N'2018-12-25T11:15:05.607' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (7, 6, 40, 34, CAST(N'2018-12-25T11:35:58.753' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (8, 6, 34, 35, CAST(N'2018-12-25T11:39:41.967' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (9, 6, 35, 36, CAST(N'2018-12-25T11:41:22.820' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (10, 7, 40, 34, CAST(N'2018-12-25T11:55:24.297' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (11, 7, 34, 35, CAST(N'2018-12-25T11:56:32.807' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (12, 7, 35, 36, CAST(N'2018-12-25T11:57:49.437' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (13, 7, 36, 35, CAST(N'2018-12-25T11:57:53.740' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (14, 7, 35, 38, CAST(N'2018-12-25T11:59:23.833' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (15, 7, 38, 34, CAST(N'2018-12-25T12:00:11.757' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (16, 7, 34, 35, CAST(N'2018-12-25T12:00:17.243' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (17, 8, 40, 34, CAST(N'2018-12-25T13:38:53.210' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (18, 8, 34, 35, CAST(N'2018-12-25T13:40:28.307' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (19, 9, 40, 34, CAST(N'2018-12-25T13:43:24.043' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (20, 9, 34, 35, CAST(N'2018-12-25T13:43:44.447' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (21, 9, 35, 38, CAST(N'2018-12-25T13:44:36.410' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (22, 10, 40, 34, CAST(N'2018-12-25T14:22:19.507' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (23, 10, 34, 35, CAST(N'2018-12-25T14:23:15.440' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (24, 10, 35, 38, CAST(N'2018-12-25T14:23:39.683' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (25, 11, 40, 34, CAST(N'2018-12-25T14:29:43.030' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (26, 12, 40, 34, CAST(N'2018-12-25T14:58:54.350' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (27, 13, 40, 34, CAST(N'2018-12-25T15:02:20.127' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (28, 14, 40, 34, CAST(N'2018-12-25T15:03:30.987' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (29, 13, 34, 35, CAST(N'2018-12-25T15:26:44.523' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (30, 15, 40, 34, CAST(N'2018-12-25T15:28:13.747' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (31, 15, 34, 35, CAST(N'2018-12-25T15:33:19.777' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (32, 15, 35, 37, CAST(N'2018-12-25T15:35:30.680' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (33, 16, 40, 34, CAST(N'2018-12-25T15:36:23.263' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (34, 16, 34, 35, CAST(N'2018-12-25T15:38:44.923' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (35, 16, 35, 36, CAST(N'2018-12-25T15:40:14.503' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (36, 17, 40, 34, CAST(N'2018-12-25T16:06:27.177' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (37, 17, 34, 35, CAST(N'2018-12-25T16:07:39.503' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (38, 18, 40, 34, CAST(N'2018-12-25T16:11:40.277' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (39, 19, 40, 34, CAST(N'2018-12-25T16:15:05.520' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (40, 20, 40, 34, CAST(N'2018-12-25T16:17:40.550' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (41, 20, 34, 35, CAST(N'2018-12-25T16:21:23.690' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (42, 20, 34, 35, CAST(N'2018-12-25T16:21:28.247' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (43, 20, 35, 38, CAST(N'2018-12-25T16:25:31.780' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (44, 21, 40, 34, CAST(N'2018-12-25T19:52:32.540' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (45, 21, 34, 35, CAST(N'2018-12-25T19:56:01.483' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (46, 21, 35, 38, CAST(N'2018-12-25T19:56:24.917' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (47, 22, 40, 34, CAST(N'2018-12-25T19:58:32.143' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (48, 22, 34, 35, CAST(N'2018-12-25T20:00:00.843' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (49, 22, 35, 38, CAST(N'2018-12-25T20:02:11.770' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (50, 22, 38, 36, CAST(N'2018-12-25T20:02:28.750' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (51, 23, 40, 34, CAST(N'2018-12-25T20:07:44.080' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (52, 24, 40, 34, CAST(N'2018-12-25T20:10:18.517' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (53, 25, 40, 34, CAST(N'2018-12-25T20:11:28.807' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (54, 26, 40, 34, CAST(N'2018-12-25T20:12:20.307' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (55, 27, 40, 34, CAST(N'2018-12-25T20:12:56.347' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (56, 28, 40, 34, CAST(N'2018-12-25T20:13:02.023' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (57, 29, 40, 34, CAST(N'2018-12-25T20:13:54.117' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (58, 30, 40, 34, CAST(N'2018-12-25T20:15:14.283' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (59, 31, 40, 34, CAST(N'2018-12-25T20:16:03.600' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (60, 32, 40, 34, CAST(N'2018-12-25T20:16:40.953' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (61, 33, 40, 34, CAST(N'2018-12-25T20:17:31.977' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (62, 34, 40, 34, CAST(N'2018-12-25T20:18:08.537' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (63, 35, 40, 34, CAST(N'2018-12-25T20:19:05.090' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (64, 36, 40, 34, CAST(N'2018-12-25T20:24:09.780' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (65, 37, 40, 34, CAST(N'2018-12-25T20:35:04.530' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (66, 38, 40, 34, CAST(N'2018-12-25T21:25:37.397' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (67, 39, 40, 34, CAST(N'2018-12-25T21:26:29.300' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (68, 40, 40, 34, CAST(N'2018-12-26T09:11:58.990' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (69, 41, 40, 34, CAST(N'2018-12-26T09:22:59.693' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (70, 41, 34, 35, CAST(N'2018-12-26T09:26:27.757' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (71, 41, 35, 36, CAST(N'2018-12-26T09:29:44.907' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (72, 41, 36, 37, CAST(N'2018-12-26T10:04:18.833' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (73, 42, 40, 34, CAST(N'2018-12-26T10:13:47.187' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (74, 43, 40, 34, CAST(N'2018-12-26T10:48:52.583' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (75, 43, 34, 35, CAST(N'2018-12-26T10:49:35.740' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (76, 15, 37, 36, CAST(N'2018-12-26T10:52:42.967' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (77, 43, 35, 36, CAST(N'2018-12-26T10:54:22.563' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (78, 20, 38, 39, CAST(N'2018-12-26T10:59:24.133' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (79, 15, 36, 37, CAST(N'2018-12-26T10:59:44.830' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (80, 15, 37, 38, CAST(N'2018-12-26T10:59:57.347' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (81, 44, 40, 34, CAST(N'2018-12-26T11:08:01.320' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (82, 44, 34, 36, CAST(N'2018-12-26T11:08:22.407' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (83, 44, 36, 35, CAST(N'2018-12-26T11:08:29.097' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (84, 45, 40, 34, CAST(N'2018-12-26T11:09:08.693' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (85, 45, 34, 36, CAST(N'2018-12-26T11:09:21.930' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (86, 46, 40, 34, CAST(N'2018-12-26T11:20:08.177' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (87, 47, 40, 34, CAST(N'2018-12-26T11:22:12.643' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (88, 48, 40, 34, CAST(N'2018-12-26T11:35:25.717' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (89, 49, 40, 34, CAST(N'2018-12-26T11:38:04.297' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (90, 49, 34, 35, CAST(N'2018-12-26T11:39:11.107' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (91, 49, 35, 37, CAST(N'2018-12-26T11:42:55.903' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (92, 50, 40, 34, CAST(N'2018-12-26T11:47:15.577' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (93, 50, 34, 35, CAST(N'2018-12-26T11:48:07.123' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (94, 49, 37, 39, CAST(N'2018-12-26T12:05:24.260' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (95, 48, 34, 37, CAST(N'2018-12-26T12:15:37.660' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (96, 45, 36, 34, CAST(N'2018-12-26T12:16:27.827' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (97, 51, 40, 34, CAST(N'2018-12-26T12:56:24.670' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (98, 51, 34, 37, CAST(N'2018-12-26T12:57:36.657' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (99, 48, 37, 34, CAST(N'2018-12-26T13:11:00.720' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (100, 48, 34, 35, CAST(N'2018-12-26T13:11:57.650' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (101, 52, 40, 34, CAST(N'2018-12-26T13:16:10.663' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (102, 52, 34, 35, CAST(N'2018-12-26T13:16:48.930' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (103, 8, 35, 38, CAST(N'2018-12-26T13:18:11.027' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (104, 8, 38, 39, CAST(N'2018-12-26T13:18:43.380' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (105, 8, 38, 39, CAST(N'2018-12-26T13:19:16.967' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (106, 52, 35, 34, CAST(N'2018-12-26T13:19:58.747' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (107, 52, 34, 35, CAST(N'2018-12-26T13:20:17.820' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (108, 8, 39, 38, CAST(N'2018-12-26T13:21:59.807' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (109, 8, 38, 39, CAST(N'2018-12-26T13:26:51.407' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (110, 8, 38, 39, CAST(N'2018-12-26T13:27:27.597' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (111, 8, 38, 36, CAST(N'2018-12-26T13:28:13.097' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (112, 8, 38, 35, CAST(N'2018-12-26T13:28:48.303' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (113, 47, 34, 37, CAST(N'2018-12-26T13:32:38.993' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (114, 52, 37, 38, CAST(N'2018-12-26T13:39:01.527' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (115, 44, 35, 38, CAST(N'2018-12-26T13:40:13.287' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (116, 43, 36, 38, CAST(N'2018-12-26T13:40:52.957' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (117, 40, 34, 38, CAST(N'2018-12-26T13:42:02.537' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (118, 13, 35, 38, CAST(N'2018-12-26T13:44:07.290' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (119, 45, 34, 35, CAST(N'2018-12-26T13:51:06.493' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (120, 53, 40, 34, CAST(N'2018-12-26T13:57:48.200' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (121, 54, 40, 34, CAST(N'2018-12-26T14:02:03.057' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (122, 54, 34, 35, CAST(N'2018-12-26T14:04:26.220' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (123, 54, 35, 38, CAST(N'2018-12-26T14:10:23.400' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (124, 55, 40, 34, CAST(N'2018-12-26T14:14:14.793' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (125, 55, 34, 35, CAST(N'2018-12-26T14:15:00.813' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (126, 55, 35, 38, CAST(N'2018-12-26T14:16:08.343' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (127, 56, 40, 34, CAST(N'2018-12-26T14:38:01.280' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (128, 56, 34, 38, CAST(N'2018-12-26T14:43:22.037' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (129, 56, 38, 39, CAST(N'2018-12-26T14:48:59.590' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (130, 57, 40, 34, CAST(N'2018-12-26T15:10:19.027' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (131, 57, 34, 35, CAST(N'2018-12-26T15:10:57.120' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (132, 57, 35, 38, CAST(N'2018-12-26T15:11:53.777' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (133, 58, 40, 34, CAST(N'2018-12-26T15:15:20.070' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (134, 58, 34, 35, CAST(N'2018-12-26T15:16:12.597' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (135, 58, 35, 38, CAST(N'2018-12-26T15:17:11.067' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (136, 58, 38, 34, CAST(N'2018-12-26T15:29:16.587' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (137, 58, 34, 35, CAST(N'2018-12-26T15:29:28.167' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (138, 58, 35, 36, CAST(N'2018-12-26T15:30:01.847' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (139, 59, 40, 34, CAST(N'2018-12-26T20:53:17.483' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (140, 60, 40, 34, CAST(N'2018-12-26T22:09:56.310' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (141, 61, 40, 34, CAST(N'2018-12-26T22:10:29.697' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (142, 62, 40, 34, CAST(N'2018-12-26T22:11:52.777' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (143, 63, 40, 34, CAST(N'2018-12-26T22:22:19.663' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (144, 64, 40, 34, CAST(N'2018-12-27T06:15:12.323' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (145, 64, 34, 38, CAST(N'2018-12-27T06:15:47.360' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (146, 65, 40, 34, CAST(N'2018-12-27T09:11:00.180' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (147, 65, 34, 38, CAST(N'2018-12-27T09:11:54.737' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (148, 65, 38, 35, CAST(N'2018-12-27T09:12:02.330' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (149, 66, 40, 34, CAST(N'2018-12-27T09:36:40.680' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (151, 67, 40, 35, CAST(N'2018-12-27T09:46:51.890' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (152, 68, 40, 34, CAST(N'2018-12-27T09:52:27.467' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (153, 69, 40, 34, CAST(N'2018-12-27T09:57:38.047' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (154, 70, 40, 34, CAST(N'2018-12-31T11:35:52.837' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (155, 70, 34, 35, CAST(N'2018-12-31T11:36:29.243' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (156, 68, 34, 36, CAST(N'2019-01-01T21:37:41.380' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (157, 70, 35, 39, CAST(N'2019-01-01T21:39:47.923' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (160, 72, 40, 35, CAST(N'2019-01-02T11:59:12.553' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (161, 70, 39, 35, CAST(N'2019-01-02T12:36:15.823' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (162, 73, 40, 34, CAST(N'2019-01-02T12:48:24.503' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (163, 73, 34, 35, CAST(N'2019-01-02T12:49:37.830' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (164, 73, 35, 38, CAST(N'2019-01-02T12:49:47.417' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (166, 69, 34, 39, CAST(N'2019-01-06T09:37:36.020' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (167, 66, 34, 35, CAST(N'2019-01-06T12:22:38.663' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (168, 75, 40, 34, CAST(N'2019-01-06T12:24:22.327' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (169, 68, 36, 34, CAST(N'2019-01-06T12:26:05.537' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (170, 76, 40, 34, CAST(N'2019-01-08T09:58:05.960' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (171, 77, 40, 34, CAST(N'2019-01-08T09:59:15.663' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (172, 65, 35, 37, CAST(N'2019-01-09T10:23:48.767' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (173, 78, 40, 34, CAST(N'2019-01-13T11:01:46.433' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (175, 80, 40, 34, CAST(N'2019-01-14T17:31:48.287' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (176, 81, 40, 34, CAST(N'2019-01-17T09:34:14.033' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (177, 75, 34, 35, CAST(N'2019-01-17T11:45:04.377' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (178, 82, 40, 34, CAST(N'2019-01-21T15:47:58.767' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (179, 83, 40, 34, CAST(N'2019-01-21T15:50:54.983' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (180, 84, 40, 34, CAST(N'2019-01-21T15:58:37.073' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (181, 85, 40, 34, CAST(N'2019-01-21T16:18:47.510' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (182, 86, 40, 34, CAST(N'2019-01-21T16:22:50.217' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (183, 87, 40, 34, CAST(N'2019-01-21T16:26:28.563' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (184, 82, 34, 66, CAST(N'2019-01-21T16:27:13.320' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (185, 87, 34, 66, CAST(N'2019-01-21T16:28:18.547' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (186, 88, 40, 34, CAST(N'2019-01-21T16:29:42.913' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (187, 88, 34, 35, CAST(N'2019-01-21T16:31:12.453' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (188, 89, 40, 34, CAST(N'2019-01-21T16:41:51.183' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (189, 89, 34, 35, CAST(N'2019-01-21T16:43:13.827' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (190, 68, 34, 35, CAST(N'2019-01-21T16:46:01.217' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (191, 84, 34, 35, CAST(N'2019-01-21T16:48:00.740' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (192, 46, 34, 35, CAST(N'2019-01-21T16:53:45.887' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (193, 89, 35, 38, CAST(N'2019-01-21T16:56:26.220' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (194, 90, 40, 34, CAST(N'2019-01-21T17:02:31.927' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (195, 90, 34, 71, CAST(N'2019-01-21T17:03:11.143' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (196, 90, 71, 73, CAST(N'2019-01-21T17:03:40.870' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (197, 91, 40, 34, CAST(N'2019-01-21T17:05:16.250' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (198, 91, 34, 66, CAST(N'2019-01-21T17:05:47.517' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (199, 91, 66, 69, CAST(N'2019-01-21T17:06:03.070' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (200, 82, 66, 68, CAST(N'2019-01-21T17:51:48.703' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (201, 66, 35, 38, CAST(N'2019-01-21T17:52:06.247' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (202, 68, 35, 34, CAST(N'2019-01-21T17:56:58.697' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (203, 89, 38, 34, CAST(N'2019-01-22T06:10:04.627' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (204, 82, 68, 65, CAST(N'2019-01-22T10:56:27.457' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (205, 82, 68, 65, CAST(N'2019-01-22T10:56:30.097' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
GO
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (206, 82, 68, 65, CAST(N'2019-01-22T10:56:33.630' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (207, 82, 65, 66, CAST(N'2019-01-22T10:56:45.577' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (208, 82, 66, 67, CAST(N'2019-01-22T10:57:08.447' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (209, 92, 40, 34, CAST(N'2019-01-22T11:39:24.347' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (210, 93, 40, 34, CAST(N'2019-01-26T19:53:59.597' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (211, 93, 34, 35, CAST(N'2019-01-29T16:02:40.877' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (212, 94, 40, 34, CAST(N'2019-01-31T10:03:01.687' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (213, 95, 40, 34, CAST(N'2019-01-31T11:15:30.123' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (214, 96, 40, 34, CAST(N'2019-01-31T11:15:32.373' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (215, 97, 40, 34, CAST(N'2019-01-31T11:16:49.703' AS DateTime), N'', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (216, 86, 34, 71, CAST(N'2019-01-31T11:23:22.673' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (217, 86, 34, 72, CAST(N'2019-01-31T11:23:24.573' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (218, 86, 34, 73, CAST(N'2019-01-31T11:23:26.137' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (219, 97, 34, 37, CAST(N'2019-03-07T14:19:53.410' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (220, 97, 34, 36, CAST(N'2019-03-07T14:19:53.843' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (221, 97, 34, 38, CAST(N'2019-03-07T14:19:54.647' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (222, 97, 34, 39, CAST(N'2019-03-07T14:19:54.957' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (223, 97, 34, 35, CAST(N'2019-03-07T14:19:55.613' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[StateHistory] ([Id], [CaseId], [PreviousState], [CurrentState], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (224, 8, 35, 39, CAST(N'2019-03-18T13:24:01.237' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[StateHistory] OFF
SET IDENTITY_INSERT [dbo].[StateTransitionsConfiguration] ON 

INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (1, 27, 40, 34, 1074, CAST(N'2018-12-24T23:00:03.327' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (2, 27, 34, 35, 1075, CAST(N'2018-12-24T23:00:12.777' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (3, 27, 35, 38, 1074, CAST(N'2018-12-24T23:00:39.420' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (4, 27, 35, 36, 1074, CAST(N'2018-12-25T09:18:50.837' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (5, 27, 35, 39, 1054, CAST(N'2018-12-25T09:19:14.987' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (6, 41, 34, 35, 2, CAST(N'2018-12-25T11:37:04.380' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-12-25T13:12:22.207' AS DateTime), 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (7, 41, 35, 36, 2, CAST(N'2018-12-25T11:37:13.510' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-12-25T13:12:25.210' AS DateTime), 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (8, 41, 36, 37, 2, CAST(N'2018-12-25T11:37:22.590' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-12-25T13:12:29.180' AS DateTime), 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (9, 41, 37, 38, 2, CAST(N'2018-12-25T11:37:33.230' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-12-25T13:12:32.150' AS DateTime), 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (10, 41, 38, 39, 2, CAST(N'2018-12-25T11:37:41.997' AS DateTime), N'salam-cs@hotmail.com', 2, CAST(N'2018-12-25T13:12:17.600' AS DateTime), 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (11, 42, 40, 34, 1054, CAST(N'2018-12-25T13:12:04.600' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (12, 42, 34, 35, 1068, CAST(N'2018-12-25T13:12:47.307' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (13, 27, 35, 36, 1054, CAST(N'2018-12-25T13:13:18.277' AS DateTime), N'muhammad.maj@gmail.com', 2, CAST(N'2018-12-25T13:13:28.253' AS DateTime), 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (14, 42, 35, 36, 1054, CAST(N'2018-12-25T13:13:38.833' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (15, 42, 35, 37, 1054, CAST(N'2018-12-25T13:13:56.637' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (16, 42, 35, 38, 1054, CAST(N'2018-12-25T13:14:20.817' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (17, 42, 35, 39, 1054, CAST(N'2018-12-25T13:14:43.260' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (18, 42, 35, 39, 1054, CAST(N'2018-12-25T13:14:58.117' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (19, 41, 40, 34, 1054, CAST(N'2018-12-25T13:16:28.050' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (20, 41, 34, 35, 1068, CAST(N'2018-12-25T13:16:38.767' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (21, 41, 35, 36, 1054, CAST(N'2018-12-25T13:16:53.170' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (22, 41, 35, 37, 1054, CAST(N'2018-12-25T13:17:09.190' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (23, 41, 35, 38, 1054, CAST(N'2018-12-25T13:17:31.213' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (24, 41, 35, 39, 1054, CAST(N'2018-12-25T13:17:43.690' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (25, 43, 40, 34, 1054, CAST(N'2018-12-25T14:07:39.747' AS DateTime), N'crmemployer@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (26, 43, 34, 35, 1068, CAST(N'2018-12-25T14:07:50.403' AS DateTime), N'crmemployer@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (27, 43, 35, 36, 1054, CAST(N'2018-12-25T14:07:59.577' AS DateTime), N'crmemployer@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (28, 43, 35, 37, 1054, CAST(N'2018-12-25T14:08:10.623' AS DateTime), N'crmemployer@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (29, 43, 35, 38, 1054, CAST(N'2018-12-25T14:08:23.427' AS DateTime), N'crmemployer@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (30, 43, 35, 39, 1054, CAST(N'2018-12-25T14:08:38.363' AS DateTime), N'crmemployer@gmail.com', 1, NULL, 14)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (31, 62, 70, 71, 1075, CAST(N'2019-01-21T17:01:11.887' AS DateTime), N'admin@smsm-it.com', 1, NULL, 18)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (32, 63, 65, 66, 1075, CAST(N'2019-01-21T17:04:16.927' AS DateTime), N'admin@smsm-it.com', 1, NULL, 19)
INSERT [dbo].[StateTransitionsConfiguration] ([Id], [CategoryId], [StateFrom], [StateTo], [AssigneeId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [CategoryType]) VALUES (33, 63, 66, 68, 1075, CAST(N'2019-01-21T17:04:32.433' AS DateTime), N'admin@smsm-it.com', 1, NULL, 19)
SET IDENTITY_INSERT [dbo].[StateTransitionsConfiguration] OFF
SET IDENTITY_INSERT [dbo].[SysCaseComments] ON 

INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [ForCitizen], [FilePath]) VALUES (1, N'لل', 8, CAST(N'2018-12-26T11:01:28.737' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, NULL, NULL)
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [ForCitizen], [FilePath]) VALUES (2, N'الطلب قيد التنفيذ الرجاء الأنتباه', 70, CAST(N'2018-12-31T11:37:00.003' AS DateTime), N'crmemployer@gmail.com', 1, NULL, NULL, NULL)
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [ForCitizen], [FilePath]) VALUES (3, N'hello ', 70, CAST(N'2018-12-31T14:16:58.593' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, 0, N'http://crm-ilut-dev.smsm-it.com//Document/2/42.jpg')
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [ForCitizen], [FilePath]) VALUES (4, N'trest', 61, CAST(N'2019-01-22T06:12:10.997' AS DateTime), N'admin@smsm-it.com', 1, NULL, 0, N'')
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [ForCitizen], [FilePath]) VALUES (5, N'hello', 92, CAST(N'2019-01-24T11:10:15.480' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, 0, N'')
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [ForCitizen], [FilePath]) VALUES (6, N'test', 92, CAST(N'2019-01-26T19:20:58.557' AS DateTime), N'admin@smsm-it.com', 1, NULL, 0, N'')
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [ForCitizen], [FilePath]) VALUES (7, N'test
', 93, CAST(N'2019-01-27T13:01:40.777' AS DateTime), N'admin@smsm-it.com', 1, NULL, 0, N'')
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [ForCitizen], [FilePath]) VALUES (8, N'test', 92, CAST(N'2019-01-27T13:02:58.737' AS DateTime), N'majadly@3-sectors.co.il', 1, NULL, NULL, NULL)
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [ForCitizen], [FilePath]) VALUES (9, N'test', 82, CAST(N'2019-01-27T13:04:43.607' AS DateTime), N'admin@smsm-it.com', 1, NULL, 0, N'')
INSERT [dbo].[SysCaseComments] ([Id], [Comment], [CaseId], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [ForCitizen], [FilePath]) VALUES (10, N'تاا', 81, CAST(N'2019-01-27T13:07:49.840' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SysCaseComments] OFF
SET IDENTITY_INSERT [dbo].[SystemCaseAttachments] ON 

INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (1, 6, 8)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (2, 7, 9)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (3, 8, 10)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (4, 10, 12)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (5, 11, 14)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (6, 14, 18)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (7, 15, 20)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (8, 19, 29)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (9, 23, 37)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (10, 24, 38)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (11, 25, 39)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (12, 27, 42)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (13, 28, 48)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (14, 30, 50)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (15, 32, 51)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (16, 34, 52)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (17, 36, 53)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (18, 37, 58)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (19, 39, 64)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (20, 41, 69)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (21, 43, 72)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (22, 46, 75)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (23, 47, 75)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (24, 48, 76)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (25, 49, 77)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (26, 50, 78)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (27, 51, 79)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (28, 52, 80)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (29, 53, 81)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (30, 54, 81)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (31, 55, 85)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (32, 56, 86)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (33, 57, 87)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (34, 59, 88)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (35, 61, 89)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (36, 62, 90)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (37, 63, 91)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (38, 65, 92)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (39, 66, 93)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (40, 68, 94)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (41, 69, 95)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (42, 70, 96)
INSERT [dbo].[SystemCaseAttachments] ([Id], [FileId], [CaseId]) VALUES (43, 72, 97)
SET IDENTITY_INSERT [dbo].[SystemCaseAttachments] OFF
SET IDENTITY_INSERT [dbo].[SystemCases] ON 

INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (1, N'227d9be0-ece6-463f-bf7b-ea1bdf25e7fd', 27, 29, NULL, 31, NULL, N'تست', N'2', 2, N'تست دسكربشن', CAST(N'2018-12-24T15:10:00.010' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'تست', N'123.2123', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (2, N'd156a143-9ec8-4d00-b1ff-08b8a9319355', 27, 0, NULL, 0, NULL, N'شارع ', NULL, 1054, N'فحص', CAST(N'2018-12-25T10:34:26.520' AS DateTime), N'linam@3-sectors.co.il', 1, NULL, N'غرب', N'شرق', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (3, N'7139e1f9-2d84-47df-8b76-ff816a79719c', 27, 0, NULL, 0, NULL, N'حفرة في الشارع - ميسان', NULL, 1054, N'تفاصيل', CAST(N'2018-12-25T10:47:26.853' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'baqa elgarbia, eben roshd', N'بجانب المدرسة', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (4, N'5193e13c-3881-442c-839d-77e495cd7f79', 41, 0, NULL, 0, NULL, N'اعمال تخريب للمقاعد', NULL, NULL, N'اعمال تخريب للمقاعد', CAST(N'2018-12-25T11:11:22.117' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'شارع الأمل', N'تقاطع 3', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (5, N'e8a3fc9b-eb2a-4770-af82-c03b30de383e', 43, 0, NULL, 0, NULL, N'شكوى جديدة', NULL, NULL, N'شكوى الجديدة لكم', CAST(N'2018-12-25T11:15:05.603' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'شارع الوطن', N'خلف المحطة', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (6, N'20c5a8a7-0f7a-4d50-a3a5-3e35f22ae483', 41, 28, NULL, 31, NULL, N'شكاوي سمسم', N'العلامات', 2, N'الشكاوي ', CAST(N'2018-12-25T11:35:58.750' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'العنوان', N'الموقع', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (7, N'08b5b098-6097-4742-ac8d-3875a4fabdd2', 27, 29, NULL, 32, NULL, N'الشكاوي 1', N'علامات', 1054, N'الشكاوي 1', CAST(N'2018-12-25T11:55:24.293' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'عنوان محمد', N'موقع محمد', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (8, N'd513ca16-5e62-4b98-b72b-4f663e16fecf', 41, 0, NULL, 0, NULL, N'أعمال تخريب', NULL, 1054, N'أعمال تخريب في ممتلكات البلدية', CAST(N'2018-12-25T13:38:53.207' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, N'بجانب المحطة', N'الشارع الخلفي', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (9, N'916cbbcb-007e-4e3a-a0c2-72c5f8d8ed8b', 27, 0, NULL, 0, NULL, N'مشاكل مياة', NULL, 1054, N'انقطاع للمياه', CAST(N'2018-12-25T13:43:24.040' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, N'الشارع الشمالي', N'4353453', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (10, N'a589ec59-f925-4d43-b357-a9c37c5a730f', 27, 0, NULL, 0, NULL, N'خلل في شبكة المياه', NULL, 1054, N'انقطاع متواصل للمياه', CAST(N'2018-12-25T14:22:19.503' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, N'الحي الغربيض', N'بجانب المحطة', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (11, N'a263dd5c-c944-49ae-9fcc-0b31cacec7a3', 41, 28, NULL, 31, NULL, N'نابلس - شكوى', N'מיסאן טסט', 1054, N'شكوى بسبب عدم الاهتمام في الحل', CAST(N'2018-12-25T14:29:43.027' AS DateTime), N'ahmad.maharma@gmail.com', 1, NULL, N'نابلس', N'شارع فيصل', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (12, N'5793e61e-4eba-46df-bd22-e95fc208f8be', 58, 0, NULL, 0, NULL, N' فتح ملفات', NULL, NULL, N'<p>&nbsp;فتح ملفات<br></p>', CAST(N'2018-12-25T14:58:54.347' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, NULL, NULL, 5, N'1119', N' فتح ملفات')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (13, N'74b38696-dabf-44ae-b724-5fe1ca7fd0e5', 43, 29, NULL, 31, NULL, N'تجربه عرض الشكاوي ', N'علامات', 1054, N'تجربه عرض الشكاوي ', CAST(N'2018-12-25T15:02:20.123' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'تجربه عرض الشكاوي ', N'تجربه عرض الشكاوي ', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (14, N'2217e555-1b56-4af4-9ceb-57585f1282fa', 55, 0, NULL, 0, NULL, N'تصريح المخطّط معدّ الطلب تحضيرًا لإصدار رخصة بناء', NULL, NULL, N'<p><b><u><span lang="AR-LB" dir="RTL" style="font-size:18.0pt;
font-family:&quot;Traditional Arabic&quot;,&quot;serif&quot;;mso-ascii-font-family:&quot;Times New Roman&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;
mso-ansi-language:EN-US;mso-fareast-language:HE;mso-bidi-language:AR-LB">تصريح
المخط</span><span lang="AR-SA" dir="RTL" style="font-size:18.0pt;font-family:&quot;Traditional Arabic&quot;,&quot;serif&quot;;
mso-ascii-font-family:&quot;Times New Roman&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-hansi-font-family:&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:
HE;mso-bidi-language:AR-SA">ّ</span><span lang="AR-LB" dir="RTL" style="font-size:
18.0pt;font-family:&quot;Traditional Arabic&quot;,&quot;serif&quot;;mso-ascii-font-family:&quot;Times New Roman&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;
mso-ansi-language:EN-US;mso-fareast-language:HE;mso-bidi-language:AR-LB">ط معدّ
الطلب تحضيرًا لإصدار رخصة بناء</span></u></b><br></p>', CAST(N'2018-12-25T15:03:30.983' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, NULL, NULL, 5, N'1138', N'تصريح المخطّط معدّ الطلب تحضيرًا لإصدار رخصة بناء')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (15, N'e06ec150-9e15-410d-a782-a91d96e25c96', 27, 29, NULL, 31, NULL, N'اضافه شكوى ', N'علامات', 1053, N'شكوى جديده', CAST(N'2018-12-25T15:28:13.737' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'شكوى جديده', N'شكوى جديده', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (16, N'751597d9-cb35-486c-a619-6de6b94bdfb2', 27, 28, NULL, 31, NULL, N'تجربه شكاوى جديده 1', N'علامات', 1054, N'تجربه شكاوى جديده 1', CAST(N'2018-12-25T15:36:23.260' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'سالم', N'الموقع', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (17, N'8996f3e5-4203-419f-9f45-513ee0b3a602', 27, 28, NULL, 31, NULL, N'انشاء شكاوى جديده 1', N'علامات', 1054, N'انشاء شكاوى جديده 1', CAST(N'2018-12-25T16:06:27.150' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'سالم', N'سالم', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (18, N'a7d1ea27-1272-431f-a933-aa3ea061fd6b', 58, 0, NULL, 0, NULL, N' فتح ملفات', NULL, NULL, N'<p>&nbsp;فتح ملفات<br></p>', CAST(N'2018-12-25T16:11:40.273' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, NULL, NULL, 5, N'1119', N' فتح ملفات')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (19, N'08c05abe-c0a5-41ca-b064-dafa9244a541', 27, 0, NULL, 0, NULL, N'انشاء شكاوى جديده 2', NULL, 1054, N'انشاء شكاوى جديده 2', CAST(N'2018-12-25T16:15:05.140' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'سالم', N'سالم', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (20, N'55e5cf56-ee4e-4cdc-9262-40100d15306b', 57, NULL, NULL, NULL, NULL, N'طلب للحصول على ترخيص تحديد استعمال الطريق', N'انفجار ماسورة', 1053, N'<p>طلب للحصول على ترخيص تحديد استعمال الطريق<br></p>', CAST(N'2018-12-25T16:17:40.547' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, NULL, NULL, 5, N'1110', N'طلب للحصول على ترخيص تحديد استعمال الطريق')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (21, N'94787502-8bec-41e0-8e82-3cb647e5757b', 41, 0, NULL, 0, NULL, N'خلل في شبكة الكهرباء', NULL, 1054, N'OOGG', CAST(N'2018-12-25T19:52:32.513' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'baqa elgarbia, eben roshd', N'DSFDS', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (22, N'3688a798-3aa2-4c47-887d-d65481fa1bfb', 27, 0, NULL, 0, NULL, N'تسريب مياه في الحي الشمالي', NULL, 1054, N'انقطاع في المياه', CAST(N'2018-12-25T19:58:32.140' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'بيسب', N'ثيسشي', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (23, N'762039ee-e8ac-4df5-ad48-373b5b24e695', 43, 28, 80, 31, 78, N'add', N'', 1054, N'add', CAST(N'2018-12-25T20:07:44.077' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (24, N'e91102ec-cc6d-4dac-b0c1-585cf59b3614', 43, 0, NULL, 0, NULL, N'ازعاج عند الجيران', NULL, 1054, N'ازعاج متواصل عند الجيران', CAST(N'2018-12-25T20:10:18.510' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'الحي الأول', N'بجانب الساحة', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (25, N'3b465ef6-de81-4337-bcb3-8e6cbb8080d3', 43, 0, NULL, 0, NULL, N'זיקוקים בשעה מאוחרת בלילה', NULL, 1054, N'זיקוקים בשעה מאוחרת בלילה', CAST(N'2018-12-25T20:11:28.803' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'השכונה הדרומית', N'רח'' האמת', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (26, N'283fae09-5c94-4cd1-838e-6513ca1f4c38', 43, 0, NULL, 0, NULL, N'רעשים של מכונות', NULL, 1054, N'רעשים של מכונות כבדות בשכונה', CAST(N'2018-12-25T20:12:20.300' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'ליד החנות', N'שכונת הפרחים', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (27, N'190dd53c-75e6-4886-a384-4da69588bc49', 27, 0, NULL, 0, NULL, N'דליפה מים', NULL, 1054, N'דליפת מים', CAST(N'2018-12-25T20:12:56.343' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'רח'' החלומות', N'ליד הב"ס', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (28, N'20a62492-e61a-4ac7-ba45-9002f7d40c9a', 27, 0, NULL, 0, NULL, N'דליפה מים', NULL, 1054, N'דליפת מים', CAST(N'2018-12-25T20:13:02.017' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'רח'' החלומות', N'ליד הב"ס', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (29, N'a886df4e-62f0-4c28-a4b5-cbf0e5c60828', 27, 0, NULL, 0, NULL, N'פיצוץ צינור מים', NULL, 1054, N'פיצוץ מים', CAST(N'2018-12-25T20:13:54.113' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'רח'' הרכבת', N'ליד האולם', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (30, N'4042960a-7ece-41d4-b47f-d04dee1a0407', 27, 0, NULL, 0, NULL, N'בור ניקוז פתוח', NULL, 1054, N'בור ניקוז פתוח', CAST(N'2018-12-25T20:15:14.280' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'שכונת העננים', N'מול חנות הבגדים', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (31, N'cbb2d815-6458-4838-a52a-8aaad772b6c0', 42, 0, NULL, 0, NULL, N'עמוד חשמל שבור', NULL, 1054, N'הפסקת חשמל', CAST(N'2018-12-25T20:16:03.597' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'רח'' הדלק', N'ליד תחנת הדלק', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (32, N'e6e2c3f8-2398-4144-9146-a4b3494f34f9', 42, 0, NULL, 0, NULL, N'תקלה בתאורת הכביש', NULL, 1054, N'תקלה בתאורת הכביש', CAST(N'2018-12-25T20:16:40.950' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'לא ידוע', N'ליד חנות הממתקים', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (33, N'957749ef-3cb0-4a92-aa56-91d902005e2b', 42, 0, NULL, 0, NULL, N'אין אור במגרש', NULL, 1054, N'תקלת תאורה במגרש הכדורסל', CAST(N'2018-12-25T20:17:31.970' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'אולם ספורט דרומי', N'ליד קריית החינוך', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (34, N'77da1b92-0ef4-4aba-88ff-75787bebd786', 41, 0, NULL, 0, NULL, N'משחקיה שבורה', NULL, 1054, N'משחקיה שבורה', CAST(N'2018-12-25T20:18:08.533' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'הפארק העירוני', N'הכביש הראשי', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (35, N'1e9ad1b5-0ba8-4ac3-b8fe-8ac20998f292', 41, 0, NULL, 0, NULL, N'ספסל לא שבור', NULL, 1054, N'ספסל שבור', CAST(N'2018-12-25T20:19:05.087' AS DateTime), N'mowaten2@outlook.com', 1, NULL, N'תחנת האוטובוס', N'ליד הפארק', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (36, N'3fb15854-456a-4549-a335-c7af2ae87d63', 42, 29, 50, 32, 50, N'test from mobile ilut 1', N'', 1054, N'test', CAST(N'2018-12-25T20:24:09.777' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (37, N'c5b4f64b-e032-4b33-afea-443141703ced', 43, 29, 33, 31, 78, N'فحص ١٢', N'', 1054, N'فحص١٢', CAST(N'2018-12-25T20:35:04.527' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL, N'31.975313550000003,35.196042', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (38, N'9f389233-9158-439c-b255-71944ac231c6', 55, 0, NULL, 0, NULL, N'تصريح المخطّط معدّ الطلب تحضيرًا لإصدار رخصة بناء', NULL, NULL, N'<p><b><u><span lang="AR-LB" dir="RTL" style="font-size:18.0pt;
font-family:&quot;Traditional Arabic&quot;,&quot;serif&quot;;mso-ascii-font-family:&quot;Times New Roman&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;
mso-ansi-language:EN-US;mso-fareast-language:HE;mso-bidi-language:AR-LB">تصريح
المخط</span><span lang="AR-SA" dir="RTL" style="font-size:18.0pt;font-family:&quot;Traditional Arabic&quot;,&quot;serif&quot;;
mso-ascii-font-family:&quot;Times New Roman&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-hansi-font-family:&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:
HE;mso-bidi-language:AR-SA">ّ</span><span lang="AR-LB" dir="RTL" style="font-size:
18.0pt;font-family:&quot;Traditional Arabic&quot;,&quot;serif&quot;;mso-ascii-font-family:&quot;Times New Roman&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;
mso-ansi-language:EN-US;mso-fareast-language:HE;mso-bidi-language:AR-LB">ط معدّ
الطلب تحضيرًا لإصدار رخصة بناء</span></u></b><br></p>', CAST(N'2018-12-25T21:25:37.363' AS DateTime), N'mowaten2@outlook.com', 1, NULL, NULL, NULL, 5, N'1138', N'تصريح المخطّط معدّ الطلب تحضيرًا لإصدار رخصة بناء')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (39, N'1ef4956a-957f-45d5-a34c-d30829bd2a22', 58, 0, NULL, 0, NULL, N'طلب لتعليم خطوط البناء', NULL, NULL, N'<p>طلب لتعليم خطوط البناء<br></p>', CAST(N'2018-12-25T21:26:29.297' AS DateTime), N'mowaten2@outlook.com', 1, NULL, NULL, NULL, 5, N'1118', N'طلب لتعليم خطوط البناء')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (40, N'40f1462c-c262-43a5-9c0b-f8c686a5874d', 27, 29, NULL, 31, NULL, N'تجربه شكاوى جديده 1', N'تبديل لامبه', 1054, N'تجربه شكاوى جديده 1', CAST(N'2018-12-26T09:11:58.950' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'عيلوط', N'قرب وسط البلد', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (41, N'52305109-a878-4d6d-b9f4-9ca1de5154dc', 27, 28, NULL, 31, NULL, N'شكوى رقم 2', N'علامات', 1054, N'شكوى رقم 2', CAST(N'2018-12-26T09:22:59.690' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'عيلوط', N'عيلوط', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (42, N'2cab40c7-1296-4b13-97ce-383dc0c9a054', 27, 29, 63, 31, 73, N'طوني', N'', 1054, N'شكوى طوني', CAST(N'2018-12-26T10:13:47.187' AS DateTime), N'mowaten100@hotmail.com', 1, NULL, NULL, N'32.2798226,34.8587951', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (43, N'a1305643-737c-4ba4-bd4a-60714394806a', 41, 29, 45, 31, 82, N'تكسير زجاج ', N'', 1054, N'تكسير زجاج في الشارع ', CAST(N'2018-12-26T10:48:52.580' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (44, N'3f30d325-bffe-44a4-b824-231afece9bbc', 42, 29, 50, 32, 50, N'تجرب ١', N'', 1054, N'تتت', CAST(N'2018-12-26T11:08:01.317' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (45, N'3d2c507f-e107-4041-a318-53b15997e020', 43, 30, 13, 31, 82, N'تجربة ١', N'', 1053, N'تجربة ١', CAST(N'2018-12-26T11:09:08.687' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (46, N'efff208b-fdd6-4581-b3c7-b0c63b5510d3', 46, 29, 50, 32, 50, N'سقوط شجرة', N'', NULL, N'سقوط شجرة في الشارع', CAST(N'2018-12-26T11:20:08.173' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (47, N'4db595f7-a1a1-4d72-8bd4-89e7109102ec', 27, 29, 50, 32, 50, N'تسريب مياه ', N'علامات', 1054, N'تسريب مياه ', CAST(N'2018-12-26T11:22:12.640' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, N'عنوان', N'موقع', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (48, N'9e86244f-1b89-4942-b0e7-4706f8a417b7', 41, 29, NULL, 32, NULL, N'الحضانات', N'علامات', 1054, N'בעיות בגנים', CAST(N'2018-12-26T11:35:25.713' AS DateTime), N'adham.hassadiyeh@gmail.com', 1, NULL, N'פורידיס', N'شارع الطيور', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (49, N'202a470e-450d-4775-8b3a-3cd0a42fa747', 27, 29, 50, 32, 50, N'تست', N'', 1053, N'تست', CAST(N'2018-12-26T11:38:04.293' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (50, N'f3318669-16bb-445c-b7ac-e325849e9d64', 27, 29, 68, 31, 73, N'מים ', N'', 1067, N'מים', CAST(N'2018-12-26T11:47:15.573' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (51, N'd78beb86-842e-4742-ad91-30023787ba94', 42, 29, 50, 32, 50, N'test', N'', 1054, N'test 2', CAST(N'2018-12-26T12:56:24.650' AS DateTime), N'adham.hassadiyeh@gmail.com', 1, NULL, NULL, N'32.2798596,34.8587017', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (52, N'42edf895-ac83-4993-a483-c7d901ef11e7', 41, 29, 50, 32, 50, N'test 2', N'علامات', 1054, N'test 2', CAST(N'2018-12-26T13:16:10.660' AS DateTime), N'adham.hassadiyeh@gmail.com', 1, NULL, N'عنوان', N'32.2798399,34.8587182', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (53, N'058a152a-f72b-4fad-bbd4-34c6f677d6b6', 27, 28, 72, 31, 76, N'شكوى', N'', 1054, N'شكوى', CAST(N'2018-12-26T13:57:48.193' AS DateTime), N'mowaten100@hotmail.com', 1, NULL, NULL, N'32.2798558,34.8586886', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (54, N'53bec6d1-a1b3-4dcd-abf5-af3894851e9c', 42, 28, 88, 32, 68, N'شكوى ٣٣', N'', 1054, N'شكوى ٣٣', CAST(N'2018-12-26T14:02:03.053' AS DateTime), N'mowaten100@hotmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (55, N'92cf05d9-0c73-4bdf-9f42-4f1477fbace8', 42, 29, 50, 32, 50, N'شكوى شكوىشكوى', N'', 1054, N'شكوى', CAST(N'2018-12-26T14:14:14.790' AS DateTime), N'mowaten100@hotmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (56, N'434bb775-8ff2-4e3f-9314-7c8ea5f18253', 27, 28, 100, 32, 50, N'شكوى مسج', N'', 1054, N'شكوى مسج', CAST(N'2018-12-26T14:38:01.277' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (57, N'b0309ed2-386a-4da5-94f6-00d7df1b9765', 42, 28, 75, 31, 75, N'شكوى الان', N'', 1054, N'شكوى', CAST(N'2018-12-26T15:10:19.003' AS DateTime), N'crmemployer@gmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (58, N'd218c839-3f63-436c-8fcf-a70c53517ac5', 27, 0, NULL, 0, NULL, N'נתניה', NULL, 1054, N'נתניה', CAST(N'2018-12-26T15:15:20.067' AS DateTime), N'irahav@013.net.il', 1, NULL, N'אלדהראת ת ד 1142', N'סכנין', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (59, N'471d34a8-f99b-4161-ab5c-bcf1b1896e4e', 44, 29, 41, 31, 72, N'اضافه جديد', N'', NULL, N'احمد', CAST(N'2018-12-26T20:53:17.447' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL, N'31.903764100000004,35.2034184', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (60, N'791707d2-e49e-4e81-ad7c-178c9d081d9c', 27, 0, NULL, 0, NULL, N'تجربه شكوى 26', NULL, 1054, N'تجربه شكوى 26', CAST(N'2018-12-26T22:09:56.283' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'سالم', N'سالم', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (61, N'f7b42fd8-7f3e-472f-847d-9759f1ba5dfa', 41, 0, NULL, 0, NULL, N'تجربه شكوى 27', NULL, 1054, N'تجربه شكوى 27', CAST(N'2018-12-26T22:10:29.690' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, N'سالم', N'الموقع', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (62, N'33154025-3efe-4824-92d6-3835d9dd9f2b', 42, 29, 50, 32, 50, N'test adham', N'', 1054, N'test', CAST(N'2018-12-26T22:11:52.777' AS DateTime), N'adham.hassadiyeh@gmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (63, N'f94eefe7-96de-4686-9217-309f2e641a34', 27, 0, NULL, 0, NULL, N'تدفق مياه المجاري', NULL, 1054, N'sfdfhghg', CAST(N'2018-12-26T22:22:19.660' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, N'fdh', N'الحارة الشرقية', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (64, N'8c430609-c71d-4e59-aa79-2578ea4db274', 42, 28, 70, 32, 56, N'שטפונות', N'testtest', 1072, N'שטפונות בשכונה', CAST(N'2018-12-27T06:15:12.297' AS DateTime), N'crmemployer@gmail.com', 1, NULL, N'שטפונות', N'test', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (65, N'8601a33e-1c6f-4372-8871-65ed807e40ac', 42, 28, 73, 31, 77, N'פניה חדשה', N'test', 1054, N'שלום לכולם', CAST(N'2018-12-27T09:11:00.143' AS DateTime), N'crmemployer@gmail.com', 1, NULL, N'test', N'test', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (66, N'47d43db4-27a6-45ae-8d6d-7accf5d53687', 27, 29, NULL, 33, NULL, N'דליפת מים', N'test', 1074, N'דליפת מים', CAST(N'2018-12-27T09:36:40.677' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, N'דאליה', N'الحارة الشرقية', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (67, N'598bf509-5431-4c87-8dcf-8dbeae64747b', 27, 28, NULL, 31, NULL, N'name', N'test', 2, N'test', CAST(N'2018-12-27T09:45:06.597' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, N'dalya', N'4332', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (68, N'5e9f3ee1-e53c-4aee-bb33-d6ae71bf3cec', 27, 28, 97, 32, 50, N'تسريب مياه', N'', 1075, N'تسريب مياه', CAST(N'2018-12-27T09:52:27.467' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (69, N'34a74299-981e-4407-85fd-4fbb409b5fab', 42, 28, 99, 32, 69, N'تست', N'', 1054, N'تلت', CAST(N'2018-12-27T09:57:38.043' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL, NULL, N'', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (70, N'a781741b-ab47-4e00-878f-d0549ad6ec25', 43, 29, 65, 31, 79, N'test55', N'تبديل لامبه', 1054, N'test44', CAST(N'2018-12-31T11:35:52.813' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, N'kjhkjh', N'kjhkjh', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (71, N'bb557d04-adcf-407f-955f-71807d8c8a33', 62, NULL, NULL, NULL, NULL, N'test', N'fsdf', 2, N'fsdfsdfsdfsdf', CAST(N'2019-01-01T22:04:28.783' AS DateTime), N'salam-cs@hotmail.com', 2, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (72, N'00532f8d-33a0-459f-b291-39b4e7894f88', 63, NULL, NULL, NULL, NULL, N'بناء مدرسة', N'منت غالبيا', 1053, N'321 نتالتابتاب', CAST(N'2019-01-02T11:58:18.007' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (73, N'6922d115-95e0-4fc1-b389-28c35ef7bab8', 42, 28, 70, 31, 75, N'مرحبا', N'test test', 1072, N'مرحباج', CAST(N'2019-01-02T12:48:24.497' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, N'test', N'testtest', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (74, N'bfd44a51-e283-434d-ac4b-d791b1fd1d04', 63, NULL, NULL, NULL, NULL, N'عطاء', N'منت غالبيا', 2, N'عطاء', CAST(N'2019-01-03T10:39:21.973' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (75, N'c089e06e-58be-42e8-af90-0d4c64d02b3f', 42, 28, 71, 31, 70, N'test060119', N'', 1068, N'tes', CAST(N'2019-01-06T12:24:22.317' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL, NULL, N'32.2798435,34.8586924', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (76, N'4e34454a-3ada-4be6-af32-8860c33fbfb9', 63, 0, NULL, 0, NULL, N'مناقصه 1', NULL, NULL, N'مناقصه 1
', CAST(N'2019-01-08T09:58:05.927' AS DateTime), N'qasem@oyounmedia.com', 1, NULL, NULL, NULL, 4, N'1292', N'مناقصه 1')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (77, N'b83ed4ba-c6a2-4c63-bd9e-6e314d44b620', 63, 0, NULL, 0, NULL, N'مناقصه 1', NULL, NULL, N'مناقصه 1
', CAST(N'2019-01-08T09:59:15.657' AS DateTime), N'qasem@oyounmedia.com', 1, NULL, NULL, NULL, 4, N'1292', N'مناقصه 1')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (78, N'fb52ff24-1dd3-4193-9de8-83caf7a55e2d', 63, 0, NULL, 0, NULL, N'مناقصه 1', NULL, NULL, N'مناقصه 1
', CAST(N'2019-01-13T11:01:46.407' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, NULL, NULL, 4, N'1292', N'مناقصه 1')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (79, N'b01aaee9-8ad0-4525-a0b6-9ee8be69b590', 63, NULL, NULL, NULL, NULL, N'מכרז לבניית גן ציבורי', N'מכרז גן ציבורי', 1072, N'מכרז', CAST(N'2019-01-13T11:17:12.557' AS DateTime), N'salam-cs@hotmail.com', 1, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (80, N'a7e04195-b29c-4f24-b49d-a12a94d76bd0', 0, 0, NULL, 0, NULL, N'وظيفه اداري موارد بشرية', NULL, NULL, N'<p><b>الوصف الوظيفي</b></p><p><b><br></b><span style="font-family: Lato, &quot;Droid Arabic Naskh&quot;; text-align: right;">نطاق ومسؤوليات الوظيفة:</span></p><ul><li>متابعة حركات الدوام اليومية وعمل جميع الادخالات الخاصة بإعداد الرواتب.</li><li>متابعة مطالبات التامين الصحي للموظفين.</li><li>متابعة إصابات العمل.</li><li>متابعة إجراءات التعيين للموظفين الجدد.</li><li>متابعة إجراءات نهاية الخدمة واعداد المخالصة النهائية.</li><li>الرد على استفسارات الموظفين بخصوص الإجازات و الراتب و اية امور مرتبطة بالموارد البشرية.</li></ul><p><br></p><p><b>متطلبات الوظيفة</b></p><p><b><br></b></p><p dir="rtl" style="line-height: 1.8; font-family: Lato, &quot;Droid Arabic Naskh&quot;; text-align: right;">الخبرة والمؤهلات الواجب توفرها:</p><ul><li>بكالوريوس ادارة اعمال او اي تخصص ذو علاقة.</li><li>يفضل خبره سنتين في الموارد البشرية.</li><li>&nbsp;اتقان اللغة الانجليزية والعربية و العبرية (قراءة، كتابة).</li><li>القدرة على الاتصال بشكل ناجع وفعال مع الاخرين والعمل بروح الفريق.</li><li>معرفة بالقوانين والتعليمات ذات العلاقة مثل قانون العمل الاسرائيلي.</li><li>&nbsp;اتقان استخدام برامج الحاسوب وخاصة MS-Office<br></li><li>مهارة عالية في المتابعة.<br></li></ul><p><br></p><p><b>مكان العمل</b> : ________</p><p><b>آخر موعد للتقديم :&nbsp;</b><span style="color: rgb(126, 126, 126); font-family: Lato, &quot;Droid Arabic Naskh&quot;; font-size: 12px;">13 - Jul - 2016</span></p>', CAST(N'2019-01-14T17:31:48.250' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, NULL, NULL, 5, N'1217', N'وظيفه اداري موارد بشرية')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (81, N'15e863f3-4456-4d5f-b03e-3912640c5af2', 0, 0, NULL, 0, NULL, N'وظيفه اداري موارد بشرية', NULL, NULL, N'<p><b>الوصف الوظيفي</b></p><p><b><br></b><span style="font-family: Lato, &quot;Droid Arabic Naskh&quot;; text-align: right;">نطاق ومسؤوليات الوظيفة:</span></p><ul><li>متابعة حركات الدوام اليومية وعمل جميع الادخالات الخاصة بإعداد الرواتب.</li><li>متابعة مطالبات التامين الصحي للموظفين.</li><li>متابعة إصابات العمل.</li><li>متابعة إجراءات التعيين للموظفين الجدد.</li><li>متابعة إجراءات نهاية الخدمة واعداد المخالصة النهائية.</li><li>الرد على استفسارات الموظفين بخصوص الإجازات و الراتب و اية امور مرتبطة بالموارد البشرية.</li></ul><p><br></p><p><b>متطلبات الوظيفة</b></p><p><b><br></b></p><p dir="rtl" style="line-height: 1.8; font-family: Lato, &quot;Droid Arabic Naskh&quot;; text-align: right;">الخبرة والمؤهلات الواجب توفرها:</p><ul><li>بكالوريوس ادارة اعمال او اي تخصص ذو علاقة.</li><li>يفضل خبره سنتين في الموارد البشرية.</li><li>&nbsp;اتقان اللغة الانجليزية والعربية و العبرية (قراءة، كتابة).</li><li>القدرة على الاتصال بشكل ناجع وفعال مع الاخرين والعمل بروح الفريق.</li><li>معرفة بالقوانين والتعليمات ذات العلاقة مثل قانون العمل الاسرائيلي.</li><li>&nbsp;اتقان استخدام برامج الحاسوب وخاصة MS-Office<br></li><li>مهارة عالية في المتابعة.<br></li></ul><p><br></p><p><b>مكان العمل</b> : ________</p><p><b>آخر موعد للتقديم :&nbsp;</b><span style="color: rgb(126, 126, 126); font-family: Lato, &quot;Droid Arabic Naskh&quot;; font-size: 12px;">13 - Jul - 2016</span></p>', CAST(N'2019-01-17T09:34:14.003' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL, NULL, NULL, 5, N'1217', N'وظيفه اداري موارد بشرية')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (82, N'bd1c4ceb-02a4-4ce6-b8ca-672a8bce6247', 63, 0, NULL, 0, NULL, N'تسجيل للمدارس', NULL, 1075, NULL, CAST(N'2019-01-21T15:47:58.717' AS DateTime), N'citizen@smsm-it.com', 1, NULL, NULL, NULL, 4, N'1303', N'تسجيل للمدارس')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (83, N'ba932c31-5767-480c-974e-9a29bfc12340', 0, 0, NULL, 0, NULL, N'وظيفه اداري موارد بشرية', NULL, NULL, N'<p><b>الوصف الوظيفي</b></p><p><b><br></b><span style="font-family: Lato, &quot;Droid Arabic Naskh&quot;; text-align: right;">نطاق ومسؤوليات الوظيفة:</span></p><ul><li>متابعة حركات الدوام اليومية وعمل جميع الادخالات الخاصة بإعداد الرواتب.</li><li>متابعة مطالبات التامين الصحي للموظفين.</li><li>متابعة إصابات العمل.</li><li>متابعة إجراءات التعيين للموظفين الجدد.</li><li>متابعة إجراءات نهاية الخدمة واعداد المخالصة النهائية.</li><li>الرد على استفسارات الموظفين بخصوص الإجازات و الراتب و اية امور مرتبطة بالموارد البشرية.</li></ul><p><br></p><p><b>متطلبات الوظيفة</b></p><p><b><br></b></p><p dir="rtl" style="line-height: 1.8; font-family: Lato, &quot;Droid Arabic Naskh&quot;; text-align: right;">الخبرة والمؤهلات الواجب توفرها:</p><ul><li>بكالوريوس ادارة اعمال او اي تخصص ذو علاقة.</li><li>يفضل خبره سنتين في الموارد البشرية.</li><li>&nbsp;اتقان اللغة الانجليزية والعربية و العبرية (قراءة، كتابة).</li><li>القدرة على الاتصال بشكل ناجع وفعال مع الاخرين والعمل بروح الفريق.</li><li>معرفة بالقوانين والتعليمات ذات العلاقة مثل قانون العمل الاسرائيلي.</li><li>&nbsp;اتقان استخدام برامج الحاسوب وخاصة MS-Office<br></li><li>مهارة عالية في المتابعة.<br></li></ul><p><br></p><p><b>مكان العمل</b> : ________</p><p><b>آخر موعد للتقديم :&nbsp;</b><span style="color: rgb(126, 126, 126); font-family: Lato, &quot;Droid Arabic Naskh&quot;; font-size: 12px;">13 - Jul - 2016</span></p>', CAST(N'2019-01-21T15:50:54.967' AS DateTime), N'citizen@smsm-it.com', 1, NULL, NULL, NULL, 5, N'1217', N'وظيفه اداري موارد بشرية')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (84, N'37e8b162-470c-4359-9c46-5542e744cdc4', 27, 0, NULL, 0, NULL, N'تسريب مياه', NULL, 1075, N'تسريب مياه', CAST(N'2019-01-21T15:58:37.067' AS DateTime), N'citizen@smsm-it.com', 1, NULL, N'דאליה', N'الحارة الشرقية', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (85, N'd57020d1-63df-429d-b624-c1765e260e6e', 0, 0, NULL, 0, NULL, N'وظيفه اداري موارد بشرية', NULL, NULL, N'<p><b>الوصف الوظيفي</b></p><p><b><br></b><span style="font-family: Lato, &quot;Droid Arabic Naskh&quot;; text-align: right;">نطاق ومسؤوليات الوظيفة:</span></p><ul><li>متابعة حركات الدوام اليومية وعمل جميع الادخالات الخاصة بإعداد الرواتب.</li><li>متابعة مطالبات التامين الصحي للموظفين.</li><li>متابعة إصابات العمل.</li><li>متابعة إجراءات التعيين للموظفين الجدد.</li><li>متابعة إجراءات نهاية الخدمة واعداد المخالصة النهائية.</li><li>الرد على استفسارات الموظفين بخصوص الإجازات و الراتب و اية امور مرتبطة بالموارد البشرية.</li></ul><p><br></p><p><b>متطلبات الوظيفة</b></p><p><b><br></b></p><p dir="rtl" style="line-height: 1.8; font-family: Lato, &quot;Droid Arabic Naskh&quot;; text-align: right;">الخبرة والمؤهلات الواجب توفرها:</p><ul><li>بكالوريوس ادارة اعمال او اي تخصص ذو علاقة.</li><li>يفضل خبره سنتين في الموارد البشرية.</li><li>&nbsp;اتقان اللغة الانجليزية والعربية و العبرية (قراءة، كتابة).</li><li>القدرة على الاتصال بشكل ناجع وفعال مع الاخرين والعمل بروح الفريق.</li><li>معرفة بالقوانين والتعليمات ذات العلاقة مثل قانون العمل الاسرائيلي.</li><li>&nbsp;اتقان استخدام برامج الحاسوب وخاصة MS-Office<br></li><li>مهارة عالية في المتابعة.<br></li></ul><p><br></p><p><b>مكان العمل</b> : ________</p><p><b>آخر موعد للتقديم :&nbsp;</b><span style="color: rgb(126, 126, 126); font-family: Lato, &quot;Droid Arabic Naskh&quot;; font-size: 12px;">13 - Jul - 2016</span></p>', CAST(N'2019-01-21T16:18:47.507' AS DateTime), N'citizen@smsm-it.com', 1, NULL, NULL, NULL, 5, N'1217', N'وظيفه اداري موارد بشرية')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (86, N'6335f6f9-bf62-4cfb-a0dc-3ca89ad9555e', 62, 0, NULL, 0, NULL, N'تست 1', NULL, NULL, N'تست 1
', CAST(N'2019-01-21T16:22:50.177' AS DateTime), N'admin@smsm-it.com', 1, NULL, NULL, NULL, 3, N'1299', N'تست 1')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (87, N'aa663a03-c5ea-4149-9164-65aed5fb4936', 63, 0, NULL, 0, NULL, N'تسجيل للمدارس', NULL, NULL, NULL, CAST(N'2019-01-21T16:26:28.560' AS DateTime), N'admin@smsm-it.com', 1, NULL, NULL, NULL, 4, N'1303', N'تسجيل للمدارس')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (88, N'004a41df-b5c2-4c69-ae68-5b1ffd0e084c', 27, 28, 75, 32, 67, N'طوني', N'', 1075, N'طوني', CAST(N'2019-01-21T16:29:42.910' AS DateTime), N'citizen@smsm-it.com', 1, NULL, NULL, N'32.2798181,34.8586881', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (89, N'038ab89b-c324-46a8-989e-27821b125cd1', 27, 28, 73, 32, 68, N'طوني', N'', 1074, N'وصف', CAST(N'2019-01-21T16:41:51.180' AS DateTime), N'citizen@smsm-it.com', 1, NULL, NULL, N'32.2798266,34.8586489', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (90, N'0c60e653-e78b-4802-82f6-b58149fb92c0', 62, 0, NULL, 0, NULL, N'تست 1', NULL, NULL, N'تست 1
', CAST(N'2019-01-21T17:02:31.920' AS DateTime), N'citizen@smsm-it.com', 1, NULL, NULL, NULL, 3, N'1299', N'تست 1')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (91, N'8bf40602-2a95-4450-bc4c-7d76a8ff5d5d', 63, 0, NULL, 0, NULL, N'تسجيل للمدارس', NULL, NULL, NULL, CAST(N'2019-01-21T17:05:16.247' AS DateTime), N'citizen@smsm-it.com', 1, NULL, NULL, NULL, 4, N'1303', N'تسجيل للمدارس')
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (92, N'e3b269bb-9222-486b-8eaf-7670352be1c2', 27, 28, 100, 31, 100, N'تسريب مياه', N'', 1074, N'انفجار ماسورة في الشارع', CAST(N'2019-01-22T11:39:24.323' AS DateTime), N'citizen@smsm-it.com', 1, NULL, NULL, N'32.482954,35.0606684', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (93, N'4e30d18e-1519-496e-b54e-49d766de0e82', 42, 0, NULL, 0, NULL, N'הפסקת חשמל', NULL, 1068, N'נפילת עץ על עמוד חשמל', CAST(N'2019-01-26T19:53:59.557' AS DateTime), N'citizen@smsm-it.com', 1, NULL, N'רח'' אבן רושד', N'ליד תחנת הדלק', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (94, N'8d5af3b7-c843-4d25-858c-54ca3ee27702', 27, 29, 65, 32, 69, N'טסט 42', N'', 1074, N'טסט', CAST(N'2019-01-31T10:03:01.340' AS DateTime), N'admin@smsm-it.com', 1, NULL, NULL, N'32.7168861,35.2604967', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (95, N'5617bdbd-9440-4aae-99fa-4667e366d6ee', 27, 0, NULL, 0, NULL, N' انفجار  شبر مياه', NULL, 1074, N'تفاصبل', CAST(N'2019-01-31T11:15:30.073' AS DateTime), N'admin@smsm-it.com', 1, NULL, N'عنوان', N'الحارة الشرقية', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (96, N'efe368d1-6c40-4d94-9017-68ecbaddaea0', 27, 0, NULL, 0, NULL, N' انفجار  شبر مياه', NULL, 1074, N'تفاصبل', CAST(N'2019-01-31T11:15:32.367' AS DateTime), N'admin@smsm-it.com', 1, NULL, N'عنوان', N'الحارة الشرقية', 1, NULL, NULL)
INSERT [dbo].[SystemCases] ([Id], [UniqueId], [CategoryId], [SeverityId], [SeverityValue], [PriorityId], [PriorityValue], [Title], [Tags], [AssigneeId], [Description], [CreatedOn], [CreatedBy], [Status], [DeletedOn], [Address], [Location], [TypeId], [FormId], [FormName]) VALUES (97, N'd85b8c32-5690-4339-932d-3a48562ce503', 27, 28, 80, 32, 50, N'شكوى', N'', 1075, N'وصف', CAST(N'2019-01-31T11:16:49.700' AS DateTime), N'admin@smsm-it.com', 1, NULL, NULL, N'32.7169006,35.2605587', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SystemCases] OFF
SET IDENTITY_INSERT [dbo].[SystemFile] ON 

INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (1, 7, N'', CAST(N'2018-12-24T15:26:26.027' AS DateTime), N'muhammad.maj@gmail.com', CAST(N'2018-12-24T15:26:26.027' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (2, 7, N'', CAST(N'2018-12-24T15:27:09.020' AS DateTime), N'muhammad.maj@gmail.com', CAST(N'2018-12-24T15:27:09.020' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (3, 7, N'', CAST(N'2018-12-24T15:27:31.577' AS DateTime), N'muhammad.maj@gmail.com', CAST(N'2018-12-24T15:27:31.577' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (4, 7, N'', CAST(N'2018-12-24T15:28:27.987' AS DateTime), N'muhammad.maj@gmail.com', CAST(N'2018-12-24T15:28:27.987' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (5, 7, N'', CAST(N'2018-12-25T09:18:13.677' AS DateTime), N'muhammad.maj@gmail.com', CAST(N'2018-12-25T09:18:13.677' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (6, 2, N'http://cms-Ilut.smsm-it.com/Document/9/1329.jpg', CAST(N'2018-12-25T13:38:54.830' AS DateTime), N'maram.sh.22@hotmail.com', CAST(N'2018-12-25T13:38:54.830' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (7, 2, N'http://cms-Ilut.smsm-it.com/Document/9/1330.jpg', CAST(N'2018-12-25T13:43:25.800' AS DateTime), N'maram.sh.22@hotmail.com', CAST(N'2018-12-25T13:43:25.800' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (8, 2, N'http://cms-Ilut.smsm-it.com/Document/9/1331.jpg', CAST(N'2018-12-25T14:22:21.287' AS DateTime), N'maram.sh.22@hotmail.com', CAST(N'2018-12-25T14:22:21.287' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (9, 7, N'', CAST(N'2018-12-25T14:54:59.147' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-12-25T14:54:59.147' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (10, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/4.pdf', CAST(N'2018-12-25T14:58:54.357' AS DateTime), N'maram.sh.22@hotmail.com', CAST(N'2018-12-25T14:58:54.357' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (11, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/5.pdf', CAST(N'2018-12-25T15:03:30.993' AS DateTime), N'smsmit2018@hotmail.com', CAST(N'2018-12-25T15:03:30.993' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (12, 7, N'', CAST(N'2018-12-25T15:44:12.037' AS DateTime), N'crmemployer@gmail.com', CAST(N'2018-12-25T15:44:12.037' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (13, 7, N'', CAST(N'2018-12-25T15:44:44.410' AS DateTime), N'crmemployer@gmail.com', CAST(N'2018-12-25T15:44:44.410' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (14, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/4.pdf', CAST(N'2018-12-25T16:11:40.283' AS DateTime), N'maram.sh.22@hotmail.com', CAST(N'2018-12-25T16:11:40.283' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (15, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/7.pdf', CAST(N'2018-12-25T16:17:40.563' AS DateTime), N'maram.sh.22@hotmail.com', CAST(N'2018-12-25T16:17:40.563' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (16, 2, N'', CAST(N'2018-12-25T20:04:37.827' AS DateTime), N'', CAST(N'2018-12-25T20:04:37.827' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (17, 2, N'', CAST(N'2018-12-25T20:05:28.013' AS DateTime), N'', CAST(N'2018-12-25T20:05:28.013' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (18, 2, N'', CAST(N'2018-12-25T20:07:33.063' AS DateTime), N'', CAST(N'2018-12-25T20:07:33.063' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (19, 2, N'http://cms-Ilut.smsm-it.com/Document/9/1337.png', CAST(N'2018-12-25T20:13:59.707' AS DateTime), N'mowaten2@outlook.com', CAST(N'2018-12-25T20:13:59.707' AS DateTime), N'mowaten2@outlook.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (20, 2, N'', CAST(N'2018-12-25T20:30:20.570' AS DateTime), N'', CAST(N'2018-12-25T20:30:20.570' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (21, 2, N'', CAST(N'2018-12-25T20:31:18.623' AS DateTime), N'', CAST(N'2018-12-25T20:31:18.623' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (22, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/22.jpg', CAST(N'2018-12-25T20:35:04.043' AS DateTime), N'', CAST(N'2018-12-25T20:35:04.043' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (23, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/22.jpg', CAST(N'2018-12-25T20:35:10.110' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-12-25T20:35:10.110' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (24, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/8.pdf', CAST(N'2018-12-25T21:25:37.443' AS DateTime), N'mowaten2@outlook.com', CAST(N'2018-12-25T21:25:37.447' AS DateTime), N'mowaten2@outlook.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (25, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/9.pdf', CAST(N'2018-12-25T21:26:29.307' AS DateTime), N'mowaten2@outlook.com', CAST(N'2018-12-25T21:26:29.307' AS DateTime), N'mowaten2@outlook.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (26, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/26.jpg', CAST(N'2018-12-26T10:13:47.050' AS DateTime), N'', CAST(N'2018-12-26T10:13:47.050' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (27, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/26.jpg', CAST(N'2018-12-26T10:13:53.207' AS DateTime), N'mowaten100@hotmail.com', CAST(N'2018-12-26T10:13:53.207' AS DateTime), N'mowaten100@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (28, 2, N'http://cms-Ilut.smsm-it.com/Document/9/1339.jpg', CAST(N'2018-12-26T11:35:31.327' AS DateTime), N'adham.hassadiyeh@gmail.com', CAST(N'2018-12-26T11:35:31.327' AS DateTime), N'adham.hassadiyeh@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (29, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/29.jpg', CAST(N'2018-12-26T11:47:15.447' AS DateTime), N'', CAST(N'2018-12-26T11:47:15.447' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (30, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/29.jpg', CAST(N'2018-12-26T11:47:21.133' AS DateTime), N'maram.sh.22@hotmail.com', CAST(N'2018-12-26T11:47:21.133' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (31, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/31.jpg', CAST(N'2018-12-26T12:56:24.363' AS DateTime), N'', CAST(N'2018-12-26T12:56:24.363' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (32, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/31.jpg', CAST(N'2018-12-26T12:56:31.740' AS DateTime), N'adham.hassadiyeh@gmail.com', CAST(N'2018-12-26T12:56:31.740' AS DateTime), N'adham.hassadiyeh@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (33, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/33.jpg', CAST(N'2018-12-26T13:16:10.557' AS DateTime), N'', CAST(N'2018-12-26T13:16:10.557' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (34, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/33.jpg', CAST(N'2018-12-26T13:16:16.340' AS DateTime), N'adham.hassadiyeh@gmail.com', CAST(N'2018-12-26T13:16:16.340' AS DateTime), N'adham.hassadiyeh@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (35, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/35.jpg', CAST(N'2018-12-26T13:57:47.477' AS DateTime), N'', CAST(N'2018-12-26T13:57:47.477' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (36, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/35.jpg', CAST(N'2018-12-26T13:57:53.993' AS DateTime), N'mowaten100@hotmail.com', CAST(N'2018-12-26T13:57:53.993' AS DateTime), N'mowaten100@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (37, 2, N'http://cms-Ilut.smsm-it.com/Document/9/1345.jpg', CAST(N'2018-12-26T15:15:25.767' AS DateTime), N'irahav@013.net.il', CAST(N'2018-12-26T15:15:25.767' AS DateTime), N'irahav@013.net.il', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (38, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/38.jpg', CAST(N'2018-12-27T06:15:12.017' AS DateTime), N'', CAST(N'2018-12-27T06:15:12.017' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (39, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/38.jpg', CAST(N'2018-12-27T06:15:21.137' AS DateTime), N'crmemployer@gmail.com', CAST(N'2018-12-27T06:15:21.137' AS DateTime), N'crmemployer@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (40, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/40.jpg', CAST(N'2018-12-27T09:57:37.787' AS DateTime), N'', CAST(N'2018-12-27T09:57:37.787' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (41, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/40.jpg', CAST(N'2018-12-27T09:57:44.693' AS DateTime), N'maram.sh.22@hotmail.com', CAST(N'2018-12-27T09:57:44.693' AS DateTime), N'maram.sh.22@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (42, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/42.jpg', CAST(N'2018-12-31T14:16:51.867' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2018-12-31T14:16:51.870' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (43, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/43.jpg', CAST(N'2019-01-02T11:58:12.953' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2019-01-02T11:58:12.953' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (44, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/44.jpg', CAST(N'2019-01-06T12:24:21.803' AS DateTime), N'', CAST(N'2019-01-06T12:24:21.803' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (45, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/45.jpg', CAST(N'2019-01-06T12:24:21.843' AS DateTime), N'', CAST(N'2019-01-06T12:24:21.843' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (46, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/44.jpg', CAST(N'2019-01-06T12:24:27.537' AS DateTime), N'muhammad.maj@gmail.com', CAST(N'2019-01-06T12:24:27.537' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (47, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/45.jpg', CAST(N'2019-01-06T12:24:27.553' AS DateTime), N'muhammad.maj@gmail.com', CAST(N'2019-01-06T12:24:27.553' AS DateTime), N'muhammad.maj@gmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (48, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/16.pdf', CAST(N'2019-01-08T09:58:06.007' AS DateTime), N'qasem@oyounmedia.com', CAST(N'2019-01-08T09:58:06.007' AS DateTime), N'qasem@oyounmedia.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (49, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/17.pdf', CAST(N'2019-01-08T09:59:15.670' AS DateTime), N'qasem@oyounmedia.com', CAST(N'2019-01-08T09:59:15.670' AS DateTime), N'qasem@oyounmedia.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (50, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/21.pdf', CAST(N'2019-01-13T11:01:46.480' AS DateTime), N'smsmit2018@hotmail.com', CAST(N'2019-01-13T11:01:46.480' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (51, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/51.xlsx', CAST(N'2019-01-13T11:17:11.780' AS DateTime), N'salam-cs@hotmail.com', CAST(N'2019-01-13T11:17:11.780' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (52, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/22.pdf', CAST(N'2019-01-14T17:31:48.327' AS DateTime), N'smsmit2018@hotmail.com', CAST(N'2019-01-14T17:31:48.327' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (53, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/23.pdf', CAST(N'2019-01-17T09:34:14.097' AS DateTime), N'smsmit2018@hotmail.com', CAST(N'2019-01-17T09:34:14.097' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (54, 2, N'http://cms-Ilut.smsm-it.com/Document/11/1370.jpg', CAST(N'2019-01-17T09:34:14.127' AS DateTime), N'smsmit2018@hotmail.com', CAST(N'2019-01-17T09:34:14.127' AS DateTime), N'smsmit2018@hotmail.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (55, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/27.pdf', CAST(N'2019-01-21T16:18:47.520' AS DateTime), N'citizen@smsm-it.com', CAST(N'2019-01-21T16:18:47.520' AS DateTime), N'citizen@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (56, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/29.pdf', CAST(N'2019-01-21T16:22:50.273' AS DateTime), N'admin@smsm-it.com', CAST(N'2019-01-21T16:22:50.273' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (57, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/30.pdf', CAST(N'2019-01-21T16:26:28.570' AS DateTime), N'admin@smsm-it.com', CAST(N'2019-01-21T16:26:28.570' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (58, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/58.jpg', CAST(N'2019-01-21T16:29:42.770' AS DateTime), N'', CAST(N'2019-01-21T16:29:42.770' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (59, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/58.jpg', CAST(N'2019-01-21T16:29:42.920' AS DateTime), N'citizen@smsm-it.com', CAST(N'2019-01-21T16:29:42.920' AS DateTime), N'citizen@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (60, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/60.jpg', CAST(N'2019-01-21T16:41:51.073' AS DateTime), N'', CAST(N'2019-01-21T16:41:51.073' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (61, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/60.jpg', CAST(N'2019-01-21T16:41:51.190' AS DateTime), N'citizen@smsm-it.com', CAST(N'2019-01-21T16:41:51.190' AS DateTime), N'citizen@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (62, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/31.pdf', CAST(N'2019-01-21T17:02:31.930' AS DateTime), N'citizen@smsm-it.com', CAST(N'2019-01-21T17:02:31.930' AS DateTime), N'citizen@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (63, 2, N'http://cms-Ilut.smsm-it.com/Document/pdf/32.pdf', CAST(N'2019-01-21T17:05:16.257' AS DateTime), N'citizen@smsm-it.com', CAST(N'2019-01-21T17:05:16.257' AS DateTime), N'citizen@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (64, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/64.jpg', CAST(N'2019-01-22T11:39:24.113' AS DateTime), N'', CAST(N'2019-01-22T11:39:24.113' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (65, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/64.jpg', CAST(N'2019-01-22T11:39:32.477' AS DateTime), N'citizen@smsm-it.com', CAST(N'2019-01-22T11:39:32.477' AS DateTime), N'citizen@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (66, 2, N'http://cms-Ilut.smsm-it.com/Document/9/1371.jpg', CAST(N'2019-01-26T19:54:05.863' AS DateTime), N'citizen@smsm-it.com', CAST(N'2019-01-26T19:54:05.863' AS DateTime), N'citizen@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (67, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/67.jpg', CAST(N'2019-01-31T10:03:01.037' AS DateTime), N'', CAST(N'2019-01-31T10:03:01.037' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (68, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/67.jpg', CAST(N'2019-01-31T10:03:08.397' AS DateTime), N'admin@smsm-it.com', CAST(N'2019-01-31T10:03:08.397' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (69, 2, N'http://cms-Ilut.smsm-it.com/Document/9/1415.jpg', CAST(N'2019-01-31T11:15:37.403' AS DateTime), N'admin@smsm-it.com', CAST(N'2019-01-31T11:15:37.403' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (70, 2, N'http://cms-Ilut.smsm-it.com/Document/9/1415.jpg', CAST(N'2019-01-31T11:15:38.380' AS DateTime), N'admin@smsm-it.com', CAST(N'2019-01-31T11:15:38.380' AS DateTime), N'admin@smsm-it.com', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (71, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/71.jpg', CAST(N'2019-01-31T11:16:49.573' AS DateTime), N'', CAST(N'2019-01-31T11:16:49.573' AS DateTime), N'', 1, NULL)
INSERT [dbo].[SystemFile] ([Id], [TypeId], [FileUrl], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DeletedOn]) VALUES (72, 2, N'http://crm-ilut-dev.smsm-it.com//Document/2/71.jpg', CAST(N'2019-01-31T11:16:55.750' AS DateTime), N'admin@smsm-it.com', CAST(N'2019-01-31T11:16:55.750' AS DateTime), N'admin@smsm-it.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[SystemFile] OFF
SET IDENTITY_INSERT [dbo].[SystemFileTranslation] ON 

INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (1, 6, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (2, 7, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (3, 8, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (4, 10, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (5, 11, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (6, 14, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (7, 15, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (8, 19, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (9, 22, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (10, 23, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (11, 24, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (12, 25, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (13, 26, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (14, 27, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (15, 28, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (16, 29, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (17, 30, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (18, 31, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (19, 32, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (20, 33, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (21, 34, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (22, 35, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (23, 36, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (24, 37, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (25, 38, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (26, 39, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (27, 40, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (28, 41, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (29, 42, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (30, 43, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (31, 44, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (32, 45, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (33, 46, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (34, 47, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (35, 48, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (36, 49, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (37, 50, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (38, 51, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (39, 52, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (40, 53, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (41, 54, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (42, 55, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (43, 56, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (44, 57, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (45, 58, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (46, 59, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (47, 60, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (48, 61, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (49, 62, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (50, 63, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (51, 64, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (52, 65, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (53, 66, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (54, 67, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (55, 68, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (56, 69, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (57, 70, 1, 1, N'', N'', N'')
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (58, 71, 1, 1, N'', N'', NULL)
INSERT [dbo].[SystemFileTranslation] ([Id], [SystemFileId], [LanguageId], [IsDefault], [DisplayName], [Description], [AltText]) VALUES (59, 72, 1, 1, N'', N'', N'')
SET IDENTITY_INSERT [dbo].[SystemFileTranslation] OFF
SET IDENTITY_INSERT [dbo].[SystemLog] ON 

INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, N'An item with the same key has already been added.', N'Error while check authentication!', N'InnerException: , StackTrace:    at System.ThrowHelper.ThrowArgumentException(ExceptionResource resource)
   at System.Collections.Generic.Dictionary`2.Insert(TKey key, TValue value, Boolean add)
   at System.Data.Entity.Core.Objects.ObjectStateManager.AddEntityEntryToDictionary(EntityEntry entry, EntityState state)
   at System.Data.Entity.Core.Objects.ObjectStateManager.AddEntry(IEntityWrapper wrappedObject, EntityKey passedKey, EntitySet entitySet, String argumentName, Boolean isAdded)
   at System.Data.Entity.Core.Common.Internal.Materialization.Shaper.HandleEntityAppendOnly[TEntity](Func`2 constructEntityDelegate, EntityKey entityKey, EntitySet entitySet)
   at lambda_method(Closure , Shaper )
   at System.Data.Entity.Core.Common.Internal.Materialization.Coordinator`1.ReadNextElement(Shaper shaper)
   at System.Data.Entity.Core.Common.Internal.Materialization.Shaper`1.SimpleEnumerator.MoveNext()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__1[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.FirstOrDefault[TSource](IQueryable`1 source, Expression`1 predicate)
   at CRM.Web.Helpers.AuthenticationHelper.CheckAuthentication(String pageName, String permissionKey, String userName) in C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Helpers\AuthenticationHelper.cs:line 21', CAST(N'2019-03-04T11:26:47.947' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, N'An item with the same key has already been added.', N'Error while check authentication!', N'InnerException: , StackTrace:    at System.ThrowHelper.ThrowArgumentException(ExceptionResource resource)
   at System.Collections.Generic.Dictionary`2.Insert(TKey key, TValue value, Boolean add)
   at System.Data.Entity.Core.Objects.ObjectStateManager.AddStateManagerTypeMetadata(EntitySet entitySet, ObjectTypeMapping mapping)
   at System.Data.Entity.Core.Objects.ObjectStateManager.GetOrAddStateManagerTypeMetadata(Type entityType, EntitySet entitySet)
   at System.Data.Entity.Core.Objects.ObjectStateManager.AddEntry(IEntityWrapper wrappedObject, EntityKey passedKey, EntitySet entitySet, String argumentName, Boolean isAdded)
   at System.Data.Entity.Core.Common.Internal.Materialization.Shaper.HandleEntityAppendOnly[TEntity](Func`2 constructEntityDelegate, EntityKey entityKey, EntitySet entitySet)
   at lambda_method(Closure , Shaper )
   at System.Data.Entity.Core.Common.Internal.Materialization.Coordinator`1.ReadNextElement(Shaper shaper)
   at System.Data.Entity.Core.Common.Internal.Materialization.Shaper`1.SimpleEnumerator.MoveNext()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__1[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.FirstOrDefault[TSource](IQueryable`1 source, Expression`1 predicate)
   at CRM.Web.Helpers.AuthenticationHelper.CheckAuthentication(String pageName, String permissionKey, String userName) in C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Helpers\AuthenticationHelper.cs:line 21', CAST(N'2019-03-04T11:26:47.950' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, N'An item with the same key has already been added.', N'Error while check authentication!', N'InnerException: , StackTrace:    at System.ThrowHelper.ThrowArgumentException(ExceptionResource resource)
   at System.Collections.Generic.Dictionary`2.Insert(TKey key, TValue value, Boolean add)
   at System.Data.Entity.Core.Objects.ObjectStateManager.AddEntityEntryToDictionary(EntityEntry entry, EntityState state)
   at System.Data.Entity.Core.Objects.ObjectStateManager.AddEntry(IEntityWrapper wrappedObject, EntityKey passedKey, EntitySet entitySet, String argumentName, Boolean isAdded)
   at System.Data.Entity.Core.Common.Internal.Materialization.Shaper.HandleEntityAppendOnly[TEntity](Func`2 constructEntityDelegate, EntityKey entityKey, EntitySet entitySet)
   at lambda_method(Closure , Shaper )
   at System.Data.Entity.Core.Common.Internal.Materialization.Coordinator`1.ReadNextElement(Shaper shaper)
   at System.Data.Entity.Core.Common.Internal.Materialization.Shaper`1.SimpleEnumerator.MoveNext()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__1[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.FirstOrDefault[TSource](IQueryable`1 source, Expression`1 predicate)
   at CRM.Web.Helpers.AuthenticationHelper.CheckAuthentication(String pageName, String permissionKey, String userName) in C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Helpers\AuthenticationHelper.cs:line 0', CAST(N'2019-03-04T11:26:47.947' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (4, N'An item with the same key has already been added.', N'Error while check authentication!', N'InnerException: , StackTrace:    at System.ThrowHelper.ThrowArgumentException(ExceptionResource resource)
   at System.Collections.Generic.Dictionary`2.Insert(TKey key, TValue value, Boolean add)
   at System.Data.Entity.Core.Objects.ObjectStateManager.AddEntityEntryToDictionary(EntityEntry entry, EntityState state)
   at System.Data.Entity.Core.Objects.ObjectStateManager.AddEntry(IEntityWrapper wrappedObject, EntityKey passedKey, EntitySet entitySet, String argumentName, Boolean isAdded)
   at System.Data.Entity.Core.Common.Internal.Materialization.Shaper.HandleEntityAppendOnly[TEntity](Func`2 constructEntityDelegate, EntityKey entityKey, EntitySet entitySet)
   at lambda_method(Closure , Shaper )
   at System.Data.Entity.Core.Common.Internal.Materialization.Coordinator`1.ReadNextElement(Shaper shaper)
   at System.Data.Entity.Core.Common.Internal.Materialization.Shaper`1.SimpleEnumerator.MoveNext()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__1[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.FirstOrDefault[TSource](IQueryable`1 source, Expression`1 predicate)
   at CRM.Web.Helpers.AuthenticationHelper.CheckAuthentication(String pageName, String permissionKey, String userName) in C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Helpers\AuthenticationHelper.cs:line 21', CAST(N'2019-03-04T11:26:47.947' AS DateTime), N'salam-cs@hotmail.com', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Shared\_Layout.cshtml(183): error CS0128: A local variable named ''activeArabicMenu'' is already defined in this scope', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-04T12:00:43.953' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (6, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Shared\_Layout.cshtml(183): error CS0128: A local variable named ''activeArabicMenu'' is already defined in this scope', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-04T12:02:00.713' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (7, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Shared\_Layout.cshtml(186): error CS0128: A local variable named ''activeArabicMenu'' is already defined in this scope', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-04T12:05:21.200' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (8, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Shared\_Layout.cshtml(168): error CS0128: A local variable named ''activeArabicMenu'' is already defined in this scope', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-04T12:06:07.687' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (9, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Shared\_Layout.cshtml(168): error CS0128: A local variable named ''activeArabicMenu'' is already defined in this scope', N'ApplicationError', N'   at System.Web.Compilation.BuildManager.PostProcessFoundBuildResult(BuildResult result, Boolean keyFromVPP, VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetBuildResultFromCacheInternal(String cacheKey, Boolean keyFromVPP, VirtualPath virtualPath, Int64 hashCode, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultFromCacheInternal(VirtualPath virtualPath, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-04T12:06:13.990' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (10, N'ApplicationError - Encountered end tag "div" with no matching start tag.  Are your start/end tags properly balanced?
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-05T10:37:38.993' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (11, N'ApplicationError - Encountered end tag "div" with no matching start tag.  Are your start/end tags properly balanced?
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-05T10:38:03.613' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (12, N'ApplicationError - The provided anti-forgery token was meant for a different claims-based user than the current user.', N'ApplicationError', N'   at System.Web.Helpers.AntiXsrf.TokenValidator.ValidateTokens(HttpContextBase httpContext, IIdentity identity, AntiForgeryToken sessionToken, AntiForgeryToken fieldToken)
   at System.Web.Helpers.AntiXsrf.AntiForgeryWorker.Validate(HttpContextBase httpContext)
   at System.Web.Helpers.AntiForgery.Validate()
   at System.Web.Mvc.ValidateAntiForgeryTokenAttribute.OnAuthorization(AuthorizationContext filterContext)
   at System.Web.Mvc.ControllerActionInvoker.InvokeAuthorizationFilters(ControllerContext controllerContext, IList`1 filters, ActionDescriptor actionDescriptor)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__19(AsyncCallback asyncCallback, Object asyncState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.BeginInvokeAction(ControllerContext controllerContext, String actionName, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1c(AsyncCallback asyncCallback, Object asyncState, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecuteCore(AsyncCallback callback, Object state)
   at CRM.Web.Controllers.BaseController.BeginExecuteCore(AsyncCallback callback, Object state) in C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Controllers\BaseController.cs:line 26
   at System.Web.Mvc.Controller.<BeginExecute>b__14(AsyncCallback asyncCallback, Object callbackState, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__4(AsyncCallback asyncCallback, Object asyncState, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-05T10:38:18.143' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (13, N'ApplicationError - Encountered end tag "div" with no matching start tag.  Are your start/end tags properly balanced?
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-05T10:38:55.057' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (14, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Home\Index.cshtml(218): error CS0103: The name ''type'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-06T15:09:12.830' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (15, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Home\Index.cshtml(218): error CS0103: The name ''type'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-06T15:11:30.293' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (16, N'ApplicationError - Encountered end tag "div" with no matching start tag.  Are your start/end tags properly balanced?
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-10T09:32:23.127' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (17, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Home\Index.cshtml(888): error CS0103: The name ''caseByState'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-10T10:33:14.540' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (18, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Home\Index.cshtml(888): error CS0103: The name ''caseByState'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-10T10:34:11.980' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (19, N'ApplicationError - Encountered end tag "div" with no matching start tag.  Are your start/end tags properly balanced?
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-10T13:01:51.013' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (20, N'ApplicationError - Encountered end tag "div" with no matching start tag.  Are your start/end tags properly balanced?
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-10T13:02:32.230' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (21, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Home\Index.cshtml(327): error CS1001: Identifier expected', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-11T14:50:12.773' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (22, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Home\Index.cshtml(439): error CS0103: The name ''actionName'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T12:23:13.297' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (23, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\Home\Index.cshtml(439): error CS0103: The name ''actionName'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T12:23:43.160' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (24, N'ApplicationError - Unexpected "switch" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "switch" with "@".
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T12:30:16.133' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (25, N'ApplicationError - Unexpected "switch" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "switch" with "@".
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T12:30:59.550' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (26, N'ApplicationError - "/*Resources.Home.Close*/" is not valid at the start of a code block.  Only identifiers, keywords, comments, "(" and "{" are valid.
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T13:28:51.453' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (27, N'ApplicationError - "/*Resources.Home.Close*/" is not valid at the start of a code block.  Only identifiers, keywords, comments, "(" and "{" are valid.
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T13:30:23.823' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (28, N'ApplicationError - Encountered end tag "div" with no matching start tag.  Are your start/end tags properly balanced?
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T13:40:50.280' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (29, N'ApplicationError - Unexpected "if" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "if" with "@".
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T15:00:08.003' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (30, N'ApplicationError - Unexpected "if" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "if" with "@".
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T15:03:34.303' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (31, N'ApplicationError - Unexpected "if" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "if" with "@".
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T15:04:00.963' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (32, N'ApplicationError - Unexpected "if" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "if" with "@".
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T15:14:28.403' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (33, N'ApplicationError - Unexpected "if" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "if" with "@".
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T15:18:26.040' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (34, N'ApplicationError - Unexpected "if" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "if" with "@".
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-12T15:18:34.443' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (35, N'ApplicationError - Encountered end tag "div" with no matching start tag.  Are your start/end tags properly balanced?
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-14T12:21:05.860' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (36, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\PersonInformation\Index.cshtml(60): error CS1525: Invalid expression term '')''', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-17T11:46:56.743' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (37, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\PersonInformation\Index.cshtml(60): error CS1525: Invalid expression term '')''', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-17T11:47:13.817' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (38, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\PersonInformation\Details.cshtml(28): error CS0103: The name ''webdesigner'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-18T09:38:25.777' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (39, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\PersonInformation\Details.cshtml(28): error CS0103: The name ''webdesigner'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-18T09:38:43.637' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (40, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\Crm\CRM.Web\Views\PersonInformation\Details.cshtml(84): error CS0103: The name ''title'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-18T11:21:17.737' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (41, N'ApplicationError - A public action method ''View'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-20T13:08:04.393' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (42, N'ApplicationError - The controller for path ''/customer'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-20T13:09:55.280' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (43, N'ApplicationError - A public action method ''View'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-20T13:14:53.100' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (44, N'ApplicationError - A public action method ''view'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-20T13:16:10.933' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (45, N'ApplicationError - A public action method ''View'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-20T13:16:40.043' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1041, N'ApplicationError - A public action method ''Default.aspx'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T12:39:11.367' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1042, N'ApplicationError - A public action method ''CustomersController'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T14:53:50.600' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1043, N'ApplicationError - The controller for path ''/CustomersController/UpdateCustomer'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T15:16:20.257' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1044, N'ApplicationError - A public action method ''UpdateCustomer'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T15:18:45.220' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1045, N'ApplicationError - A public action method ''UpdateCustomer'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T15:22:25.597' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1046, N'ApplicationError - The controller for path ''/CustomersController/UpdateCustomer'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T15:26:41.010' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1047, N'ApplicationError - The controller for path ''/CustomersController/UpdateCustomer'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T15:29:34.767' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1048, N'ApplicationError - A public action method ''UpdateCustomer'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T15:29:56.573' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1049, N'ApplicationError - A public action method ''updatecustomer'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T15:30:28.897' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1050, N'ApplicationError - A public action method ''UpdateCustomer'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T15:34:30.793' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1051, N'ApplicationError - A public action method ''UpdateCustomer'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T15:35:14.333' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1052, N'ApplicationError - A public action method ''UpdateCustomer'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-25T15:42:45.780' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1053, N'ApplicationError - A public action method ''updatecustomer'' was not found on controller ''CRM.Web.Controllers.CustomersController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-26T09:24:15.793' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1054, N'ApplicationError - "class" is a reserved word and cannot be used in implicit expressions.  An explicit expression ("@()") must be used.
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-27T13:48:06.330' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1055, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Shared\_Layout.cshtml(149): error CS0103: The name ''currentUrl'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-03-27T15:10:12.663' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1056, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml(51): error CS0019: Operator ''=='' cannot be applied to operands of type ''string'' and ''int''', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-01T11:05:52.757' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1057, N'ApplicationError - The controller for path ''/index'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-01T11:16:06.243' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1058, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml(72): error CS1963: An expression tree may not contain a dynamic operation', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-01T11:26:22.407' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1059, N'ApplicationError - A public action method ''SetCulture'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-02T13:01:08.560' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1060, N'ApplicationError - A public action method ''SetCulture'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-02T13:01:27.507' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1061, N'ApplicationError - A public action method ''SetCulture'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-02T13:01:32.787' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1062, N'ApplicationError - A public action method ''SetCulture'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-02T13:04:27.547' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1063, N'ApplicationError - A public action method ''SetCulture'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-02T13:04:42.160' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1064, N'ApplicationError - The controller for path ''/leadinfo/1'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-04T10:48:31.900' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1065, N'ApplicationError - The controller for path ''/leadinfo/1'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-04T11:29:57.533' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1066, N'ApplicationError - The controller for path ''/leadinfo/1'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-04T11:57:48.027' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1067, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\LeadInfo.cshtml(120): error CS1003: Syntax error, '','' expected', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-04T13:01:28.133' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1068, N'ApplicationError - A public action method ''_create'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-04T14:04:15.657' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1069, N'ApplicationError - A public action method ''_Create'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-04T14:04:26.420' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1070, N'ApplicationError - A public action method ''_Create'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-04T14:05:35.220' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1071, N'ApplicationError - A public action method ''_Create'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-04T14:06:10.440' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1072, N'ApplicationError - The controller for path ''/Customer/Create'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-04T15:51:42.070' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1073, N'ApplicationError - The controller for path ''/Customer/Create'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-04T15:59:24.573' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1074, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_Index_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml:line 190
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-07T09:54:14.180' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1075, N'ApplicationError - A public action method ''Edit'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-07T11:56:58.080' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1076, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml(82): error CS1525: Invalid expression term ''float''', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-07T12:09:55.673' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1077, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml(152): error CS0103: The name ''floating'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-08T12:14:29.377' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1078, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_Index_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml:line 359
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-09T09:46:32.837' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1079, N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', N'Error While editing Lead (Post)', N'InnerException: , StackTrace:    at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at System.Data.Entity.Internal.LazyInternalContext.SaveChanges()
   at System.Data.Entity.DbContext.SaveChanges()
   at CRM.Web.Controllers.HomeController.LeadInfo(LeadViewModel lead) in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Controllers\HomeController.cs:line 124', CAST(N'2019-04-09T09:49:40.973' AS DateTime), N'', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1080, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_Index_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml:line 359
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-09T09:53:22.287' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1081, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_Index_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml:line 359
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-09T09:57:47.260' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1082, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml(9): error CS0117: ''Home'' does not contain a definition for ''Title''', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-14T10:48:49.947' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1083, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml(9): error CS0117: ''Home'' does not contain a definition for ''Title''', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-14T10:51:44.677' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1084, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml(9): error CS0117: ''Home'' does not contain a definition for ''Title''', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-14T10:56:26.547' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1085, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml(9): error CS0117: ''Home'' does not contain a definition for ''Title''', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-14T11:06:30.700' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1086, N'ApplicationError - C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\Index.cshtml(71): error CS0103: The name ''citizenSearchTypes'' does not exist in the current context', N'ApplicationError', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-04-16T11:09:34.807' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1087, N'ApplicationError - The controller for path ''/Departments'' was not found or does not implement IController.', N'ApplicationError', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-02T14:16:34.813' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1088, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_LeadInfo_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\LeadInfo.cshtml:line 192
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-05T12:30:05.083' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1089, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_LeadInfo_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\LeadInfo.cshtml:line 192
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-05T12:31:09.740' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1090, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_LeadInfo_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\LeadInfo.cshtml:line 193
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-05T14:13:29.757' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1091, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_LeadInfo_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\LeadInfo.cshtml:line 193
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-05T14:15:40.487' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1092, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_LeadInfo_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\LeadInfo.cshtml:line 193
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-05T14:17:04.223' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1093, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_LeadInfo_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\LeadInfo.cshtml:line 193
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-05T14:17:48.160' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1094, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_LeadInfo_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\LeadInfo.cshtml:line 193
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-05T14:18:12.747' AS DateTime), N'System', 0, NULL)
GO
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1095, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_LeadInfo_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\LeadInfo.cshtml:line 192
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-06T12:58:09.793' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1096, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-06T15:41:57.940' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1097, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-06T15:43:48.353' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1098, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-06T15:43:53.267' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1099, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-06T15:47:38.290' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1100, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-06T15:47:46.493' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1101, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-06T15:47:58.127' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1102, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-06T15:48:10.370' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1103, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-06T15:48:17.390' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1104, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-06T15:48:28.463' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1105, N'Object reference not set to an instance of an object.', N'Error While editing Lead (Post)', N'InnerException: , StackTrace:    at CRM.Web.Controllers.HomeController.UpdateLeadActivity(LeadActivityViewModel leadAct)', CAST(N'2019-05-07T11:53:54.717' AS DateTime), N'', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1106, N'ApplicationError - Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'ApplicationError', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Home_LeadInfo_cshtml.Execute() in C:\Users\Lenovo\Documents\Visual Studio 2017\CRM-WEB-NEW\CRM.Web\Views\Home\LeadInfo.cshtml:line 194
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-07T13:42:07.523' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1107, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-07T13:42:23.063' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1108, N'ApplicationError - A public action method ''DeleteLeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-07T13:42:57.787' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1109, N'ApplicationError - A public action method ''LeadActivity'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-08T11:51:53.193' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1110, N'ApplicationError - A public action method ''LeadInfoظ1'' was not found on controller ''CRM.Web.Controllers.HomeController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-08T14:56:06.987' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1111, N'ApplicationError - Encountered end tag "li" with no matching start tag.  Are your start/end tags properly balanced?
', N'ApplicationError', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-09T10:58:55.390' AS DateTime), N'System', 0, NULL)
INSERT [dbo].[SystemLog] ([Id], [Name], [Component], [StackTrace], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1112, N'ApplicationError - A public action method ''2'' was not found on controller ''CRM.Web.Controllers.ManageController''.', N'ApplicationError', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-05-13T10:36:29.507' AS DateTime), N'System', 0, NULL)
SET IDENTITY_INSERT [dbo].[SystemLog] OFF
SET IDENTITY_INSERT [dbo].[SystemSetting] ON 

INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1, CAST(N'2018-08-09T16:52:56.183' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (2, CAST(N'2018-08-09T16:52:56.320' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (3, CAST(N'2018-08-09T16:52:56.400' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, CAST(N'2018-08-09T23:20:36.073' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1002, CAST(N'2018-08-10T21:53:46.560' AS DateTime), N'System', 2, CAST(N'2018-08-11T15:17:11.247' AS DateTime))
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1003, CAST(N'2018-08-18T20:33:46.447' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1004, CAST(N'2018-08-21T20:04:39.117' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1005, CAST(N'2018-08-21T20:04:39.153' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1006, CAST(N'2018-08-21T22:15:40.127' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1007, CAST(N'2018-08-21T22:15:42.090' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1008, CAST(N'2018-08-24T21:35:30.127' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1009, CAST(N'2018-08-24T21:35:30.157' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1010, CAST(N'2018-08-24T21:35:30.163' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1011, CAST(N'2018-08-24T21:35:30.170' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1012, CAST(N'2018-08-24T21:35:30.177' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1013, CAST(N'2018-08-24T21:35:30.183' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1014, CAST(N'2018-08-24T21:35:30.190' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1015, CAST(N'2018-08-25T19:30:37.490' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1016, CAST(N'2018-09-02T19:47:36.457' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1017, CAST(N'2018-09-06T22:23:01.767' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1018, CAST(N'2018-09-10T03:04:36.603' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1019, CAST(N'2018-09-10T03:04:36.643' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1020, CAST(N'2018-10-20T19:00:12.887' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1021, CAST(N'2018-10-21T23:41:36.487' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1022, CAST(N'2018-11-16T21:14:43.770' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1023, CAST(N'2018-12-24T15:10:00.073' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1024, CAST(N'2018-12-24T15:10:00.097' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1025, CAST(N'2018-12-24T15:10:00.107' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1026, CAST(N'2018-12-24T15:10:00.113' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1027, CAST(N'2019-01-15T09:17:04.153' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1028, CAST(N'2019-01-15T09:17:04.183' AS DateTime), N'System', 1, NULL)
INSERT [dbo].[SystemSetting] ([Id], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (1029, CAST(N'2019-01-15T09:17:04.190' AS DateTime), N'System', 1, NULL)
SET IDENTITY_INSERT [dbo].[SystemSetting] OFF
SET IDENTITY_INSERT [dbo].[SystemSettingTranslation] ON 

INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1, 1, 1, 1, N'System_Google_Map_Key', N'AIzaSyASbUiCGYwyz0MsCk0hMrFzR6a1ksha2A8')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (2, 2, 1, 1, N'System_Google_Tag_Manager_Key', N'')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (3, 3, 1, 1, N'Tracking_Id_Google_Analytics', N'UA-87284465-2')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (5, 5, 1, 1, N'System_ControlPanel_PageSize', N'10')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1002, 1002, 1, 1, N'Static_Menu', N'/Home/ManageHome,/Menu,/Event,/Category,/Page,/Service,/Forms,/FormQuestionType,/FormUserProfileField,/Gallery,/Slider,/NewsLetters,/ContactUs,/UserProfile,/Permission,/MasterLookups,/SystemSettings,/Faqs')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1003, 1003, 1, 1, N'WebsiteUrl', N'http://crm-ilut-dev.smsm-it.com/')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1004, 1004, 1, 1, N'Crm_Integration_Api_Username', N'Integration')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1005, 1005, 1, 1, N'Crm_Integration_Api_Password', N'C@rm@123')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1006, 1006, 1, 1, N'FileMaxSize', N'5')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1007, 1007, 1, 1, N'AllowedFilesForUpload', N'.jpg,.gif,.png,.txt,.pdf,.jpeg,.bmp,.svg,.tiff,.ppm,.pgm,.pbm,.pnm')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1008, 1008, 1, 1, N'System_Emails_Source_Email', N'iluttest@gmail.com')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1009, 1009, 1, 1, N'System_Emails_Error_Email', N'iluttest@gmail.com')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1010, 1010, 1, 1, N'System_Emails_SmtpClient', N'smtp.gmail.com')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1011, 1011, 1, 1, N'System_Emails_Reset_Password', N'Ilut@123')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1012, 1012, 1, 1, N'System_Emails_ReplyTo', N'iluttest@gmail.com')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1013, 1013, 1, 1, N'System_Emails_SmtpPort', N'587')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1014, 1014, 1, 1, N'System_Emails_EnableSsl', N'true')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1015, 1015, 1, 1, N'System_Emails_Source_Email_Name', N'Crm Test')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1016, 1016, 1, 1, N'Background_Image_login_page', N'/Content/assets/img/hero.jpg')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1017, 1017, 1, 1, N'Background_Image_ForgotPassword_page', N'/Content/assets/img/hero.jpg')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1018, 1018, 1, 1, N'Cms_System_Link', N'http://cms-ilut-dev.smsm-it.com')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1019, 1019, 1, 1, N'Archiving_System_Link', N'http://archiving.smsm-it.com')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1020, 1020, 2, 0, N'System_CRM_ForgetPasswordLink', N'http://crm.smsm-it.com/Account/ForgotPassword')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1021, 1020, 1, 1, N'System_CRM_ForgetPasswordLink', N'http://crm-ilut-dev.smsm-it.com/Account/ForgotPassword')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1022, 1021, 2, 0, N'System_CRM_RegistrationLink', N'http://crm.smsm-it.com/Account/Register')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1023, 1021, 1, 1, N'System_CRM_RegistrationLink', N'http://crm-ilut-dev.smsm-it.com/Account/ForgotPassword')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1024, 1022, 1, 1, N'Crm_Allowed_Roles_For_Mobile', N'Administrator,citizen,User,CrmEmployer,DepartmentManager,DepartmentTeam')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1025, 1023, 1, 1, N'SMS_API_URL', N'https://019sms.co.il/api')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1026, 1024, 1, 1, N'SMS_Username', N'sectorspr')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1027, 1025, 1, 1, N'SMS_Password', N'faraj1234')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1028, 1026, 1, 1, N'SMS_Source', N'Ilut')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1029, 1027, 1, 1, N'CMS_Intg_Username', N'Integration')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1030, 1028, 1, 1, N'CMS_Intg_Password', N'C@ms@123')
INSERT [dbo].[SystemSettingTranslation] ([Id], [SettingId], [LanguageId], [IsDefault], [Name], [Value]) VALUES (1031, 1029, 1, 1, N'CMS_API_Forms_Url', N'http://cms-ilut-dev.smsm-it.com/api/FormsInfo/GetCaseByTypeId/')
SET IDENTITY_INSERT [dbo].[SystemSettingTranslation] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (2, N'salam-cs@hotmail.com', N'0527238893', N'854171915', NULL, CAST(N'1991-10-30T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2018-08-09T23:14:19.483' AS DateTime), 1, NULL, N'0527238893', NULL, N'http://crm.smsm-it.com//Document/7/162.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 17, N'salam-cs@hotmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1052, N'farajh@3-sectors.co.il', N'0542510333', N'300427697', NULL, CAST(N'1987-04-03T00:00:00.000' AS DateTime), 1, 4, CAST(N'2018-11-28T17:04:08.693' AS DateTime), 1, NULL, N'0542510333', NULL, NULL, NULL, NULL, 56, NULL, NULL, NULL, NULL, N'farajh@3-sectors.co.il', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1053, N'muhammad.maj@gmail.com', N'0503633113', N'036710544', N'', CAST(N'1985-03-24T00:00:00.000' AS DateTime), 1, 3, CAST(N'2018-12-09T09:34:47.273' AS DateTime), 1, NULL, N'0503633113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1054, 17, N'muhammad.maj@gmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1054, N'crmemployer@gmail.com', N'0542902686', N'456998787', N'', CAST(N'1998-12-29T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2018-12-24T15:40:28.787' AS DateTime), 1, NULL, N'0542902686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1054, 17, N'crmemployer@gmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1055, N'watermanmoder@gmail.com', N'', N'', N'', NULL, 2, NULL, CAST(N'2018-12-24T15:53:21.623' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, N'watermanmoder@gmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1056, N'watermanfirstman@gmail.com', N'', N'987654621', N'', CAST(N'1993-11-29T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2018-12-24T16:02:05.703' AS DateTime), 1, NULL, N'0542902686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, N'watermanfirstman@gmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1057, N'qasem@oyounmedia.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-12-24T16:45:27.377' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, N'qasem@oyounmedia.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1058, N'qasemhatem1@hotmail.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2018-12-24T17:28:06.747' AS DateTime), 1, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, N'qasemhatem1@hotmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1059, N'majadly@3-sectors.co.il', N'', N'', N'', CAST(N'1995-12-31T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2018-12-24T22:53:45.247' AS DateTime), 1, NULL, N'0506360092', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1054, 17, N'majadly@3-sectors.co.il', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1060, N'linam@3-sectors.co.il', N'', N'', N'', CAST(N'1998-12-31T00:00:00.000' AS DateTime), 2, 3, CAST(N'2018-12-25T09:32:19.867' AS DateTime), 1, NULL, N'0506360092', NULL, NULL, NULL, 9, 12, NULL, NULL, NULL, 17, N'linam@3-sectors.co.il', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1061, N'mowaten2@outlook.com', N'0501111112', N'556448879', N'', CAST(N'2003-02-02T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2018-12-25T10:45:45.793' AS DateTime), 1, NULL, N'0542902686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'mowaten2@outlook.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1062, N'qasemhatem@oyounmedai.com', N'5454545454', N'888555555', N'', NULL, NULL, NULL, CAST(N'2018-12-25T11:27:16.057' AS DateTime), 1, NULL, N'5454545454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'qasemhatem@oyounmedai.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1063, N'smsmit2018@hotmail.com', N'0527238893', N'853333333', N'', CAST(N'1992-05-22T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2018-12-25T11:34:31.223' AS DateTime), 1, NULL, N'0527238893', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'smsmit2018@hotmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1064, N'maram.sh.22@hotmail.com', N'0545760775', N'43223', NULL, CAST(N'2005-12-30T00:00:00.000' AS DateTime), 2, 3, CAST(N'2018-12-25T13:36:10.600' AS DateTime), 1, NULL, N'0545760775', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, N'maram.sh.22@hotmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1065, N'ahmad.maharma@gmail.com', N'092321105', N'936673565', N'', NULL, NULL, NULL, CAST(N'2018-12-25T14:23:08.130' AS DateTime), 1, NULL, N'0599001155', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ahmad.maharma@gmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1066, N'mowaten100@hotmail.com', N'0503633113', N'233111254', N'', CAST(N'2004-12-28T00:00:00.000' AS DateTime), 1, 3, CAST(N'2018-12-26T09:53:08.310' AS DateTime), 1, NULL, N'0503633113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, N'mowaten100@hotmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1067, N'mowathaf100@hotmail.com', N'0503633113', N'423423', N'', CAST(N'2001-12-28T00:00:00.000' AS DateTime), 2, 3, CAST(N'2018-12-26T10:03:28.120' AS DateTime), 1, NULL, N'0503633113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1054, 17, N'mowathaf100@hotmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1068, N'adham.hassadiyeh@gmail.com', N'0412345678', N'038004396', N'', CAST(N'1985-09-24T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2018-12-26T11:26:30.423' AS DateTime), 1, NULL, N'0507605632', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1054, NULL, N'adham.hassadiyeh@gmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1069, N'MetanesF@3-sectors.co.il', N'0525505883', N'', N'', CAST(N'2008-12-30T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2018-12-26T11:33:34.100' AS DateTime), 3, NULL, N'0525505883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, N'MetanesF@3-sectors.co.il', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1070, N'irahav@013.net.il', N'0522346861', N'012345678', NULL, CAST(N'1959-01-01T00:00:00.000' AS DateTime), 1, 3, CAST(N'2018-12-26T15:14:08.573' AS DateTime), 1, NULL, N'0522346861', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, N'irahav@013.net.il', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1071, N'demo1@smsm-it.com', N'1155555555', N'111233333', N'', NULL, 1, NULL, CAST(N'2019-01-03T10:27:13.893' AS DateTime), 1, NULL, N'1111111222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'demo1@smsm-it.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1072, N'visitor212@hotmail.com', N'', N'', N'', NULL, 1, NULL, CAST(N'2019-01-09T10:09:30.653' AS DateTime), 1, NULL, N'0542902686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, N'visitor212@hotmail.com', NULL)
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1073, N'visitor214@hotmail.com', N'0542902686', N'654987987', N'', NULL, NULL, NULL, CAST(N'2019-01-09T10:37:58.187' AS DateTime), 3, NULL, N'0542902686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'visitor214@hotmail.com', N'לא בשימוש')
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1074, N'admin@smsm-it.com', N'0595119122', N'122222222', N'', CAST(N'1990-03-01T00:00:00.000' AS DateTime), 1, 3, CAST(N'2019-01-21T08:48:43.643' AS DateTime), 1, NULL, N'0542902686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, N'majadly@3-sectors.co.il', N'')
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1075, N'emp@smsm-it.com', N'1554112121', N'554454588', N'', NULL, NULL, NULL, CAST(N'2019-01-21T08:50:01.957' AS DateTime), 1, NULL, N'0542902686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'MetanesF@3-sectors.co.il', N'')
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1076, N'citizen@smsm-it.com', N'5454545412', N'454484848', N'', CAST(N'1993-05-03T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-01-21T08:51:20.877' AS DateTime), 1, NULL, N'0545760775', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'marams@3-sectors.co.il', N'')
INSERT [dbo].[UserProfile] ([Id], [Username], [PhoneNumber], [IdNumber], [Fax], [Birthday], [GenderLookupId], [MartialStatusLookupId], [CreatedOn], [Status], [DeletedOn], [Mobile], [LastLogin], [ProfilePhoto], [IntegrationId], [ProvinceId], [CityId], [RegionId], [DepartmentId], [ManagerId], [PreferedLanguageId], [Email], [StatusEditDescription]) VALUES (1077, N't@t.com', N'56789', N'5678', NULL, CAST(N'2000-01-01T00:00:00.000' AS DateTime), 1, 3, CAST(N'2019-02-27T17:50:57.457' AS DateTime), 1, NULL, N'67890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, N't@t.com', NULL)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
SET IDENTITY_INSERT [dbo].[UserProfileOffDays] ON 

INSERT [dbo].[UserProfileOffDays] ([Id], [UserProfileId], [WeekDay], [CreatedOn], [CreatedBy], [Status], [DeletedOn]) VALUES (5, 1053, N'26', CAST(N'2018-12-26T10:35:13.443' AS DateTime), N'salam-cs@hotmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[UserProfileOffDays] OFF
SET IDENTITY_INSERT [dbo].[UserProfileTranslation] ON 

INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (2, 1, 1, 2, NULL, NULL, N'سلام و قاسم', NULL)
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1051, 1, 1, 1052, NULL, NULL, N'فرج هلون', N'يتسحاك سادي 5')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1052, 1, 1, 1053, NULL, NULL, N'محمد مجادلة', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1053, 1, 1, 1054, NULL, NULL, N'أدهم CRM ', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1054, 1, 1, 1055, NULL, NULL, N'מיסאן מנהל מים', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1055, 1, 1, 1056, NULL, NULL, N'العامل الثالث', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1056, 1, 1, 1057, NULL, NULL, N'qasem hatem', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1057, 1, 1, 1058, NULL, NULL, N'قاسم خمايسه', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1058, 1, 1, 1059, NULL, NULL, N'محمد رشدي', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1059, 1, 1, 1060, NULL, NULL, N'لينا مراعنة', N'dffgd')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1060, 1, 1, 1061, NULL, NULL, N'مواطن الثاني', N'baqa elgarbia, eben rosh')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1061, 1, 1, 1062, NULL, NULL, N'قاسم حاتم', N'سالم')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1062, 1, 1, 1063, NULL, NULL, N'qasem smsm', N'سالم')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1063, 1, 1, 1064, NULL, NULL, N'maram', NULL)
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1064, 1, 1, 1065, NULL, NULL, N'Ahmad', N'Ramallah')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1065, 1, 1, 1066, NULL, NULL, N'مواطن ثلاث', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1066, 1, 1, 1067, NULL, NULL, N'موظف ثلاث', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1067, 1, 1, 1068, NULL, NULL, N'adham hassadiyeh', N'אלדהראת ת ד 1142')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1068, 2, 0, 1069, NULL, NULL, N'tony', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1069, 1, 1, 1069, NULL, NULL, N'tony', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1070, 1, 1, 1070, NULL, NULL, N'איציק רהב', NULL)
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1071, 1, 1, 1071, NULL, NULL, N'demo', N'سالم')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1072, 2, 0, 1072, NULL, NULL, N'מבקר צופה', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1073, 1, 1, 1072, NULL, NULL, N'מבקר צופה', N'')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1074, 1, 1, 1073, NULL, NULL, N'מבקר צופה אתר', N'111')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1075, 1, 1, 1074, NULL, NULL, N'admin', N'عيلوط')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1076, 1, 1, 1075, NULL, NULL, N'employee', N'عيلوط')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1077, 1, 1, 1076, NULL, NULL, N'user', N'عيلوط')
INSERT [dbo].[UserProfileTranslation] ([Id], [LanguageId], [IsDefault], [UserProfileId], [FirstName], [LastName], [FullName], [Address]) VALUES (1078, 1, 1, 1077, NULL, NULL, N'rtyu', NULL)
SET IDENTITY_INSERT [dbo].[UserProfileTranslation] OFF
ALTER TABLE [dbo].[StateTransitionsConfiguration] ADD  DEFAULT ((14)) FOR [CategoryType]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Category]
GO
ALTER TABLE [dbo].[ArticleTranslation]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTranslation_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[ArticleTranslation] CHECK CONSTRAINT [FK_ArticleTranslation_Article]
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
ALTER TABLE [dbo].[CategoryTranslation]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTranslation_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[CategoryTranslation] CHECK CONSTRAINT [FK_CategoryTranslation_Category]
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
ALTER TABLE [dbo].[Lead_Activity]  WITH CHECK ADD FOREIGN KEY([Lead_ID])
REFERENCES [dbo].[Leads] ([Id])
GO
ALTER TABLE [dbo].[Leads]  WITH CHECK ADD FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[Leads]  WITH CHECK ADD FOREIGN KEY([CampaignId])
REFERENCES [dbo].[Campaigns] ([Id])
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
ALTER TABLE [dbo].[SMSTemplateTranslation]  WITH CHECK ADD  CONSTRAINT [FK_SMSTemplateTranslation_SMSTemplate] FOREIGN KEY([SMSTemplateId])
REFERENCES [dbo].[SMSTemplate] ([Id])
GO
ALTER TABLE [dbo].[SMSTemplateTranslation] CHECK CONSTRAINT [FK_SMSTemplateTranslation_SMSTemplate]
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
ALTER DATABASE [Crm_dev] SET  READ_WRITE 
GO
