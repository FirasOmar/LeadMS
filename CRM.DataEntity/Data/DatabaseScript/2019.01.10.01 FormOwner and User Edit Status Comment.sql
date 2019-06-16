Alter table UserProfile 
Add StatusEditDescription nvarchar(300) null
Go


CREATE TABLE [dbo].[FormOwner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CaseId] [int] Not Null,
	[FormId] [nvarchar](200) Null,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_FormOwner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FormOwner] WITH CHECK ADD  CONSTRAINT [FK_FormOwner] FOREIGN KEY([CaseId])
REFERENCES [dbo].[SystemCases] ([Id])
GO

ALTER TABLE [dbo].[FormOwner] CHECK CONSTRAINT [FK_FormOwner]
GO
