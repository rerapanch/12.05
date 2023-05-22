USE [master]
GO
/****** Object:  Database [Store]    Script Date: 16.05.2023 12:38:13 ******/
CREATE DATABASE [Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Store', FILENAME = N'C:\1\Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Store_log', FILENAME = N'C:\1\Store_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Store] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Store] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Store] SET RECOVERY FULL 
GO
ALTER DATABASE [Store] SET  MULTI_USER 
GO
ALTER DATABASE [Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Store', N'ON'
GO
ALTER DATABASE [Store] SET QUERY_STORE = OFF
GO
USE [Store]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 16.05.2023 12:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NOT NULL,
	[id_city] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](51) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[id_region] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[id_supplier] [int] NOT NULL,
	[price] [numeric](18, 2) NOT NULL,
	[quantity] [numeric](18, 3) NOT NULL,
	[date_of_delivery] [date] NOT NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markup]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[percent] [numeric](5, 2) NULL,
 CONSTRAINT [PK_Markup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurment]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Measurment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[id_category] [int] NULL,
	[price] [numeric](18, 2) NULL,
	[quantity] [numeric](18, 3) NULL,
	[id_producer] [int] NULL,
	[id_measurement] [int] NULL,
	[id_markup] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[id_country] [int] NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[price] [numeric](18, 2) NOT NULL,
	[quantity] [numeric](18, 3) NOT NULL,
	[date_of_sale] [date] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 16.05.2023 12:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (1, N'Садовая', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (2, N'Решильевская', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (3, N'Вильямса', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (4, N'Тополёва', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (5, N'Малая Арнаутская', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (6, N'Заболотного', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (7, N'Торговая', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (9, N'Новосельского', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (10, N'Ольгиевская', 1)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Хлебо-булочные')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Бакалея')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Мясные')
INSERT [dbo].[Category] ([id], [name]) VALUES (211, N'Молочные')
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (1, N'Одесса', 1)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (2, N'Киев', 2)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (3, N'Львов', 3)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (4, N'Харьков', 4)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (5, N'Николаев', 5)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (6, N'Texas City', 6)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (8, N'London', 9)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (9, N'Liverpool', 9)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (10, N'Prague', 10)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [name]) VALUES (1, N'Ukraine')
INSERT [dbo].[Country] ([id], [name]) VALUES (2, N'Germany')
INSERT [dbo].[Country] ([id], [name]) VALUES (3, N'France')
INSERT [dbo].[Country] ([id], [name]) VALUES (4, N'USA')
INSERT [dbo].[Country] ([id], [name]) VALUES (5, N'Czech Republic')
INSERT [dbo].[Country] ([id], [name]) VALUES (6, N'Great Britian')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (1, 1, 1, CAST(18.20 AS Numeric(18, 2)), CAST(100.000 AS Numeric(18, 3)), CAST(N'2022-05-05' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (2, 2, 3, CAST(19.20 AS Numeric(18, 2)), CAST(100.000 AS Numeric(18, 3)), CAST(N'2022-07-06' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (3, 3, 3, CAST(19.10 AS Numeric(18, 2)), CAST(250.000 AS Numeric(18, 3)), CAST(N'2022-09-07' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (4, 4, 4, CAST(19.10 AS Numeric(18, 2)), CAST(20.000 AS Numeric(18, 3)), CAST(N'2022-11-08' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (5, 5, 5, CAST(191.10 AS Numeric(18, 2)), CAST(201.000 AS Numeric(18, 3)), CAST(N'2022-12-09' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (6, 6, 6, CAST(191.10 AS Numeric(18, 2)), CAST(206.000 AS Numeric(18, 3)), CAST(N'2022-12-10' AS Date))
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Markup] ON 

INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (1, N'без наценки', CAST(0.00 AS Numeric(5, 2)))
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (2, N'1%', CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (3, N'2%', CAST(2.00 AS Numeric(5, 2)))
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (4, N'3%', CAST(3.00 AS Numeric(5, 2)))
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (5, N'4%', CAST(4.00 AS Numeric(5, 2)))
SET IDENTITY_INSERT [dbo].[Markup] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurment] ON 

INSERT [dbo].[Measurment] ([id], [name], [description]) VALUES (1, N'шт', N'штука')
INSERT [dbo].[Measurment] ([id], [name], [description]) VALUES (2, N'ящ', N'ящик')
INSERT [dbo].[Measurment] ([id], [name], [description]) VALUES (3, N'кг', N'килограмм')
INSERT [dbo].[Measurment] ([id], [name], [description]) VALUES (4, N'г', N'грамм')
INSERT [dbo].[Measurment] ([id], [name], [description]) VALUES (5, N'упк', N'упаковка')
SET IDENTITY_INSERT [dbo].[Measurment] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (1, N'Глав рыба', 4)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (2, N'Ферма', 6)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (3, N'Супер крупа', 10)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (4, N'Молокозавод №2', 9)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (5, N'Хлебзавод №5', 5)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (6, N'Фрукт постав', 2)
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (1, N'Кефир', 211, CAST(29.00 AS Numeric(18, 2)), CAST(10.000 AS Numeric(18, 3)), 2, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (2, N'Молоко', 211, CAST(32.00 AS Numeric(18, 2)), CAST(20.000 AS Numeric(18, 3)), 2, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (3, N'Йогурт', 211, CAST(19.00 AS Numeric(18, 2)), CAST(30.000 AS Numeric(18, 3)), 2, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (4, N'Свинина', 4, CAST(125.00 AS Numeric(18, 2)), CAST(40.000 AS Numeric(18, 3)), 3, 3, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (5, N'Говядина', 4, CAST(155.00 AS Numeric(18, 2)), CAST(50.000 AS Numeric(18, 3)), 3, 3, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (6, N'Баранина', 4, CAST(145.00 AS Numeric(18, 2)), CAST(60.000 AS Numeric(18, 3)), 3, 3, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (7, N'Ряженка', 211, CAST(35.00 AS Numeric(18, 2)), CAST(123.000 AS Numeric(18, 3)), 4, 3, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (8, N'Творог', 211, CAST(55.00 AS Numeric(18, 2)), CAST(234.000 AS Numeric(18, 3)), 4, 3, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (1, N'Одесская', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (2, N'Киевская', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (3, N'Львовская', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (4, N'Харьковская', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (5, N'Николаевская', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (6, N'Texas', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (9, N'England', 6)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (10, N'Prague', 5)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (1, 1, CAST(29.00 AS Numeric(18, 2)), CAST(123.000 AS Numeric(18, 3)), CAST(N'2022-12-22' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (2, 2, CAST(31.00 AS Numeric(18, 2)), CAST(234.000 AS Numeric(18, 3)), CAST(N'2022-10-23' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (3, 3, CAST(15.00 AS Numeric(18, 2)), CAST(345.000 AS Numeric(18, 3)), CAST(N'2022-08-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (4, 4, CAST(120.00 AS Numeric(18, 2)), CAST(456.000 AS Numeric(18, 3)), CAST(N'2022-06-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (5, 5, CAST(130.00 AS Numeric(18, 2)), CAST(567.000 AS Numeric(18, 3)), CAST(N'2022-04-26' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (6, 6, CAST(140.00 AS Numeric(18, 2)), CAST(678.000 AS Numeric(18, 3)), CAST(N'2022-12-27' AS Date))
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (1, N'Юж поставка', 7)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (3, N'Закуп универсал', 9)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (4, N'ТОВ Снабжение', 10)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (5, N'Супер закупка', 7)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (6, N'Снабд торг', 9)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Product]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Supplier] FOREIGN KEY([id_supplier])
REFERENCES [dbo].[Supplier] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Supplier]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Address]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Markup] FOREIGN KEY([id_markup])
REFERENCES [dbo].[Markup] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Markup]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Measurment] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurment] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Measurment]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
USE [master]
GO
ALTER DATABASE [Store] SET  READ_WRITE 
GO
