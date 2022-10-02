USE [master]
GO
/****** Object:  Database [QuizPractiseDB_Demo]    Script Date: 10/2/2022 4:44:00 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 10/2/2022 4:44:00 PM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 10/2/2022 4:44:00 PM ******/
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
/****** Object:  Table [dbo].[CourseCategory]    Script Date: 10/2/2022 4:44:00 PM ******/
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
/****** Object:  Table [dbo].[ExpertAssign]    Script Date: 10/2/2022 4:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpertAssign](
	[userID] [int] NOT NULL,
	[subjectID] [nchar](6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteSubject]    Script Date: 10/2/2022 4:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteSubject](
	[userID] [int] NOT NULL,
	[subjectID] [nchar](6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 10/2/2022 4:44:00 PM ******/
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
/****** Object:  Table [dbo].[Quiz]    Script Date: 10/2/2022 4:44:00 PM ******/
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
/****** Object:  Table [dbo].[QuizHistory]    Script Date: 10/2/2022 4:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizHistory](
	[quizID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
	[userAnswer] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 10/2/2022 4:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[userID] [int] NOT NULL,
	[courseID] [nchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleName]    Script Date: 10/2/2022 4:44:00 PM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 10/2/2022 4:44:00 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 10/2/2022 4:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[avatar] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[roleID] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[registerDay] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
