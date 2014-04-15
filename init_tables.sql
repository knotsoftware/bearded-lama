USE [bearded_lama]
GO
/****** Object:  Table [dbo].[Bans]    Script Date: 15/04/2014 1:49:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bans](
	[userId] [bigint] NULL,
	[gameId] [bigint] NULL,
	[duration] [datetimeoffset](7) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chat]    Script Date: 15/04/2014 1:49:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chat](
	[userId] [bigint] NULL,
	[gameId] [bigint] NULL,
	[message] [varchar](80) NULL,
	[timeStamp] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GameHistory]    Script Date: 15/04/2014 1:49:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameHistory](
	[userId] [bigint] NULL,
	[gameId] [bigint] NULL,
	[timeSpan] [datetimeoffset](7) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Games]    Script Date: 15/04/2014 1:49:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Games](
	[gameId] [bigint] IDENTITY(1,1) NOT NULL,
	[gameName] [varchar](50) NULL,
	[gameDesc] [varchar](300) NULL,
	[publicPackage] [xml] NULL,
	[rating] [int] NULL,
	[userId] [bigint] NULL,
	[subDate] [datetime] NULL,
	[hashValue] [varchar](32) NULL,
	[restrict] [bit] NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[gameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 15/04/2014 1:49:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Posts](
	[userId] [bigint] NULL,
	[pageId] [bigint] NULL,
	[content] [varchar](200) NULL,
	[timeStamp] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/04/2014 1:49:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [bigint] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](12) NULL,
	[email] [varchar](50) NULL,
	[age] [date] NULL,
	[userBio] [varchar](300) NULL,
	[avatar] [image] NULL,
	[creation] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
