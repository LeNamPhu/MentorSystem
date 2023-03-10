USE [master]
GO
/****** Object:  Database [mentorsystem]    Script Date: 26-Feb-23 6:31:21 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 26-Feb-23 6:31:21 PM ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 26-Feb-23 6:31:21 PM ******/
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
/****** Object:  Table [dbo].[ClassInfo]    Script Date: 26-Feb-23 6:31:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassInfo](
	[classid] [int] NULL,
	[studentid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MentorCV]    Script Date: 26-Feb-23 6:31:22 PM ******/
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
/****** Object:  Table [dbo].[MentorSkill]    Script Date: 26-Feb-23 6:31:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MentorSkill](
	[skillid] [int] NULL,
	[mentorid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rating]    Script Date: 26-Feb-23 6:31:22 PM ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 26-Feb-23 6:31:22 PM ******/
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
/****** Object:  Table [dbo].[Skill]    Script Date: 26-Feb-23 6:31:22 PM ******/
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
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [email], [password], [role], [fullname], [phone], [address], [dateofbirth], [sex]) VALUES (1, N'duis.mi@google.com', N'2745', N'Mentor', N'Steven Powell', N'(607) 112-8335', N'Ap #511-985 A St.', N'15-5-2001', N'Male')
INSERT [dbo].[Account] ([id], [email], [password], [role], [fullname], [phone], [address], [dateofbirth], [sex]) VALUES (2, N'dui.in@google.com', N'6258', N'Mentor', N'Travis Copeland', N'(987) 328-8124', N'P.O. Box 800, 2395 Duis St.', N'30-5-2001', N'Male')
INSERT [dbo].[Account] ([id], [email], [password], [role], [fullname], [phone], [address], [dateofbirth], [sex]) VALUES (3, N'cursus.vestibulum@google.com', N'6400', N'Student', N'Nathaniel Heath', N'1-539-486-5686', N'Ap #354-6067 Dignissim Road', N'13-5-2004', N'Female')
INSERT [dbo].[Account] ([id], [email], [password], [role], [fullname], [phone], [address], [dateofbirth], [sex]) VALUES (4, N'dignissim.tempor@google.com', N'7310', N'Student', N'Demetria Hammond', N'1-731-764-4643', N'360-2437 Odio Rd.', N'23-2-2002', N'Female')
INSERT [dbo].[Account] ([id], [email], [password], [role], [fullname], [phone], [address], [dateofbirth], [sex]) VALUES (5, N'diam.nunc@google.com', N'5924', N'Mentor', N'Yoshi Waters', N'(711) 872-7404', N'836-6748 Curabitur Rd.', N'27-3-2001', N'Male')
INSERT [dbo].[Account] ([id], [email], [password], [role], [fullname], [phone], [address], [dateofbirth], [sex]) VALUES (6, N'ornare@google.com', N'6357', N'Student', N'Cailin Frank', N'(623) 952-2773', N'Ap #473-1915 Primis Ave', N'21-2-2004', N'Female')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([id], [name], [mentorid], [schedule]) VALUES (1, N'React Tutor', 1, N'Mon Wed Fri 1PM-3PM')
INSERT [dbo].[Class] ([id], [name], [mentorid], [schedule]) VALUES (2, N'Java Tutor', 1, N'Tue Thu Sat 1PM-3PM')
INSERT [dbo].[Class] ([id], [name], [mentorid], [schedule]) VALUES (3, N'Python Class', 2, N'Mon Wed Fri 2PM-4PM')
INSERT [dbo].[Class] ([id], [name], [mentorid], [schedule]) VALUES (4, N'TypeScript Tutor', 5, N'Sat Sun 3PM-5PM')
SET IDENTITY_INSERT [dbo].[Class] OFF
INSERT [dbo].[ClassInfo] ([classid], [studentid]) VALUES (1, 3)
INSERT [dbo].[ClassInfo] ([classid], [studentid]) VALUES (1, 4)
INSERT [dbo].[ClassInfo] ([classid], [studentid]) VALUES (1, 6)
INSERT [dbo].[ClassInfo] ([classid], [studentid]) VALUES (2, 4)
INSERT [dbo].[ClassInfo] ([classid], [studentid]) VALUES (2, 6)
INSERT [dbo].[ClassInfo] ([classid], [studentid]) VALUES (3, 3)
INSERT [dbo].[ClassInfo] ([classid], [studentid]) VALUES (1, 6)
SET IDENTITY_INSERT [dbo].[MentorCV] ON 

INSERT [dbo].[MentorCV] ([id], [mentorid], [profession], [achievement], [job], [introduction], [service]) VALUES (1, 1, N'Sofware Engineer', N'Bachelors Degree', N'Senior Developer', N'hello', N'tutor')
INSERT [dbo].[MentorCV] ([id], [mentorid], [profession], [achievement], [job], [introduction], [service]) VALUES (2, 2, N'QA Testing', N'Bachelors Degree', N'Tester', N'good day', N'online teaching')
INSERT [dbo].[MentorCV] ([id], [mentorid], [profession], [achievement], [job], [introduction], [service]) VALUES (3, 5, N'Sofware Engineer', N'Bachelors Degree', N'Web Developer', N'hi', N'tutor')
SET IDENTITY_INSERT [dbo].[MentorCV] OFF
INSERT [dbo].[MentorSkill] ([skillid], [mentorid]) VALUES (1, 1)
INSERT [dbo].[MentorSkill] ([skillid], [mentorid]) VALUES (2, 1)
INSERT [dbo].[MentorSkill] ([skillid], [mentorid]) VALUES (3, 1)
INSERT [dbo].[MentorSkill] ([skillid], [mentorid]) VALUES (4, 2)
INSERT [dbo].[MentorSkill] ([skillid], [mentorid]) VALUES (5, 3)
INSERT [dbo].[MentorSkill] ([skillid], [mentorid]) VALUES (3, 3)
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([id], [name], [status]) VALUES (1, N'C#', N'Active')
INSERT [dbo].[Skill] ([id], [name], [status]) VALUES (2, N'Java', N'Active')
INSERT [dbo].[Skill] ([id], [name], [status]) VALUES (3, N'React', N'Active')
INSERT [dbo].[Skill] ([id], [name], [status]) VALUES (4, N'Python', N'Active')
INSERT [dbo].[Skill] ([id], [name], [status]) VALUES (5, N'TypeScript', N'Active')
SET IDENTITY_INSERT [dbo].[Skill] OFF
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
