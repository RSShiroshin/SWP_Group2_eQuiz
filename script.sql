USE [master]
GO
/****** Object:  Database [QuizPractiseDB_Demo]    Script Date: 10/30/2022 8:34:54 PM ******/
CREATE DATABASE [QuizPractiseDB_Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizPractiseDB_Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuizPractiseDB_Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuizPractiseDB_Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuizPractiseDB_Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizPractiseDB_Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET  MULTI_USER 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET QUERY_STORE = OFF
GO
USE [QuizPractiseDB_Demo]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[answerID] [int] IDENTITY(1,1) NOT NULL,
	[questionID] [int] NOT NULL,
	[content] [nvarchar](500) NOT NULL,
	[isAnswer] [bit] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[answerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[courseID] [nchar](2) NOT NULL,
	[courseName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NULL,
	[categoryID] [int] NOT NULL,
	[thumbnail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseCategory]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CourseCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpertAssign]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpertAssign](
	[userID] [int] NOT NULL,
	[subjectID] [nchar](6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteSubject]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteSubject](
	[userID] [int] NOT NULL,
	[subjectID] [nchar](6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[subjectID] [nchar](6) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[explain] [nvarchar](500) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizID] [int] IDENTITY(1,1) NOT NULL,
	[subjectID] [nchar](6) NOT NULL,
	[userID] [int] NOT NULL,
	[timeStart] [nvarchar](50) NOT NULL,
	[score] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizHistory]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizHistory](
	[quizID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
	[userAnswer] [int] NOT NULL,
	[isCorrect] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[userID] [int] NOT NULL,
	[courseID] [nchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleName]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleName](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RoleName] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectID] [nchar](6) NOT NULL,
	[subjectName] [nvarchar](80) NOT NULL,
	[description] [nvarchar](500) NULL,
	[courseID] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/30/2022 8:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](200) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[avatar] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[roleID] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[registerDay] [date] NOT NULL,
 CONSTRAINT [PK__User__CB9A1CDF78A9C63F] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (1, 1, N'A. During test planning. ', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (2, 1, N'B. During test analysis. ', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (3, 1, N'C. During test execution. ', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (4, 1, N'D. When evaluating exit criteria', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (5, 2, N'A. ii, iv.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (6, 2, N'B. ii, iii.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (7, 2, N'C. i, iii, iv.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (8, 2, N'D. iii.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (9, 3, N'A. Damaged reputation', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (10, 3, N'B. Lack of methodology', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (11, 3, N'C. Inadequate training', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (12, 3, N'D. Regulatory compliance', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (13, 4, N'A. i, ii, iii.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (14, 4, N'B. ii, iii, iv.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (15, 4, N'C. i, iii, iv.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (16, 4, N'D. i, ii, iv.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (17, 5, N'A. It is cheaper than designing tests during the test phases.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (18, 5, N'B. It helps prevent defects from being introduced into the code.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (19, 5, N'C. Tests designed early are more effective than tests designed later.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (20, 5, N'D. It saves time during the testing phases when testers are busy.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (21, 6, N'A. ii and iv', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (22, 6, N'B. ii and iii', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (23, 6, N'C. i and iv', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (24, 6, N'D. i and iii', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (25, 7, N'A. Providing coaching to users and defining usage guidelines', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (26, 7, N'B. Monitoring tool usage and reducing the need for risk analysis', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (27, 7, N'C. Improving processes and focusing more on component testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (28, 7, N'D. Assessing testing completion and minimizing code reviews', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (29, 8, N'A. To define when a test level is complete.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (30, 8, N'B. To determine when a test has completed.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (31, 8, N'C. To identify when a software system should be retired.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (32, 8, N'D. To determine whether a test has passed.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (33, 9, N'A. Data driven testing technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (34, 9, N'B. Experience-based technique', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (35, 9, N'C. White-box technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (36, 9, N'D. Structure-based technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (37, 10, N'A. Tools and techniques', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (38, 10, N'B. Procedures and standards', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (39, 10, N'C. Processes and walkthroughs', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (40, 10, N'D. Reviews and update', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (41, 11, N'A. Configuration management and test data generation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (42, 11, N'B. Test case specification and change control', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (43, 11, N'C. Test condition and test procedure specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (44, 11, N'D. Impact analysis and requirements coverage', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (45, 12, N'A. L-N +2P', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (46, 12, N'B. N-L +2P', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (47, 12, N'C. N-L +P', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (48, 12, N'D. N-L +P', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (49, 13, N'A. To measure the functional requirements of the project', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (50, 13, N'B. To measure the size of the functionality of an Information system', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (51, 13, N'C. To measure the functional testing effort', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (52, 13, N'D. To measure the functional flow', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (53, 14, N'A. SDLC', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (54, 14, N'B. Project Plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (55, 14, N'C. Policy', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (56, 14, N'D. Procedure', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (57, 15, N'A. The existing system (For a bench mark)', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (58, 15, N'B. The code', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (59, 15, N'C. Individual''s knowledge', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (60, 15, N'D. User manual', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (61, 16, N'A. Plan, Do, Check, Act', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (62, 16, N'B. Plan, Do, Correct, Act', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (63, 16, N'C. Plan, Debug, Check, Act', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (64, 16, N'D. Plan, Do, Check, Accept', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (65, 17, N'A. Performance testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (66, 17, N'B. Unit testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (67, 17, N'C. Regression testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (68, 17, N'D. Sanity testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (69, 18, N'A. Determining the exit criteria', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (70, 18, N'B. Measuring and analyzing results', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (71, 18, N'C. Implementing corrective actions', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (72, 18, N'D. Monitoring and documenting progress', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (73, 19, N'A. Load Testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (74, 19, N'B. Integration Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (75, 19, N'C. System Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (76, 19, N'D. Usability Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (77, 20, N'A. i, ii, iii is true and iv is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (78, 20, N'B. ii,iii,iv is true and i is false', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (79, 20, N'C. i is true and ii,iii,iv are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (80, 20, N'D. iii and iv is correct and i and ii are incorrect', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (81, 21, N'A. The use of a variable before it has been defined', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (82, 21, N'B. Unreachable ("dead") code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (83, 21, N'C. Memory leaks', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (84, 21, N'D. Array bound violations', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (85, 22, N'A. Structural Testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (86, 22, N'B. Design Based Testin', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (87, 22, N'C. Error Guessing Technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (88, 22, N'D. Experience Based Technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (89, 23, N'A. Test Analysis and Design', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (90, 23, N'B. Test Implementation and execution', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (91, 23, N'C. Test Closure Activities', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (92, 23, N'D. Evaluating exit criteria and reporting', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (93, 24, N'A. i,ii,iii are true and iv is false', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (94, 24, N'B. i,ii,iii,iv are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (95, 24, N'C. i,ii,iv are true and iii is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (96, 24, N'D. all of above is true', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (97, 25, N'A. a: 2; b: 4; c: 1, 3 and 5; d: 6', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (98, 25, N'B. a: 2; b: 3; c: 4, 5 and 6; d: 1', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (99, 25, N'C. a: 2; b: 6; c: 3, 4 and 5; d: 1', 1)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (100, 25, N'D. a: 2; b: 1; c: 3, 4 and 5; d: 6', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (101, 26, N'A. ii is true and i,iii,iv are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (102, 26, N'B. i,iii,iv are true and ii is false', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (103, 26, N'C. i,iii,iv are false and ii is true', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (104, 26, N'D. iii is true and I,ii,iv are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (105, 27, N'A. i,ii,iii,iv,v,vi', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (106, 27, N'B. vi,i,ii,iii,iv,v', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (107, 27, N'C. i,v,iv,ii,iii,vi', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (108, 27, N'D. i,ii,iii,v,iv,vi', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (109, 28, N'A. System Level Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (110, 28, N'B. Integration Level Testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (111, 28, N'C. Unit Level Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (112, 28, N'D. Component Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (113, 29, N'A. Breadth Test and Depth Test', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (114, 29, N'B. Re-testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (115, 29, N'C. Confirmation Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (116, 29, N'D. Sanity Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (117, 30, N'A. 12,16,22', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (118, 30, N'B. 24,27,17', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (119, 30, N'C. 22,23,24', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (120, 30, N'D. 14,15,19', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (121, 31, N'A. A set of test cases for testing classes of objects', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (122, 31, N'B. An input or output range of values such that only one value in the range becomes a test case', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (123, 31, N'C. An input or output range of values such that each value in the range becomes a test case', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (124, 31, N'D. An input or output range of values such that every tenth value in the range becomes a test case.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (125, 32, N'A. Creating test suites from the test cases', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (126, 32, N'B. Executing test cases either manually or by using test execution tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (127, 32, N'C. Comparing actual results', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (128, 32, N'D. Designing the Tests', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (129, 33, N'A. Component Integration testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (130, 33, N'B. Component System Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (131, 33, N'C. Component Sub System Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (132, 33, N'D. Maintenance testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (133, 34, N'A. i,ii,iii,iv are true', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (134, 34, N'B. i,ii,iii are true and iv is false.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (135, 34, N'C. ii,iii,iv are true and i is false.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (136, 34, N'D. i,iv are true and ii, iii are false.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (137, 35, N'A. Static testing requires the running of tests through the code', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (138, 35, N'B. Static testing includes desk checking', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (139, 35, N'C. Static testing includes techniques such as reviews and inspections', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (140, 35, N'D. Static testing can give measurements such as cyclomatic complexity', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (141, 36, N'A. Test Implementation and execution', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (142, 36, N'B. Test Analysis and Design', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (143, 36, N'C. Evaluating the Exit Criteria and reporting', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (144, 36, N'D. Test Closure Activities', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (145, 37, N'A. Security Testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (146, 37, N'B. Recovery Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (147, 37, N'C. Performance Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (148, 37, N'D. Functionality Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (149, 38, N'A. Moderator.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (150, 38, N'B. Scribe', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (151, 38, N'C. Author', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (152, 38, N'D. Manager', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (153, 39, N'A. Are most useful in uncovering defects in the process flows during real world use of the system', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (154, 39, N'B. Are most useful in uncovering defects in the process flows during the testing use of the system', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (155, 39, N'C. Are most useful in covering the defects in the process flows during real world use of the system', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (156, 39, N'D. Are most useful in covering the defects at the Integration Level', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (157, 40, N'A. i,ii,iii are true and iv is false', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (158, 40, N'B. i,,iv are true and ii is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (159, 40, N'C. i,ii are true and iii,iv are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (160, 40, N'D. ii,iii,iv are true and i is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (161, 41, N'A. 17', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (162, 41, N'B. 19', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (163, 41, N'C. 24', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (164, 41, N'D. 21', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (165, 42, N'A. Is impractical but possible', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (166, 42, N'B. Is practically possible', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (167, 42, N'C. Is impractical and impossible', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (168, 42, N'D. Is always possible', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (169, 43, N'A. Progress tracking tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (170, 43, N'B. Test management tools', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (171, 43, N'C. Metrics management tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (172, 43, N'D. Test execution tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (173, 44, N'A. IEC', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (174, 44, N'B. IEEE', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (175, 44, N'C. ISO', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (176, 44, N'D. All of the above', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (177, 45, N'A. Requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (178, 45, N'B. Design', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (179, 45, N'C. Coding', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (180, 45, N'D. All of the above', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (181, 46, N'A. Chances of having repetition of tests that are already done by programmer.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (182, 46, N'B. The test inputs needs to be from large sample space.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (183, 46, N'C. It is difficult to identify all possible inputs in limited testing time. So writing test cases is slow and difficult', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (184, 46, N'D. All above', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (185, 47, N'A. Validation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (186, 47, N'B. Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (187, 47, N'C. Debugging', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (188, 47, N'D. Verification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (189, 48, N'A. Requirements Phase.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (190, 48, N'B. Analysis and Design Phase', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (191, 48, N'C. Development Phase', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (192, 48, N'D. Testing Phase', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (193, 49, N'A. Creating test suites and cases for efficient execution', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (194, 49, N'B. Writing a test summary report for stakeholders', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (195, 49, N'C. Handing the testware to the maintenance organization', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (196, 49, N'D. Identifying any required infrastructure and tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (197, 50, N'A. I and II', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (198, 50, N'B. I, III and IV', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (199, 50, N'C. III', 1)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (200, 50, N'D. IV', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (201, 51, N'A. It is probable that subsystem C has still more hidden defects. Therefore we need to test subsystem C in more detail.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (202, 51, N'B. Because we have already found many defects in subsystem C, we should concentrate testing resources on Subsystem A.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (203, 51, N'C. Observed defect density does not allow any conclusions about the amount of additional testing.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (204, 51, N'D. We should try to equalize the amount of testing over all modules to ensure that we test all subsystems evenly.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (205, 52, N'A. Determine the productivity of programmers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (206, 52, N'B. Eliminate the need for future program maintenance', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (207, 52, N'C. Eliminate every error prior to release', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (208, 52, N'D. Uncover software errors', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (209, 53, N'A. Incorrect program behavior due to a fault in the program', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (210, 53, N'B. Bug found before product Release', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (211, 53, N'C. Bug found after product Release', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (212, 53, N'D. Bug found during Design phase', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (213, 54, N'A. When the code is complete.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (214, 54, N'B. When the design is complete.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (215, 54, N'C. When the software requirements have been approved.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (216, 54, N'D. When the first code module is ready for unit testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (217, 55, N'A. This question is impossible to answer', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (218, 55, N'B. This question is easy to answer', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (219, 55, N'C. The answer depends on the risk for your industry, contract and special requirements', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (220, 55, N'D. This answer depends on the maturity of your developers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (221, 56, N'A. I and II are true; III and IV are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (222, 56, N'B. II and IV are true; I and II are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (223, 56, N'C. I and IV are true; II and III are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (224, 56, N'D. I and III are true; II and IV are false', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (225, 57, N'A. Test case specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (226, 57, N'B. Test procedure specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (227, 57, N'C. Test plan', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (228, 57, N'D. Test design specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (229, 58, N'A. Component testing tests interfaces; integration testing searches for defects', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (230, 58, N'B. Component testing searches for defects; integration testing tests Interfaces', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (231, 58, N'C. Developers perform component testing; testers perform integration testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (232, 58, N'D. Testers perform component testing; users perform integration testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (233, 59, N'A. Error condition hiding another error condition', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (234, 59, N'B. Creating a test case which does not reveal a fault', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (235, 59, N'C. Masking a fault by developer', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (236, 59, N'D. Masking a fault by a tester', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (237, 60, N'A. Functionality', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (238, 60, N'B. Usability', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (239, 60, N'C. Supportability', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (240, 60, N'D. Maintainability', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (241, 61, N'A. Lack of technical documentation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (242, 61, N'B. Lack of test tools on the market for developers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (243, 61, N'C. Lack of training', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (244, 61, N'D. Lack of Objectivity', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (245, 62, N'A. Missing Statements', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (246, 62, N'B. Unused Branches', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (247, 62, N'C. Dead Code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (248, 62, N'D. Unused Statement', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (249, 63, N'A. 2', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (250, 63, N'B. 3', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (251, 63, N'C. 4', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (252, 63, N'D. 5', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (253, 64, N'A. Stub', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (254, 64, N'B. Driver', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (255, 64, N'C. Proxy', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (256, 64, N'D. None of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (257, 65, N'A. Quality is job one', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (258, 65, N'B. Zero defects', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (259, 65, N'C. Conformance to requirements', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (260, 65, N'D. Work as designed', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (261, 66, N'A. Is the same as equivalence partitioning tests', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (262, 66, N'B. Test boundary conditions on, below and above the edges of input and output equivalence classes', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (263, 66, N'C. Tests combinations of input circumstances', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (264, 66, N'D. Is used in white box testing strategy', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (265, 67, N'A. 0,1900,2004,2005', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (266, 67, N'B. 1900, 2004', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (267, 67, N'C. 1899,1900,2004,2005', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (268, 67, N'D. 1899, 1900, 1901,2003,2004,2005', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (269, 68, N'A. 2 Test Cases', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (270, 68, N'B. 3 Test Cases', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (271, 68, N'C. 4 Test Cases', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (272, 68, N'D. Not achievable', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (273, 69, N'A. Statement and branch testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (274, 69, N'B. Usability testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (275, 69, N'C. Security testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (276, 69, N'D. Performance testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (277, 70, N'A. Takes minutes of the meeting', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (278, 70, N'B. Mediates between people', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (279, 70, N'C. Takes telephone calls', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (280, 70, N'D. Writes the documents to be reviewed', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (281, 71, N'A. Requirements', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (282, 71, N'B. Design', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (283, 71, N'C. Code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (284, 71, N'D. Decision table', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (285, 72, N'A. Test plan and test design specification', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (286, 72, N'B. Test plan and test case specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (287, 72, N'C. Test procedure specification and test design specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (288, 72, N'D. Test case specification and test procedure specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (289, 73, N'A. Done by the Developer', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (290, 73, N'B. Done by the Test Engineers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (291, 73, N'C. Done By Management', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (292, 73, N'D. Done by an Entity Outside the Project� s sphere of influence', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (293, 74, N'A. Defect prevention', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (294, 74, N'B. Deliverable base-lining', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (295, 74, N'C. Management reporting', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (296, 74, N'D. None of the above', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (297, 75, N'A. Test procedure specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (298, 75, N'B. Test level', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (299, 75, N'C. Test case specification', 0)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (300, 75, N'D. Test plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (301, 76, N'A. (a) are performed outside the company and (b) are conducted by the test team', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (302, 76, N'B. (a) are conducted by regulators and (b) are performed by system administrators', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (303, 76, N'C. (a) are mandatory test for government applications and (b) are usually optional', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (304, 76, N'D. (a) are for custom-developed software and (b) are for off the - shelf software', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (305, 77, N'A. v & w are true, x & z are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (306, 77, N'B. w, x & y are true, v & z are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (307, 77, N'C. w & y are true, v, x & z are false', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (308, 77, N'D. w is true, v, x y and z are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (309, 77, N'E. All of the above are true', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (310, 78, N'A. Execution', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (311, 78, N'B. Design', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (312, 78, N'C. Planning', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (313, 78, N'D. Check Exit criteria completion', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (314, 79, N'A. Does not meet people needs', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (315, 79, N'B. Cultural difference', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (316, 79, N'C. Loss of control over reallocation of resources', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (317, 79, N'D. Relinquishments of control', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (318, 80, N'A. Project plan', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (319, 80, N'B. Business plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (320, 80, N'C. Support plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (321, 80, N'D. None of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (322, 81, N'A. Error guessing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (323, 81, N'B. Walkthrough', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (324, 81, N'C. Data flow analysis', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (325, 81, N'D. Inspections', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (326, 82, N'A. Test procedure specification', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (327, 82, N'B. Test design specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (328, 82, N'C. Test case specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (329, 82, N'D. Test plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (330, 83, N'A. Variables not defined in the code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (331, 83, N'B. Spelling and grammar faults in the documents', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (332, 83, N'C. Requirements that have been omitted from the design documents', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (333, 83, N'D. How much of the code has been covered', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (334, 84, N'A. Operability', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (335, 84, N'B. Observability', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (336, 84, N'C. Simplicity', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (337, 84, N'D. Robustness', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (338, 85, N'A. 10-20', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (339, 85, N'B. 40-50', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (340, 85, N'C. 70-80', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (341, 85, N'D. 5-10', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (342, 86, N'A. Coverage management tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (343, 86, N'B. Test management tool', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (344, 86, N'C. Data preparation tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (345, 86, N'D. Performance testing tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (346, 87, N'A. We cannot run the test', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (347, 87, N'B. It may be difficult to repeat the test', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (348, 87, N'C. It may be difficult to determine if the test has passed or failed', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (349, 87, N'D. We cannot automate the user inputs', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (350, 88, N'A. This question is difficult to answer', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (351, 88, N'B. The answer depends on the contract with the client, special requirements if any & risks your', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (352, 88, N'organization is willing to take', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (353, 88, N'C. The answer depends on the experience & maturity of your developers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (354, 88, N'D. The answer should be standardized for the software development industry', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (355, 89, N'A. To freeze requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (356, 89, N'B. To understand user needs', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (357, 89, N'C. To define the scope of testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (358, 89, N'D. All of the above', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (359, 90, N'A. Simple Loops', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (360, 90, N'B. Nested Loops', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (361, 90, N'C. Concatenated Loops', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (362, 90, N'D. All of the above', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (363, 91, N'A. White box', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (364, 91, N'B. Black box', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (365, 91, N'C. Green box', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (366, 91, N'D. Yellow box', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (367, 92, N'A. Is unlikely to be completed on schedule', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (368, 92, N'B. Is unlikely to cause a failure', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (369, 92, N'C. Is likely to be fault-free', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (370, 92, N'D. Is likely to be liked by the users', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (371, 93, N'A. Being diplomatic', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (372, 93, N'B. Able to write software', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (373, 93, N'C. Having good attention to detail', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (374, 93, N'D. Able to be relied on', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (375, 94, N'A. Will always be automated', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (376, 94, N'B. Will help ensure unchanged areas of the software have not been affected', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (377, 94, N'C. Will help ensure changed areas of the software have not been affected', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (378, 94, N'D. Can only be run during user acceptance testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (379, 95, N'A. Interim Test report', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (380, 95, N'B. Final test report', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (381, 95, N'C. Project status report', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (382, 95, N'D. Management report', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (383, 96, N'A. Top-down integration', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (384, 96, N'B. Bottom-up integration', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (385, 96, N'C. None of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (386, 96, N'D. Module integration', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (387, 97, N'A. Checking that we are building the right system', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (388, 97, N'B. Checking that we are building the system right', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (389, 97, N'C. Performed by an independent test team', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (390, 97, N'D. Making sure that it is what the user really wants', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (391, 98, N'A. Re-testing is running a test again; regression testing looks for unexpected side effects', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (392, 98, N'B. Re-testing looks for unexpected side effects; regression testing is repeating those tests', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (393, 98, N'C. Re-testing is done after faults are fixed; regression testing is done earlier', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (394, 98, N'D. Re-testing uses different environments, regression testing uses the same environment', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (395, 98, N'E. Re-testing is done by developers, regression testing is done by independent testers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (396, 99, N'A. All the planned tests have been run', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (397, 99, N'B. Time has run out', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (398, 99, N'C. All faults have been fixed correctly', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (399, 99, N'D. Both A. and C.', 0)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (400, 99, N'E. I depends on the risks for the system being tested', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (401, 100, N'A. White-box technology', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (402, 100, N'B. Component testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (403, 100, N'C. Black-box technique', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (404, 100, N'D. Data driven testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (405, 101, N'A. Status accounting of configuration items', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (406, 101, N'B. Auditing conformance to ISO9001', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (407, 101, N'C. Identification of test versions', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (408, 101, N'D. Record of changes to documentation over time', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (409, 101, N'E. controlled library access', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (410, 102, N'A. What is selected for testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (411, 102, N'B. Objectives and results', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (412, 102, N'C. Expected results', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (413, 102, N'D. Targets and misses', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (414, 103, N'A. A dynamic analysis tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (415, 103, N'B. A test execution tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (416, 103, N'C. A debugging tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (417, 103, N'D. A test management tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (418, 103, N'E. A configuration management tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (419, 104, N'A. Is not important', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (420, 104, N'B. Increases as we move the product towards live use', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (421, 104, N'C. Decreases as we move the product towards live use', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (422, 104, N'D. Is more expensive if found in requirements than functional design', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (423, 104, N'E. Can never be determined', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (424, 105, N'A. 1000, 5000, 99999', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (425, 105, N'B. 9999, 50000, 100000', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (426, 105, N'C. 10000, 50000, 99999', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (427, 105, N'D. 10000, 99999', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (428, 105, N'E. 9999, 10000, 50000, 99999, 10000', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (429, 106, N'A. An error', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (430, 106, N'B. A fault', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (431, 106, N'C. A failure', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (432, 106, N'D. A defect', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (433, 106, N'E. A mistake', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (434, 107, N'A. Component interaction', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (435, 107, N'B. Probe effect', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (436, 107, N'C. State transition', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (437, 107, N'D. Disaster recovery', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (438, 108, N'A. 1 test for statement coverage, 1 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (439, 108, N'B. 1 test for statement coverage, 2 for branch coverage', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (440, 108, N'C. 1 test for statement coverage. 3 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (441, 108, N'D. 2 tests for statement coverage, 2 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (442, 108, N'E. 2 tests for statement coverage, 3 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (443, 109, N'A. Report on deviations from the project plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (444, 109, N'B. Sign the system off for release', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (445, 109, N'C. Re-allocate resource to meet original plans', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (446, 109, N'D. Rise incidents on faults that they have found', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (447, 109, N'E. Provide information for risk analysis and quality improvement', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (448, 110, N'A. Business process-based testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (449, 110, N'B. Performance, load and stress testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (450, 110, N'C. Requirements-based testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (451, 110, N'D. Usability testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (452, 110, N'E. Top-down integration testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (453, 111, N'A. A small team to establish the best way to use the tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (454, 111, N'B. Everyone who may eventually have some use for the tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (455, 111, N'C. The independent testing team', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (456, 111, N'D. The managers to see what projects it should be used in', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (457, 111, N'E. The vendor contractor to write the initial scripts', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (458, 112, N'A. Measuring response time', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (459, 112, N'B. Measuring transaction rates', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (460, 112, N'C. Recovery testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (461, 112, N'D. Simulating many users', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (462, 112, N'E. Generating many transactions', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (463, 113, N'A. To know when a specific test has finished its execution', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (464, 113, N'B. To ensure that the test case specification is complete', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (465, 113, N'C. To set the criteria used in generating test inputs', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (466, 113, N'D. To know when test planning is complete', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (467, 113, N'E. To plan when to stop testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (468, 114, N'A. 1 test for statement coverage, 3 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (469, 114, N'B. 2 tests for statement coverage, 2 for branch coverage', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (470, 114, N'C. 2 tests for statement coverage. 3 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (471, 114, N'D. 3 tests for statement coverage, 3 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (472, 114, N'E. 3 tests for statement coverage, 2 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (473, 115, N'A. Code reviews', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (474, 115, N'B. Code inspections', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (475, 115, N'C. A coverage tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (476, 115, N'D. A test management tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (477, 115, N'E. A static analysis tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (478, 116, N'A. How to fix the fault', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (479, 116, N'B. How to reproduce the fault', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (480, 116, N'C. Test environment details', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (481, 116, N'D. Severity, priority', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (482, 116, N'E. The actual and expected outcomes', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (483, 117, N'A. Test items (i.e. software versions)', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (484, 117, N'B. What is not to be tested', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (485, 117, N'C. Test environments', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (486, 117, N'D. ulsuality plans', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (487, 117, N'E. Schedules and deadlines', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (488, 118, N'A. Test items', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (489, 118, N'B. Test deliverables', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (490, 118, N'C. Test tasks', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (491, 118, N'D. Test environment', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (492, 118, N'E. Test specification', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (493, 119, N'A. ISO/IEC 12207', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (494, 119, N'B. BS7925-1', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (495, 119, N'C. BS7925-2', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (496, 119, N'D. ANSI/IEEE 829', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (497, 119, N'E. ANSI/IEEE 729', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (498, 120, N'A. Increase focus on preventive processes and improve tester job satisfaction', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (499, 120, N'B. Reduce the probability of occurrence and decrease the potential impact', 1)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (500, 120, N'C. Control contractor problems and minimize the impact of corporate politics', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (501, 120, N'D. Increase the probability of project success regardless of the cost involved', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (502, 121, N'A. A,C,B', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (503, 121, N'B. B,C,A', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (504, 121, N'C. A,B,C', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (505, 121, N'D. C,B,A', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (506, 122, N'A. 3', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (507, 122, N'B. 6', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (508, 122, N'C. 5', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (509, 122, N'D. 4', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (510, 123, N'A. Black box design techniques all have an associated measurement technique', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (511, 123, N'B. White box design techniques all have an associated measurement technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (512, 123, N'C. Cyclomatic complexity is not a test measurement technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (513, 123, N'D. Black box measurement techniques all have an associated test design technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (514, 123, N'E. White box measurement techniques all have an associated test design technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (515, 124, N'A. No, because they apply to development documentation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (516, 124, N'B. No, because they are normally applied before testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (517, 124, N'C. No, because they do not apply to the test documentation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (518, 124, N'D. Yes, because both help detect faults and improve quality', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (519, 124, N'E. Yes, because testing includes all non-constructive activities', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (520, 125, N'A. Finding faults in the system', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (521, 125, N'B. Ensuring that the system is acceptable to all users', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (522, 125, N'C. Testing the system with other systems', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (523, 125, N'D. Testing for a business perspective', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (524, 125, N'E. Testing by an independent test team', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (525, 126, N'A. Ishikawa diagram', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (526, 126, N'B. Cause-and-effect diagram', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (527, 126, N'C. Lessons learned', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (528, 126, N'D. Fishbone diagram', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (529, 127, N'A. Specification-based technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (530, 127, N'B. Black-box technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (531, 127, N'C. White-box technique', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (532, 127, N'D. Data driven testing technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (533, 128, N'A. Testing to see where the system does not function properly', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (534, 128, N'B. Testing quality attributes of the system including performance and usability', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (535, 128, N'C. Testing a system feature using only the software required for that action', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (536, 128, N'D. Testing a system feature using only the software required for that function', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (537, 128, N'E. Testing for functions that should not exist', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (538, 129, N'A. Equivalence partitioning', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (539, 129, N'B. State transition testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (540, 129, N'C. LCSAJ', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (541, 129, N'D. Syntax testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (542, 129, N'E. Boundary value analysis', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (543, 130, N'A. Only important in system testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (544, 130, N'B. Only used in component testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (545, 130, N'C. Never specified in advance', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (546, 130, N'D. Most useful when specified in advance', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (547, 130, N'E. Derived from the code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (548, 131, N'A. Performed by customers at their own site', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (549, 131, N'B. Performed by customers at their software developer�s site', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (550, 131, N'C. Performed by an independent test team', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (551, 131, N'D. Useful to test bespoke software', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (552, 131, N'E. Performed as early as possible in the lifecycle', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (553, 132, N'A. SC = 1 and DC = 1', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (554, 132, N'B. SC = 1 and DC = 2', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (555, 132, N'C. SC = 1 and DC = 3', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (556, 132, N'D. SC = 2 and DC = 2', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (557, 132, N'E. SC = 2 and DC = 3', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (558, 133, N'A. Generating expected outputs', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (559, 133, N'B. Replaying inputs according to a programmed script', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (560, 133, N'C. Comparison of expected outcomes with actual outcomes', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (561, 133, N'D. Recording test inputs', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (562, 133, N'E. Reading test values from a data file', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (563, 134, N'A. i, iii & iv are true. Ii & v are false', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (564, 134, N'B. iii is true, I, ii, iv & v are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (565, 134, N'C. iii & iv are true. i, ii & v are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (566, 134, N'D. i, iii, iv & v are true, ii us false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (567, 134, N'E. i & iii are true, ii, iv & v are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (568, 135, N'A. 1 test for statement coverage, 3 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (569, 135, N'B. 1 test for statement coverage, 2 for branch coverage', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (570, 135, N'C. 1 test for statement coverage, 1 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (571, 135, N'D. 2 tests for statement coverage, 3 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (572, 135, N'E. 2 tests for statement coverage, 2 for branch coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (573, 136, N'A. Attend a tool exhibition', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (574, 136, N'B. Invite a vendor to give a demo', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (575, 136, N'C. Analyse your needs and requirements', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (576, 136, N'D. Find out what your budget would be for the tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (577, 136, N'E. Search the internet', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (578, 137, N'A. As the first approach to deriving test cases', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (579, 137, N'B. After more formal techniques have been applied', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (580, 137, N'C. By inexperienced testers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (581, 137, N'D. After the system has gone live', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (582, 137, N'E. Only by end users', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (583, 138, N'A. iv is correct and i,ii,iii are incorrect.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (584, 138, N'B. i,ii,iii is correct and iv is incorrect', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (585, 138, N'C. ii is correct and i,ii,iii are incorrect', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (586, 138, N'D. iii and iv are correct and i,ii are incorrect', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (587, 139, N'A. CLASS', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (588, 139, N'B. cLASS', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (589, 139, N'C. CLass', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (590, 139, N'D. CLa01ss', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (591, 140, N'A. Explaining the objective', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (592, 140, N'B. Fixing defects found typically done by author', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (593, 140, N'C. Follow up', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (594, 140, N'D. Individual Meeting preparations', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (595, 141, N'A. Inspection', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (596, 141, N'B. Walkthrough', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (597, 141, N'C. Technical Review', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (598, 141, N'D. Formal Review', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (599, 142, N'A. Options i,ii,iii,iv are true.', 0)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (600, 142, N'B. ii is true and i,iii,iv are false', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (601, 142, N'C. i,ii,iii are true and iv is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (602, 142, N'D. iii is true and i,ii,iv are false.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (603, 143, N'A. ii,iii,iv are correct and i is incorrect', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (604, 143, N'B. iii , i , iv is correct and ii is incorrect', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (605, 143, N'C. i , iii , iv , ii is in correct', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (606, 143, N'D. ii is correct', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (607, 144, N'A. Structural testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (608, 144, N'B. Stress testing', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (609, 144, N'C. Error guessing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (610, 144, N'D. Black-box testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (611, 145, N'A. i , ii,iii,iv is correct', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (612, 145, N'B. iii ,is correct I,ii,iv are incorrect.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (613, 145, N'C. i ,ii, iii and iv are incorrect', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (614, 145, N'D. iv, ii is correct', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (615, 148, N'A. Success metrics', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (616, 148, N'B. Functional requirements', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (617, 148, N'C. Vision and scope statements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (618, 148, N'D. Business opportunities', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (619, 148, N'E. Business objectives', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (620, 149, N'A. If the expiration date for a chemical container has been reached, then notify the person who currently possesses the container.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (621, 149, N'B. Every order has a shipping charge.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (622, 149, N'C. On the last day of a calendar quarter, generate the mandated ABC and XYZ reports on chemical handling and for that quarter.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (623, 149, N'D. If the chemical stockroom has containers of a requested chemical in stock, then offer existing containers to the requester.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (624, 150, N'A. Favored user class gets preference', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (625, 150, N'B. Segment with greatest impact on business success gets preference', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (626, 150, N'C. Product champion or product owner who will decides the requirements Nest ', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (627, 150, N'D. Business objectives dictate direction', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (628, 151, N'A. A business rule is guidance that there is an obligation concerning conduct. action. practice, or procedure within a particular activity or', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (629, 151, N'B. A business rule is a statement that defines or constrains some aspect of the business. It is intended to assert business structure or to of the business.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (630, 152, N'A. A system requirements baseline', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (631, 152, N'B. A requirements document', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (632, 152, N'C. A requirements baseline', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (633, 152, N'D. A system requirements document', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (634, 153, N'A. Maintenance , Project tracking, Reengineering, Reuse, Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (635, 153, N'B. Finding missing requirements, Finding unnecessary requirements, Certification and compliance, Change impact analysis', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (636, 153, N'C. Managing Project', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (637, 154, N'A. Validation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (638, 154, N'B. Elicitation', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (639, 154, N'C. Specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (640, 154, N'D. Analysis', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (641, 155, N'A. When you numbering requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (642, 155, N'B. When you labeling requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (643, 155, N'C. When you organizing requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (644, 155, N'D. When you dealing with incompleteness requirements', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (645, 156, N'A. User requirements specify the behaviors the product will exhibit under specific conditions. They describe what thedevelopers must implement to enable users to accomplish their tasks(user requirements), thereby satisfying the business requirements.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (646, 156, N'B. User requirements describe goals or tasks the users must be able to perform with the product that will provide someone. The domain of user requirements also includes descriptions of product attributes or characteristics that a important to user satisfaction.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (647, 156, N'C. User requirements describe why the organization is implementing the system, the business benefits the organi hopes to achieve. The focus is on the business objectives of the organization or the customer who requests the system,', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (648, 156, N'D. User requirements describes as fully as necessary the expected behavior of the software system.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (649, 157, N'A. The team', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (650, 157, N'B. Scrum master', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (651, 157, N'C. The tester', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (652, 157, N'D. Product owner', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (653, 158, N'A. A policy, guideline, standard, or regulation that defines or constrains some aspect of the business. Not a software requirement in itself, but the origin of several types of software requirements.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (654, 158, N'B. A description of a connection between a software system and a user, another software system, or a hardware device.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (655, 158, N'C. A high-level business objective of the organization that builds a product or of a customer who procures it.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (656, 158, N'D. A restriction that is imposed on the choices available to the developer for the design and construction of a product.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (657, 159, N'A. A description of a set of logically related possible interactions between an actor and a system that results in an outcome that provides value to the actor. Can encompass multiple scenarios.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (658, 159, N'B. A format to capture user requirements on agile projects in the form of one or two sentences that articulate a user or describe a unit of desired functionality, as well as stating the benefit of the functionality to the user.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (659, 159, N'C. A customer who will interact with a system either directly or indirectly', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (660, 159, N'D. A statement that describes the strategic concept or the ultimate purpose and form, of a new system.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (661, 160, N'A. business requirements document (BRD)', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (662, 160, N'B. requirements document', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (663, 160, N'C. software requirements specification', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (664, 160, N'D. system specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (665, 160, N'E. functional specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (666, 160, N'F. product specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (667, 161, N'A. Holding workshops and interviews, analyzing documents, and performing other elicitation activities', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (668, 161, N'B. Creating and evaluating prototypes intended to assist with requirements development', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (669, 161, N'C. Reviewing requirements and performing other validation activities', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (670, 161, N'D. Writing requirements specifications, creating analysis models, and prioritizing requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (671, 161, N'E. Planning requirements-related activities for the project', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (672, 161, N'F. Writing the software sources', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (673, 162, N'A. A feature tree', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (674, 162, N'B. A Ecosystem map', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (675, 162, N'C. A Sequence Diagram', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (676, 162, N'D. An event list', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (677, 163, N'A. Industry standards', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (678, 163, N'B. Books taller than 16 inches are shelved in the library''s Oversize section.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (679, 163, N'C. Government regulations', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (680, 163, N'D. Organizational policies', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (681, 164, N'A. True', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (682, 164, N'B. False', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (683, 165, N'A. Respect a developer''s assessment of the cost and feasibility of requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (684, 165, N'B. Make timely decisions about requirements when asked.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (685, 165, N'C. Educate BAs and developers about business', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (686, 165, N'D. Describe characteristics that will make the product easy to use.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (687, 166, N'A. Be specific and precise when providing input about requirements.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (688, 166, N'B. Hear ideas and alternatives for your requirements and for their solution', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (689, 166, N'C. Describe characteristics that will make the product easy to use.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (690, 166, N'D. Receive a system that meets your functional needs and quality expectations.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (691, 167, N'A. Nonfunctional requirement', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (692, 167, N'B. Quality attribute', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (693, 167, N'C. System requirement', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (694, 167, N'D. Feature', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (695, 167, N'E. Constraint', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (696, 168, N'A. Formal specifications that define requirements by using mathematically precise specifcation languages.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (697, 168, N'B. Well-structured and carefully written natural language.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (698, 168, N'C. Visual models that illustrate transformational processes, system states and changes between them, data relation logic flows, and the like.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (699, 168, N'D. The language you "invented" and write what you like', 1)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (700, 169, N'A. Precedents are available, as when a previous application is being replaced.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (701, 169, N'B. A package solution will be used.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (702, 169, N'C. Accurate estimates are needed.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (703, 169, N'D. Customers are extensively involved.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (704, 170, N'A. Business requirement', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (705, 170, N'B. Business rule', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (706, 170, N'C. Constraint', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (707, 170, N'D. Functional requirement', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (708, 170, N'E. System requirement', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (709, 171, N'A. Communication skills', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (710, 171, N'B. Interviewing and questioning skills', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (711, 171, N'C. Document requirements', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (712, 171, N'D. Analytical skills', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (713, 171, N'E Listening skills', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (714, 171, N'F. Modeling skills', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (715, 172, N'A. Identify project stakeholders and user classes', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (716, 172, N'B. Elicit requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (717, 172, N'C. Document requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (718, 172, N'D. Define business requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (719, 172, N'E. Thinking on your feet', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (720, 172, N'F. Plan the requirements approach', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (721, 173, N'A. Constraint', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (722, 173, N'B. User requirement', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (723, 173, N'C. System requirement', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (724, 173, N'D. Quality attribute', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (725, 173, N'E. Business rule', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (726, 174, N'A. System requirement', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (727, 174, N'B. Functional Requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (728, 174, N'C. User Requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (729, 174, N'D. Business Requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (730, 175, N'A. Detailed screen layouts and high-fidelity prototypes', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (731, 175, N'B. User stories, scenarios, and use case specifications', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (732, 175, N'C. The entity-relationship diagram', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (733, 175, N'D. Statetrensition diagrams and state tables', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (734, 176, N'A. A format to capture user requirements on agile projects in the form of one or two sentences that articulate a user need or describe a unit of desired functionality. as well as stating the benefit of the functionality to the user.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (735, 176, N'B. A description of a set of logically related possible interactions between an actor and a system that results in an outcome that provides value to the actor. Can encompass multiple scenarios.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (736, 176, N'C. A statement that describes the strategic concept or the ultimate purpose and form of a new system', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (737, 177, N'A. It describes part of a core business process that the system enables.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (738, 177, N'B. A favored user class requested it.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (739, 177, N'C. Other system functions depend on its presence.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (740, 177, N'D. That use case won''t be implemented for months', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (741, 177, N'E. Many users will use it frequently.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (742, 177, N'F. It''s required for regulatory compliance.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (743, 178, N'A. Elicitation', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (744, 178, N'B. Specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (745, 178, N'C. Analysis', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (746, 178, N'D. Validation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (747, 179, N'A. Expect BAs to record requirements in an appropriate form.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (748, 179, N'B. Dedicate the time that it takes to provide and clanfy requirements.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (749, 179, N'C. Expect BAs to speak your language', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (750, 179, N'D. Receive explanations of requirements practices and deliverables.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (751, 180, N'A. Marketing gets preference', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (752, 180, N'B. Customers get preference. but tn alignment with business objectives', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (753, 180, N'C. Product owner or product champion for the user class decides', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (754, 180, N'D. Business objectives dictate direction', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (755, 181, N'A. Product champions are all members of the user community to provide the requirements.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (756, 181, N'B. Product champions is a description of a hypothetical, generic person who serves as a stand-in for a group of users having similar charactenstics and needs.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (757, 181, N'C. Product champions are key members of the user community to provide the requirements.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (758, 182, N'A. Marketing gets preference', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (759, 182, N'B. Customers get preference. but in alignment with business objectives', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (760, 182, N'C. Product owner or product champion for the user class decides', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (761, 182, N'D. Business objectives dictate direction', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (762, 183, N'A. Document open issues', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (763, 183, N'B. Prepare questions and straw man models', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (764, 183, N'C. Prepare resource', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (765, 183, N'D. Decide on elicitation scope and agenda', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (766, 184, N'A. False', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (767, 184, N'B. True', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (768, 185, N'A. A description of a behavior that a system will exhibit under specific conditions.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (769, 185, N'B. A kind of nonfunctional requirement that describes a service or performance characteristic of a product.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (770, 185, N'C. A description of a property or characteristic that a system must exhibit or a constraint that it must respect.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (771, 185, N'D One or more logically related system capabilities that provide value to a user and are described by a set of functional requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (772, 186, N'A. The business opportunities describe the primary benefits that the new system will provide to its sponsors, buyesrs, and users.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (773, 186, N'B. The business opportunities summarize the important business benefits the product will provide in a quantitative and measurable way.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (774, 186, N'C. The business opportunities describe the business opportunity that exists and the market In which the product will be competing.', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (775, 186, N'D. The business opportunities summarize the rationale and context for the new product or for changes to be made to an existing one to the decision to build this product.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (776, 187, N'A Use cases (use case diagram)', 1)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (777, 187, N'B. Entities or their attributes (ERD)', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (778, 187, N'C. Actors(use case diagram)', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (779, 187, N'D. Objects with states(STD)', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (780, 188, N'A. Specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (781, 188, N'B. Elicitation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (782, 188, N'C. Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (783, 188, N'D. Analysis', 1)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'aa', N'1', N'sdas', 1, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'AI', N'Artificial Intelligence', NULL, 3, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'BA', N'Business Administration', NULL, 2, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'CF', N'Computing Fundamental', NULL, 1, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'CH', N'Chinese', NULL, 5, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'CS', N'Computer Science', NULL, 4, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'EN', N'English', NULL, 5, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'FI', N'Finance', NULL, 2, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'GD', N'Graphic Design', NULL, 8, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'IA', N'Information Assurance', NULL, 1, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'IT', N'Information Technology Specialization', NULL, 1, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'JA', N'Japanese', NULL, 5, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'KO', N'Korean', NULL, 5, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'MA', N'Mathematics', NULL, 6, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'MC', N'Multimedia Communications', NULL, 1, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'SS', N'Soft Skill', NULL, 7, NULL)
GO
SET IDENTITY_INSERT [dbo].[CourseCategory] ON 

INSERT [dbo].[CourseCategory] ([categoryID], [categoryName]) VALUES (1, N'Information Technology')
INSERT [dbo].[CourseCategory] ([categoryID], [categoryName]) VALUES (2, N'Business')
INSERT [dbo].[CourseCategory] ([categoryID], [categoryName]) VALUES (3, N'Data Science')
INSERT [dbo].[CourseCategory] ([categoryID], [categoryName]) VALUES (4, N'Computer Science')
INSERT [dbo].[CourseCategory] ([categoryID], [categoryName]) VALUES (5, N'Language')
INSERT [dbo].[CourseCategory] ([categoryID], [categoryName]) VALUES (6, N'Math')
INSERT [dbo].[CourseCategory] ([categoryID], [categoryName]) VALUES (7, N'Social Science')
INSERT [dbo].[CourseCategory] ([categoryID], [categoryName]) VALUES (8, N'Arts')
SET IDENTITY_INSERT [dbo].[CourseCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (1, N'SWT301', N'When should configuration management procedures be implemented?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (2, N'SWT301', N'Which of the following are characteristic of regression testing?/i) Regression testing is run ONLY once/ii) Regression testing is used after fixes have been made/iii) Regression testing is often automated/iv) Regression tests need not be maintained/Options:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (3, N'SWT301', N'Which of the problems below BEST characterize a result of software failure?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (4, N'SWT301', N'Which of the following activities should be performed during the selection and implementation of a testing tool?/i) Investigate the organisation''s test process./ii) Conduct a proof of concept./iii) Implement the selected tool on a project behind schedule to save time./iv) Identify coaching and mentoring requirements for the use of the selected tool./Options:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (5, N'SWT301', N'What is the MAIN benefit of designing tests early in the life cycle?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (6, N'SWT301', N'Which of the following benefits are MOST likely to be achieved by using test tools?/i) Easy to access information about tests and testing./ii) Reduced maintenance of testware./iii) Easy and cheap to implement./iv) Greater consistency of tests./Options:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (7, N'SWT301', N'Which of the following can be considered as success factors when deploying a new tool in an organization?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (8, N'SWT301', N'What is the purpose of exit criteria?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (9, N'SWT301', N'Which test design technique relies heavily on prior thorough knowledge of the system?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (10, N'SWT301', N'The ________ and ________ are used within individual workbenches to produce the right output products.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (11, N'SWT301', N'Which aspects of testing will establishing traceability help?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (12, N'SWT301', N'The principle of Cyclomatic complexity, considering L as edges or links, N as nodes, P as independent paths', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (13, N'SWT301', N'FPA is used to', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (14, N'SWT301', N'A _____ is the step-by-step method followed to ensure that standards are met', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (15, N'SWT301', N'Which is not a test Oracle', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (16, N'SWT301', N'PDCA is known as', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (17, N'SWT301', N'Which is the non-functional testing', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (18, N'SWT301', N'Which of the following is a MAJOR test planning task?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (19, N'SWT301', N'Testing where in we subject the target of the test , to varying workloads to measure and evaluate the performance behaviors and ability of the target and of the test to continue to function properly under these different workloads.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (20, N'SWT301', N'Which of the following is the task of a Tester?/i. Interaction with the Test Tool Vendor to identify best ways to leverage test tool on the project./ii. Prepare and acquire Test Data/iii. Implement Tests on all test levels, execute and log the tests./iv. Create the Test Specifications', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (21, N'SWT301', N'What can static analysis NOT find?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (22, N'SWT301', N'White Box Techniques are also called as:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (23, N'SWT301', N'Reviewing the test Basis is a part of which phase', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (24, N'SWT301', N'Component Testing is also called as :-/i. Unit Testing/ii. Program Testing/iii. Module Testing/iv. System Component Testing .', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (25, N'SWT301', N'Based on the IEEE Standard for Software Test Documentation (IEEE Std 829-1998), which sections of the test incident report should the following items be recorded?/Sections/a) Test incident report identifier/b) Summary/c) Incident description/d) Impact Items/1. Impact on test plans/2. Unique identifier/3. Anomalies/4. Procedure step/5. Environment/6. References to other relevant documents', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (26, N'SWT301', N'Which of the following is true about Formal Review or Inspection:-/i. Led by Trained Moderator (not the author)./ii. No Pre Meeting Preparations/iii. Formal Follow up process./iv. Main Objective is to find defects', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (27, N'SWT301', N'The Phases of formal review process is mentioned below arrange them in the correct order./i. Planning/ii. Review Meeting/iii. Rework/iv. Individual Preparations/v. Kick Off/vi. Follow Up', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (28, N'SWT301', N'Testing activity which is performed to expose defects in the interfaces and in the interaction between integrated components is :', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (29, N'SWT301', N'Methodologies adopted while performing Maintenance Testing:-', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (30, N'SWT301', N'The Switch is switched off once the temperature falls below 18 and then it is turned on when the temperature is more than 21. When the temperature is more than 21. Identify the Equivalance values which belong to the same class.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (31, N'SWT301', N'What is an equivalence partition (also known as an equivalence class)?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (32, N'SWT301', N'Which of the following is not a part of the Test Implementation and Execution Phase', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (33, N'SWT301', N'Link Testing is also called as :', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (34, N'SWT301', N'Who are the persons involved in a Formal Review:/i. Manager/ii. Moderator/iii. Scribe / Recorder/iv. Assistant Manager', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (35, N'SWT301', N'Which of the following statements regarding static testing is false:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (36, N'SWT301', N'Designing the test environment set-up and identifying any required infrastructure and tools are a part of which phase', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (37, N'SWT301', N'A Type of functional Testing, which investigates the functions relating to detection of threats, such as virus from malicious outsiders.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (38, N'SWT301', N'A Person who documents all the issues, problems and open points that were identified during a formal review.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (39, N'SWT301', N'The Test Cases Derived from use cases', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (40, N'SWT301', N'Test Implementation and execution has which of the following major tasks?/i. Developing and prioritizing test cases, creating test data, writing test procedures and optionally preparing the test harnesses and writing automated test scripts./ii. Creating the test suite from the test cases for efficient test execution./iii. Verifying that the test environment has been set up correctly./iv. Determining the exit criteria.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (41, N'SWT301', N'One of the fields on a form contains a text box which accepts numeric values in the range of 18 to 25. Identify the invalid Equivalance class', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (42, N'SWT301', N'Exhaustive Testing is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (43, N'SWT301', N'Which tool needs to interface with other office automation software in order to generate reports in the format required by the organization?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (44, N'SWT301', N'Which one is not comes under international standard', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (45, N'SWT301', N'In which phase static tests are used', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (46, N'SWT301', N'What''s the disadvantage of Black Box Testing', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (47, N'SWT301', N'What is the process of analyzing and removing causes of failures in software?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (48, N'SWT301', N'Majority of system errors occur in the _________ phase', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (49, N'SWT301', N'Which of the following is a MAJOR task when evaluating the exit criteria?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (50, N'SWT301', N'Which of the following are success factors when rolling out a new tool?/I. Roll the tool out to the entire organization to ensure reasonably even coverage./II. Avoid changing existing processes to reduce impact of the tool./III. Provide training and mentoring to new users./IV. Allow users to determine where the tool fits into the process best.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (51, N'SWT301', N'As a test leader you are collecting measures about defects. You recognize that after the first test cycle � covering all requirements - subsystem C has a defect density that is 150% higher than the average. Subsystem A on the other hand has a defect density that is 60% lower than the average. What conclusions for the next test cycle could you draw from this fact?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (52, N'SWT301', N'Which of these are objectives for software testing?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (53, N'SWT301', N'Failure is _________', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (54, N'SWT301', N'During the software development process, at what point can the test process start?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (55, N'SWT301', N'"How much testing is enough?"', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (56, N'SWT301', N'Which approaches can help increase the quality of software?/I. Incorporating rigorous testing/II. Preventing change requests/III. Establishing defects metrics/IV. Allocating schedule contingencies', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (57, N'SWT301', N'Features to be tested, approach, item pass / fail criteria and test deliverables should be specified in which document?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (58, N'SWT301', N'What is the difference between component testing and integration testing?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (59, N'SWT301', N'Fault Masking is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (60, N'SWT301', N'Which of the following is not a quality characteristic listed in ISO 9126 Standard?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (61, N'SWT301', N'One Key reason why developers have difficulty testing their own work is :', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (62, N'SWT301', N'Statement Coverage will not check for the following.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (63, N'SWT301', N'Given the Following program:/IF X <>= Z/THEN Statement 2;/END/McCabe� s Cyclomatic Complexity is :', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (64, N'SWT301', N'To test a function, the programmer has to write a _________, which calls the function to be tested and passes it test data.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (65, N'SWT301', N'Pick the best definition of quality ', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (66, N'SWT301', N'Boundary value testing', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (67, N'SWT301', N'An input field takes the year of birth between 1900 and 2004 The boundary values for testing this field are', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (68, N'SWT301', N'How many test cases are necessary to cover all the possible sequences of statements (paths) for the following program fragment/Assume that the two conditions are independent of each other:/if (Condition 1)/then statement 1/else statement 2/fi/if (Condition 2)/then statement 3/fi', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (69, N'SWT301', N'A common test technique during component test is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (70, N'SWT301', N'In a review meeting a moderator is a person who', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (71, N'SWT301', N'Acceptance test cases are based on what?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (72, N'SWT301', N'Which documents specify features to - be tested, approach, and pass / fail criteria?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (73, N'SWT301', N'Independent Verification & Validation is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (74, N'SWT301', N'Defect Management process does not include', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (75, N'SWT301', N'What is a group of test activities that are organized and managed together?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (76, N'SWT301', N'What is the key difference between (a) contract and regulation acceptance testing, and (b) alpha and beta testing?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (77, N'SWT301', N'Regression testing should be performed:/v) Every week/w) After the software has changed/x) As often as possible/y) When the environment has changed/z) When the project manager says', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (78, N'SWT301', N'During which test activity could faults be found most cost effectively?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (79, N'SWT301', N'What is the difference between testing software developed by contractor outside your country, versus testing software developed by a contractor within your country?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (80, N'SWT301', N'The inputs for developing a test plan are taken from', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (81, N'SWT301', N'Which of the following is not a static testing technique', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (82, N'SWT301', N'Which document specifies the sequence of test executions?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (83, N'SWT301', N'Inspections can find all the following except', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (84, N'SWT301', N'Which of the following is not a characteristic for Testability?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (85, N'SWT301', N'Software testing accounts to what percent of software development costs?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (86, N'SWT301', N'Which tool can be used to support and control part of the test management process?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (87, N'SWT301', N'If an expected result is not specified then:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (88, N'SWT301', N'When should we stop our testing', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (89, N'SWT301', N'The purpose of requirement phase is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (90, N'SWT301', N'Which of these can be successfully tested using Loop Testing methodology?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (91, N'SWT301', N'Cyclomatic Complexity method comes under which testing method.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (92, N'SWT301', N'A reliable system will be one that:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (93, N'SWT301', N'Which, in general, is the least required skill of a good tester?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (94, N'SWT301', N'A regression test:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (95, N'SWT301', N'Function/Test matrix is a type of', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (96, N'SWT301', N'The process starting with the terminal modules is called:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (97, N'SWT301', N'Verification is:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (98, N'SWT301', N'The difference between re-testing and regression testing is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (99, N'SWT301', N'Testing should be stopped when:', N'')
GO
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (100, N'SWT301', N'Which test technique is based on requirements specifications?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (101, N'SWT301', N'Which of the following is NOT part of configuration management:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (102, N'SWT301', N'A test plan defines', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (103, N'SWT301', N'A tool that supports traceability, recording of incidents or scheduling of tests is called:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (104, N'SWT301', N'The cost of fixing a fault:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (105, N'SWT301', N'Order numbers on a stock control system can range between 10000 and 99999 inclusive. Which of the following inputs might be a result of designing tests for only valid equivalence classes and valid boundaries:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (106, N'SWT301', N'When what is visible to end-users is a deviation from the specific or expected behavior, this is called:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (107, N'SWT301', N'Which of the following can be tested as part of operational testing?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (108, N'SWT301', N'Given the following:/Switch PC on/Start "outlook"/IF outlook appears THEN/Send an email/Close outlook', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (109, N'SWT301', N'Test managers should not:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (110, N'SWT301', N'Which of the following is NOT part of system testing:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (111, N'SWT301', N'When a new testing tool is purchased, it should be used first by:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (112, N'SWT301', N'Which of the following is not part of performance testing:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (113, N'SWT301', N'What is the purpose of test completion criteria in a test plan:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (114, N'SWT301', N'Given the following code, which is true:/IF A > B THEN/C = A - B/ELSE/C = A + B/ENDIF/Read D/IF C = D Then/Print "Error"/ENDIF', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (115, N'SWT301', N'Unreachable code would best be found using:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (116, N'SWT301', N'What information need not be included in a test incident report:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (117, N'SWT301', N'Which of the following is NOT included in the Test Plan document of the Test Documentation Standard:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (118, N'SWT301', N'IEEE 829 test plan documentation standard contains all of the following except:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (119, N'SWT301', N'The standard that gives definitions of testing terms is:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (120, N'SWT301', N'What are the main objectives of software project risk management?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (121, N'SWT301', N'Consider the following state transition diagram of a two-speed hair dryer, which is operated by pressing its one button. The first press of the button turns it on to Speed 1, second press to Speed 2 and the third press turns it off. Which of the following series of state transitions below will provide 0-switch coverage', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (122, N'SWT301', N'How many test cases are needed to achieve 100 % decision coverage?/If (p = q) {/s = s + 1;/if (a < S) {/t = 10;/}/} else if (p > q) {/t = 5;/}', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (123, N'SWT301', N'Which of the following statements about the component testing standard is false:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (124, N'SWT301', N'Could reviews or inspections be considered part of testing:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (125, N'SWT301', N'The main focus of acceptance testing is:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (126, N'SWT301', N'Which of the following can help testers understand the root causes of defects from previous projects?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (127, N'SWT301', N'Which technique is appropriate to test changes on old and undocumented functionalities of a system?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (128, N'SWT301', N'Non-functional system testing includes:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (129, N'SWT301', N'Which of the following is NOT a black box technique:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (130, N'SWT301', N'Expected results are:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (131, N'SWT301', N'Beta testing is:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (132, N'SWT301', N'Consider the following:/Pick up and read the newspaper/Look at what is on television/If there is a program that you are interested in watching then switch the the television on and watch/the program/Otherwise/Continue reading the newspaper/If there is a crossword in the newspaper then try and complete the crossword', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (133, N'SWT301', N'A typical commercial test execution tool would be able to perform all of the following EXCEPT:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (134, N'SWT301', N'Consider the following statements about early test design:/i. Early test design can prevent fault multiplication/ii. Faults found during early test design are more expensive to fix/iii. Early test design can find faults/iv. Early test design can cause changes to the requirements/v. Early test design takes more effort', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (135, N'SWT301', N'Given the following code, which is true about the minimum number of test cases required for full statement and branch coverage:/Read P/Read/IF P > 100 THEN/Print "Large"/ENDIF/If P > 50 THEN/Print "P Large"/ENDIF', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (136, N'SWT301', N'The place to start if you want a (new) test tool is:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (137, N'SWT301', N'Error guessing is best used', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (138, N'SWT301', N'Exit Criteria may consist of:/i. Thoroughness measures, such as coverage of code, functionality or risk/ii. Estimates of Defect density or reliability measures./iii. Residual risk such as defects not fixed or lack of test coverage in certain areas/iv. Verifying the Test Environment.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (139, N'SWT301', N'One of the fields on a form contains a text box, which accepts alphabets in lower or upper case. Identify the invalid Equivalance class value.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (140, N'SWT301', N'The Kick Off phase of a formal review includes the following:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (141, N'SWT301', N'Peer Reviews are also called as :', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (142, N'SWT301', N'Validation involves which of the following/i. Helps to check the usality of the Built Product/ii. Helps to check that we have built the right product./iii. Helps in developing the product/iv. Monitoring tool wastage and obsoleteness.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (143, N'SWT301', N'Success Factors for a review include:/i. Each Review does not have a predefined objective/ii. Defects found are welcomed and expressed objectively/iii. Management supports a good review process./iv. There is an emphasis on learning and process improvement.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (144, N'SWT301', N'Which test measures the system at or beyond the limits of its specified requirements?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (145, N'SWT301', N'Defects discovered by static analysis tools include:/i. Variables that are never used./ii. Security vulnerabilities./iii. Programming Standard Violations/iv. Uncalled functions and procedures', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (148, N'SWR302', N'Which is NOT a basic element that make up Business Requirements?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (149, N'SWR302', N'Which is NOT an example belong to the Action Enablers, a type of business rule?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (150, N'SWR302', N'Which is the most appropriate way when you want to resolve the disagreement requirement between Individual users?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (151, N'SWR302', N'Which is the correct definition of the term business rule based on the information system perspective?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (152, N'SWR302', N'_______ is a set of requirements that has been reviewed and agreed upon and serves as the basis for further development', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (153, N'SWR302', N'What is NOT true about motivations for tracing requirements?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (154, N'SWR302', N'Conduct focus groups and Identify user requirements activities should be done in __________ stage', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (155, N'SWR302', N'When to use notation TBD (to be determined) in software requirements specification?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (156, N'SWR302', N'Which is the CORRECT statements describe about User Requirements?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (157, N'SWR302', N'On projects using agile development methods, the traditional project role Business Analyst will likely be a________', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (158, N'SWR302', N'Which of the following is the CORRECT definition of the term Business Requirement?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (159, N'SWR302', N'Which statement CORRECT describe the term user story?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (160, N'SWR302', N'The following terms can be used exchangeable. Which is the industry-standard term?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (161, N'SWR302', N'What is not included in Requirement Effort?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (162, N'SWR302', N'__________identifies external events that could trigger behavior in the system. It depicts the scope boundary for the by naming possible business events triggered by users, time-triggered (temporal) events, or signal events received external components, such as hardware devices', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (163, N'SWR302', N'Which is NOT an example belong to the constraint, a type of business rule?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (164, N'SWR302', N'Requirements are missed during elicitation that does not relate the software projects shouldn''t be finished on time.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (165, N'SWR302', N'Requirements bill of responsibilities for software customers are, EXCEPT:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (166, N'SWR302', N'Requirements bill of rights for software customers are, EXCEPT:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (167, N'SWR302', N'_________is a restriction that is imposed on the choices available to the developer for the design and construction of a product.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (168, N'SWR302', N'Which is NOT a common way to represent software requirement?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (169, N'SWR302', N'Which case you should write software requirement specification more detail is better?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (170, N'SWR302', N'______is a high-level business objective of the organization that builds a product or of a customer who procures it', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (171, N'SWR302', N'Which is NOT a basic skill of a Business Analyst?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (172, N'SWR302', N'Which is NOT a basic task of a Business Analyst?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (173, N'SWR302', N'_________ is a goal or task that specific classes of users must be able to perform with a system, or a desired product attribute.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (174, N'SWR302', N'(Choose 1 answer)According to Karl Wiegers and Joy Beatty in the book Software Requirements, third edition, which is NOT a basic distinct levels of Software Requirement', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (175, N'SWR302', N'Which the most appropriate representation techniques when you are trying to show. analyze. or discover User task descriptions?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (176, N'SWR302', N'Which statement CORRECT describe the term use case?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (177, N'SWR302', N'Which is NOT a good reason to set a use case at high priority to implement?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (178, N'SWR302', N'Define vision and scope and Select product champions activities should be done in________ stage', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (179, N'SWR302', N'Requirements bill of rights for software customers are. EXCEPT:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (180, N'SWR302', N'Which is the most appropriate way when you want to resolve the disagreement requirement between Users and user manage.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (181, N'SWR302', N'According to Kar Wiegers and Joy Beatty in Software Requirements. third edition, which is the CORRECT statement describe the production champion term?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (182, N'SWR302', N'Which is the most appropriate way when you want to resolve the disagreement requirement between Development and customers?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (183, N'SWR302', N'Which is NOT belong to prepare for elicitation activity when you do requirements elicitation on your project?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (184, N'SWR302', N'Impact analysis procedure and template are not necessary for change impact analysis', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (185, N'SWR302', N'Which of the following is the CORRECT definition of the term Nonfunctional Requirement?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (186, N'SWR302', N'Which is the CORRECT statements that describe about business opportunities section in the template of Vision and scope document.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (187, N'SWR302', N'Which analysis model you should use when the customers present their requirements using Verb?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (188, N'SWR302', N'Model the requirements and allocate requirements to subsystems activities should be done in _____ stage', N'')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[RoleName] ([roleID], [roleName]) VALUES (0, N'admin')
INSERT [dbo].[RoleName] ([roleID], [roleName]) VALUES (1, N'expert')
INSERT [dbo].[RoleName] ([roleID], [roleName]) VALUES (2, N'customer')
GO
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'ACC101', N'Principles of Accounting', NULL, N'BA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'ACH301', N'Accommodation Management', NULL, N'BA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'ADY201', N'AI, DS with Python & SQL', NULL, N'AI')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'AFA201', N'Human Anatomy for Artis', NULL, N'GD')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'AIT301', N'AI with Tensorflow', NULL, N'AI')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'ANS201', N'Idea & Script Development', NULL, N'GD')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'BUE201', N'Business ethics', NULL, N'BA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'CEA201', N'Computer Organization and Architecture', NULL, N'IT')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'CHN111', N'Elementary Chinese 1', NULL, N'CH')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'CHN122', N'Elementary Chinese 2', NULL, N'CH')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'CSD201', N'Data Structures and Algorithms', NULL, N'CF')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'CSD203', N'Data Structures and Algorithm with Python', NULL, N'CF')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'CSD301', N'Advanced Algorithms', N'Advanced Algorithms', N'CF')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'DBI202', N'Introduction to Databases', NULL, N'CF')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'DBS401', N'Database Security', NULL, N'IA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'DGT301', N'Digital Signal Processing', NULL, N'IT')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'DMT301', N'Data mining with Tensorflow', NULL, N'AI')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'DTG111', N'Visual Design Tools 1', NULL, N'MC')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'ECR201', N'Critical Reading', NULL, N'EN')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'ENM301', N'Intermediate Business English', NULL, N'EN')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'ENW492', N'Writing Research Papers', NULL, N'EN')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'FIN201', N'Monetary Economics and Global Economy', NULL, N'FI')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'FIN301', N'Financial Markets and Institutions', NULL, N'FI')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'FRS301', N'Digital Forensics', NULL, N'IA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'HCM201', N'Ho Chi Minh Ideology', NULL, N'SS')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'IAA202', N'Risk Management in Information Systems', NULL, N'IA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'IMP301', N'Image Processing', NULL, N'CS')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'IOT102', N'Internet of Things', NULL, N'IT')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'JPD113', N'Elementary Japanese 1-A1.1', NULL, N'JA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'JPD123', N'Elementary Japanese 1-A1.2', NULL, N'JA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'JPD316', N'Intermediate Japanese 1-B1/B2', NULL, N'JA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'KOR311', N'Intermediate Korean Language 1', NULL, N'KO')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'KOR321', N'Intermediate Korean Language 2', NULL, N'KO')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'KOR411', N'Intermediate Korean Language 3', NULL, N'KO')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'MAD101', N'Discrete mathematics', NULL, N'MA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'MAE101', N'Mathematics for Engineering', NULL, N'MA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'MAS202', N'Applied Statistics for Business', NULL, N'MA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'MAS291', N'Statistics and Probability', NULL, N'MA')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'MED201', N' New Media Technology', NULL, N'MC')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'NLP301', N'Natural Language Processing', NULL, N'CS')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'NWC203', N'Computer Networking', NULL, N'CF')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'PFD201', N' Photography for Designer', NULL, N'GD')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'PRF192', N'Programming Fundamentals', NULL, N'CF')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'PRJ301', N'Java Web Application Development', NULL, N'CF')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'PRN211', N'Basic Cross-Platform Application Programming With .NET', NULL, N'CF')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'PRO192', N'Object-Oriented Programming', NULL, N'CF')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'PRP201', N' Python programming', NULL, N'CS')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'SDP201', N'Sound Production', NULL, N'MC')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'SSG104', N'Communication and In-Group Working Skills', NULL, N'SS')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'SSL101', N'Academic Skills for University Success', NULL, N'SS')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'SWR302', N'Software Requirement', NULL, N'IT')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'SWT301', N'Software Testing', NULL, N'IT')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'WED201', N'Web Design', NULL, N'CF')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userID], [userName], [password], [fullName], [email], [avatar], [description], [roleID], [status], [registerDay]) VALUES (1, N'admin', N'admin', N'Administrator', N'admin@gmail.com', NULL, NULL, 0, 1, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[User] ([userID], [userName], [password], [fullName], [email], [avatar], [description], [roleID], [status], [registerDay]) VALUES (2, N'expert', N'expert', N'Expert', N'expert@email.com', NULL, NULL, 1, 1, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[User] ([userID], [userName], [password], [fullName], [email], [avatar], [description], [roleID], [status], [registerDay]) VALUES (3, N'expert1', N'expert1', N'Expert1', N'expert1@email.com', NULL, NULL, 1, 0, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[User] ([userID], [userName], [password], [fullName], [email], [avatar], [description], [roleID], [status], [registerDay]) VALUES (4, N'customer', N'customer', N'Customer', N'customer@email.com', NULL, NULL, 2, 1, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[User] ([userID], [userName], [password], [fullName], [email], [avatar], [description], [roleID], [status], [registerDay]) VALUES (5, N'customer1', N'customer1', N'Customer1', N'customer1@email.com', NULL, NULL, 2, 0, CAST(N'2022-09-28' AS Date))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([questionID])
REFERENCES [dbo].[Question] ([questionID])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_CourseCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[CourseCategory] ([categoryID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_CourseCategory]
GO
ALTER TABLE [dbo].[ExpertAssign]  WITH CHECK ADD  CONSTRAINT [FK_ExpertAssign_Subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subjectID])
GO
ALTER TABLE [dbo].[ExpertAssign] CHECK CONSTRAINT [FK_ExpertAssign_Subject]
GO
ALTER TABLE [dbo].[ExpertAssign]  WITH CHECK ADD  CONSTRAINT [FK_ExpertAssign_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[ExpertAssign] CHECK CONSTRAINT [FK_ExpertAssign_User]
GO
ALTER TABLE [dbo].[FavoriteSubject]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteSubject_Subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subjectID])
GO
ALTER TABLE [dbo].[FavoriteSubject] CHECK CONSTRAINT [FK_FavoriteSubject_Subject]
GO
ALTER TABLE [dbo].[FavoriteSubject]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteSubject_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[FavoriteSubject] CHECK CONSTRAINT [FK_FavoriteSubject_User]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subjectID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subjectID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Subject]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_User]
GO
ALTER TABLE [dbo].[QuizHistory]  WITH CHECK ADD  CONSTRAINT [FK_QuizHistory_Question] FOREIGN KEY([questionID])
REFERENCES [dbo].[Question] ([questionID])
GO
ALTER TABLE [dbo].[QuizHistory] CHECK CONSTRAINT [FK_QuizHistory_Question]
GO
ALTER TABLE [dbo].[QuizHistory]  WITH CHECK ADD  CONSTRAINT [FK_QuizHistory_Quiz] FOREIGN KEY([quizID])
REFERENCES [dbo].[Quiz] ([quizID])
GO
ALTER TABLE [dbo].[QuizHistory] CHECK CONSTRAINT [FK_QuizHistory_Quiz]
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Course] FOREIGN KEY([courseID])
REFERENCES [dbo].[Course] ([courseID])
GO
ALTER TABLE [dbo].[Register] CHECK CONSTRAINT [FK_Activity_Course]
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD  CONSTRAINT [FK_Register_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Register] CHECK CONSTRAINT [FK_Register_User]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Course] FOREIGN KEY([courseID])
REFERENCES [dbo].[Course] ([courseID])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Course]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_RoleName] FOREIGN KEY([roleID])
REFERENCES [dbo].[RoleName] ([roleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_RoleName]
GO
USE [master]
GO
ALTER DATABASE [QuizPractiseDB_Demo] SET  READ_WRITE 
GO
