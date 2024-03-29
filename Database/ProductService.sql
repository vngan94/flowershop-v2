USE [master]
GO
/****** Object:  Database [PRODUCT_SERVICE]    Script Date: 9/27/2022 11:41:59 PM ******/
CREATE DATABASE [PRODUCT_SERVICE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRODUCT_SERVICE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRODUCT_SERVICE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRODUCT_SERVICE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRODUCT_SERVICE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRODUCT_SERVICE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRODUCT_SERVICE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRODUCT_SERVICE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET RECOVERY FULL 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET  MULTI_USER 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRODUCT_SERVICE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRODUCT_SERVICE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRODUCT_SERVICE', N'ON'
GO
ALTER DATABASE [PRODUCT_SERVICE] SET QUERY_STORE = OFF
GO
USE [PRODUCT_SERVICE]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/27/2022 11:41:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[parent_id] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 9/27/2022 11:41:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flower]    Script Date: 9/27/2022 11:41:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flower](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [decimal](15, 0) NOT NULL,
	[contents] [nvarchar](max) NULL,
	[discount] [int] NULL,
	[views] [int] NULL,
	[created] [datetime] NOT NULL,
	[updated] [datetime] NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Flower] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flower_Category]    Script Date: 9/27/2022 11:41:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flower_Category](
	[idFlower] [int] NOT NULL,
	[idCategory] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Flower_Category] PRIMARY KEY CLUSTERED 
(
	[idFlower] ASC,
	[idCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flower_Color]    Script Date: 9/27/2022 11:41:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flower_Color](
	[idFlower] [int] NOT NULL,
	[idColor] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Flower_Color] PRIMARY KEY CLUSTERED 
(
	[idFlower] ASC,
	[idColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 9/27/2022 11:41:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imageURL] [varchar](max) NOT NULL,
	[imgDetail] [nvarchar](max) NULL,
	[idFlower] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[created] [datetime] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 9/27/2022 11:41:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idFlower] [int] NOT NULL,
	[quantity_in] [int] NOT NULL,
	[quantity_remain] [int] NOT NULL,
	[isLast] [bit] NOT NULL,
	[detail] [nvarchar](max) NULL,
	[price] [decimal](15, 0) NOT NULL,
	[created] [datetime] NOT NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [parent_id]) VALUES (1, N'Hoa Sáp', NULL)
INSERT [dbo].[Category] ([id], [name], [parent_id]) VALUES (2, N'Hoa Khô', NULL)
INSERT [dbo].[Category] ([id], [name], [parent_id]) VALUES (3, N'Hoa Chúc Mừng', NULL)
INSERT [dbo].[Category] ([id], [name], [parent_id]) VALUES (4, N'Hoa Sự Kiện', NULL)
INSERT [dbo].[Category] ([id], [name], [parent_id]) VALUES (5, N'Hoa Khai Trương', NULL)
INSERT [dbo].[Category] ([id], [name], [parent_id]) VALUES (6, N'Hoa Sinh Nhật', NULL)
INSERT [dbo].[Category] ([id], [name], [parent_id]) VALUES (7, N'Hoa Tang Lễ', NULL)
INSERT [dbo].[Category] ([id], [name], [parent_id]) VALUES (8, N'Khác', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([id], [name]) VALUES (1, N'Đỏ')
INSERT [dbo].[Color] ([id], [name]) VALUES (2, N'Cam')
INSERT [dbo].[Color] ([id], [name]) VALUES (3, N'Vàng')
INSERT [dbo].[Color] ([id], [name]) VALUES (4, N'Lục')
INSERT [dbo].[Color] ([id], [name]) VALUES (5, N'Lam')
INSERT [dbo].[Color] ([id], [name]) VALUES (6, N'Chàm')
INSERT [dbo].[Color] ([id], [name]) VALUES (7, N'Tím')
INSERT [dbo].[Color] ([id], [name]) VALUES (8, N'Hồng')
INSERT [dbo].[Color] ([id], [name]) VALUES (9, N'Trắng')
INSERT [dbo].[Color] ([id], [name]) VALUES (10, N'Khác')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Flower] ON 

INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (1, N'Hoa Test', CAST(120000 AS Decimal(15, 0)), N'Hoa Test', 0, 0, CAST(N'2022-08-28T17:13:37.997' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (3, N'Hoa May Mắn', CAST(21000 AS Decimal(15, 0)), N'Hoa đẹp tuyệt vời', 0, 0, CAST(N'2022-08-28T17:49:26.730' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (4, N'Hoa May Mắn', CAST(21000 AS Decimal(15, 0)), N'Hoa đẹp tuyệt vời', 0, 0, CAST(N'2022-08-28T17:51:43.070' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (5, N'Hoa Minh Đoan', CAST(520000 AS Decimal(15, 0)), N'Trong ngày lễ tình nhân hay mỗi dịp kỉ niệm tình yêu, hoa hồng là một món quà không thể thiếu. Bởi lẽ đó là loại hoa tượng trưng cho tình yêu được nhiều người biết đến nhất trên thế giới, là loại hoa ngọt ngào, nồng thắm mà tình yêu đã len lỏi vào từng cánh hoa, nhị hoa và cả hương thơm dịu nhẹ phảng phất...', 5, 0, CAST(N'2022-08-28T17:53:14.620' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (6, N'Hoa May Mắn', CAST(21000 AS Decimal(15, 0)), N'Hoa đẹp tuyệt vời', 0, 0, CAST(N'2022-08-29T01:16:11.030' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (7, N'Hoa Lan', CAST(222000 AS Decimal(15, 0)), N'Hoa Lan tuyệt vời', 0, 0, CAST(N'2022-08-29T01:39:48.307' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (8, N'Hồng trắng tinh tế', CAST(300000 AS Decimal(15, 0)), N'Trong ngày lễ tình nhân hay mỗi dịp kỉ niệm tình yêu, hoa hồng là một món quà không thể thiếu. Bởi lẽ đó là loại hoa tượng trưng cho tình yêu được nhiều người biết đến nhất trên thế giới, là loại hoa ngọt ngào, nồng thắm mà tình yêu đã len lỏi vào từng cánh hoa, nhị hoa và cả hương thơm dịu nhẹ phảng phất...', 15, 0, CAST(N'2022-09-05T22:36:57.800' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (9, N'Sắc màu hồng cam', CAST(500000 AS Decimal(15, 0)), N'Trong ngày lễ tình nhân hay mỗi dịp kỉ niệm tình yêu, hoa hồng là một món quà không thể thiếu. Bởi lẽ đó là loại hoa tượng trưng cho tình yêu được nhiều người biết đến nhất trên thế giới, là loại hoa ngọt ngào, nồng thắm mà tình yêu đã len lỏi vào từng cánh hoa, nhị hoa và cả hương thơm dịu nhẹ phảng phất...', 0, 0, CAST(N'2022-09-05T22:39:24.470' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (10, N'Trao yêu thương 1', CAST(100000 AS Decimal(15, 0)), N'Hoa cúc - loài hoa được người ta yêu mến bởi vẻ mộc mạc, giản đơn và biết bao gần gũi. Không chỉ là nét ngây thơ trong sáng của những đóa cúc nhỏ nhắn, trắng xinh; mà còn là niềm vui tươi, rạng rỡ của những đóa cúc đa sắc màu...', 0, 0, CAST(N'2022-09-05T22:41:36.880' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (11, N'Trao yêu thương 2', CAST(100000 AS Decimal(15, 0)), N'Hoa cúc - loài hoa được người ta yêu mến bởi vẻ mộc mạc, giản đơn và biết bao gần gũi. Không chỉ là nét ngây thơ trong sáng của những đóa cúc nhỏ nhắn, trắng xinh; mà còn là niềm vui tươi, rạng rỡ của những đóa cúc đa sắc màu...', 10, 0, CAST(N'2022-09-05T22:46:05.420' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (12, N'I Love you 1', CAST(10000 AS Decimal(15, 0)), N'Đối với hoa hồng, ý nghĩa bày tỏ không chỉ nằm ở màu sắc, mà còn thể hiện ở cả số lượng hoa bạn tặng. Nếu không chủ ý trước rằng mình sẽ tặng hoa theo số tuổi, hoặc số ngày quen nhau,... bạn hãy cũng Hoayeuthuong.com tìm hiểu xem, thông điệp mình muốn nhắn nhủ sẽ nằm ở con số nào nhé!', 25, 0, CAST(N'2022-09-05T22:47:01.317' AS DateTime), NULL, 0)
INSERT [dbo].[Flower] ([id], [name], [price], [contents], [discount], [views], [created], [updated], [isDeleted]) VALUES (13, N'I Love you 2', CAST(150000 AS Decimal(15, 0)), N'Đối với hoa hồng, ý nghĩa bày tỏ không chỉ nằm ở màu sắc, mà còn thể hiện ở cả số lượng hoa bạn tặng. Nếu không chủ ý trước rằng mình sẽ tặng hoa theo số tuổi, hoặc số ngày quen nhau,... bạn hãy cũng Hoayeuthuong.com tìm hiểu xem, thông điệp mình muốn nhắn nhủ sẽ nằm ở con số nào nhé!', 11, 0, CAST(N'2022-09-05T22:47:53.533' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Flower] OFF
GO
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (1, 2, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (1, 4, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (3, 3, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (3, 5, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (3, 6, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (4, 3, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (4, 5, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (4, 6, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (5, 1, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (5, 3, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (6, 3, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (6, 5, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (6, 6, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (7, 2, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (8, 4, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (9, 3, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (10, 3, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (10, 4, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (10, 5, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (10, 6, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (11, 3, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (11, 4, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (11, 5, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (11, 6, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (12, 3, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (12, 4, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (13, 3, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (13, 4, 0)
INSERT [dbo].[Flower_Category] ([idFlower], [idCategory], [isDeleted]) VALUES (13, 6, 0)
GO
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (1, 1, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (1, 2, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (1, 3, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (3, 4, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (3, 9, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (4, 4, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (4, 9, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (5, 1, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (5, 3, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (6, 4, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (6, 9, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (7, 1, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (7, 7, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (8, 9, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (9, 2, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (10, 2, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (10, 3, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (11, 3, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (12, 1, 0)
INSERT [dbo].[Flower_Color] ([idFlower], [idColor], [isDeleted]) VALUES (13, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (1, N'211204011549-ty2.jpg', NULL, 1, 0, CAST(N'2022-08-28T17:13:38.000' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (2, N'211205235129-lan 2.png', NULL, 1, 0, CAST(N'2022-08-28T17:13:38.000' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (4, N'20220828_173453_4la1.png', NULL, 3, 0, CAST(N'2022-08-28T17:49:26.730' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (5, N'211204140513-lan 3.jpg', NULL, 4, 0, CAST(N'2022-08-28T17:51:43.073' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (6, N'20220828_175241_162881.jpg', NULL, 5, 0, CAST(N'2022-08-28T17:53:14.620' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (7, N'20220828_175052_4la1.png', NULL, 6, 0, CAST(N'2022-08-29T01:16:11.030' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (8, N'211204134850-lan 3.jpg', NULL, 7, 0, CAST(N'2022-08-29T01:39:48.310' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (9, N'20220905_223656_1.jpg', NULL, 8, 0, CAST(N'2022-09-05T22:36:57.803' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (10, N'20220905_223922_2.jpg', NULL, 9, 0, CAST(N'2022-09-05T22:39:24.470' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (11, N'20220905_224135_cm3.jpg', NULL, 10, 0, CAST(N'2022-09-05T22:41:36.880' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (12, N'20220905_224603_cm4.jpg', NULL, 11, 0, CAST(N'2022-09-05T22:46:05.420' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (13, N'20220905_224659_sn1.jpg', NULL, 12, 0, CAST(N'2022-09-05T22:47:01.317' AS DateTime))
INSERT [dbo].[Image] ([id], [imageURL], [imgDetail], [idFlower], [isDeleted], [created]) VALUES (14, N'20220905_224752_sn2.jpg', NULL, 13, 0, CAST(N'2022-09-05T22:47:53.533' AS DateTime))
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Storage] ON 

INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (1, 1, 5, 0, 0, NULL, CAST(12000 AS Decimal(15, 0)), CAST(N'2022-08-28T17:13:37.997' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (3, 3, 10, 0, 0, NULL, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-08-28T17:13:37.997' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (4, 4, 11, 0, 0, NULL, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-08-28T17:13:37.997' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (5, 5, 21, 0, 0, NULL, CAST(520000 AS Decimal(15, 0)), CAST(N'2022-08-28T17:13:37.997' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (6, 1, 10, 5, 0, NULL, CAST(12000 AS Decimal(15, 0)), CAST(N'2022-08-28T17:13:37.997' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (7, 1, -2, 15, 0, NULL, CAST(12000 AS Decimal(15, 0)), CAST(N'2022-08-28T17:13:37.997' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (8, 6, 10, 0, 1, NULL, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-08-28T17:13:37.997' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (9, 7, 16, 0, 1, NULL, CAST(222000 AS Decimal(15, 0)), CAST(N'2022-08-28T17:13:37.997' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (10, 1, 12, 13, 0, NULL, CAST(12000 AS Decimal(15, 0)), CAST(N'2022-08-28T17:13:37.997' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (11, 3, -2, 10, 0, NULL, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-08-28T17:13:37.997' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (12, 8, 100, 0, 0, NULL, CAST(300000 AS Decimal(15, 0)), CAST(N'2022-09-05T22:36:57.803' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (13, 9, 132, 0, 0, NULL, CAST(500000 AS Decimal(15, 0)), CAST(N'2022-09-05T22:39:24.470' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (14, 10, 220, 0, 0, NULL, CAST(100000 AS Decimal(15, 0)), CAST(N'2022-09-05T22:41:36.880' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (15, 11, 111, 0, 0, NULL, CAST(100000 AS Decimal(15, 0)), CAST(N'2022-09-05T22:46:05.420' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (16, 12, 12, 0, 0, NULL, CAST(10000 AS Decimal(15, 0)), CAST(N'2022-09-05T22:47:01.317' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (17, 13, 15, 0, 1, NULL, CAST(150000 AS Decimal(15, 0)), CAST(N'2022-09-05T22:47:53.533' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (18, 12, 10, 12, 0, NULL, CAST(10000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:07:38.063' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (19, 8, 2, 100, 0, NULL, CAST(300000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:07:38.080' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (20, 5, 1, 21, 0, NULL, CAST(520000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:07:38.093' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (21, 1, 1, 25, 0, NULL, CAST(120000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:07:38.110' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (22, 10, 3, 220, 0, NULL, CAST(100000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:07:38.127' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (23, 12, 10, 22, 1, NULL, CAST(10000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:11:28.310' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (24, 8, 2, 102, 0, NULL, CAST(300000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:11:28.333' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (25, 5, 1, 22, 0, NULL, CAST(520000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:11:28.353' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (26, 1, 1, 26, 1, NULL, CAST(120000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:11:28.370' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (27, 10, 3, 223, 1, NULL, CAST(100000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:11:28.390' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (28, 4, 1, 11, 0, NULL, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:13:33.077' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (29, 5, 1, 23, 0, NULL, CAST(520000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:13:33.090' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (30, 5, 2, 24, 0, NULL, CAST(520000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:17:33.613' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (31, 3, 1, 8, 0, NULL, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:21:52.820' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (32, 11, 3, 111, 1, NULL, CAST(100000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:27:36.673' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (33, 8, 2, 104, 0, NULL, CAST(300000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:28:36.813' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (34, 5, 1, 26, 0, NULL, CAST(520000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:30:33.130' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (35, 8, 1, 106, 0, NULL, CAST(300000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:57:42.857' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (36, 4, 1, 12, 0, NULL, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T10:57:47.880' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (37, 8, 1, 107, 1, NULL, CAST(300000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:07:31.837' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (38, 4, 1, 13, 0, NULL, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:07:31.853' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (39, 4, 1, 14, 1, NULL, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:24:51.833' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (40, 5, 1, 27, 0, NULL, CAST(520000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:24:51.850' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (41, 5, 1, 28, 0, NULL, CAST(520000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:29:24.563' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (42, 3, 1, 9, 1, NULL, CAST(21000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:29:24.583' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (43, 5, 3, 29, 1, NULL, CAST(520000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:34:45.393' AS DateTime))
INSERT [dbo].[Storage] ([id], [idFlower], [quantity_in], [quantity_remain], [isLast], [detail], [price], [created]) VALUES (44, 9, 1, 132, 1, NULL, CAST(500000 AS Decimal(15, 0)), CAST(N'2022-09-10T11:35:52.737' AS DateTime))
SET IDENTITY_INSERT [dbo].[Storage] OFF
GO
ALTER TABLE [dbo].[Flower_Category]  WITH CHECK ADD  CONSTRAINT [FK_Flower_Category_Category] FOREIGN KEY([idCategory])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Flower_Category] CHECK CONSTRAINT [FK_Flower_Category_Category]
GO
ALTER TABLE [dbo].[Flower_Category]  WITH CHECK ADD  CONSTRAINT [FK_Flower_Category_Flower] FOREIGN KEY([idFlower])
REFERENCES [dbo].[Flower] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Flower_Category] CHECK CONSTRAINT [FK_Flower_Category_Flower]
GO
ALTER TABLE [dbo].[Flower_Color]  WITH CHECK ADD  CONSTRAINT [FK_Flower_Color_Color] FOREIGN KEY([idColor])
REFERENCES [dbo].[Color] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Flower_Color] CHECK CONSTRAINT [FK_Flower_Color_Color]
GO
ALTER TABLE [dbo].[Flower_Color]  WITH CHECK ADD  CONSTRAINT [FK_Flower_Color_Flower] FOREIGN KEY([idFlower])
REFERENCES [dbo].[Flower] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Flower_Color] CHECK CONSTRAINT [FK_Flower_Color_Flower]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Flower] FOREIGN KEY([idFlower])
REFERENCES [dbo].[Flower] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Flower]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_Flower] FOREIGN KEY([idFlower])
REFERENCES [dbo].[Flower] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_Storage_Flower]
GO
/****** Object:  StoredProcedure [dbo].[sp_Flower_add]    Script Date: 9/27/2022 11:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Flower_add]
	   @name nvarchar(50),
       @price decimal(15, 0),
       @contents nvarchar(MAX),
       @discount int,
	   @listImage varchar(MAX),
       @listColor varchar(50),
       @listCategory varchar(50),
	   @quantity_in int,
	   @pdId int = -1 Output
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			INSERT INTO [dbo].Flower
                (name, price, contents, discount, views, created, isDeleted)
            VALUES
                (@name, @price, @contents, @discount, 0, GetDate(), 0)

            SET @pdId = SCOPE_IDENTITY()

			-- now insert Flower_Color table
            INSERT INTO Flower_Color
                (idFlower, idColor, isDeleted)
            SELECT
				@pdId, VALUE, 0
			FROM STRING_SPLIT(@listColor, ',')

			-- now insert Flower_Category table
            INSERT INTO Flower_Category
                (idFlower, idCategory, isDeleted)
            SELECT
				@pdId, VALUE, 0
			FROM STRING_SPLIT(@listCategory, ',')

			
			-- now insert Image table
            INSERT INTO [dbo].Image
                (idFlower, imageURL, isDeleted, created)
            SELECT
				@pdId, VALUE, 0, getDate()
			FROM STRING_SPLIT(@listImage, ',')

            -- now insert Storage table
            INSERT INTO Storage
                (idFlower, quantity_in, quantity_remain, isLast, price, created)
            VALUES
                (@pdId, @quantity_in, 0 , 1, @price, getdate() )

		-- if not error, commit the transcation
              COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
              -- if error, roll back any chanegs done by any of the sql statements
              ROLLBACK TRANSACTION
		END CATCH
		Return;
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Flower_GetAll]    Script Date: 9/27/2022 11:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Flower_GetAll] 
as
BEGIN
	select flo.id , flo.name, flo.price, flo.contents,st.quantity_in + st.quantity_remain as quantity, flo.discount, flo.views, 
		(SELECT STRING_AGG(Color.name, ', ') 
		 FROM Flower_Color fc join Color on fc.idColor = Color.id
         WHERE fc.idFlower = flo.id) AS colorsName,
		 (SELECT STRING_AGG(Category.name, ', ')
         FROM Flower_Category fca join Category on fca.idCategory = Category.id
         WHERE fca.idFlower = flo.id) AS categoriesName,
		 (SELECT STRING_AGG(img.imageURL, ',')
         FROM Image img
         WHERE img.idFlower = flo.id) AS imagesName

	from dbo.Flower as flo join Storage as st on flo.id = st.idFlower
	where flo.isDeleted = 0 and st.isLast = 1
	Group by flo.id , flo.name, flo.price, flo.contents,st.quantity_in + st.quantity_remain, flo.discount, flo.views
end
	
GO
/****** Object:  StoredProcedure [dbo].[sp_Flower_GetById]    Script Date: 9/27/2022 11:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Flower_GetById]
			@idFlower nvarchar(50)
as
BEGIN
	select flo.id , flo.name, flo.price, flo.contents,st.quantity_in + st.quantity_remain as quantity, flo.discount, flo.views, 
		(SELECT STRING_AGG(Color.name, ', ') 
		 FROM Flower_Color fc join Color on fc.idColor = Color.id
         WHERE fc.idFlower = flo.id) AS colorsName,
		 (SELECT STRING_AGG(Category.name, ', ')
         FROM Flower_Category fca join Category on fca.idCategory = Category.id
         WHERE fca.idFlower = flo.id) AS categoriesName,
		 (SELECT STRING_AGG(img.imageURL, ',')
         FROM Image img
         WHERE img.idFlower = flo.id) AS imagesName

	from dbo.Flower as flo join Storage as st on flo.id = st.idFlower
	where flo.id = @idFlower and flo.isDeleted = 0 and st.isLast = 1
	Group by flo.id , flo.name, flo.price, flo.contents,st.quantity_in + st.quantity_remain, flo.discount, flo.views
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Flower_GetByKey]    Script Date: 9/27/2022 11:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Flower_GetByKey]
			@key nvarchar(50)
as
BEGIN
	select flo.id , flo.name, flo.price, flo.contents,st.quantity_in + st.quantity_remain as quantity, flo.discount, flo.views, 
		(SELECT STRING_AGG(Color.name, ', ') 
		 FROM Flower_Color fc join Color on fc.idColor = Color.id
         WHERE fc.idFlower = flo.id) AS colorsName,
		 (SELECT STRING_AGG(Category.name, ', ')
         FROM Flower_Category fca join Category on fca.idCategory = Category.id
         WHERE fca.idFlower = flo.id) AS categoriesName,
		 (SELECT STRING_AGG(img.imageURL, ',')
         FROM Image img
         WHERE img.idFlower = flo.id) AS imagesName

	from dbo.Flower as flo join Storage as st on flo.id = st.idFlower
	where (flo.name LIKE N'%' + @key + '%' or 
			(SELECT STRING_AGG(Color.name, ', ') 
				FROM Flower_Color fc join Color on fc.idColor = Color.id
				WHERE fc.idFlower = flo.id) 
				LIKE N'%' + @key + '%' or
			(SELECT STRING_AGG(Category.name, ', ')
				FROM Flower_Category fca join Category on fca.idCategory = Category.id
				WHERE fca.idFlower = flo.id) 
				LIKE N'%' + @key + '%')
		and flo.isDeleted = 0 and st.isLast = 1
	Group by flo.id , flo.name, flo.price, flo.contents,st.quantity_in + st.quantity_remain, flo.discount, flo.views
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCategory]    Script Date: 9/27/2022 11:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_GetAllCategory]
AS 
Begin
	SELECT *
	from dbo.Category
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllColor]    Script Date: 9/27/2022 11:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_GetAllColor]
AS 
Begin
	SELECT *
	from dbo.Color
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Storage_add]    Script Date: 9/27/2022 11:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Storage_add]
	   @idFlower nvarchar(50),
       @quantity_in decimal(15, 0),
       @detail nvarchar(MAX),
	   @price decimal(15, 0),
	   @storageId int = -1 Output
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			declare @quantity_remain int 
			select @quantity_remain = quantity_remain + quantity_in from dbo.Storage where isLast = 1 and idFlower = @idFlower
			update dbo.Storage set isLast = 0 where idFlower = @idFlower and isLast = 1; 
            -- now insert Storage table
            INSERT INTO Storage
                (idFlower, quantity_in, quantity_remain, isLast, price, created)
            VALUES
                (@idFlower, @quantity_in, @quantity_remain , 1, @price, getdate())
			select @storageId = SCOPE_IDENTITY()
		-- if not error, commit the transcation
              COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
              -- if error, roll back any chanegs done by any of the sql statements
              ROLLBACK TRANSACTION
		END CATCH
		Return;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Storage_getByFlower]    Script Date: 9/27/2022 11:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Storage_getByFlower]
	   @idFlower int,
	   @quantity_remain int = -1 Output
AS
BEGIN
	select @quantity_remain = quantity_remain + quantity_in from dbo.Storage where isLast = 1 and idFlower = @idFlower
	Return;
end
GO
USE [master]
GO
ALTER DATABASE [PRODUCT_SERVICE] SET  READ_WRITE 
GO
