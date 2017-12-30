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
/****** Object:  Database [Library]    Script Date: 2017-12-30 21:54:08 ******/
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
/****** Object:  Table [dbo].[bookInfo]    Script Date: 2017-12-30 21:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookInfo](
	[ISBN] [varchar](50) NOT NULL,
	[type] [varchar](50) NULL,
	[typeNo] [int] NULL,
	[name] [varchar](50) NULL,
	[author] [varchar](50) NULL,
	[press] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookNo]    Script Date: 2017-12-30 21:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookNo](
	[bookNO] [varchar](50) NOT NULL,
	[ISBN] [varchar](50) NOT NULL,
	[condition] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shelf_book]    Script Date: 2017-12-30 21:54:12 ******/
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
/****** Object:  Table [dbo].[shelfInfo]    Script Date: 2017-12-30 21:54:12 ******/
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
/****** Object:  Table [dbo].[stuInfo]    Script Date: 2017-12-30 21:54:12 ******/
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
/****** Object:  Table [dbo].[userInfo]    Script Date: 2017-12-30 21:54:12 ******/
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
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'0000000001', N'admin', N'00000001', NULL, NULL, 0, 0)
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'2015051471', N'胡承佐', N'00224588', N'信息科学技术学院', N'软件工程', 0, 0)
INSERT [dbo].[stuInfo] ([stuID], [stuName], [cardID], [Department], [major], [brwCond], [brwNum]) VALUES (N'2015051481', N'test', N'00224598', NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[userInfo] ON 

INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (1, N'admin', N'01321246104E24B8734F6BF6098CDC097D1B37EF59522E2DD88CE38C')
INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (2, N'2015051471', N'10C79B2D73349618C67AF7E1341AAC927BEA531AB20A06D6F373E32F')
INSERT [dbo].[userInfo] ([userID], [stuID], [password]) VALUES (4, N'2015051481', N'2AC8D1415A89414A4C290271C31F79E88AA02A612F98580B43797CAD')
SET IDENTITY_INSERT [dbo].[userInfo] OFF
ALTER TABLE [dbo].[shelf_book] ADD  CONSTRAINT [DF_shelf_book_num]  DEFAULT ((0)) FOR [num]
GO
ALTER TABLE [dbo].[stuInfo] ADD  CONSTRAINT [DF_stuInfo_brwCond]  DEFAULT ((0)) FOR [brwCond]
GO
ALTER TABLE [dbo].[stuInfo] ADD  CONSTRAINT [DF_stuInfo_brwNum]  DEFAULT ((0)) FOR [brwNum]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
