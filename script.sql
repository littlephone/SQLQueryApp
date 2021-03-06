/*    ==脚本参数==

    源服务器版本 : SQL Server 2017 (14.0.1000)
    源数据库引擎版本 : Microsoft SQL Server Enterprise Edition
    源数据库引擎类型 : 独立的 SQL Server

    目标服务器版本 : SQL Server 2017
    目标数据库引擎版本 : Microsoft SQL Server Standard Edition
    目标数据库引擎类型 : 独立的 SQL Server
*/
USE [master]
GO
/****** Object:  Database [Library]    Script Date: 2018-1-3 1:11:30 ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'D:\SQLServer\MSSQL14.MSSQLSERVER\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'D:\SQLServer\MSSQL14.MSSQLSERVER\MSSQL\DATA\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Library', N'ON'
GO
ALTER DATABASE [Library] SET QUERY_STORE = OFF
GO
USE [Library]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Library]
GO
/****** Object:  Table [dbo].[administrator]    Script Date: 2018-1-3 1:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrator](
	[adminID] [varchar](50) NOT NULL,
	[adminPsw] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookInfo]    Script Date: 2018-1-3 1:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookInfo](
	[ISBN] [varchar](50) NOT NULL,
	[type] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[author] [varchar](50) NULL,
	[press] [varchar](50) NULL,
	[intro] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookNo]    Script Date: 2018-1-3 1:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookNo](
	[ISBN] [varchar](50) NOT NULL,
	[condition] [varchar](50) NULL,
 CONSTRAINT [PK_bookNo] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shelf_book]    Script Date: 2018-1-3 1:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shelf_book](
	[shelfNO] [int] NOT NULL,
	[ISBN] [varchar](50) NOT NULL,
	[num] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shelfInfo]    Script Date: 2018-1-3 1:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shelfInfo](
	[shelfNO] [int] NOT NULL,
	[col] [int] NULL,
	[row] [int] NULL,
	[side] [int] NULL,
	[campus] [int] NULL,
	[floor] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stu_book]    Script Date: 2018-1-3 1:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stu_book](
	[stuID] [varchar](50) NOT NULL,
	[ISBN] [varchar](50) NOT NULL,
	[shelfNO] [int] NOT NULL,
	[campus] [int] NULL,
	[brwDate] [date] NULL,
	[rtnDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stuInfo]    Script Date: 2018-1-3 1:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stuInfo](
	[stuID] [varchar](50) NOT NULL,
	[stuName] [varchar](50) NOT NULL,
	[cardID] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
	[major] [varchar](50) NULL,
	[brwCond] [int] NULL,
	[brwNum] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userInfo]    Script Date: 2018-1-3 1:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userInfo](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[stuID] [varchar](50) NULL,
	[password] [varchar](100) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[administrator] ([adminID], [adminPsw]) VALUES (N'admin', N'01321246104E24B8734F6BF6098CDC097D1B37EF59522E2DD88CE38C')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'962-215-001-2', N'文学', N'文学1', N'作者1', N'出版社1', N'简介1')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'962-215-001-3', N'文学', N'文学2', N'作者2', N'出版社2', N'简介2非常非常非常非常非常非常长吃葡萄不吐葡萄皮不吃葡萄倒吐葡萄皮')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'962-215-888-0', N'经济', N'经济1', N'作者1', N'出版社3', N'简介3')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'962-215-000-2', N'社科', N'社科1', N'作者3', N'出版社3', N'简介4')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'962-215-999-2', N'马哲', N'马哲1', N'作者3', N'出版社5', N'简介5')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'962-215-666-2', N'毛东', N'毛东1', N'作者4', N'出版社4', N'丢了丢了')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'ttest', N'ttest', N'ttest', N'ttest', N'ttest', N'ttest')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'asdf', N'asdf', N'asdf', N'asdf', N'asdf', N'asdf')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'123', N'123', N'123', N'123', N'123', N'123')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'aaa', N'aaa', N'aaa', N'aaa', N'aaa', N'aaa')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'testing', N'testing', N'testing', N'testing', N'testing', N'testing')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'test', N'test', N'test', N'test', N'test', N'test')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'2', N'2', N'2', N'2', N'2', N'2')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'3', N'3', N'3', N'3', N'3', N'3')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'testing', N'testing', N'testing', N'testing', N'testing', N'testing')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'1234', N'1234', N'1234', N'1234', N'1234', N'1234')
INSERT [dbo].[bookInfo] ([ISBN], [type], [name], [author], [press], [intro]) VALUES (N'aaa', N'aaa', N'aaa', N'aaa', N'aaa', N'aaa')
INSERT [dbo].[bookNo] ([ISBN], [condition]) VALUES (N'962-215-000-2', N'1')
INSERT [dbo].[bookNo] ([ISBN], [condition]) VALUES (N'962-215-001-2', N'0')
INSERT [dbo].[bookNo] ([ISBN], [condition]) VALUES (N'962-215-001-3', N'0')
INSERT [dbo].[bookNo] ([ISBN], [condition]) VALUES (N'962-215-666-2', N'3')
INSERT [dbo].[bookNo] ([ISBN], [condition]) VALUES (N'962-215-888-0', N'0')
INSERT [dbo].[bookNo] ([ISBN], [condition]) VALUES (N'962-215-999-2', N'0')
INSERT [dbo].[shelf_book] ([shelfNO], [ISBN], [num]) VALUES (1, N'962-215-001-2', 2)
INSERT [dbo].[shelf_book] ([shelfNO], [ISBN], [num]) VALUES (2, N'962-215-001-3', 2)
INSERT [dbo].[shelf_book] ([shelfNO], [ISBN], [num]) VALUES (3, N'962-215-888-0', 5)
INSERT [dbo].[shelf_book] ([shelfNO], [ISBN], [num]) VALUES (4, N'962-215-000-2', 7)
INSERT [dbo].[shelf_book] ([shelfNO], [ISBN], [num]) VALUES (5, N'962-215-999-2', 6)
INSERT [dbo].[shelf_book] ([shelfNO], [ISBN], [num]) VALUES (3, N'962-215-666-2', 1)
INSERT [dbo].[shelf_book] ([shelfNO], [ISBN], [num]) VALUES (1, N'123', 0)
INSERT [dbo].[shelf_book] ([shelfNO], [ISBN], [num]) VALUES (4, N'aaa', 2)
INSERT [dbo].[shelfInfo] ([shelfNO], [col], [row], [side], [campus], [floor]) VALUES (1, 1, 1, 1, 1, 1)
INSERT [dbo].[shelfInfo] ([shelfNO], [col], [row], [side], [campus], [floor]) VALUES (2, 1, 1, 2, 1, 1)
INSERT [dbo].[shelfInfo] ([shelfNO], [col], [row], [side], [campus], [floor]) VALUES (3, 1, 2, 1, 1, 2)
INSERT [dbo].[shelfInfo] ([shelfNO], [col], [row], [side], [campus], [floor]) VALUES (4, 2, 1, 1, 1, 1)
INSERT [dbo].[shelfInfo] ([shelfNO], [col], [row], [side], [campus], [floor]) VALUES (5, 1, 1, 1, 1, 1)
INSERT [dbo].[shelfInfo] ([shelfNO], [col], [row], [side], [campus], [floor]) VALUES (6, 1, 1, 1, 1, 1)
INSERT [dbo].[shelfInfo] ([shelfNO], [col], [row], [side], [campus], [floor]) VALUES (7, 1, 1, 1, 1, 2)
INSERT [dbo].[shelfInfo] ([shelfNO], [col], [row], [side], [campus], [floor]) VALUES (8, 2, 2, 2, 1, 2)
INSERT [dbo].[stu_book] ([stuID], [ISBN], [shelfNO], [campus], [brwDate], [rtnDate]) VALUES (N'2015051471', N'TESTING', 1, 1, CAST(N'2015-08-04' AS Date), CAST(N'2015-09-04' AS Date))
INSERT [dbo].[stu_book] ([stuID], [ISBN], [shelfNO], [campus], [brwDate], [rtnDate]) VALUES (N'admin', N'962-215-666-2', 3, 1, CAST(N'2018-01-03' AS Date), CAST(N'2018-02-03' AS Date))
INSERT [dbo].[stu_book] ([stuID], [ISBN], [shelfNO], [campus], [brwDate], [rtnDate]) VALUES (N'2015051471', N'123', 1, 1, CAST(N'2018-01-03' AS Date), CAST(N'2018-02-03' AS Date))
INSERT [dbo].[stu_book] ([stuID], [ISBN], [shelfNO], [campus], [brwDate], [rtnDate]) VALUES (N'2015051471', N'123', 1, 1, CAST(N'2018-01-03' AS Date), CAST(N'2018-02-03' AS Date))
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'0000000001', N'admin', N'00000001', NULL, NULL, 0, 0)
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'2015051471', N'胡承佐', N'00224588', N'信息科学技术学院', N'软件工程', 0, 0)
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'2015051481', N'test', N'00224598', NULL, NULL, 0, 0)
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'2015051472', N'胡承佑', N'2015051472', NULL, NULL, 0, 0)
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'2015051470', N'胡承佑', N'00224587', NULL, NULL, 0, 0)
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'2015051473', N'胡承佐', N'00224599', NULL, NULL, 0, 0)
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'2015051475', N'没放', N'00224595', NULL, NULL, 0, 0)
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'2014051472', N'武松', N'00214588', NULL, NULL, 0, 0)
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'2014051471', N'武松', N'00212445', NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[userInfo] ON 

INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (1, N'admin', N'01321246104E24B8734F6BF6098CDC097D1B37EF59522E2DD88CE38C')
INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (2, N'2015051471', N'10C79B2D73349618C67AF7E1341AAC927BEA531AB20A06D6F373E32F')
INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (4, N'2015051481', N'2AC8D1415A89414A4C290271C31F79E88AA02A612F98580B43797CAD')
INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (5, N'2015051472', N'8388E0BFDCF9AEC0069862DE4DFB4A2E82969ED6B7FB5ECE10CCB00B')
INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (6, N'2015051470', N'236BF9345649AA8E91F5D2AA94D4F52A1E7E50D47CB024777839434F')
INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (7, N'2015051473', N'DBCD411B9CB9AB4BEB8F03FA8346262BA19F5AFE4DBBFD06A46B3668')
INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (8, N'2015051475', N'8FE8DCD5F40E8B4E6FA71E3B94DE5F9176FCEB6DC2F1379DF2B1E908')
INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (10, N'2014051472', N'36437581CBE363AF91E7384D8FB6039C4FA1EE3D9DD2D858C83944EC')
INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (9, N'2014051471', N'3EE61B64537EA1B38AFCD22724309DC587A258D5FC00D10223E25BB4')
SET IDENTITY_INSERT [dbo].[userInfo] OFF
ALTER TABLE [dbo].[stuInfo] ADD  CONSTRAINT [DF_stuInfo_brwCond]  DEFAULT ((0)) FOR [brwCond]
GO
ALTER TABLE [dbo].[stuInfo] ADD  CONSTRAINT [DF_stuInfo_brwNum]  DEFAULT ((0)) FOR [brwNum]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
