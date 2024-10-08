USE [master]
GO
/****** Object:  Database [Insurance_Policy]    Script Date: 27-09-2024 02:21:35 ******/
CREATE DATABASE [Insurance_Policy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Insurance_Policy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\Insurance_Policy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Insurance_Policy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\Insurance_Policy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Insurance_Policy] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Insurance_Policy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Insurance_Policy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Insurance_Policy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Insurance_Policy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Insurance_Policy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Insurance_Policy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Insurance_Policy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Insurance_Policy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Insurance_Policy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Insurance_Policy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Insurance_Policy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Insurance_Policy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Insurance_Policy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Insurance_Policy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Insurance_Policy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Insurance_Policy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Insurance_Policy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Insurance_Policy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Insurance_Policy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Insurance_Policy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Insurance_Policy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Insurance_Policy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Insurance_Policy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Insurance_Policy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Insurance_Policy] SET  MULTI_USER 
GO
ALTER DATABASE [Insurance_Policy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Insurance_Policy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Insurance_Policy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Insurance_Policy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Insurance_Policy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Insurance_Policy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Insurance_Policy] SET QUERY_STORE = ON
GO
ALTER DATABASE [Insurance_Policy] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Insurance_Policy]
GO
/****** Object:  Table [dbo].[Endorsement]    Script Date: 27-09-2024 02:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endorsement](
	[EndorsementID] [int] NOT NULL,
	[PolicyID] [int] NULL,
	[EndorsementDetails] [varchar](255) NULL,
	[EndorsementDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EndorsementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 27-09-2024 02:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[PolicyID] [int] NOT NULL,
	[PolicyNumber] [varchar](50) NOT NULL,
	[PolicyHolderName] [varchar](100) NULL,
	[IsRenewal] [bit] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Submission]    Script Date: 27-09-2024 02:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Submission](
	[SubmissionID] [int] NOT NULL,
	[PolicyID] [int] NULL,
	[SubmissionDate] [date] NULL,
	[SubmissionStatus] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Endorsement] ([EndorsementID], [PolicyID], [EndorsementDetails], [EndorsementDate]) VALUES (1, 1, N'Endorsement 1 Details', CAST(N'2024-09-26' AS Date))
INSERT [dbo].[Endorsement] ([EndorsementID], [PolicyID], [EndorsementDetails], [EndorsementDate]) VALUES (2, 2, N'Endorsement 2 Details', CAST(N'2024-09-26' AS Date))
INSERT [dbo].[Endorsement] ([EndorsementID], [PolicyID], [EndorsementDetails], [EndorsementDate]) VALUES (3, 3, N'Endorsement 3 Details', CAST(N'2024-09-26' AS Date))
GO
INSERT [dbo].[Policy] ([PolicyID], [PolicyNumber], [PolicyHolderName], [IsRenewal], [StartDate], [EndDate]) VALUES (1, N'P12345', N'John Doe', 1, CAST(N'2024-09-26' AS Date), CAST(N'2025-09-26' AS Date))
INSERT [dbo].[Policy] ([PolicyID], [PolicyNumber], [PolicyHolderName], [IsRenewal], [StartDate], [EndDate]) VALUES (2, N'P12346', N'Tom Cruise', 0, CAST(N'2024-09-26' AS Date), CAST(N'2025-09-26' AS Date))
INSERT [dbo].[Policy] ([PolicyID], [PolicyNumber], [PolicyHolderName], [IsRenewal], [StartDate], [EndDate]) VALUES (3, N'P12347', N'Glen Mac', 1, CAST(N'2024-09-26' AS Date), CAST(N'2025-09-26' AS Date))
GO
INSERT [dbo].[Submission] ([SubmissionID], [PolicyID], [SubmissionDate], [SubmissionStatus]) VALUES (1, 1, CAST(N'2024-09-26' AS Date), N'Submitted')
INSERT [dbo].[Submission] ([SubmissionID], [PolicyID], [SubmissionDate], [SubmissionStatus]) VALUES (2, 2, CAST(N'2024-09-26' AS Date), N'Renewal')
INSERT [dbo].[Submission] ([SubmissionID], [PolicyID], [SubmissionDate], [SubmissionStatus]) VALUES (3, 3, CAST(N'2024-09-26' AS Date), N'Issue')
GO
USE [master]
GO
ALTER DATABASE [Insurance_Policy] SET  READ_WRITE 
GO
