USE [master]
GO
/****** Object:  Database [PAYMENT_SERVICE]    Script Date: 9/27/2022 11:41:18 PM ******/
CREATE DATABASE [PAYMENT_SERVICE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PAYMENT_SERVICE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PAYMENT_SERVICE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PAYMENT_SERVICE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PAYMENT_SERVICE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PAYMENT_SERVICE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PAYMENT_SERVICE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PAYMENT_SERVICE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET ARITHABORT OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET RECOVERY FULL 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET  MULTI_USER 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PAYMENT_SERVICE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PAYMENT_SERVICE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PAYMENT_SERVICE', N'ON'
GO
ALTER DATABASE [PAYMENT_SERVICE] SET QUERY_STORE = OFF
GO
USE [PAYMENT_SERVICE]
GO
/****** Object:  Table [dbo].[GiftVoucher]    Script Date: 9/27/2022 11:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiftVoucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[value] [decimal](15, 0) NOT NULL,
	[created] [datetime] NOT NULL,
	[updated] [datetime] NULL,
	[isUsed] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[createdTransactionId] [int] NOT NULL,
 CONSTRAINT [PK_GiftVoucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentLocalTrans]    Script Date: 9/27/2022 11:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentLocalTrans](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTypeKey] [int] NULL,
	[tagName] [varchar](20) NOT NULL,
	[status] [bit] NULL,
	[created] [datetime] NOT NULL,
	[idPaymentTrans] [int] NOT NULL,
	[idPaymentType] [int] NOT NULL,
 CONSTRAINT [PK_PaymentLocalTrans] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOnlineTrans]    Script Date: 9/27/2022 11:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOnlineTrans](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tagName] [varchar](20) NOT NULL,
	[amount] [decimal](15, 0) NOT NULL,
	[status] [bit] NOT NULL,
	[created] [datetime] NOT NULL,
	[idPaymentTrans] [int] NOT NULL,
	[idPaymentType] [int] NOT NULL,
 CONSTRAINT [PK_PaymentOnlineTrans] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTransaction]    Script Date: 9/27/2022 11:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTransaction](
	[id] [int] NOT NULL,
	[idTrans] [int] NOT NULL,
	[pointUsed] [decimal](18, 0) NULL,
	[giftVoucherAmount] [decimal](18, 0) NULL,
	[paymentOnlAmount] [decimal](18, 0) NULL,
	[cashVND] [decimal](18, 0) NULL,
	[status] [bit] NOT NULL,
	[created] [datetime] NULL,
	[isCanceled] [bit] NOT NULL,
 CONSTRAINT [PK_PaymentTransaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 9/27/2022 11:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paymentType] [varchar](50) NOT NULL,
	[detail] [nvarchar](max) NULL,
	[isOnline] [bit] NOT NULL,
 CONSTRAINT [PK_LocalPayment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GiftVoucher] ON 

INSERT [dbo].[GiftVoucher] ([id], [title], [value], [created], [updated], [isUsed], [isDeleted], [createdTransactionId]) VALUES (3, N'ABCABC', CAST(100000 AS Decimal(15, 0)), CAST(N'2022-09-09T00:00:00.000' AS DateTime), CAST(N'2022-09-10T11:07:35.767' AS DateTime), 1, 0, 1)
INSERT [dbo].[GiftVoucher] ([id], [title], [value], [created], [updated], [isUsed], [isDeleted], [createdTransactionId]) VALUES (4, N'123456', CAST(200000 AS Decimal(15, 0)), CAST(N'2022-09-09T14:29:37.253' AS DateTime), NULL, 1, 0, 3)
INSERT [dbo].[GiftVoucher] ([id], [title], [value], [created], [updated], [isUsed], [isDeleted], [createdTransactionId]) VALUES (5, N'0BC03A', CAST(50000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:29:24.610' AS DateTime), NULL, 0, 0, 13)
INSERT [dbo].[GiftVoucher] ([id], [title], [value], [created], [updated], [isUsed], [isDeleted], [createdTransactionId]) VALUES (6, N'17061A', CAST(150000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:34:45.417' AS DateTime), CAST(N'2022-09-10T11:35:56.140' AS DateTime), 1, 0, 14)
INSERT [dbo].[GiftVoucher] ([id], [title], [value], [created], [updated], [isUsed], [isDeleted], [createdTransactionId]) VALUES (7, N'C78E29', CAST(50000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:35:56.160' AS DateTime), NULL, 0, 0, 15)
SET IDENTITY_INSERT [dbo].[GiftVoucher] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([id], [paymentType], [detail], [isOnline]) VALUES (1, N'Gift Voucher', N'Thanh toán bằng phiếu mua hàng', 0)
INSERT [dbo].[PaymentType] ([id], [paymentType], [detail], [isOnline]) VALUES (2, N'Loyalty Point', N'Sử dụng điểm của khách hàng', 0)
INSERT [dbo].[PaymentType] ([id], [paymentType], [detail], [isOnline]) VALUES (3, N'Paypal', N'Thanh toán trực tuyến Paypal', 1)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
ALTER TABLE [dbo].[PaymentLocalTrans]  WITH CHECK ADD  CONSTRAINT [FK_PaymentLocalTrans_GiftVoucher] FOREIGN KEY([idTypeKey])
REFERENCES [dbo].[GiftVoucher] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PaymentLocalTrans] CHECK CONSTRAINT [FK_PaymentLocalTrans_GiftVoucher]
GO
ALTER TABLE [dbo].[PaymentLocalTrans]  WITH CHECK ADD  CONSTRAINT [FK_PaymentLocalTrans_PaymentTransaction] FOREIGN KEY([idPaymentTrans])
REFERENCES [dbo].[PaymentTransaction] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PaymentLocalTrans] CHECK CONSTRAINT [FK_PaymentLocalTrans_PaymentTransaction]
GO
ALTER TABLE [dbo].[PaymentLocalTrans]  WITH CHECK ADD  CONSTRAINT [FK_PaymentLocalTrans_PaymentType] FOREIGN KEY([idPaymentType])
REFERENCES [dbo].[PaymentType] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PaymentLocalTrans] CHECK CONSTRAINT [FK_PaymentLocalTrans_PaymentType]
GO
ALTER TABLE [dbo].[PaymentOnlineTrans]  WITH CHECK ADD  CONSTRAINT [FK_PaymentOnlineTrans_PaymentTransaction] FOREIGN KEY([idPaymentTrans])
REFERENCES [dbo].[PaymentTransaction] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PaymentOnlineTrans] CHECK CONSTRAINT [FK_PaymentOnlineTrans_PaymentTransaction]
GO
ALTER TABLE [dbo].[PaymentOnlineTrans]  WITH CHECK ADD  CONSTRAINT [FK_PaymentOnlineTrans_PaymentType] FOREIGN KEY([idPaymentType])
REFERENCES [dbo].[PaymentType] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PaymentOnlineTrans] CHECK CONSTRAINT [FK_PaymentOnlineTrans_PaymentType]
GO
/****** Object:  StoredProcedure [dbo].[sp_GiftVoucher_add]    Script Date: 9/27/2022 11:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GiftVoucher_add]
	@title VARCHAR(50),
	@value decimal(15,0),
	@createdTransactionId int,
	@id int = -1 Output
AS
BEGIN
	INSERT INTO [dbo].[GiftVoucher]
		(
			title,
			[value],
			created,
			isUsed,
			isDeleted,
			createdTransactionId
		)
	VALUES
		(
			@title,
			@value,
			GETDATE(),
			0,
			0,
			@createdTransactionId
		);
	SELECT @id = SCOPE_IDENTITY();
	RETURN;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GiftVoucher_GetByKey]    Script Date: 9/27/2022 11:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GiftVoucher_GetByKey]
@key VARCHAR(10)
AS
BEGIN
	-- routine body goes here, e.g.
	-- SELECT 'Navicat for SQL Server'
	SELECT gf.id, gf.title, gf.[value], gf.isUsed, gf.createdTransactionId FROM GiftVoucher as gf
		WHERE gf.isDeleted = 0 and 
		(TRIM(Convert(varchar(10),gf.id)) = TRIM(@key) or TRIM(gf.title) = TRIM(@key)) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GiftVoucher_update]    Script Date: 9/27/2022 11:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GiftVoucher_update]
	@id int,
	@isUsed bit,
	@isDeleted bit
AS
BEGIN
      UPDATE GiftVoucher
			SET isUsed = @isUsed,
					isDeleted = @isDeleted,
					updated = GETDATE()
			WHERE GiftVoucher.id = @id 
	
END
GO
USE [master]
GO
ALTER DATABASE [PAYMENT_SERVICE] SET  READ_WRITE 
GO
