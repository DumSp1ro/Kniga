USE [master]
GO
/****** Object:  Database [bookclub]    Script Date: 04.12.2023 20:41:42 ******/
CREATE DATABASE [bookclub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookclub', FILENAME = N'K:\sql\MSSQL15.MSSQLSERVER\MSSQL\DATA\bookclub.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookclub_log', FILENAME = N'K:\sql\MSSQL15.MSSQLSERVER\MSSQL\DATA\bookclub_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bookclub] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookclub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookclub] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookclub] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookclub] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookclub] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookclub] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookclub] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bookclub] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookclub] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookclub] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookclub] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookclub] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookclub] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookclub] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookclub] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookclub] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bookclub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookclub] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookclub] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookclub] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookclub] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookclub] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookclub] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookclub] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bookclub] SET  MULTI_USER 
GO
ALTER DATABASE [bookclub] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookclub] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookclub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookclub] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bookclub] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bookclub] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bookclub] SET QUERY_STORE = OFF
GO
USE [bookclub]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 04.12.2023 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NULL,
	[LoginDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 04.12.2023 20:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[dexcription] [text] NOT NULL,
	[manufacturer] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 04.12.2023 20:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[code] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
	[total_cost] [int] NULL,
	[delivery_days] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 04.12.2023 20:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 04.12.2023 20:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NULL,
	[quantity] [int] NULL,
	[total_cost] [int] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_sostav] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 04.12.2023 20:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_user]    Script Date: 04.12.2023 20:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 04.12.2023 20:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoginHistory] ON 

INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime]) VALUES (1, 1, CAST(N'2023-12-04T17:06:31.960' AS DateTime))
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime]) VALUES (2, 2, CAST(N'2023-12-04T17:06:46.233' AS DateTime))
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime]) VALUES (3, 3, CAST(N'2023-12-04T17:06:52.390' AS DateTime))
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime]) VALUES (4, 1, CAST(N'2023-12-04T17:07:15.567' AS DateTime))
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime]) VALUES (5, 1, CAST(N'2023-12-04T17:07:32.120' AS DateTime))
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime]) VALUES (6, 1, CAST(N'2023-12-04T17:08:54.273' AS DateTime))
SET IDENTITY_INSERT [dbo].[LoginHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[merch] ON 

INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (1, N'/photo/book.jpg', N'Война и Мир', N'Описание книги 1', N'издательство 1', 2200, 0)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (2, N'/photo/book2.jpg', N'Гарри Поттер', N'Описание книги 2', N'издательство 2', 2500, 5)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (3, N'/photo/book3.jpg', N'Тень-Пустоты', N'Что-то из прошлого', N'dozopravka', 1000000, 0)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (4, NULL, N'Книга', N'Описание книги 4', N'ditclay', 7000, 0)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (5, N'/photo/book4.jpg', N'Пиксель-Шутер', N'Шутер', N'pickle', 1000000, 0)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (8, N'/photo/book5.jpg', N'Блокс-Шахта', N'Симулятор шахтёра', N'pickle', 1000000, 0)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (4005, N'/photo/book3.jpg', N'opana', N'ono rabotaet', N'nu mozno i 5 postavit', 1000000, 23)
SET IDENTITY_INSERT [dbo].[merch] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1, 1, 1, 1, CAST(N'2023-09-14' AS Date), 1256, 1200, 35, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2, 2, 2, 2, CAST(N'2023-09-25' AS Date), 6673, 5000, 0, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (3, 3, 3, 3, CAST(N'2023-09-28' AS Date), 4342, 9000, 0, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (4, 3, 1, 1, CAST(N'2023-12-01' AS Date), 214872783, 2200, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (5, 3, 1, 1, CAST(N'2023-12-01' AS Date), 381231859, 4700, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (6, 3, 1, 1, CAST(N'2023-12-01' AS Date), 399, 2200, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (7, 3, 1, 1, CAST(N'2023-12-01' AS Date), 259, 1000000, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (8, 3, 1, 1, CAST(N'2023-12-01' AS Date), 196, 1001000, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (9, 3, 1, 1, CAST(N'2023-12-01' AS Date), 736, 1000000, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (10, 3, 1, 1, CAST(N'2023-12-01' AS Date), 207, 1000, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (11, 3, 1, 1, CAST(N'2023-12-01' AS Date), 729, 1001000, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (12, 3, 1, 1, CAST(N'2023-12-01' AS Date), 717, 2200, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1004, 3, 1, 1, CAST(N'2023-12-03' AS Date), 395, 1002200, 0, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1005, 3, 1, 1, CAST(N'2023-12-03' AS Date), 200, 2004700, 0, NULL, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1012, 3, 1, 2, CAST(N'2023-12-04' AS Date), 345, 2500, 125, 2375, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1013, 3, 1, 2, CAST(N'2023-12-04' AS Date), 599, 1012000, 230250, 781750, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1014, 3, 1, 2, CAST(N'2023-12-04' AS Date), 494, 3000000, 690000, 2310000, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1015, 3, 1, 2, CAST(N'2023-12-04' AS Date), 734, 2000000, 460000, 1540000, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1016, 2, 2, 3, CAST(N'2023-12-04' AS Date), 678, 2200, 0, 2200, NULL)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1017, 3, 1, 1, CAST(N'2023-12-04' AS Date), 235, 1004700, 125, 1004575, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1018, 3, 1, 1, CAST(N'2023-12-04' AS Date), 490, 3004700, 460125, 2544575, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1019, 3, 1, 1, CAST(N'2023-12-04' AS Date), 740, 2000000, 230000, 1770000, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1020, 3, 1, 1, CAST(N'2023-12-04' AS Date), 733, 6006900, 690125, 5316775, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1021, 3, 1, 1, CAST(N'2023-12-04' AS Date), 489, 4700, 125, 4575, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1022, 3, 1, 1, CAST(N'2023-12-04' AS Date), 608, 2009400, 230250, 1779150, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1023, 3, 1, 1, CAST(N'2023-12-04' AS Date), 320, 4009400, 460250, 3549150, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1024, 3, 1, 1, CAST(N'2023-12-04' AS Date), 382, 2500, 125, 2375, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1025, 3, 1, 1, CAST(N'2023-12-04' AS Date), 103, 17200, 750, 16450, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1026, 3, 1, 1, CAST(N'2023-12-04' AS Date), 282, 2200, 0, 2200, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1027, 3, 1, 1, CAST(N'2023-12-04' AS Date), 326, 4006900, 460125, 3546775, 3)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[point] ON 

INSERT [dbo].[point] ([id], [name], [photo]) VALUES (1, N'Пункт выдачи 1', N'/photo/point.jpg')
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (2, N'Пункт выдачи 1', N'/photo/point2.jpg')
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (3, N'Пункт выдачи 3', NULL)
SET IDENTITY_INSERT [dbo].[point] OFF
GO
SET IDENTITY_INSERT [dbo].[sostav] ON 

INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (2, 2, 2, 1, NULL, NULL, NULL)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (3, 3, 3, 1, NULL, NULL, NULL)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (4, 1004, 1, 1, 1, NULL, NULL)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (5, 1004, 4005, 1, 1, NULL, NULL)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (6, 1005, 1, 1, 1, NULL, NULL)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (7, 1005, 2, 1, 1, NULL, NULL)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (8, 1005, 4005, 1, 1, NULL, NULL)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (9, 1005, 8, 1, 1, NULL, NULL)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (10, 1012, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (11, 1013, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (12, 1013, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (13, 1013, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (14, 1013, 4, 1, 1, 7000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (15, 1014, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (16, 1014, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (17, 1014, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (18, 1015, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (19, 1015, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (20, 1016, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (21, 1017, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (22, 1017, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (23, 1017, 5, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (24, 1018, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (25, 1018, 8, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (26, 1018, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (27, 1018, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (28, 1018, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (29, 1019, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (30, 1019, 8, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (31, 1020, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (32, 1020, 8, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (33, 1020, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (34, 1020, 8, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (35, 1020, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (36, 1020, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (37, 1020, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (38, 1020, 8, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (39, 1020, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (40, 1021, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (41, 1021, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (42, 1022, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (43, 1022, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (44, 1022, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (45, 1022, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (46, 1022, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (47, 1022, 8, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (48, 1023, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (49, 1023, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (50, 1023, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (51, 1023, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (52, 1023, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (53, 1023, 8, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (54, 1023, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (55, 1023, 8, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (56, 1024, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (57, 1025, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (58, 1025, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (59, 1025, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (60, 1025, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (61, 1025, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (62, 1025, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (63, 1025, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (64, 1026, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (65, 1027, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (66, 1027, 8, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (67, 1027, 1, 1, 1, 2200, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (68, 1027, 2, 1, 1, 2500, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (69, 1027, 4005, 1, 1, 1000000, 23)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (70, 1027, 8, 1, 1, 1000000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (71, 1027, 1, 1, 1, 2200, 0)
SET IDENTITY_INSERT [dbo].[sostav] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([id], [status_name]) VALUES (1, N'новый')
INSERT [dbo].[status] ([id], [status_name]) VALUES (2, N'в работе')
INSERT [dbo].[status] ([id], [status_name]) VALUES (3, N'доставляется')
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[type_user] ON 

INSERT [dbo].[type_user] ([id], [role]) VALUES (1, N'Администратор')
INSERT [dbo].[type_user] ([id], [role]) VALUES (2, N'Менеджер')
INSERT [dbo].[type_user] ([id], [role]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[type_user] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (1, N'dozopravka', N'12345', N'Евгений', N'/Res/dp.png', 1)
INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (2, N'1groznya_wars1', N'12345', N'Эрик', N'/Res/1g_w1.png', 2)
INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (3, N'client', N'12345', N'Имя', N'/Res/user.png', 3)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[LoginHistory]  WITH CHECK ADD FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_point] FOREIGN KEY([id_point])
REFERENCES [dbo].[point] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_point]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_orders] FOREIGN KEY([id_orders])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_orders]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_user] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_user] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_user]
GO
USE [master]
GO
ALTER DATABASE [bookclub] SET  READ_WRITE 
GO
