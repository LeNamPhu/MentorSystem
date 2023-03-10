USE [master]
GO
/****** Object:  Database [mentorsystem]    Script Date: 26-Feb-23 6:27:53 PM ******/
CREATE DATABASE [mentorsystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mentorsystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\mentorsystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mentorsystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\mentorsystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [mentorsystem] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mentorsystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mentorsystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mentorsystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mentorsystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mentorsystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mentorsystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [mentorsystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mentorsystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mentorsystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mentorsystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mentorsystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mentorsystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mentorsystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mentorsystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mentorsystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mentorsystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mentorsystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mentorsystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mentorsystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mentorsystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mentorsystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mentorsystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mentorsystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mentorsystem] SET RECOVERY FULL 
GO
ALTER DATABASE [mentorsystem] SET  MULTI_USER 
GO
ALTER DATABASE [mentorsystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mentorsystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mentorsystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mentorsystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mentorsystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mentorsystem', N'ON'
GO
ALTER DATABASE [mentorsystem] SET QUERY_STORE = OFF
GO
USE [mentorsystem]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [mentorsystem]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 26-Feb-23 6:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](250) NULL,
	[password] [nvarchar](250) NULL,
	[role] [nvarchar](250) NULL,
	[fullname] [nvarchar](250) NULL,
	[phone] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[dateofbirth] [nvarchar](250) NULL,
	[sex] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 26-Feb-23 6:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[mentorid] [int] NULL,
	[schedule] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassInfo]    Script Date: 26-Feb-23 6:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassInfo](
	[classid] [int] NULL,
	[studentid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MentorCV]    Script Date: 26-Feb-23 6:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MentorCV](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mentorid] [int] NULL,
	[profession] [nvarchar](250) NULL,
	[achievement] [nvarchar](250) NULL,
	[job] [nvarchar](250) NULL,
	[introduction] [nvarchar](250) NULL,
	[service] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MentorSkill]    Script Date: 26-Feb-23 6:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MentorSkill](
	[skillid] [int] NULL,
	[mentorid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rating]    Script Date: 26-Feb-23 6:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rating] [int] NULL,
	[comment] [nvarchar](250) NULL,
	[studentid] [int] NULL,
	[mentorid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 26-Feb-23 6:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [int] NULL,
	[mentorid] [int] NULL,
	[classid] [int] NULL,
	[status] [nvarchar](250) NULL,
	[title] [nvarchar](250) NULL,
	[content] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skill]    Script Date: 26-Feb-23 6:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[status] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([mentorid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[ClassInfo]  WITH CHECK ADD FOREIGN KEY([classid])
REFERENCES [dbo].[Class] ([id])
GO
ALTER TABLE [dbo].[ClassInfo]  WITH CHECK ADD FOREIGN KEY([studentid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[MentorCV]  WITH CHECK ADD FOREIGN KEY([mentorid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[MentorSkill]  WITH CHECK ADD FOREIGN KEY([mentorid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[MentorSkill]  WITH CHECK ADD FOREIGN KEY([skillid])
REFERENCES [dbo].[Skill] ([id])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([mentorid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([studentid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([classid])
REFERENCES [dbo].[Class] ([id])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([mentorid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([studentid])
REFERENCES [dbo].[Account] ([id])
GO
USE [master]
GO
ALTER DATABASE [mentorsystem] SET  READ_WRITE 
GO
