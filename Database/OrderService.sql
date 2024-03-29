USE [master]
GO
/****** Object:  Database [ORDER_SERVICE]    Script Date: 9/27/2022 11:40:18 PM ******/
CREATE DATABASE [ORDER_SERVICE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ORDER_SERVICE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ORDER_SERVICE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ORDER_SERVICE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ORDER_SERVICE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ORDER_SERVICE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ORDER_SERVICE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ORDER_SERVICE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET ARITHABORT OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ORDER_SERVICE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ORDER_SERVICE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ORDER_SERVICE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ORDER_SERVICE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET RECOVERY FULL 
GO
ALTER DATABASE [ORDER_SERVICE] SET  MULTI_USER 
GO
ALTER DATABASE [ORDER_SERVICE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ORDER_SERVICE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ORDER_SERVICE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ORDER_SERVICE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ORDER_SERVICE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ORDER_SERVICE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ORDER_SERVICE', N'ON'
GO
ALTER DATABASE [ORDER_SERVICE] SET QUERY_STORE = OFF
GO
USE [ORDER_SERVICE]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[transactionID] [int] NOT NULL,
	[idFlower] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[amount] [decimal](15, 0) NOT NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	[isCanceled] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
	[detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCart]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[idFlower] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[amount] [decimal](15, 0) NOT NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	[isOrdered] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ShopCart_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[recipientName] [nvarchar](50) NOT NULL,
	[recipientEmail] [varchar](50) NOT NULL,
	[recipientPhone] [varchar](10) NOT NULL,
	[recipientAddress] [nvarchar](max) NOT NULL,
	[amount] [decimal](15, 0) NOT NULL,
	[message] [nvarchar](max) NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	[status] [bit] NOT NULL,
	[note] [nvarchar](max) NULL,
	[isCanceled] [bit] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	[isDeleted] [bit] NOT NULL,
	[idRole] [int] NOT NULL,
	[loyaltyPoint] [decimal](15, 0) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (1, 1, 8, 5, CAST(255000 AS Decimal(15, 0)), CAST(N'2022-09-10T09:36:41.697' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (2, 1, 6, 3, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T09:36:41.697' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (3, 1, 1, 20, CAST(120000 AS Decimal(15, 0)), CAST(N'2022-09-10T09:36:41.697' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (4, 2, 12, 10, CAST(7500 AS Decimal(15, 0)), CAST(N'2022-09-10T10:07:38.033' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (5, 2, 8, 2, CAST(255000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:07:38.037' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (6, 2, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:07:38.037' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (7, 2, 1, 1, CAST(120000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:07:38.037' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (8, 2, 10, 3, CAST(100000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:07:38.037' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (9, 3, 12, 10, CAST(7500 AS Decimal(15, 0)), CAST(N'2022-09-10T10:11:28.287' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (10, 3, 8, 2, CAST(255000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:11:28.287' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (11, 3, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:11:28.287' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (12, 3, 1, 1, CAST(120000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:11:28.287' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (13, 3, 10, 3, CAST(100000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:11:28.290' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (14, 4, 4, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:13:33.053' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (15, 4, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:13:33.053' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (16, 5, 5, 2, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:17:33.593' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (17, 6, 3, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:21:52.797' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (18, 7, 11, 3, CAST(90000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:27:36.650' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (19, 8, 8, 2, CAST(255000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:28:36.773' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (20, 9, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:30:33.097' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (21, 10, 8, 1, CAST(255000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:57:37.813' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (22, 10, 4, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:57:37.817' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (23, 11, 8, 1, CAST(255000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:07:31.817' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (24, 11, 4, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:07:31.817' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (25, 12, 4, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:24:51.810' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (26, 12, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:24:51.810' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (27, 13, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:29:24.540' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (28, 13, 3, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:29:24.540' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (29, 14, 5, 3, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:34:45.373' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([id], [transactionID], [idFlower], [quantity], [amount], [created], [updated], [isCanceled]) VALUES (30, 15, 9, 1, CAST(500000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:35:52.720' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [roleName], [detail]) VALUES (1, N'Quản Lý', NULL)
INSERT [dbo].[Role] ([id], [roleName], [detail]) VALUES (2, N'Nhân Viên', NULL)
INSERT [dbo].[Role] ([id], [roleName], [detail]) VALUES (3, N'Khách Hàng', NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopCart] ON 

INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (1, 5, 8, 5, CAST(255000 AS Decimal(15, 0)), CAST(N'2022-09-08T01:48:21.613' AS DateTime), CAST(N'2022-09-10T09:36:55.233' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (2, 5, 6, 3, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-08T02:07:44.203' AS DateTime), CAST(N'2022-09-10T09:36:55.243' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (3, 5, 9, 1, CAST(500000 AS Decimal(15, 0)), CAST(N'2022-09-08T02:58:50.630' AS DateTime), CAST(N'2022-09-08T03:29:22.127' AS DateTime), 0, 1)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (4, 5, 1, 20, CAST(120000 AS Decimal(15, 0)), CAST(N'2022-09-08T02:59:03.483' AS DateTime), CAST(N'2022-09-10T09:36:55.253' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (5, 5, 3, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-08T03:30:13.897' AS DateTime), CAST(N'2022-09-08T03:30:17.053' AS DateTime), 0, 1)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (6, 5, 9, 2, CAST(500000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:01:10.577' AS DateTime), CAST(N'2022-09-10T10:03:13.973' AS DateTime), 0, 1)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (7, 5, 12, 10, CAST(7500 AS Decimal(15, 0)), CAST(N'2022-09-10T10:01:19.013' AS DateTime), CAST(N'2022-09-10T10:11:28.300' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (8, 5, 8, 2, CAST(255000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:01:48.783' AS DateTime), CAST(N'2022-09-10T10:11:28.317' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (9, 5, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:02:32.637' AS DateTime), CAST(N'2022-09-10T10:11:28.340' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (10, 5, 1, 1, CAST(120000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:05:47.847' AS DateTime), CAST(N'2022-09-10T10:11:28.360' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (11, 5, 10, 3, CAST(100000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:06:26.987' AS DateTime), CAST(N'2022-09-10T10:11:28.380' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (12, 5, 4, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:13:21.637' AS DateTime), CAST(N'2022-09-10T10:13:33.063' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (13, 5, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:13:25.647' AS DateTime), CAST(N'2022-09-10T10:13:33.083' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (14, 5, 5, 2, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:16:48.290' AS DateTime), CAST(N'2022-09-10T10:17:33.600' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (15, 5, 3, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:17:18.223' AS DateTime), CAST(N'2022-09-10T10:21:52.807' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (16, 5, 8, 2, CAST(255000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:21:44.700' AS DateTime), CAST(N'2022-09-10T10:28:36.803' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (17, 5, 11, 3, CAST(90000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:27:26.827' AS DateTime), CAST(N'2022-09-10T10:27:36.660' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (18, 5, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:30:21.823' AS DateTime), CAST(N'2022-09-10T10:30:33.120' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (19, 5, 8, 1, CAST(255000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:31:03.567' AS DateTime), CAST(N'2022-09-10T11:07:31.827' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (20, 5, 4, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:56:47.583' AS DateTime), CAST(N'2022-09-10T11:07:31.847' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (21, 5, 4, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:24:25.657' AS DateTime), CAST(N'2022-09-10T11:24:51.820' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (22, 5, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:24:32.210' AS DateTime), CAST(N'2022-09-10T11:24:51.843' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (23, 5, 5, 1, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:29:11.270' AS DateTime), CAST(N'2022-09-10T11:29:24.553' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (24, 5, 3, 1, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:29:19.467' AS DateTime), CAST(N'2022-09-10T11:29:24.573' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (25, 5, 5, 3, CAST(494000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:34:33.217' AS DateTime), CAST(N'2022-09-10T11:34:45.383' AS DateTime), 1, 0)
INSERT [dbo].[ShopCart] ([id], [userID], [idFlower], [quantity], [amount], [created], [updated], [isOrdered], [isDeleted]) VALUES (26, 5, 9, 1, CAST(500000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:35:33.410' AS DateTime), CAST(N'2022-09-10T11:35:52.730' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[ShopCart] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (1, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(3738000 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T09:36:41.690' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (2, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(78750 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T10:07:38.033' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (3, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(78750 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T10:11:28.287' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (4, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(22050 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T10:13:33.050' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (5, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(1037400 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T10:17:33.590' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (6, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(22050 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T10:21:52.793' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (7, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(283500 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T10:27:36.647' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (8, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(535500 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T10:28:36.770' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (9, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(518700 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T10:30:33.093' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (10, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(289800 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T10:57:37.810' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (11, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(289800 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T11:07:31.813' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (12, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(540750 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T11:24:51.807' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (13, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(540750 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T11:29:24.540' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (14, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(1556100 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T11:34:45.373' AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Transaction] ([id], [userID], [recipientName], [recipientEmail], [recipientPhone], [recipientAddress], [amount], [message], [created], [updated], [status], [note], [isCanceled]) VALUES (15, 5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', CAST(525000 AS Decimal(15, 0)), N'', CAST(N'2022-09-10T11:35:52.720' AS DateTime), NULL, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[Transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (2, N'Nguyễn Minh Đoan', N'doannguyen120820@gmail.com', N'0911711901', N'Tân Hội', N'123', NULL, NULL, 0, 1, NULL)
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (5, N'Chúc Nguyễn', N'ttvn120820@gmail.com', N'0927828901', N'Tân Hội Lâm Đồng', N'123', NULL, CAST(N'2022-09-10T11:35:56.150' AS DateTime), 0, 3, CAST(55000 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (6, N'doan pro', N'doan1233testq@gmail14.com', N'0911711930', N'', N'448965', CAST(N'2022-08-21T15:34:07.907' AS DateTime), CAST(N'2022-08-21T16:04:39.940' AS DateTime), 0, 2, CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (9, N'doan', N'doan1233testq@gmail145.com', N'0911711931', N'', N'1234', CAST(N'2022-08-21T15:43:33.467' AS DateTime), CAST(N'2022-08-21T15:43:33.467' AS DateTime), 0, 2, CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (10, N'Minh ?oan Nguy?n', N'doan675895@gmail.com', N'0911711782', N'', N'123', CAST(N'2022-08-21T16:14:26.590' AS DateTime), CAST(N'2022-08-21T16:14:26.590' AS DateTime), 0, 3, CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (11, N'Minh ?oan Nguy?n', N'doan1233testq@gmail.com', N'0911711783', N'', N'123', CAST(N'2022-08-21T16:22:24.750' AS DateTime), CAST(N'2022-08-21T16:22:24.750' AS DateTime), 0, 3, CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (12, N'Đoan Nguyễn', N'doan1233testq@gmail1454.com', N'0911711938', N'', N'1234', CAST(N'2022-08-21T16:23:46.937' AS DateTime), CAST(N'2022-08-21T16:23:46.937' AS DateTime), 0, 2, CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (13, N'Minh ?oan Nguy?n', N'doa3n1233testq@gmail14.com', N'0911711789', N'', N'123', CAST(N'2022-08-21T16:27:04.420' AS DateTime), CAST(N'2022-08-21T16:27:04.420' AS DateTime), 0, 3, CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (14, N'Minh Đoan Nguyễn', N'doa3n1233testq@gmail141.com', N'0911711712', N'', N'123', CAST(N'2022-08-21T16:32:19.467' AS DateTime), CAST(N'2022-08-21T16:32:19.467' AS DateTime), 0, 3, CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (15, N'Minh ?oan Nguy?n', N'doan1233testq@gmail14.com22', N'0911711713', N'', N'2', CAST(N'2022-08-21T16:39:32.783' AS DateTime), CAST(N'2022-08-21T16:39:32.783' AS DateTime), 0, 3, CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (16, N'Minh Đoan Nguyễn', N'doan675895@gmail.com1', N'0911711734', N'', N'2', CAST(N'2022-08-21T16:42:57.030' AS DateTime), CAST(N'2022-08-21T16:42:57.030' AS DateTime), 0, 3, CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (17, N'Minh ?oan Nguy?n', N'doan1233testq@gmail1334.com', N'0911711756', N'', N'3', CAST(N'2022-08-21T16:44:29.607' AS DateTime), CAST(N'2022-08-21T16:44:29.607' AS DateTime), 0, 3, CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[User] ([id], [fullName], [email], [phone], [address], [password], [created], [updated], [isDeleted], [idRole], [loyaltyPoint]) VALUES (18, N'Minh Đoan Nguyễn', N'doan6758951@gmail.com', N'0911711715', N'', N'123', CAST(N'2022-08-21T16:49:56.513' AS DateTime), CAST(N'2022-08-21T16:49:56.513' AS DateTime), 0, 3, CAST(0 AS Decimal(15, 0)))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [User_UK_phone]    Script Date: 9/27/2022 11:40:18 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [User_UK_phone] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [User_UN_Email]    Script Date: 9/27/2022 11:40:18 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [User_UN_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Transaction] FOREIGN KEY([transactionID])
REFERENCES [dbo].[Transaction] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Transaction]
GO
ALTER TABLE [dbo].[ShopCart]  WITH CHECK ADD  CONSTRAINT [FK_ShopCart_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ShopCart] CHECK CONSTRAINT [FK_ShopCart_User]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([idRole])
REFERENCES [dbo].[Role] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUser]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUser]
@key varchar(50)
AS 
Begin
	SELECT top 1 u.id, u.fullName, u.email, u.phone, u.address, u.password, u.isDeleted, u.idRole, u.loyaltyPoint, role.roleName
	from dbo.[User] as u 
		join dbo.Role as role on u.idRole = role.id
	WHERE u.isDeleted = 0 and ( TRIM(Convert(varchar(50),u.id)) = TRIM(@key) or TRIM(u.email) = TRIM(@key) or TRIM(u.phone) = TRIM(@key))
	return;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Login]
@login varchar(50), @pass varchar(MAX), @result int = -1 output 
AS 
Begin
	SELECT @result = u.id
	from dbo.[User] as u 
		join dbo.Role as role on u.idRole = role.id
	WHERE u.email = @login or u.phone = @login
	and u.password = @pass;
	return;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_add]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Order_add]
	   @transactionID int,
	   @idFlower int,
	   @quantity int,
     @amount decimal(15, 0)
AS
BEGIN
	INSERT INTO [dbo].[Order]
		(transactionID, idFlower, quantity, amount, created, isCanceled)
	VALUES
		(@transactionID, @idFlower, @quantity,  @amount, GETDATE(), 0)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ShopCart_add]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ShopCart_add]
	   @userID int,
	   @idFlower int,
	   @quantity int,
       @amount decimal(15, 0),
	   @cartId int = -1 Output
AS
BEGIN
	INSERT INTO [dbo].ShopCart
		(userID, idFlower, quantity, amount, created, isOrdered, isDeleted)
	VALUES
		(@userID, @idFlower, @quantity,  @amount, GetDate(), 0 , 0)

	SET @cartId = SCOPE_IDENTITY()
	Return;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ShopCart_GetByUser]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ShopCart_GetByUser]
@userId int
AS 
Begin
	SELECT ShopCart.id, ShopCart.userID, ShopCart.idFlower, ShopCart.quantity, ShopCart.amount, ShopCart.isOrdered, ShopCart.isDeleted
	FROM ShopCart 
	WHERE ShopCart.isDeleted = 0 and ShopCart.isOrdered = 0 and ShopCart.userID = @userId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ShopCart_GetByUserFlo]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ShopCart_GetByUserFlo]
@userId int,
@idFlower int
AS 
Begin
	SELECT ShopCart.id, ShopCart.userID, ShopCart.idFlower, ShopCart.quantity, ShopCart.amount, ShopCart.isOrdered, ShopCart.isDeleted
	FROM ShopCart 
	WHERE ShopCart.isDeleted = 0 and ShopCart.isOrdered = 0 and ShopCart.userID = @userId and ShopCart.idFlower = @idFlower
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ShopCart_GetCartById]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ShopCart_GetCartById]
@id int
AS 
Begin
	SELECT ShopCart.id, ShopCart.userID, ShopCart.idFlower, ShopCart.quantity, ShopCart.amount, ShopCart.isOrdered, ShopCart.isDeleted
	FROM ShopCart 
	WHERE ShopCart.isDeleted = 0 and ShopCart.id = @id and ShopCart.isOrdered = 0
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ShopCart_update]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ShopCart_update]
	   @cartId int,
	   @userID int,
	   @idFlower int,
	   @quantity int,
       @amount decimal(15, 0),
	   @isOrdered bit,
	   @isDeleted bit
AS 
Begin
	Update [dbo].ShopCart
	set userID = @userID,
		idFlower = @idFlower,
		quantity = @quantity,
		amount = @amount,
		updated = getdate(),
		isOrdered = @isOrdered,
		isDeleted = @isDeleted
	where ShopCart.id = @cartId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Transaction_add]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Transaction_add]
	   @userID int,
	   @recipientName nvarchar(50),
	   @recipientEmail varchar(50),
     @recipientPhone varchar(10),
		 @recipientAddress nvarchar(MAX),
		 @amount decimal(15, 0),
		 @message nvarchar(MAX),
		 @note nvarchar(MAX),
	   @id int = -1 Output
AS
BEGIN
	INSERT INTO [dbo].[Transaction]
		(userID, recipientName, recipientEmail, recipientPhone, recipientAddress, amount, message, created, status, note, isCanceled)
	VALUES
		(@userID, @recipientName, @recipientEmail,  @recipientPhone, @recipientAddress,@amount , @message , GETDATE(), 0, @note, 0)

	SET @id = SCOPE_IDENTITY()
	Return;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UserAdd]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UserAdd]
			@fullName nvarchar(50),
			@email varchar(50),
			@phone varchar(10),
			@address nvarchar(100),
			@password varchar(MAX),
			@idRole int,
			@loyaltyPoint decimal(15, 0),
			@idUser int = -1 Output
AS 
Begin
	INSERT INTO [dbo].[User]
		(
			fullName,
			email,
			phone,
			address,
			password,
			created,
			updated,
			isDeleted,
			idRole,
			loyaltyPoint
		)
	VALUES
		(
			@fullName,
			@email,
			@phone,
			@address,
			@password,
			GetDate(),
			GetDate(),
			0,
			@idRole,
			@loyaltyPoint
		);
	SELECT @idUser = SCOPE_IDENTITY();
	RETURN;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UserUpdate]    Script Date: 9/27/2022 11:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UserUpdate]
			@idUser int,
			@fullName nvarchar(50),
			@email varchar(50),
			@phone varchar(10),
			@address nvarchar(100),
			@password varchar(MAX),
			@isDeleted bit,
			@idRole int,
			@loyaltyPoint decimal(15, 0)
AS 
Begin
	Update [dbo].[User]
	set
			[User].fullName = @fullName,
			[User].email =@email,
			[User].phone =@phone,
			[User].address =@address,
			[User].password =@password,
			[User].updated = GETDATE(),
			[User].isDeleted = @isDeleted,
			[User].idRole = @idRole,
			[User].loyaltyPoint =@loyaltyPoint
	where [User].id = @idUser
end
GO
USE [master]
GO
ALTER DATABASE [ORDER_SERVICE] SET  READ_WRITE 
GO
