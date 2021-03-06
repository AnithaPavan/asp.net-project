USE [master]
GO
/****** Object:  Database [ThinkBridge_inventory]    Script Date: 18-04-2021 02:55:33 ******/
CREATE DATABASE [ThinkBridge_inventory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ThinkBridge_inventory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ThinkBridge_inventory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ThinkBridge_inventory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ThinkBridge_inventory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ThinkBridge_inventory] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ThinkBridge_inventory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ThinkBridge_inventory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET ARITHABORT OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ThinkBridge_inventory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ThinkBridge_inventory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ThinkBridge_inventory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ThinkBridge_inventory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ThinkBridge_inventory] SET  MULTI_USER 
GO
ALTER DATABASE [ThinkBridge_inventory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ThinkBridge_inventory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ThinkBridge_inventory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ThinkBridge_inventory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ThinkBridge_inventory] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ThinkBridge_inventory] SET QUERY_STORE = OFF
GO
USE [ThinkBridge_inventory]
GO
/****** Object:  Table [dbo].[ExceptionLogging_Tbl]    Script Date: 18-04-2021 02:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExceptionLogging_Tbl](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[ExceptionMsg] [varchar](max) NULL,
	[ExceptionType] [varchar](max) NULL,
	[ExceptionURL] [varchar](max) NULL,
	[ExceptionSource] [nvarchar](max) NULL,
	[method_name] [varchar](max) NULL,
	[LogDate] [nvarchar](50) NULL,
	[PageName] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory_Table]    Script Date: 18-04-2021 02:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory_Table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QR_code] [nvarchar](50) NULL,
	[Product_name] [nvarchar](50) NULL,
	[Product_description] [nvarchar](max) NULL,
	[Product_price] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[Bought_on] [date] NULL,
	[image_name] [nvarchar](max) NULL,
	[Image_url] [nvarchar](max) NULL,
	[image] [image] NULL,
	[IsActive] [nchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login_Table]    Script Date: 18-04-2021 02:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_Table](
	[UserID] [nvarchar](50) NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Role] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Login_Table] ([UserID], [UserName], [Password], [Role]) VALUES (N'THINK_01', N'AAA', N'123', N'Admin')
USE [master]
GO
ALTER DATABASE [ThinkBridge_inventory] SET  READ_WRITE 
GO
