USE [master]

GO
/****** Object:  Database [JOBAPPLICATIONAGENCY]    Script Date: 12/24/2018 6:27:41 PM ******/
CREATE DATABASE [JOBAPPLICATIONAGENCY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JOBAPPLICATIONAGENCY', FILENAME = N'Z:\JOBAPPLICATIONAGENCY.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JOBAPPLICATIONAGENCY_log', FILENAME = N'Z:\JOBAPPLICATIONAGENCY_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JOBAPPLICATIONAGENCY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET ARITHABORT OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET RECOVERY FULL 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET  MULTI_USER 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JOBAPPLICATIONAGENCY', N'ON'
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET QUERY_STORE = OFF
GO
USE [JOBAPPLICATIONAGENCY]
GO
/****** Object:  Table [dbo].[AGENCY]    Script Date: 12/24/2018 6:27:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AGENCY](
	[AgentID] [int] NOT NULL,
	[AgentFName] [varchar](45) NOT NULL,
	[AgentLName] [varchar](45) NOT NULL,
	[AgentStreet] [varchar](45) NOT NULL,
	[AgentCity] [varchar](10) NOT NULL,
	[AgentState] [varchar](2) NOT NULL,
	[AgentZip] [int] NOT NULL,
	[AgentEmail] [varchar](45) NOT NULL,
	[AgentSalary] [decimal](7, 2) NOT NULL,
	[AgentDOB] [date] NOT NULL,
	[AgentHireDate] [date] NOT NULL,
 CONSTRAINT [PK_AGENCY] PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APPLICANT]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPLICANT](
	[ApplicantID] [int] NOT NULL,
	[AFName] [varchar](30) NOT NULL,
	[ALName] [varchar](40) NOT NULL,
	[Street] [varchar](45) NOT NULL,
	[City] [varchar](10) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[Zip] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNum] [int] NOT NULL,
 CONSTRAINT [PK_APPLICANT] PRIMARY KEY CLUSTERED 
(
	[ApplicantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APPLICANTSKILLS]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPLICANTSKILLS](
	[SkillID] [int] NOT NULL,
	[ApplicantID] [int] NOT NULL,
	[YearsExperince] [int] NOT NULL,
 CONSTRAINT [PK_APPLICANTSKILLS] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC,
	[ApplicantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APPLICATION]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPLICATION](
	[ApplicationID] [int] NOT NULL,
	[ApplicantID] [int] NOT NULL,
	[JobPosting] [int] NOT NULL,
	[DatePosted] [date] NOT NULL,
	[PreferredWSalary] [decimal](7, 2) NOT NULL,
	[WasHired] [date] NOT NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_APPLICATION] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APPLIEDJOBS]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPLIEDJOBS](
	[JobPostingID] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
 CONSTRAINT [PK_APPLIEDJOBS] PRIMARY KEY CLUSTERED 
(
	[JobPostingID] ASC,
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPANY]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPANY](
	[CompanyID] [int] NOT NULL,
	[CompanyName] [varchar](45) NOT NULL,
	[CompanyStreet] [varchar](35) NOT NULL,
	[CompanyCity] [varchar](10) NOT NULL,
	[CompanyState] [varchar](2) NOT NULL,
	[CompanyZip] [int] NOT NULL,
	[CompanyPhone] [int] NOT NULL,
	[CompanyContactName] [varchar](45) NOT NULL,
	[CompanyEmail] [varchar](45) NOT NULL,
 CONSTRAINT [PK_COMPANY] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEGREE]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEGREE](
	[DegreeID] [int] NOT NULL,
	[DegreeType] [varchar](45) NOT NULL,
	[Concentration] [varchar](45) NOT NULL,
 CONSTRAINT [PK_DEGREE] PRIMARY KEY CLUSTERED 
(
	[DegreeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EARNEDDEGREE]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EARNEDDEGREE](
	[ApplicantID] [int] NOT NULL,
	[DegreeID] [int] NOT NULL,
	[DateEarned] [date] NOT NULL,
	[Institution] [varchar](45) NOT NULL,
 CONSTRAINT [PK_EARNEDDEGREE] PRIMARY KEY CLUSTERED 
(
	[ApplicantID] ASC,
	[DegreeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOB]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOB](
	[JobID] [int] NOT NULL,
	[JobDescription] [varchar](45) NOT NULL,
CONSTRAINT [PK_JOB] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOBPOSTING]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOBPOSTING](
	[JobPostingID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[JobType] [varchar](10) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[SalaryRate] [decimal](7, 2) NOT NULL,
 CONSTRAINT [PK_JOBPOSTING] PRIMARY KEY CLUSTERED 
(
	[JobPostingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REQUIREDSKILL]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REQUIREDSKILL](
	[JobPostingID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
	[DegreeID] [int] NOT NULL,

 CONSTRAINT [PK_REQUIREDSKILL] PRIMARY KEY CLUSTERED 
(
	[JobPostingID] ASC,
	[SkillID] ASC,
	[DegreeID] ASC
	
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SKILLS]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SKILLS](
	[SkillID] [int] NOT NULL,
	[SkillDescription] [varchar](45) NOT NULL,
 CONSTRAINT [PK_SKILLS] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORKEXPERIENCE]    Script Date: 12/24/2018 6:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKEXPERIENCE](
	[ApplicantID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[YearsEmployed] [int] NOT NULL,
 CONSTRAINT [PK_WORKEXPERIENCE] PRIMARY KEY CLUSTERED 
(
	[ApplicantID] ASC,
	[JobID] ASC,
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AGENCY] ([AgentID], [AgentFName], [AgentLName], [AgentStreet], [AgentCity], [AgentState], [AgentZip], [AgentEmail], [AgentSalary], [AgentDOB], [AgentHireDate]) VALUES (1, N'Emir', N'Ozkara', N'210 fulton street', N'brooklyn', N'ny', 11209, N'emir@gmail.com', CAST(65000.00 AS Decimal(7, 2)), CAST(N'1993-03-05' AS Date), CAST(N'2017-05-08' AS Date))
INSERT [dbo].[AGENCY] ([AgentID], [AgentFName], [AgentLName], [AgentStreet], [AgentCity], [AgentState], [AgentZip], [AgentEmail], [AgentSalary], [AgentDOB], [AgentHireDate]) VALUES (2, N'john', N'karas', N'485th street', N'brooklyn', N'ny', 11210, N'jk@gmail.com', CAST(75000.00 AS Decimal(7, 2)), CAST(N'1990-05-03' AS Date), CAST(N'2010-10-05' AS Date))
INSERT [dbo].[AGENCY] ([AgentID], [AgentFName], [AgentLName], [AgentStreet], [AgentCity], [AgentState], [AgentZip], [AgentEmail], [AgentSalary], [AgentDOB], [AgentHireDate]) VALUES (3, N'salim', N'atmaca', N'12 Bowl street', N'brooklyn', N'ny', 11214, N'salim@gmail.com', CAST(20000.00 AS Decimal(7, 2)), CAST(N'1956-05-03' AS Date), CAST(N'2005-12-05' AS Date))
INSERT [dbo].[AGENCY] ([AgentID], [AgentFName], [AgentLName], [AgentStreet], [AgentCity], [AgentState], [AgentZip], [AgentEmail], [AgentSalary], [AgentDOB], [AgentHireDate]) VALUES (4, N'sumeyra', N'ozgur', N'480 8th street', N'brooklyn', N'ny', 11232, N'sozgur@gmail.com', CAST(95000.00 AS Decimal(7, 2)), CAST(N'1978-05-03' AS Date), CAST(N'2001-12-12' AS Date))
INSERT [dbo].[AGENCY] ([AgentID], [AgentFName], [AgentLName], [AgentStreet], [AgentCity], [AgentState], [AgentZip], [AgentEmail], [AgentSalary], [AgentDOB], [AgentHireDate]) VALUES (5, N'emre', N'tekin', N'12 bulbery street', N'brooklyn', N'ny', 11000, N'etekin@gmail.com', CAST(90000.00 AS Decimal(7, 2)), CAST(N'1966-12-03' AS Date), CAST(N'2006-01-01' AS Date))
INSERT [dbo].[APPLICANT] ([ApplicantID], [AFName], [ALName], [Street], [City], [State], [Zip], [Email], [PhoneNum]) VALUES (100, N'necdet', N'goksu', N'857 holly', N'bronx', N'ny', 14586, N'ngoksu@gmail.com', 6465856)
INSERT [dbo].[APPLICANT] ([ApplicantID], [AFName], [ALName], [Street], [City], [State], [Zip], [Email], [PhoneNum]) VALUES (101, N'mehmet', N'nuyur', N'56 yum street', N'brooklyn', N'ny', 12586, N'mn@gmail.com', 929646585)
INSERT [dbo].[APPLICANT] ([ApplicantID], [AFName], [ALName], [Street], [City], [State], [Zip], [Email], [PhoneNum]) VALUES (102, N'karen', N'clock', N'12 farazi street', N'brooklyn', N'ny', 12500, N'kclock@gmail.com', 12345678)
INSERT [dbo].[APPLICANT] ([ApplicantID], [AFName], [ALName], [Street], [City], [State], [Zip], [Email], [PhoneNum]) VALUES (103, N'chana', N'ockier', N'45 ulu street', N'brooklyn', N'ny', 12520, N'cok@gmail.com', 98765432)
INSERT [dbo].[APPLICANT] ([ApplicantID], [AFName], [ALName], [Street], [City], [State], [Zip], [Email], [PhoneNum]) VALUES (104, N'barrack', N'lolo', N'476 67th street', N'newyork', N'ny', 10520, N'barrack@gmail.com', 56432156)
INSERT [dbo].[APPLICANTSKILLS] ([SkillID], [ApplicantID], [YearsExperince]) VALUES (200, 100, 3)
INSERT [dbo].[APPLICANTSKILLS] ([SkillID], [ApplicantID], [YearsExperince]) VALUES (201, 101, 4)
INSERT [dbo].[APPLICANTSKILLS] ([SkillID], [ApplicantID], [YearsExperince]) VALUES (202, 102, 1)
INSERT [dbo].[APPLICANTSKILLS] ([SkillID], [ApplicantID], [YearsExperince]) VALUES (203, 103, 2)
INSERT [dbo].[APPLICANTSKILLS] ([SkillID], [ApplicantID], [YearsExperince]) VALUES (204, 104, 5)
INSERT [dbo].[APPLICANTSKILLS] ([SkillID], [ApplicantID], [YearsExperince]) VALUES (205, 102, 2)
INSERT [dbo].[APPLICANTSKILLS] ([SkillID], [ApplicantID], [YearsExperince]) VALUES (206, 101, 3)
INSERT [dbo].[APPLICATION] ([ApplicationID], [ApplicantID], [JobPosting], [DatePosted], [PreferredWSalary], [WasHired], [AgentID]) VALUES (10, 100, 1000, CAST(N'2018-05-03' AS Date), CAST(1500.00 AS Decimal(7, 2)), CAST(N'2018-06-04' AS Date), 1)
INSERT [dbo].[APPLICATION] ([ApplicationID], [ApplicantID], [JobPosting], [DatePosted], [PreferredWSalary], [WasHired], [AgentID]) VALUES (11, 100, 1000, CAST(N'2018-01-03' AS Date), CAST(900.00 AS Decimal(7, 2)), CAST(N'2018-06-04' AS Date), 1)
INSERT [dbo].[APPLICATION] ([ApplicationID], [ApplicantID], [JobPosting], [DatePosted], [PreferredWSalary], [WasHired], [AgentID]) VALUES (12, 101, 1001, CAST(N'2018-01-01' AS Date), CAST(1500.00 AS Decimal(7, 2)), CAST(N'2018-02-04' AS Date), 2)
INSERT [dbo].[APPLICATION] ([ApplicationID], [ApplicantID], [JobPosting], [DatePosted], [PreferredWSalary], [WasHired], [AgentID]) VALUES (13, 101, 1002, CAST(N'2017-11-11' AS Date), CAST(1200.00 AS Decimal(7, 2)), CAST(N'2018-01-01' AS Date), 3)
INSERT [dbo].[APPLICATION] ([ApplicationID], [ApplicantID], [JobPosting], [DatePosted], [PreferredWSalary], [WasHired], [AgentID]) VALUES (14, 102, 1003, CAST(N'2017-10-11' AS Date), CAST(1200.00 AS Decimal(7, 2)), CAST(N'2018-09-01' AS Date), 4)
INSERT [dbo].[APPLIEDJOBS] ([JobPostingID], [ApplicationID]) VALUES (50, 10)
INSERT [dbo].[APPLIEDJOBS] ([JobPostingID], [ApplicationID]) VALUES (51, 13)
INSERT [dbo].[APPLIEDJOBS] ([JobPostingID], [ApplicationID]) VALUES (51, 14)
INSERT [dbo].[APPLIEDJOBS] ([JobPostingID], [ApplicationID]) VALUES (52, 10)
INSERT [dbo].[APPLIEDJOBS] ([JobPostingID], [ApplicationID]) VALUES (52, 12)
INSERT [dbo].[APPLIEDJOBS] ([JobPostingID], [ApplicationID]) VALUES (53, 11)
INSERT [dbo].[APPLIEDJOBS] ([JobPostingID], [ApplicationID]) VALUES (53, 13)
INSERT [dbo].[APPLIEDJOBS] ([JobPostingID], [ApplicationID]) VALUES (54, 12)
INSERT [dbo].[APPLIEDJOBS] ([JobPostingID], [ApplicationID]) VALUES (55, 11)
INSERT [dbo].[APPLIEDJOBS] ([JobPostingID], [ApplicationID]) VALUES (56, 14)
INSERT [dbo].[COMPANY] ([CompanyID], [CompanyName], [CompanyStreet], [CompanyCity], [CompanyState], [CompanyZip], [CompanyPhone], [CompanyContactName], [CompanyEmail]) VALUES (30, N'Creative Solution INC', N'1 mark way', N'newyork', N'ny', 11205, 58269347, N'Linda Marks', N'CS@gmail.com')
INSERT [dbo].[COMPANY] ([CompanyID], [CompanyName], [CompanyStreet], [CompanyCity], [CompanyState], [CompanyZip], [CompanyPhone], [CompanyContactName], [CompanyEmail]) VALUES (31, N'Apple INC', N'56 lolo street', N'brooklyn', N'ny', 11345, 34569347, N'janet Tarks', N'apple@gmail.com')
INSERT [dbo].[COMPANY] ([CompanyID], [CompanyName], [CompanyStreet], [CompanyCity], [CompanyState], [CompanyZip], [CompanyPhone], [CompanyContactName], [CompanyEmail]) VALUES (32, N'business solution INC', N'55 kol street', N'brooklyn', N'ny', 16644, 52353347, N'malam atakan', N'bS@gmail.com')
INSERT [dbo].[COMPANY] ([CompanyID], [CompanyName], [CompanyStreet], [CompanyCity], [CompanyState], [CompanyZip], [CompanyPhone], [CompanyContactName], [CompanyEmail]) VALUES (33, N'orange INC', N'44 gluten street', N'newyork', N'ny', 13464, 12349347, N'Donald reks', N'orange@gmail.com')
INSERT [dbo].[COMPANY] ([CompanyID], [CompanyName], [CompanyStreet], [CompanyCity], [CompanyState], [CompanyZip], [CompanyPhone], [CompanyContactName], [CompanyEmail]) VALUES (34, N'tech world INC', N'34 free street', N'bronx', N'ny', 16434, 98739347, N'Susan hres', N'twS@gmail.com')
INSERT [dbo].[COMPANY] ([CompanyID], [CompanyName], [CompanyStreet], [CompanyCity], [CompanyState], [CompanyZip], [CompanyPhone], [CompanyContactName], [CompanyEmail]) VALUES (35, N'first tech INC', N'11 fulton place', N'bronx', N'ny', 17654, 32459347, N'michelle otom', N'ft@gmail.com')
INSERT [dbo].[DEGREE] ([DegreeID], [DegreeType], [Concentration]) VALUES (10000, N'master', N'database')
INSERT [dbo].[DEGREE] ([DegreeID], [DegreeType], [Concentration]) VALUES (10001, N'association', N'computer sience')
INSERT [dbo].[DEGREE] ([DegreeID], [DegreeType], [Concentration]) VALUES (10002, N'association', N'business management')
INSERT [dbo].[DEGREE] ([DegreeID], [DegreeType], [Concentration]) VALUES (10003, N'association', N'project management')
INSERT [dbo].[DEGREE] ([DegreeID], [DegreeType], [Concentration]) VALUES (10004, N'bachelor', N'information technology')
INSERT [dbo].[DEGREE] ([DegreeID], [DegreeType], [Concentration]) VALUES (10005, N'bachelor', N'accounting')
INSERT [dbo].[EARNEDDEGREE] ([ApplicantID], [DegreeID], [DateEarned], [Institution]) VALUES (100, 10000, CAST(N'2009-12-11' AS Date), N'Touro College')
INSERT [dbo].[EARNEDDEGREE] ([ApplicantID], [DegreeID], [DateEarned], [Institution]) VALUES (101, 10001, CAST(N'2006-06-11' AS Date), N'Baruch College')
INSERT [dbo].[EARNEDDEGREE] ([ApplicantID], [DegreeID], [DateEarned], [Institution]) VALUES (102, 10002, CAST(N'2007-06-11' AS Date), N'Laguardia College')
INSERT [dbo].[EARNEDDEGREE] ([ApplicantID], [DegreeID], [DateEarned], [Institution]) VALUES (103, 10003, CAST(N'2011-06-02' AS Date), N'Laguardia College')
INSERT [dbo].[EARNEDDEGREE] ([ApplicantID], [DegreeID], [DateEarned], [Institution]) VALUES (104, 10005, CAST(N'2001-06-02' AS Date), N'Brooklyn College')
INSERT [dbo].[JOB] ([JobID], [JobDescription]) VALUES (20, N'accountant')
INSERT [dbo].[JOB] ([JobID], [JobDescription]) VALUES (21, N'DBA')
INSERT [dbo].[JOB] ([JobID], [JobDescription]) VALUES (22, N'Programmer')
INSERT [dbo].[JOB] ([JobID], [JobDescription]) VALUES (23, N'ProjectManager')
INSERT [dbo].[JOB] ([JobID], [JobDescription]) VALUES (24, N'Financial Analyst')
INSERT [dbo].[JOB] ([JobID], [JobDescription]) VALUES (25, N'Data Analyst')
INSERT [dbo].[JOBPOSTING] ([JobPostingID], [JobID],[JobType] ,[CompanyID], [SalaryRate]) VALUES (50, 20,'Full Time', 30, CAST(65000.00 AS Decimal(7, 2)))
INSERT [dbo].[JOBPOSTING] ([JobPostingID], [JobID],[JobType] ,[CompanyID], [SalaryRate]) VALUES (51, 21,'Part Time', 31, CAST(34000.00 AS Decimal(7, 2)))
INSERT [dbo].[JOBPOSTING] ([JobPostingID], [JobID],[JobType] ,[CompanyID], [SalaryRate]) VALUES (52, 22,'Full Time', 33, CAST(55000.00 AS Decimal(7, 2)))
INSERT [dbo].[JOBPOSTING] ([JobPostingID], [JobID],[JobType] ,[CompanyID], [SalaryRate]) VALUES (53, 23,'Full Time', 32, CAST(44400.00 AS Decimal(7, 2)))
INSERT [dbo].[JOBPOSTING] ([JobPostingID], [JobID],[JobType] ,[CompanyID], [SalaryRate]) VALUES (54, 24,'Part Time', 35, CAST(98700.00 AS Decimal(7, 2)))
INSERT [dbo].[JOBPOSTING] ([JobPostingID], [JobID],[JobType] ,[CompanyID], [SalaryRate]) VALUES (55, 25,'Part Time', 34, CAST(78900.00 AS Decimal(7, 2)))
INSERT [dbo].[JOBPOSTING] ([JobPostingID], [JobID],[JobType] ,[CompanyID], [SalaryRate]) VALUES (56, 22,'Part Time', 31, CAST(77700.00 AS Decimal(7, 2)))
INSERT [dbo].[JOBPOSTING] ([JobPostingID], [JobID],[JobType] ,[CompanyID], [SalaryRate]) VALUES (57, 22,'Full Time', 31, CAST(77700.00 AS Decimal(7, 2)))
INSERT [dbo].[JOBPOSTING] ([JobPostingID], [JobID],[JobType] ,[CompanyID], [SalaryRate]) VALUES (58, 23,'Full Time', 32, CAST(77700.00 AS Decimal(7, 2)))
INSERT [dbo].[REQUIREDSKILL] ([JobPostingID], [SkillID],[DegreeID]) VALUES (50, 200,10000)
INSERT [dbo].[REQUIREDSKILL] ([JobPostingID], [SkillID],[DegreeID]) VALUES (51, 201,10000)
INSERT [dbo].[REQUIREDSKILL] ([JobPostingID], [SkillID],[DegreeID]) VALUES (51, 205,10001)
INSERT [dbo].[REQUIREDSKILL] ([JobPostingID], [SkillID],[DegreeID]) VALUES (52, 202,10002)
INSERT [dbo].[REQUIREDSKILL] ([JobPostingID], [SkillID],[DegreeID]) VALUES (52, 204,10003)
INSERT [dbo].[REQUIREDSKILL] ([JobPostingID], [SkillID],[DegreeID]) VALUES (53, 203,10004)
INSERT [dbo].[REQUIREDSKILL] ([JobPostingID], [SkillID],[DegreeID]) VALUES (53, 204,10005)
INSERT [dbo].[REQUIREDSKILL] ([JobPostingID], [SkillID],[DegreeID]) VALUES (54, 204,10000)
INSERT [dbo].[REQUIREDSKILL] ([JobPostingID], [SkillID],[DegreeID]) VALUES (55, 205,10002)
INSERT [dbo].[REQUIREDSKILL] ([JobPostingID], [SkillID],[DegreeID]) VALUES (56, 206,10003)
INSERT [dbo].[SKILLS] ([SkillID], [SkillDescription]) VALUES (200, N'sql')
INSERT [dbo].[SKILLS] ([SkillID], [SkillDescription]) VALUES (201, N'MYsql')
INSERT [dbo].[SKILLS] ([SkillID], [SkillDescription]) VALUES (202, N'Java')
INSERT [dbo].[SKILLS] ([SkillID], [SkillDescription]) VALUES (203, N'Access')
INSERT [dbo].[SKILLS] ([SkillID], [SkillDescription]) VALUES (204, N'Excel')
INSERT [dbo].[SKILLS] ([SkillID], [SkillDescription]) VALUES (205, N'Sage')
INSERT [dbo].[SKILLS] ([SkillID], [SkillDescription]) VALUES (206, N'QuickBox')
INSERT [dbo].[WORKEXPERIENCE] ([ApplicantID], [JobID], [CompanyID], [YearsEmployed]) VALUES (100, 20, 30, 5)
INSERT [dbo].[WORKEXPERIENCE] ([ApplicantID], [JobID], [CompanyID], [YearsEmployed]) VALUES (101, 20, 31, 5)
INSERT [dbo].[WORKEXPERIENCE] ([ApplicantID], [JobID], [CompanyID], [YearsEmployed]) VALUES (101, 23, 31, 1)
INSERT [dbo].[WORKEXPERIENCE] ([ApplicantID], [JobID], [CompanyID], [YearsEmployed]) VALUES (102, 21, 32, 3)
INSERT [dbo].[WORKEXPERIENCE] ([ApplicantID], [JobID], [CompanyID], [YearsEmployed]) VALUES (103, 22, 33, 7)
INSERT [dbo].[WORKEXPERIENCE] ([ApplicantID], [JobID], [CompanyID], [YearsEmployed]) VALUES (104, 24, 34, 2)
ALTER TABLE [dbo].[APPLICANTSKILLS]  WITH CHECK ADD  CONSTRAINT [FK_APPLICANTSKILLS_APPLICANT] FOREIGN KEY([ApplicantID])
REFERENCES [dbo].[APPLICANT] ([ApplicantID])
GO
ALTER TABLE [dbo].[APPLICANTSKILLS] CHECK CONSTRAINT [FK_APPLICANTSKILLS_APPLICANT]
GO
ALTER TABLE [dbo].[APPLICANTSKILLS]  WITH CHECK ADD  CONSTRAINT [FK_APPLICANTSKILLS_SKILLS] FOREIGN KEY([SkillID])
REFERENCES [dbo].[SKILLS] ([SkillID])
GO
ALTER TABLE [dbo].[APPLICANTSKILLS] CHECK CONSTRAINT [FK_APPLICANTSKILLS_SKILLS]
GO
ALTER TABLE [dbo].[APPLICATION]  WITH CHECK ADD  CONSTRAINT [FK_APPLICATION_AGENCY] FOREIGN KEY([AgentID])
REFERENCES [dbo].[AGENCY] ([AgentID])
GO
ALTER TABLE [dbo].[APPLICATION] CHECK CONSTRAINT [FK_APPLICATION_AGENCY]
GO
ALTER TABLE [dbo].[APPLICATION]  WITH CHECK ADD  CONSTRAINT [FK_APPLICATION_APPLICANT] FOREIGN KEY([ApplicantID])
REFERENCES [dbo].[APPLICANT] ([ApplicantID])
GO
ALTER TABLE [dbo].[APPLICATION] CHECK CONSTRAINT [FK_APPLICATION_APPLICANT]
GO
ALTER TABLE [dbo].[APPLIEDJOBS]  WITH CHECK ADD  CONSTRAINT [FK_APPLIEDJOBS_APPLICATION] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[APPLICATION] ([ApplicationID])
GO
ALTER TABLE [dbo].[APPLIEDJOBS] CHECK CONSTRAINT [FK_APPLIEDJOBS_APPLICATION]
GO
ALTER TABLE [dbo].[APPLIEDJOBS]  WITH CHECK ADD  CONSTRAINT [FK_APPLIEDJOBS_JOBPOSTING] FOREIGN KEY([JobPostingID])
REFERENCES [dbo].[JOBPOSTING] ([JobPostingID])
GO
ALTER TABLE [dbo].[APPLIEDJOBS] CHECK CONSTRAINT [FK_APPLIEDJOBS_JOBPOSTING]
GO
ALTER TABLE [dbo].[EARNEDDEGREE]  WITH CHECK ADD  CONSTRAINT [FK_EARNEDDEGREE_APPLICANT] FOREIGN KEY([ApplicantID])
REFERENCES [dbo].[APPLICANT] ([ApplicantID])
GO
ALTER TABLE [dbo].[EARNEDDEGREE] CHECK CONSTRAINT [FK_EARNEDDEGREE_APPLICANT]
GO
ALTER TABLE [dbo].[EARNEDDEGREE]  WITH CHECK ADD  CONSTRAINT [FK_EARNEDDEGREE_DEGREE] FOREIGN KEY([DegreeID])
REFERENCES [dbo].[DEGREE] ([DegreeID])
GO
ALTER TABLE [dbo].[EARNEDDEGREE] CHECK CONSTRAINT [FK_EARNEDDEGREE_DEGREE]
GO
ALTER TABLE [dbo].[JOBPOSTING]  WITH CHECK ADD  CONSTRAINT [FK_JOBPOSTING_COMPANY] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[COMPANY] ([CompanyID])
GO
ALTER TABLE [dbo].[JOBPOSTING] CHECK CONSTRAINT [FK_JOBPOSTING_COMPANY]
GO
ALTER TABLE [dbo].[JOBPOSTING]  WITH CHECK ADD  CONSTRAINT [FK_JOBPOSTING_JOB] FOREIGN KEY([JobID])
REFERENCES [dbo].[JOB] ([JobID])
GO
ALTER TABLE [dbo].[JOBPOSTING] CHECK CONSTRAINT [FK_JOBPOSTING_JOB]
GO
ALTER TABLE [dbo].[REQUIREDSKILL]  WITH CHECK ADD  CONSTRAINT [FK_REQUIREDSKILL_JOBPOSTING] FOREIGN KEY([JobPostingID])
REFERENCES [dbo].[JOBPOSTING] ([JobPostingID])
GO
ALTER TABLE [dbo].[REQUIREDSKILL] CHECK CONSTRAINT [FK_REQUIREDSKILL_JOBPOSTING]
GO
ALTER TABLE [dbo].[REQUIREDSKILL]  WITH CHECK ADD  CONSTRAINT [FK_REQUIREDSKILL_SKILLS] FOREIGN KEY([SkillID])
REFERENCES [dbo].[SKILLS] ([SkillID])
GO
ALTER TABLE [dbo].[REQUIREDSKILL] CHECK CONSTRAINT [FK_REQUIREDSKILL_SKILLS]
GO
ALTER TABLE [dbo].[REQUIREDSKILL]  WITH CHECK ADD  CONSTRAINT [FK_REQUIREDSKILL_DEGREE] FOREIGN KEY([DegreeID])
REFERENCES [dbo].[DEGREE] ([DegreeID])
GO
ALTER TABLE [dbo].[REQUIREDSKILL] CHECK CONSTRAINT [FK_REQUIREDSKILL_DEGREE]
GO
ALTER TABLE [dbo].[WORKEXPERIENCE]  WITH CHECK ADD  CONSTRAINT [FK_WORKEXPERIENCE_APPLICANT] FOREIGN KEY([ApplicantID])
REFERENCES [dbo].[APPLICANT] ([ApplicantID])
GO
ALTER TABLE [dbo].[WORKEXPERIENCE] CHECK CONSTRAINT [FK_WORKEXPERIENCE_APPLICANT]
GO
ALTER TABLE [dbo].[WORKEXPERIENCE]  WITH CHECK ADD  CONSTRAINT [FK_WORKEXPERIENCE_COMPANY] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[COMPANY] ([CompanyID])
GO
ALTER TABLE [dbo].[WORKEXPERIENCE] CHECK CONSTRAINT [FK_WORKEXPERIENCE_COMPANY]
GO
ALTER TABLE [dbo].[WORKEXPERIENCE]  WITH CHECK ADD  CONSTRAINT [FK_WORKEXPERIENCE_JOB] FOREIGN KEY([JobID])
REFERENCES [dbo].[JOB] ([JobID])
GO
ALTER TABLE [dbo].[WORKEXPERIENCE] CHECK CONSTRAINT [FK_WORKEXPERIENCE_JOB]
GO
ALTER TABLE [dbo].[AGENCY]  WITH CHECK ADD  CONSTRAINT [CK_AGENCY] CHECK  ((datediff(year,[AgentDOB],[AgentHireDate])>=(18)))
GO
ALTER TABLE [dbo].[AGENCY] CHECK CONSTRAINT [CK_AGENCY]
GO
ALTER TABLE [dbo].[APPLICATION]  WITH CHECK ADD  CONSTRAINT [CK_APPLICATION] CHECK  (([PreferredWsalary]>=(700) AND [PreferredWsalary]<=(9000)))
GO
ALTER TABLE [dbo].[APPLICATION] CHECK CONSTRAINT [CK_APPLICATION]
GO
USE [master]
GO
ALTER DATABASE [JOBAPPLICATIONAGENCY] SET  READ_WRITE 
GO
