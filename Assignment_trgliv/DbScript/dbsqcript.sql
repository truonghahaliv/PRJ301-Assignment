USE [master]
GO
/****** Object:  Database [Assignment_PRJ]    Script Date: 2023-11-10 9:40:39 AM ******/
CREATE DATABASE [Assignment_PRJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment_PRJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Assignment_PRJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_PRJ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Assignment_PRJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Assignment_PRJ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment_PRJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment_PRJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment_PRJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment_PRJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment_PRJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment_PRJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment_PRJ] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment_PRJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment_PRJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment_PRJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment_PRJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment_PRJ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment_PRJ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assignment_PRJ] SET QUERY_STORE = ON
GO
ALTER DATABASE [Assignment_PRJ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Assignment_PRJ]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2023-11-10 9:40:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](250) NULL,
	[password] [nvarchar](250) NULL,
	[fullname] [nvarchar](250) NULL,
	[phone] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[gender] [int] NULL,
	[email] [nvarchar](250) NULL,
	[role] [int] NULL,
	[avatar] [nvarchar](250) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2023-11-10 9:40:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[accountid] [int] NULL,
	[productid] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2023-11-10 9:40:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryid] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](250) NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2023-11-10 9:40:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NULL,
	[total_money] [float] NULL,
	[name] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[phone] [nvarchar](250) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 2023-11-10 9:40:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[orderdetailid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[orderdetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2023-11-10 9:40:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[productname] [nvarchar](250) NULL,
	[categoryid] [int] NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[image] [nvarchar](250) NULL,
	[description] [nvarchar](250) NULL,
	[sold_quantity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (1, N'truong', N'123', N'ntt', N'0123456789', N'hoa lac', 1, N'gsgsg@gmail.com', 0, N'admin.jpg')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (3, N'truonghahaliv', N'123', N'nnt', N'123456789', N'ha noi', 0, N'truongnnhe170897@fpt.edu.vn', 0, N'guest.png')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (4, N'hoilamhi', N'123', N'fgđg', N'012545555', N'thuong tin', 1, N'truonghahaliv@gmail.com', 1, N'guest.png')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (5, N'hahahihi', N'123', N'hahaha', N'098888888', N'ha tay', 0, N'hahahahihi@gmail.com', 1, NULL)
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (6, N'hihihii', N'123', N'fầ', N'098888888', N'ha tay', 1, N'123@gmail.com', 1, N'guest.png')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (7, N'truong1', N'', N'truong nguyen', N'1234567890', N'hoa lac', 1, N'kkk@gmail.com', 1, N'guest.png')
INSERT [dbo].[Account] ([accountid], [username], [password], [fullname], [phone], [address], [gender], [email], [role], [avatar]) VALUES (8, N'csa', N'123', N'csacs', N'123', N'123', 1, N'zzz@gmail.com', 1, N'guest.png')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Cart] ([accountid], [productid], [quantity]) VALUES (4, 21, 6)
INSERT [dbo].[Cart] ([accountid], [productid], [quantity]) VALUES (3, 13, 1)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (3, N'Nike')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (4, N'Adidas')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (5, N'Puma')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (7, N'New Banlance')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (1, 1, 3500, N'truong', N'hoa lac', N'0123456789')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (2, 1, 3000, N'truong', N'hoa lac', N'0123456789')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (3, 1, 3000, N'truong', N'hoa lac', N'0123456789')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (4, 3, 15000, N'truonghahaliv', N'ha noi', N'123456789')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (5, 3, 5000, N'truonghahaliv', N'ha noi', N'123456789')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (6, 4, 1500, N'hoilamhi', N'thuong tin', N'012545555')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (7, 4, 3000, N'hoilamhi', N'thuong tin', N'012545555')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (8, 5, 1200, N'hahahihi', N'ha tay', N'098888888')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (9, 5, 500, N'hahahihi', N'ha tay', N'098888888')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (10, 6, 1200, N'hihihii', N'ha tay', N'098888888')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (11, 8, 1200, N'123', N'123', N'123')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (12, 8, 1000, N'123', N'123', N'123')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (13, 4, 10800, N'hoilamhi', N'thuong tin', N'012545555')
INSERT [dbo].[Order] ([orderid], [accountid], [total_money], [name], [address], [phone]) VALUES (14, 4, 24400, N'hoilamhi', N'thuong tin', N'012545555')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (1, 1, 9, 7)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (2, 2, 9, 6)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (3, 3, 9, 6)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (4, 4, 13, 10)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (5, 4, 12, 3)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (6, 5, 12, 2)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (7, 5, 9, 6)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (8, 6, 9, 3)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (9, 7, 9, 6)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (10, 8, 13, 1)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (11, 9, 9, 1)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (12, 10, 13, 1)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (13, 11, 13, 1)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (14, 12, 12, 1)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (15, 13, 13, 9)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (16, 14, 12, 5)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (17, 14, 13, 7)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (18, 14, 14, 5)
INSERT [dbo].[Order_Detail] ([orderdetailid], [orderid], [productid], [quantity]) VALUES (19, 14, 9, 7)
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (9, N'Nike Air Force 1', 3, 500, 57, N'nikeairforce1.jpg', N'Good', 42)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (12, N'Nike Air Force 1 ''07', 3, 1000, 79, N'giay-nike-air-force-1-low-07-lv8-40th-anniversary-white-black-dq7658-100-63aa63ad5f659-27122022101701.jpg', N'Very Good', 21)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (13, N'Nike Revolution 6', 3, 1200, 40, N'dd1096-600_0_448acea668564b9aa2b7a878e092280a_859744cec254437291827a9046964966_grande.jpg', N'Good', 41)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (14, N'Adidas Response Super 3.0', 4, 1500, 64, N'0d9e888a7ffd4f8fbb6c2ab5c582d582_9366.jpg', N'Good', 15)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (21, N'Nike Air Force 1', 3, 1000, 12, N'b7d9211c-26e7-431a-ac24-b0540fb3c00f.jpg', N'Good', 10)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (22, N'Nike Dunk Low Retro Premium', 3, 1500, 15, N'35cd473e-b388-4de0-83f5-8a8f3287eef6.jpg', N'Good', 15)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (23, N'Adidas RUNFALCON 3', 4, 1000, 56, N'0d9e888a7ffd4f8fbb6c2ab5c582d582_9366.jpg', N'Good', 10)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (24, N'Puma Palermo Leather', 5, 1200, 65, N'Palermo-Leather-Men''s-Sneakers.jpg', N'Good', 15)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (25, N'New Balance Men 530', 7, 999, 24, N'mr530sg_nb_03_i.jpg', N'Beutiful', 12)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (26, N'Adidas PUREBOOST 23
', 4, 990, 15, N'b26ffc91c6bb49b59a67d52cbb89b540_9366.jpg', N'So Pretty', 15)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (27, N'RS-X Faded Daytona Sneakers', 5, 1500, 15, N'RS-X-Faded-Daytona-Sneakers.jpg', N'So Good', 15)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (28, N'ALD x New Balance 650R', 7, 1700, 51, N'bb650rx1_nb_02_i.jpg', N'Pretty', 15)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (29, N'Adidas ULTRABOOST 1.0', 4, 1300, 79, N'ec6a133ce53d435aacc02e7d9f4ccf0d_9366.jpg', N'Nice', 10)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (30, N'New Balance Men''s
574', 7, 1500, 89, N'u574lgfg_nb_02_i.jpg', N'Nice', 5)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (31, N'Adidas SUPERNOVA 3', 4, 1200, 88, N'eb0b9557873344559e74a33c60f36353_9366.jpg', N'Very Good', 10)
INSERT [dbo].[Product] ([productid], [productname], [categoryid], [price], [quantity], [image], [description], [sold_quantity]) VALUES (32, N'New Balance', 7, 990, 55, N'nm600ogs_nb_02_i.jpg', N'Good', 11)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([accountid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([productid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([accountid])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order1] FOREIGN KEY([orderid])
REFERENCES [dbo].[Order] ([orderid])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order1]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Product] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([productid])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Category] ([categoryid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [Assignment_PRJ] SET  READ_WRITE 
GO
