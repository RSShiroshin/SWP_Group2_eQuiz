USE [master]
GO
/****** Object:  Database [QuizPractiseDB_Demo]    Script Date: 10/27/2022 10:30:14 AM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 10/27/2022 10:30:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[answerID] [int] IDENTITY(1,1) NOT NULL,
	[questionID] [int] NOT NULL,
	[content] [nvarchar](500) NOT NULL,
	[isAnswer] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[answerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/27/2022 10:30:14 AM ******/
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
/****** Object:  Table [dbo].[CourseCategory]    Script Date: 10/27/2022 10:30:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpertAssign]    Script Date: 10/27/2022 10:30:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpertAssign](
	[userID] [int] NOT NULL,
	[subjectID] [nchar](6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteSubject]    Script Date: 10/27/2022 10:30:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteSubject](
	[userID] [int] NOT NULL,
	[subjectID] [nchar](6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 10/27/2022 10:30:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[subjectID] [nchar](6) NOT NULL,
	[content] [nvarchar](500) NOT NULL,
	[explain] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 10/27/2022 10:30:14 AM ******/
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
/****** Object:  Table [dbo].[QuizHistory]    Script Date: 10/27/2022 10:30:14 AM ******/
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
/****** Object:  Table [dbo].[Register]    Script Date: 10/27/2022 10:30:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[userID] [int] NOT NULL,
	[courseID] [nchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleName]    Script Date: 10/27/2022 10:30:14 AM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 10/27/2022 10:30:14 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 10/27/2022 10:30:14 AM ******/
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

INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (1, 1, N'dsfrfds', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (2, 2, N'A. Google', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (3, 2, N'B. Library aggregated search', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (4, 2, N'C. YouTube', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (5, 2, N'D. An academic database entitled. "Commmunication Source. Focussing on Media Studies"', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (6, 2, N'E. An academic database called JSTOR, which has journal articles from fields such as film studies and literature, sociology and more.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (7, 3, N'A. Semantically nich problem', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (8, 3, N'B. Semantically lean problem', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (9, 3, N'C. Knowledge-rich problem', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (10, 3, N'D. Knowledge - lean problem', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (11, 4, N'A. Responsibility is not mentioned in academic culture.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (12, 4, N'B. Students are expected to complete all given assignments on time.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (13, 4, N'C. Students are expected to be critical on analyzing. communicate and producing ideas to complete their assignments, and avoid any academic unet', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (14, 4, N'D Students are expected to have responsibility to use our knowledge in ways that are ethical and make a positive contribution to the communities to global', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (15, 5, N'English, German, Scandinavian, French, and Japanese.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (16, 5, N'All of the answers are incorrect.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (17, 5, N'ethity, race, gender, age, and physical disability.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (18, 5, N'corporate, multicultural, language, ethnicity, and global.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (19, 6, N'I am a researcher focusing on the DNA of earthworms and trying to apply their genetic adaptations to use with human DNA.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (20, 6, N'Passionate pop culture enthusiast. Social media junkie Avid blogger Retweets do not mean endorsements.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (21, 6, N'Creative Dynamic Motivated', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (22, 6, N'A mum and a wife with a cool day job writing children''s books.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (23, 7, N'Borowing a friend''s notes from class', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (24, 7, N'Reusing the exact same paragraph from an essay you wrote for a different class in a new', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (25, 7, N'Having a friend read-over your essay to check for meaning and clarity essay', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (26, 7, N'Paying someone outside of the university to write your essay because you aren''t feeling well', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (27, 8, N'A. During test planning. ', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (28, 8, N'B. During test analysis. ', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (29, 8, N'C. During test execution. ', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (30, 8, N'D. When evaluating exit criteria', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (31, 9, N'A. ii, iv.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (32, 9, N'B. ii, iii.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (33, 9, N'C. i, iii, iv.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (34, 9, N'D. iii.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (35, 10, N'A. Damaged reputation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (36, 10, N'B. Lack of methodology', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (37, 10, N'C. Inadequate training', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (38, 10, N'D. Regulatory compliance', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (39, 11, N'A. i, ii, iii.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (40, 11, N'B. ii, iii, iv.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (41, 11, N'C. i, iii, iv.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (42, 11, N'D. i, ii, iv.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (43, 12, N'A. It is cheaper than designing tests during the test phases.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (44, 12, N'B. It helps prevent defects from being introduced into the code.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (45, 12, N'C. Tests designed early are more effective than tests designed later.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (46, 12, N'D. It saves time during the testing phases when testers are busy.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (47, 13, N'Options:', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (48, 13, N'A. ii and iv', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (49, 13, N'B. ii and iii', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (50, 13, N'C. i and iv', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (51, 13, N'D. i and iii', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (52, 14, N'A. Providing coaching to users and defining usage guidelines', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (53, 14, N'B. Monitoring tool usage and reducing the need for risk analysis', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (54, 14, N'C. Improving processes and focusing more on component testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (55, 14, N'D. Assessing testing completion and minimizing code reviews', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (56, 15, N'A. To define when a test level is complete.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (57, 15, N'B. To determine when a test has completed.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (58, 15, N'C. To identify when a software system should be retired.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (59, 15, N'D. To determine whether a test has passed.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (60, 16, N'A. Data driven testing technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (61, 16, N'B. Experience-based technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (62, 16, N'C. White-box technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (63, 16, N'D. Structure-based technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (64, 17, N'A. Tools and techniques', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (65, 17, N'B. Procedures and standards', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (66, 17, N'C. Processes and walkthroughs', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (67, 17, N'D. Reviews and update', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (68, 18, N'A. Configuration management and test data generation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (69, 18, N'B. Test case specification and change control', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (70, 18, N'C. Test condition and test procedure specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (71, 18, N'D. Impact analysis and requirements coverage', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (72, 19, N'A. L-N +2P', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (73, 19, N'B. N-L +2P', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (74, 19, N'C. N-L +P', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (75, 19, N'D. N-L +P', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (76, 20, N'A. To measure the functional requirements of the project', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (77, 20, N'B. To measure the size of the functionality of an Information system', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (78, 20, N'C. To measure the functional testing effort', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (79, 20, N'D. To measure the functional flow', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (80, 21, N'A. SDLC', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (81, 21, N'B. Project Plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (82, 21, N'C. Policy', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (83, 21, N'D. Procedure', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (84, 22, N'A. The existing system (For a bench mark)', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (85, 22, N'B. The code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (86, 22, N'C. Individual''s knowledge', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (87, 22, N'D. User manual', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (88, 23, N'A. Plan, Do, Check, Act', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (89, 23, N'B. Plan, Do, Correct, Act', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (90, 23, N'C. Plan, Debug, Check, Act', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (91, 23, N'D. Plan, Do, Check, Accept', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (92, 24, N'A. Performance testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (93, 24, N'B. Unit testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (94, 24, N'C. Regression testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (95, 24, N'D. Sanity testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (96, 25, N'A. Determining the exit criteria', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (97, 25, N'B. Measuring and analyzing results', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (98, 25, N'C. Implementing corrective actions', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (99, 25, N'D. Monitoring and documenting progress', 0)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (100, 26, N'A. Load Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (101, 26, N'B. Integration Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (102, 26, N'C. System Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (103, 26, N'D. Usability Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (104, 27, N'A. i, ii, iii is true and iv is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (105, 27, N'B. ii,iii,iv is true and i is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (106, 27, N'C. i is true and ii,iii,iv are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (107, 27, N'D. iii and iv is correct and i and ii are incorrect', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (108, 28, N'A. The use of a variable before it has been defined', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (109, 28, N'B. Unreachable ("dead") code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (110, 28, N'C. Memory leaks', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (111, 28, N'D. Array bound violations', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (112, 29, N'A. Structural Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (113, 29, N'B. Design Based Testin', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (114, 29, N'C. Error Guessing Technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (115, 29, N'D. Experience Based Technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (116, 30, N'A. Test Analysis and Design', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (117, 30, N'B. Test Implementation and execution', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (118, 30, N'C. Test Closure Activities', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (119, 30, N'D. Evaluating exit criteria and reporting', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (120, 31, N'i. Unit Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (121, 31, N'ii. Program Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (122, 31, N'iii. Module Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (123, 31, N'iv. System Component Testing .', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (124, 31, N'A. i,ii,iii are true and iv is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (125, 31, N'B. i,ii,iii,iv are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (126, 31, N'C. i,ii,iv are true and iii is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (127, 31, N'D. all of above is true', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (128, 32, N'A. a: 2; b: 4; c: 1, 3 and 5; d: 6', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (129, 32, N'B. a: 2; b: 3; c: 4, 5 and 6; d: 1', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (130, 32, N'C. a: 2; b: 6; c: 3, 4 and 5; d: 1', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (131, 32, N'D. a: 2; b: 1; c: 3, 4 and 5; d: 6', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (132, 33, N'A. ii is true and i,iii,iv are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (133, 33, N'B. i,iii,iv are true and ii is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (134, 33, N'C. i,iii,iv are false and ii is true', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (135, 33, N'D. iii is true and I,ii,iv are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (136, 34, N'A. i,ii,iii,iv,v,vi', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (137, 34, N'B. vi,i,ii,iii,iv,v', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (138, 34, N'C. i,v,iv,ii,iii,vi', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (139, 34, N'D. i,ii,iii,v,iv,vi', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (140, 35, N'A. System Level Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (141, 35, N'B. Integration Level Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (142, 35, N'C. Unit Level Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (143, 35, N'D. Component Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (144, 36, N'A. Breadth Test and Depth Test', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (145, 36, N'B. Re-testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (146, 36, N'C. Confirmation Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (147, 36, N'D. Sanity Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (148, 37, N'A. 12,16,22', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (149, 37, N'B. 24,27,17', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (150, 37, N'C. 22,23,24', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (151, 37, N'D. 14,15,19', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (152, 38, N'A. A set of test cases for testing classes of objects', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (153, 38, N'B. An input or output range of values such that only one value in the range becomes a test case', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (154, 38, N'C. An input or output range of values such that each value in the range becomes a test case', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (155, 38, N'D. An input or output range of values such that every tenth value in the range becomes a test case.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (156, 39, N'A. Creating test suites from the test cases', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (157, 39, N'B. Executing test cases either manually or by using test execution tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (158, 39, N'C. Comparing actual results', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (159, 39, N'D. Designing the Tests', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (160, 40, N'A. Component Integration testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (161, 40, N'B. Component System Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (162, 40, N'C. Component Sub System Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (163, 40, N'D. Maintenance testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (164, 41, N'A. i,ii,iii,iv are true', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (165, 41, N'B. i,ii,iii are true and iv is false.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (166, 41, N'C. ii,iii,iv are true and i is false.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (167, 41, N'D. i,iv are true and ii, iii are false.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (168, 42, N'A. Static testing requires the running of tests through the code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (169, 42, N'B. Static testing includes desk checking', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (170, 42, N'C. Static testing includes techniques such as reviews and inspections', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (171, 42, N'D. Static testing can give measurements such as cyclomatic complexity', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (172, 43, N'A. Test Implementation and execution', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (173, 43, N'B. Test Analysis and Design', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (174, 43, N'C. Evaluating the Exit Criteria and reporting', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (175, 43, N'D. Test Closure Activities', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (176, 44, N'A. Security Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (177, 44, N'B. Recovery Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (178, 44, N'C. Performance Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (179, 44, N'D. Functionality Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (180, 45, N'A. Moderator.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (181, 45, N'B. Scribe', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (182, 45, N'C. Author', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (183, 45, N'D. Manager', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (184, 46, N'A. Are most useful in uncovering defects in the process flows during real world use of the system', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (185, 46, N'B. Are most useful in uncovering defects in the process flows during the testing use of the system', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (186, 46, N'C. Are most useful in covering the defects in the process flows during real world use of the system', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (187, 46, N'D. Are most useful in covering the defects at the Integration Level', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (188, 47, N'A. i,ii,iii are true and iv is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (189, 47, N'B. i,,iv are true and ii is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (190, 47, N'C. i,ii are true and iii,iv are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (191, 47, N'D. ii,iii,iv are true and i is false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (192, 48, N'A. 17', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (193, 48, N'B. 19', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (194, 48, N'C. 24', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (195, 48, N'D. 21', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (196, 49, N'A. Is impractical but possible', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (197, 49, N'B. Is practically possible', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (198, 49, N'C. Is impractical and impossible', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (199, 49, N'D. Is always possible', 0)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (200, 50, N'A. Progress tracking tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (201, 50, N'B. Test management tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (202, 50, N'C. Metrics management tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (203, 50, N'D. Test execution tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (204, 51, N'A. IEC', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (205, 51, N'B. IEEE', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (206, 51, N'C. ISO', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (207, 51, N'D. All of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (208, 52, N'A. Requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (209, 52, N'B. Design', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (210, 52, N'C. Coding', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (211, 52, N'D. All of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (212, 53, N'A. Chances of having repetition of tests that are already done by programmer.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (213, 53, N'B. The test inputs needs to be from large sample space.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (214, 53, N'C. It is difficult to identify all possible inputs in limited testing time. So writing test cases is slow and difficult', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (215, 53, N'D. All above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (216, 54, N'A. Validation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (217, 54, N'B. Testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (218, 54, N'C. Debugging', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (219, 54, N'D. Verification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (220, 55, N'A. Requirements Phase.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (221, 55, N'B. Analysis and Design Phase', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (222, 55, N'C. Development Phase', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (223, 55, N'D. Testing Phase', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (224, 56, N'A. Creating test suites and cases for efficient execution', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (225, 56, N'B. Writing a test summary report for stakeholders', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (226, 56, N'C. Handing the testware to the maintenance organization', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (227, 56, N'D. Identifying any required infrastructure and tools', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (228, 57, N'A. I and II', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (229, 57, N'B. I, III and IV', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (230, 57, N'C. III', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (231, 57, N'D. IV', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (232, 58, N'A. It is probable that subsystem C has still more hidden defects. Therefore we need to test subsystem C in more detail.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (233, 58, N'B. Because we have already found many defects in subsystem C, we should concentrate testing resources on Subsystem A.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (234, 58, N'C. Observed defect density does not allow any conclusions about the amount of additional testing.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (235, 58, N'D. We should try to equalize the amount of testing over all modules to ensure that we test all subsystems evenly.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (236, 59, N'A. Determine the productivity of programmers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (237, 59, N'B. Eliminate the need for future program maintenance', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (238, 59, N'C. Eliminate every error prior to release', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (239, 59, N'D. Uncover software errors', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (240, 60, N'A. Incorrect program behavior due to a fault in the program', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (241, 60, N'B. Bug found before product Release', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (242, 60, N'C. Bug found after product Release', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (243, 60, N'D. Bug found during Design phase', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (244, 61, N'A. When the code is complete.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (245, 61, N'B. When the design is complete.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (246, 61, N'C. When the software requirements have been approved.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (247, 61, N'D. When the first code module is ready for unit testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (248, 62, N'A. This question is impossible to answer', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (249, 62, N'B. This question is easy to answer', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (250, 62, N'C. The answer depends on the risk for your industry, contract and special requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (251, 62, N'D. This answer depends on the maturity of your developers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (252, 63, N'A. I and II are true; III and IV are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (253, 63, N'B. II and IV are true; I and II are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (254, 63, N'C. I and IV are true; II and III are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (255, 63, N'D. I and III are true; II and IV are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (256, 64, N'A. Test case specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (257, 64, N'B. Test procedure specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (258, 64, N'C. Test plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (259, 64, N'D. Test design specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (260, 65, N'A. Component testing tests interfaces; integration testing searches for defects', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (261, 65, N'B. Component testing searches for defects; integration testing tests Interfaces', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (262, 65, N'C. Developers perform component testing; testers perform integration testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (263, 65, N'D. Testers perform component testing; users perform integration testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (264, 66, N'A. Error condition hiding another error condition', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (265, 66, N'B. Creating a test case which does not reveal a fault', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (266, 66, N'C. Masking a fault by developer', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (267, 66, N'D. Masking a fault by a tester', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (268, 67, N'A. Functionality', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (269, 67, N'B. Usability', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (270, 67, N'C. Supportability', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (271, 67, N'D. Maintainability', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (272, 68, N'A. Lack of technical documentation', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (273, 68, N'B. Lack of test tools on the market for developers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (274, 68, N'C. Lack of training', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (275, 68, N'D. Lack of Objectivity', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (276, 69, N'A. Missing Statements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (277, 69, N'B. Unused Branches', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (278, 69, N'C. Dead Code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (279, 69, N'D. Unused Statement', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (280, 70, N'A. 2', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (281, 70, N'B. 3', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (282, 70, N'C. 4', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (283, 70, N'D. 5', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (284, 71, N'A. Stub', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (285, 71, N'B. Driver', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (286, 71, N'C. Proxy', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (287, 71, N'D. None of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (288, 72, N'A. Quality is job one', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (289, 72, N'B. Zero defects', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (290, 72, N'C. Conformance to requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (291, 72, N'D. Work as designed', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (292, 73, N'A. Is the same as equivalence partitioning tests', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (293, 73, N'B. Test boundary conditions on, below and above the edges of input and output equivalence classes', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (294, 73, N'C. Tests combinations of input circumstances', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (295, 73, N'D. Is used in white box testing strategy', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (296, 74, N'A. 0,1900,2004,2005', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (297, 74, N'B. 1900, 2004', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (298, 74, N'C. 1899,1900,2004,2005', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (299, 74, N'D. 1899, 1900, 1901,2003,2004,2005', 0)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (300, 75, N'A. 2 Test Cases', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (301, 75, N'B. 3 Test Cases', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (302, 75, N'C. 4 Test Cases', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (303, 75, N'D. Not achievable', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (304, 76, N'A. Statement and branch testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (305, 76, N'B. Usability testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (306, 76, N'C. Security testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (307, 76, N'D. Performance testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (308, 77, N'A. Takes minutes of the meeting', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (309, 77, N'B. Mediates between people', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (310, 77, N'C. Takes telephone calls', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (311, 77, N'D. Writes the documents to be reviewed', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (312, 78, N'A. Requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (313, 78, N'B. Design', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (314, 78, N'C. Code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (315, 78, N'D. Decision table', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (316, 79, N'A. Test plan and test design specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (317, 79, N'B. Test plan and test case specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (318, 79, N'C. Test procedure specification and test design specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (319, 79, N'D. Test case specification and test procedure specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (320, 80, N'A. Done by the Developer', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (321, 80, N'B. Done by the Test Engineers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (322, 80, N'C. Done By Management', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (323, 80, N'D. Done by an Entity Outside the Project� s sphere of influence', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (324, 81, N'A. Defect prevention', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (325, 81, N'B. Deliverable base-lining', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (326, 81, N'C. Management reporting', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (327, 81, N'D. None of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (328, 82, N'A. Test procedure specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (329, 82, N'B. Test level', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (330, 82, N'C. Test case specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (331, 82, N'D. Test plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (332, 83, N'A. (a) are performed outside the company and (b) are conducted by the test team', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (333, 83, N'B. (a) are conducted by regulators and (b) are performed by system administrators', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (334, 83, N'C. (a) are mandatory test for government applications and (b) are usually optional', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (335, 83, N'D. (a) are for custom-developed software and (b) are for off the - shelf software', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (336, 84, N'A. v & w are true, x & z are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (337, 84, N'B. w, x & y are true, v & z are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (338, 84, N'C. w & y are true, v, x & z are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (339, 84, N'D. w is true, v, x y and z are false', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (340, 84, N'E. All of the above are true', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (341, 85, N'A. Execution', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (342, 85, N'B. Design', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (343, 85, N'C. Planning', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (344, 85, N'D. Check Exit criteria completion', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (345, 86, N'A. Does not meet people needs', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (346, 86, N'B. Cultural difference', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (347, 86, N'C. Loss of control over reallocation of resources', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (348, 86, N'D. Relinquishments of control', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (349, 87, N'A. Project plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (350, 87, N'B. Business plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (351, 87, N'C. Support plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (352, 87, N'D. None of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (353, 88, N'A. Error guessing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (354, 88, N'B. Walkthrough', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (355, 88, N'C. Data flow analysis', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (356, 88, N'D. Inspections', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (357, 89, N'A. Test procedure specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (358, 89, N'B. Test design specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (359, 89, N'C. Test case specification', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (360, 89, N'D. Test plan', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (361, 90, N'A. Variables not defined in the code', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (362, 90, N'B. Spelling and grammar faults in the documents', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (363, 90, N'C. Requirements that have been omitted from the design documents', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (364, 90, N'D. How much of the code has been covered', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (365, 91, N'A. Operability', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (366, 91, N'B. Observability', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (367, 91, N'C. Simplicity', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (368, 91, N'D. Robustness', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (369, 92, N'A. 10-20', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (370, 92, N'B. 40-50', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (371, 92, N'C. 70-80', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (372, 92, N'D. 5-10', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (373, 93, N'A. Coverage management tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (374, 93, N'B. Test management tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (375, 93, N'C. Data preparation tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (376, 93, N'D. Performance testing tool', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (377, 94, N'A. We cannot run the test', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (378, 94, N'B. It may be difficult to repeat the test', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (379, 94, N'C. It may be difficult to determine if the test has passed or failed', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (380, 94, N'D. We cannot automate the user inputs', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (381, 95, N'A. This question is difficult to answer', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (382, 95, N'B. The answer depends on the contract with the client, special requirements if any & risks your', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (383, 95, N'organization is willing to take', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (384, 95, N'C. The answer depends on the experience & maturity of your developers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (385, 95, N'D. The answer should be standardized for the software development industry', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (386, 96, N'A. To freeze requirements', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (387, 96, N'B. To understand user needs', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (388, 96, N'C. To define the scope of testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (389, 96, N'D. All of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (390, 97, N'A. Simple Loops', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (391, 97, N'B. Nested Loops', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (392, 97, N'C. Concatenated Loops', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (393, 97, N'D. All of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (394, 98, N'A. White box', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (395, 98, N'B. Black box', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (396, 98, N'C. Green box', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (397, 98, N'D. Yellow box', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (398, 99, N'A. Is unlikely to be completed on schedule', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (399, 99, N'B. Is unlikely to cause a failure', 0)
GO
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (400, 99, N'C. Is likely to be fault-free', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (401, 99, N'D. Is likely to be liked by the users', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (402, 100, N'A. Being diplomatic', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (403, 100, N'B. Able to write software', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (404, 100, N'C. Having good attention to detail', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (405, 100, N'D. Able to be relied on', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (406, 101, N'A. Will always be automated', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (407, 101, N'B. Will help ensure unchanged areas of the software have not been affected', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (408, 101, N'C. Will help ensure changed areas of the software have not been affected', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (409, 101, N'D. Can only be run during user acceptance testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (410, 102, N'A. Interim Test report', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (411, 102, N'B. Final test report', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (412, 102, N'C. Project status report', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (413, 102, N'D. Management report', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (414, 103, N'A. Top-down integration', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (415, 103, N'B. Bottom-up integration', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (416, 103, N'C. None of the above', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (417, 103, N'D. Module integration', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (418, 104, N'A. Checking that we are building the right system', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (419, 104, N'B. Checking that we are building the system right', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (420, 104, N'C. Performed by an independent test team', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (421, 104, N'D. Making sure that it is what the user really wants', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (422, 105, N'A. Re-testing is running a test again; regression testing looks for unexpected side effects', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (423, 105, N'B. Re-testing looks for unexpected side effects; regression testing is repeating those tests', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (424, 105, N'C. Re-testing is done after faults are fixed; regression testing is done earlier', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (425, 105, N'D. Re-testing uses different environments, regression testing uses the same environment', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (426, 105, N'E. Re-testing is done by developers, regression testing is done by independent testers', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (427, 106, N'A. All the planned tests have been run', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (428, 106, N'B. Time has run out', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (429, 106, N'C. All faults have been fixed correctly', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (430, 106, N'D. Both A. and C.', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (431, 106, N'E. I depends on the risks for the system being tested', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (432, 107, N'A. White-box technology', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (433, 107, N'B. Component testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (434, 107, N'C. Black-box technique', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (435, 107, N'D. Data driven testing', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (436, 108, N'A. Status accounting of configuration items', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (437, 108, N'B. Auditing conformance to ISO9001', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (438, 108, N'C. Identification of test versions', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (439, 108, N'D. Record of changes to documentation over time', 0)
INSERT [dbo].[Answer] ([answerID], [questionID], [content], [isAnswer]) VALUES (440, 108, N'E. controlled library access', 0)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'aa', N'1', N'sdas', 1, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'AI', N'Artificial Intelligence', NULL, 3, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'BA', N'Business Administration', NULL, 2, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'CF', N'Computing Fundamental', NULL, 1, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'CH', N'Chinese', NULL, 5, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'CS', N'Computer Science', NULL, 4, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'EN', N'English', NULL, 5, NULL)
INSERT [dbo].[Course] ([courseID], [courseName], [description], [categoryID], [thumbnail]) VALUES (N'ff', N'qwqwer', N'gfhfghfg', 5, N'fghfgh')
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
INSERT [dbo].[ExpertAssign] ([userID], [subjectID]) VALUES (2, N'ACC101')
INSERT [dbo].[ExpertAssign] ([userID], [subjectID]) VALUES (2, N'CHN111')
INSERT [dbo].[ExpertAssign] ([userID], [subjectID]) VALUES (3, N'CSD201')
INSERT [dbo].[ExpertAssign] ([userID], [subjectID]) VALUES (3, N'CEA201')
INSERT [dbo].[ExpertAssign] ([userID], [subjectID]) VALUES (3, N'DBI202')
INSERT [dbo].[ExpertAssign] ([userID], [subjectID]) VALUES (4, N'MAD101')
INSERT [dbo].[ExpertAssign] ([userID], [subjectID]) VALUES (4, N'MAE101')
INSERT [dbo].[ExpertAssign] ([userID], [subjectID]) VALUES (5, N'SSL101')
INSERT [dbo].[ExpertAssign] ([userID], [subjectID]) VALUES (5, N'NWC203')
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (1, N'CHN122', N'dsadasdasd', N'dasdadsad')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (2, N'SSL101', N'You are doing an assignment on media representations of women in business. Where would be a good place to begin your search?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (3, N'SSL101', N'Problem which requires a lot of prior knowledge and such knowledge is domain specific and applies only to that domain is referred to as:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (4, N'SSL101', N'In the course Critical thinking skills for University Success, in academic culture, what is included in the responsibility of students?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (5, N'SSL101', N'Five generally recognized core cultural dimensions are', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (6, N'SSL101', N'Which of these Twitter bios is best?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (7, N'SSL101', N'Which of the following situations would be a breach of academic integrity?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (8, N'SWT301', N'When should configuration management procedures be implemented?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (9, N'SWT301', N'Which of the following are characteristic of regression testing?/i) Regression testing is run ONLY once/ii) Regression testing is used after fixes have been made/iii) Regression testing is often automated/iv) Regression tests need not be maintained/Options:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (10, N'SWT301', N'Which of the problems below BEST characterize a result of software failure?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (11, N'SWT301', N'Which of the following activities should be performed during the selection and implementation of a testing tool?/i) Investigate the organisation''s test process./ii) Conduct a proof of concept./iii) Implement the selected tool on a project behind schedule to save time./iv) Identify coaching and mentoring requirements for the use of the selected tool./Options:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (12, N'SWT301', N'What is the MAIN benefit of designing tests early in the life cycle?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (13, N'SWT301', N'Which of the following benefits are MOST likely to be achieved by using test tools?/i) Easy to access information about tests and testing./ii) Reduced maintenance of testware./iii) Easy and cheap to implement./iv) Greater consistency of tests.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (14, N'SWT301', N'Which of the following can be considered as success factors when deploying a new tool in an organization?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (15, N'SWT301', N'What is the purpose of exit criteria?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (16, N'SWT301', N'Which test design technique relies heavily on prior thorough knowledge of the system?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (17, N'SWT301', N'The ________ and ________ are used within individual workbenches to produce the right output products.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (18, N'SWT301', N'Which aspects of testing will establishing traceability help?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (19, N'SWT301', N'The principle of Cyclomatic complexity, considering L as edges or links, N as nodes, P as independent paths', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (20, N'SWT301', N'FPA is used to', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (21, N'SWT301', N'A _____ is the step-by-step method followed to ensure that standards are met', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (22, N'SWT301', N'Which is not a test Oracle', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (23, N'SWT301', N'PDCA is known as', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (24, N'SWT301', N'Which is the non-functional testing', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (25, N'SWT301', N'Which of the following is a MAJOR test planning task?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (26, N'SWT301', N'Testing where in we subject the target of the test , to varying workloads to measure and evaluate the performance behaviors and ability of the target and of the test to continue to function properly under these different workloads.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (27, N'SWT301', N'Which of the following is the task of a Tester? i. Interaction with the Test Tool Vendor to identify best ways to leverage test tool on the project. ii. Prepare and acquire Test Data iii. Implement Tests on all test levels, execute and log the tests. iv. Create the Test Specifications', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (28, N'SWT301', N'What can static analysis NOT find?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (29, N'SWT301', N'White Box Techniques are also called as:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (30, N'SWT301', N'Reviewing the test Basis is a part of which phase', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (31, N'SWT301', N'Component Testing is also called as :-', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (32, N'SWT301', N'Based on the IEEE Standard for Software Test Documentation (IEEE Std 829-1998), which sections of the test incident report should the following items be recorded?/Sections/a) Test incident report identifier/b) Summary/c) Incident description/d) Impact Items/1. Impact on test plans/2. Unique identifier/3. Anomalies/4. Procedure step/5. Environment/6. References to other relevant documents', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (33, N'SWT301', N'Which of the following is true about Formal Review or Inspection:/i. Led by Trained Moderator (not the author)./ii. No Pre Meeting Preparations/iii. Formal Follow up process./iv. Main Objective is to find defects', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (34, N'SWT301', N'The Phases of formal review process is mentioned below arrange them in the correct order./i. Planning/ii. Review Meeting/iii. Rework/iv. Individual Preparations/v. Kick Off/vi. Follow Up', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (35, N'SWT301', N'Testing activity which is performed to expose defects in the interfaces and in the interaction between integrated components is :', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (36, N'SWT301', N'Methodologies adopted while performing Maintenance Testing:-', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (37, N'SWT301', N'The Switch is switched off once the temperature falls below 18 and then it is turned on when the temperature is more than 21. When the temperature is more than 21. Identify the Equivalance values which belong to the same class.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (38, N'SWT301', N'What is an equivalence partition (also known as an equivalence class)?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (39, N'SWT301', N'Which of the following is not a part of the Test Implementation and Execution Phase', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (40, N'SWT301', N'Link Testing is also called as :', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (41, N'SWT301', N'Who are the persons involved in a Formal Review:/i. Manager/ii. Moderator/iii. Scribe\Recorder/iv. Assistant Manager', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (42, N'SWT301', N'Which of the following statements regarding static testing is false:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (43, N'SWT301', N'Designing the test environment set-up and identifying any required infrastructure and tools are a part of which phase', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (44, N'SWT301', N'A Type of functional Testing, which investigates the functions relating to detection of threats, such as virus from malicious outsiders.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (45, N'SWT301', N'A Person who documents all the issues, problems and open points that were identified during a formal review.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (46, N'SWT301', N'The Test Cases Derived from use cases', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (47, N'SWT301', N'Test Implementation and execution has which of the following major tasks?/i. Developing and prioritizing test cases, creating test data, writing test procedures and optionally preparing the test harnesses and writing automated test scripts./ii. Creating the test suite from the test cases for efficient test execution./iii. Verifying that the test environment has been set up correctly./iv. Determining the exit criteria.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (48, N'SWT301', N'One of the fields on a form contains a text box which accepts numeric values in the range of 18 to 25. Identify the invalid Equivalance class', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (49, N'SWT301', N'Exhaustive Testing is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (50, N'SWT301', N'Which tool needs to interface with other office automation software in order to generate reports in the format required by the organization?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (51, N'SWT301', N'Which one is not comes under international standard', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (52, N'SWT301', N'In which phase static tests are used', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (53, N'SWT301', N'What''s the disadvantage of Black Box Testing', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (54, N'SWT301', N'What is the process of analyzing and removing causes of failures in software?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (55, N'SWT301', N'Majority of system errors occur in the _________ phase', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (56, N'SWT301', N'Which of the following is a MAJOR task when evaluating the exit criteria?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (57, N'SWT301', N'Which of the following are success factors when rolling out a new tool?/I. Roll the tool out to the entire organization to ensure reasonably even coverage./II. Avoid changing existing processes to reduce impact of the tool./0in 0in 0pt" class=MsoBodyText>III. Provide training and mentoring to new users./IV. Allow users to determine where the tool fits into the process best.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (58, N'SWT301', N'As a test leader you are collecting measures about defects. You recognize that after the first test cycle � covering all requirements - subsystem C has a defect density that is 150% higher than the average. Subsystem A on the other hand has a defect density that is 60% lower than the average. What conclusions for the next test cycle could you draw from this fact?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (59, N'SWT301', N'Which of these are objectives for software testing?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (60, N'SWT301', N'Failure is _________', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (61, N'SWT301', N'During the software development process, at what point can the test process start?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (62, N'SWT301', N'"How much testing is enough?"', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (63, N'SWT301', N'Which approaches can help increase the quality of software?/I. Incorporating rigorous testing/II. Preventing change requests/III. Establishing defects metrics/IV. Allocating schedule contingencies', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (64, N'SWT301', N'Features to be tested, approach, item pass / fail criteria and test deliverables should be specified in which document?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (65, N'SWT301', N'What is the difference between component testing and integration testing?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (66, N'SWT301', N'Fault Masking is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (67, N'SWT301', N'Which of the following is not a quality characteristic listed in ISO 9126 Standard?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (68, N'SWT301', N'One Key reason why developers have difficulty testing their own work is :', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (69, N'SWT301', N'Statement Coverage will not check for the following.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (70, N'SWT301', N'Given the Following program:/IF X <>= Z/THEN Statement 2;/END/McCabe� s Cyclomatic Complexity is :', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (71, N'SWT301', N'To test a function, the programmer has to write a _________, which calls the function to be tested and passes it test data.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (72, N'SWT301', N'Pick the best definition of quality ', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (73, N'SWT301', N'Boundary value testing', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (74, N'SWT301', N'An input field takes the year of birth between 1900 and 2004 The boundary values for testing this field are', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (75, N'SWT301', N'How many test cases are necessary to cover all the possible sequences of statements (paths) for the following program fragment:/Assume that the two conditions are independent of each other:/if (Condition 1)/then statement 1/else statement 2/fi/if (Condition 2)/then statement 3/fi', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (76, N'SWT301', N'A common test technique during component test is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (77, N'SWT301', N'In a review meeting a moderator is a person who', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (78, N'SWT301', N'Acceptance test cases are based on what?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (79, N'SWT301', N'Which documents specify features to - be tested, approach, and pass / fail criteria?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (80, N'SWT301', N'Independent Verification & Validation is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (81, N'SWT301', N'Defect Management process does not include', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (82, N'SWT301', N'What is a group of test activities that are organized and managed together?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (83, N'SWT301', N'What is the key difference between (a) contract and regulation acceptance testing, and (b) alpha and beta testing?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (84, N'SWT301', N'Regression testing should be performed:/v) Every week/w) After the software has changed/x) As often as possible/y) When the environment has changed/z) When the project manager says', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (85, N'SWT301', N'During which test activity could faults be found most cost effectively?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (86, N'SWT301', N'What is the difference between testing software developed by contractor outside your country, versus testing software developed by a contractor within your country?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (87, N'SWT301', N'The inputs for developing a test plan are taken from', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (88, N'SWT301', N'Which of the following is not a static testing technique', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (89, N'SWT301', N'Which document specifies the sequence of test executions?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (90, N'SWT301', N'Inspections can find all the following except', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (91, N'SWT301', N'Which of the following is not a characteristic for Testability?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (92, N'SWT301', N'Software testing accounts to what percent of software development costs?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (93, N'SWT301', N'Which tool can be used to support and control part of the test management process?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (94, N'SWT301', N'If an expected result is not specified then:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (95, N'SWT301', N'When should we stop our testing', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (96, N'SWT301', N'The purpose of requirement phase is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (97, N'SWT301', N'Which of these can be successfully tested using Loop Testing methodology?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (98, N'SWT301', N'Cyclomatic Complexity method comes under which testing method.', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (99, N'SWT301', N'A reliable system will be one that:', N'')
GO
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (100, N'SWT301', N'Which, in general, is the least required skill of a good tester?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (101, N'SWT301', N'A regression test:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (102, N'SWT301', N'Function/Test matrix is a type of', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (103, N'SWT301', N'The process starting with the terminal modules is called:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (104, N'SWT301', N'Verification is:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (105, N'SWT301', N'The difference between re-testing and regression testing is', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (106, N'SWT301', N'Testing should be stopped when:', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (107, N'SWT301', N'Which test technique is based on requirements specifications?', N'')
INSERT [dbo].[Question] ([questionID], [subjectID], [content], [explain]) VALUES (108, N'SWT301', N'Which of the following is NOT part of configuration management:', N'')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[Register] ([userID], [courseID]) VALUES (2, N'AI')
INSERT [dbo].[Register] ([userID], [courseID]) VALUES (2, N'CS')
INSERT [dbo].[Register] ([userID], [courseID]) VALUES (3, N'EN')
INSERT [dbo].[Register] ([userID], [courseID]) VALUES (3, N'KO')
INSERT [dbo].[Register] ([userID], [courseID]) VALUES (3, N'CH')
INSERT [dbo].[Register] ([userID], [courseID]) VALUES (4, N'GD')
INSERT [dbo].[Register] ([userID], [courseID]) VALUES (4, N'IT')
INSERT [dbo].[Register] ([userID], [courseID]) VALUES (5, N'JA')
INSERT [dbo].[Register] ([userID], [courseID]) VALUES (5, N'BA')
INSERT [dbo].[Register] ([userID], [courseID]) VALUES (4, N'CF')
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
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'SWT301', N'Software Testing', NULL, N'IT')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [description], [courseID]) VALUES (N'WED201', N'Web Design', NULL, N'CF')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userID], [userName], [password], [fullName], [email], [avatar], [description], [roleID], [status], [registerDay]) VALUES (1, N'admin', N'admin', N'Administrator', N'admin@gmail.com', NULL, NULL, 2, 1, CAST(N'2022-09-28' AS Date))
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
