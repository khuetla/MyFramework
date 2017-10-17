/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [bmag_db]    Script Date: 10/17/2017 4:27:05 PM ******/
CREATE DATABASE [bmag_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bmag_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL16ENTERPRISE\MSSQL\DATA\bmag_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bmag_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL16ENTERPRISE\MSSQL\DATA\bmag_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bmag_db] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bmag_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bmag_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bmag_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bmag_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bmag_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bmag_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [bmag_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bmag_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bmag_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bmag_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bmag_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bmag_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bmag_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bmag_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bmag_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bmag_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bmag_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bmag_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bmag_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bmag_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bmag_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bmag_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bmag_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bmag_db] SET RECOVERY FULL 
GO
ALTER DATABASE [bmag_db] SET  MULTI_USER 
GO
ALTER DATABASE [bmag_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bmag_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bmag_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bmag_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bmag_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bmag_db', N'ON'
GO
ALTER DATABASE [bmag_db] SET QUERY_STORE = OFF
GO
USE [bmag_db]
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
USE [bmag_db]
GO
/****** Object:  Table [dbo].[learner]    Script Date: 10/17/2017 4:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[learner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[dob] [datetime] NULL,
	[session_id] [int] NULL,
 CONSTRAINT [PK_learner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturer]    Script Date: 10/17/2017 4:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_lecturer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturer_teach_subject]    Script Date: 10/17/2017 4:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturer_teach_subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lecturer_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
 CONSTRAINT [PK_lecturer_teach_subject_1] PRIMARY KEY CLUSTERED 
(
	[lecturer_id] ASC,
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[session]    Script Date: 10/17/2017 4:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[session](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_session] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 10/17/2017 4:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[learner]  WITH CHECK ADD  CONSTRAINT [FK_learner_session] FOREIGN KEY([session_id])
REFERENCES [dbo].[session] ([id])
GO
ALTER TABLE [dbo].[learner] CHECK CONSTRAINT [FK_learner_session]
GO
ALTER TABLE [dbo].[lecturer_teach_subject]  WITH CHECK ADD  CONSTRAINT [FK_lecturer_teach_subject_lecturer] FOREIGN KEY([lecturer_id])
REFERENCES [dbo].[lecturer] ([id])
GO
ALTER TABLE [dbo].[lecturer_teach_subject] CHECK CONSTRAINT [FK_lecturer_teach_subject_lecturer]
GO
ALTER TABLE [dbo].[lecturer_teach_subject]  WITH CHECK ADD  CONSTRAINT [FK_lecturer_teach_subject_subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([id])
GO
ALTER TABLE [dbo].[lecturer_teach_subject] CHECK CONSTRAINT [FK_lecturer_teach_subject_subject]
GO
USE [master]
GO
ALTER DATABASE [bmag_db] SET  READ_WRITE 
GO
