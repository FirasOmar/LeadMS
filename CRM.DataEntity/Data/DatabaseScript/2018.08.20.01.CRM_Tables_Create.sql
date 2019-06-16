USE [CrmSystem]
GO
/****** Object:  Table [dbo].[Sla]    Script Date: 8/21/2018 12:05:39 AM ******/
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
/****** Object:  Table [dbo].[SlaIgnoredCaseStates]    Script Date: 8/21/2018 12:05:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlaIgnoredCaseStates](
	[Id] [int] NOT NULL,
	[SlaId] [int] NOT NULL,
	[IgnoredCaseStateId] [int] NOT NULL,
 CONSTRAINT [PK_IgnoredCaseStates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlaTranslation]    Script Date: 8/21/2018 12:05:40 AM ******/
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
/****** Object:  Table [dbo].[StateHistory]    Script Date: 8/21/2018 12:05:40 AM ******/
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
/****** Object:  Table [dbo].[StateTransitionsConfiguration]    Script Date: 8/21/2018 12:05:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateTransitionsConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
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
