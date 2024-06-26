USE [master]
GO
/****** Object:  Database [cursed]    Script Date: 02.06.2024 12:10:42 ******/
CREATE DATABASE [cursed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cursed', FILENAME = N'C:\Users\norek\cursed.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cursed_log', FILENAME = N'C:\Users\norek\cursed_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cursed] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cursed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cursed] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cursed] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cursed] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cursed] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cursed] SET ARITHABORT OFF 
GO
ALTER DATABASE [cursed] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cursed] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cursed] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cursed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cursed] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cursed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cursed] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cursed] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cursed] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cursed] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cursed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cursed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cursed] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cursed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cursed] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cursed] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cursed] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cursed] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cursed] SET  MULTI_USER 
GO
ALTER DATABASE [cursed] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cursed] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cursed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cursed] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cursed] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cursed] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [cursed] SET QUERY_STORE = OFF
GO
USE [cursed]
GO
/****** Object:  Table [dbo].[Components]    Script Date: 02.06.2024 12:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Components](
	[IdComponent] [int] IDENTITY(1,1) NOT NULL,
	[ComponentModel] [nvarchar](max) NOT NULL,
	[ComponentPrice] [float] NOT NULL,
	[ComponentAmount] [int] NOT NULL,
	[ComponentArticle] [nvarchar](50) NOT NULL,
	[ComponentManufacturerId] [int] NOT NULL,
	[ComponentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Components] PRIMARY KEY CLUSTERED 
(
	[IdComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentTypes]    Script Date: 02.06.2024 12:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentTypes](
	[IdComponentType] [int] IDENTITY(1,1) NOT NULL,
	[ComponentTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ComponentTypes] PRIMARY KEY CLUSTERED 
(
	[IdComponentType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComputerComponentRelationship]    Script Date: 02.06.2024 12:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComputerComponentRelationship](
	[PC_Comp_RelationId] [int] IDENTITY(1,1) NOT NULL,
	[ComputerId] [int] NOT NULL,
	[ComponentId] [int] NOT NULL,
 CONSTRAINT [PK_Computer_Component_Relationship] PRIMARY KEY CLUSTERED 
(
	[PC_Comp_RelationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Computers]    Script Date: 02.06.2024 12:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computers](
	[ComputerId] [int] IDENTITY(1,1) NOT NULL,
	[ComputerName] [nvarchar](50) NOT NULL,
	[ComputerTypeId] [int] NOT NULL,
	[ComputerPicPath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Computers] PRIMARY KEY CLUSTERED 
(
	[ComputerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComputerTypes]    Script Date: 02.06.2024 12:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComputerTypes](
	[IdComputerType] [int] IDENTITY(1,1) NOT NULL,
	[ComputerTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ComputerTypes] PRIMARY KEY CLUSTERED 
(
	[IdComputerType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 02.06.2024 12:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[IdManufacturer] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[IdManufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02.06.2024 12:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [int] NULL,
	[OrderDescription] [nvarchar](300) NOT NULL,
	[ComponentId] [int] NOT NULL,
	[ComputerId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[OrderExecDate] [date] NULL,
	[OrderCode] [nvarchar](6) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 02.06.2024 12:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[IdOrderStatus] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[IdOrderStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02.06.2024 12:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02.06.2024 12:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Components] ON 

INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (1, N'Ryzen 5 3600', 5000, 8285, N'100-000000031', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (2, N'Ryzen Threadripper PRO 5995WX', 654328, 23, N'100-000000444', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (3, N'Core i9-10980XE', 140654, 13, N'BX8069510980XE-SRGSG', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (4, N'Core i5-12400F', 15496, 5613, N'CM8071504650609-SRL5Z', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (5, N'Ryzen 5 7500F', 20428, 1234, N'100-000000597', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (6, N'Core i3-12100F', 10452, 5466, N'CM8071504651013-SRL63', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (7, N'Ryzen 3 3200G', 5278, 4176, N'YD3200C5FH', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (8, N'FX-4300', 1778, 1717, N'FD4300WMW4MHK', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (9, N'Ryzen Threadripper PRO 7995WX', 1675127, 0, N'100-000000884', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (10, N'Core Ultra 9 185H', 68132, 3, N'LP891695654898-SIRGA', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (11, N'Ryzen 7 7735U', 31044, 6, N'100-000000987', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (12, N'Ryzen 3 7320C', 15631, 9, N'100-000000774', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (13, N'Core i3-1305U', 6566, 7, N'X1404VA-EB182', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (14, N'Celeron N5100', 1243, 109, N'CLRN-N51JSSHT', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (15, N'MEG Z790 GODLIKE', 150689, 20, N'981V-26901', 5, 2)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (16, N'B450M K', 7075, 782, N'GB-15WGMK', 4, 2)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (17, N'B760 Pro RS', 16959, 178, N'ASGF-2356G', 3, 2)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (18, N'TUF GAMING Z790-PLUS WIFI', 30556, 65, N'GAQ-1337', 15, 2)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (19, N'NVidia GeForce RTX 9090 TiSuperXTX', 555, 95, N'NKLL-NUFF9', 7, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (20, N'AMD Radeon 9999XFTX', 65468, 89, N'LJKH-KLJHLK667', 6, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (21, N'3dfx Woodoo 5', 176173, 92, N'JKLHH-643FX', 4, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (22, N'NVidia GeForce GT1010', 2095, 98, N'LKJ-126GB', 3, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (23, N'AMD Radeon FX6021', 1720, 46, N'SKOLK-165GQA', 5, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (24, N'AMD Fakeon GL6516', 9135.5, 64, N'LA-10000-111', 1, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (25, N'Predatel 15B 16G', 9841, 566, N'PRD3200-16G', 8, 4)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (26, N'Furry 169GF', 5356, 908, N'LFAK0-11199', 9, 4)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (27, N'GigaCHD-128T', 98426, 2, N'GIGAGA9999GA-125BW', 15, 4)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (28, N'SSHD SV3001500', 9841, 5, N'UV3000-5000-400', 8, 5)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (29, N'SSD O151HK ULTRA', 99876, 23, N'NVDA-4Q-U', 9, 5)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (30, N'HHD KKJJ2H-15TB', 6535, 843, N'JAJJ-1111', 13, 5)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (31, N'SSD WE556A', 8956, 390, N'AJKOLJ-1781', 10, 5)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (32, N'OKHKADITEL', 6541, 516, N'DL9-ARBU-ZA', 11, 6)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (33, N'ZH AR2', 91685, 45, N'LQ-1GHR327', 15, 6)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (34, N'GSS27', 5594, 92, N'NHR590', 10, 6)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (35, N'PNR1285', 6562, 543, N'SJKEJ3', 14, 7)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (36, N'GACH1K', 50575, 16, N'AJ2H38990', 13, 7)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (37, N'MOTHERLODE', 999, 65, N'5GYHY3ER', 10, 7)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (38, N'HN49LG', 56616, 99, N'5649FGKJK11', 12, 7)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (39, N'J5KRH38', 10969, 561, N'EHJTJS999', 14, 7)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (40, N'WiFi-BAD56', 16968, 98, N'Eth-1S-G00D', 17, 8)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (41, N'K100-1GG', 5921, 46, N'NoS4und', 16, 8)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (45, N'test', 15666, 26, N'some-text15262h', 21, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (1045, N'Test Component', 1000, 1, N'TestArticle', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (1046, N'Test Component', 1000, 1, N'TestArticle', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (1047, N'Test Component', 1000, 1, N'TestArticle', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (1048, N'Test Component', 1000, 1, N'TestArticle', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (2045, N'Test Component', 1000, 1, N'TestArticle', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (2046, N'Test Component', 1000, 1, N'TestArticle', 1, 1)
SET IDENTITY_INSERT [dbo].[Components] OFF
GO
SET IDENTITY_INSERT [dbo].[ComponentTypes] ON 

INSERT [dbo].[ComponentTypes] ([IdComponentType], [ComponentTypeName]) VALUES (1, N'Процессор')
INSERT [dbo].[ComponentTypes] ([IdComponentType], [ComponentTypeName]) VALUES (2, N'Материнская плата')
INSERT [dbo].[ComponentTypes] ([IdComponentType], [ComponentTypeName]) VALUES (3, N'Видеокарта')
INSERT [dbo].[ComponentTypes] ([IdComponentType], [ComponentTypeName]) VALUES (4, N'Оперативная память')
INSERT [dbo].[ComponentTypes] ([IdComponentType], [ComponentTypeName]) VALUES (5, N'Накопители')
INSERT [dbo].[ComponentTypes] ([IdComponentType], [ComponentTypeName]) VALUES (6, N'Кулер для процессора')
INSERT [dbo].[ComponentTypes] ([IdComponentType], [ComponentTypeName]) VALUES (7, N'Блок питания')
INSERT [dbo].[ComponentTypes] ([IdComponentType], [ComponentTypeName]) VALUES (8, N'Сетевая карта')
INSERT [dbo].[ComponentTypes] ([IdComponentType], [ComponentTypeName]) VALUES (9, N'Звуковая карта')
SET IDENTITY_INSERT [dbo].[ComponentTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ComputerComponentRelationship] ON 

INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (1, 1, 1)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (2, 1, 18)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (3, 1, 20)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (4, 1, 31)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (5, 1, 25)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (6, 1, 32)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (7, 1, 36)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (8, 1, 40)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (10, 2, 3)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (11, 2, 17)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (12, 2, 20)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (13, 2, 25)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (14, 2, 28)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (15, 2, 33)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (16, 2, 35)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (17, 2, 41)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (18, 3, 11)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (19, 3, 17)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (20, 3, 21)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (21, 3, 25)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (22, 3, 29)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (23, 3, 33)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (24, 3, 37)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (25, 4, 12)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (26, 4, 18)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (27, 4, 22)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (28, 4, 26)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (29, 4, 30)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (30, 4, 34)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (31, 4, 38)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (32, 5, 13)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (33, 5, 19)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (34, 5, 23)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (35, 5, 27)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (36, 5, 31)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (37, 5, 35)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (38, 5, 39)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (39, 6, 14)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (40, 6, 20)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (41, 6, 24)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (42, 6, 28)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (43, 6, 32)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (44, 6, 36)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (45, 6, 40)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (46, 7, 15)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (47, 7, 21)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (48, 7, 25)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (49, 7, 29)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (50, 7, 33)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (51, 7, 37)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (52, 7, 41)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (53, 8, 16)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (54, 8, 22)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (55, 8, 26)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (56, 8, 30)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (57, 8, 34)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (58, 8, 38)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (60, 9, 17)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (61, 9, 23)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (62, 9, 27)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (63, 9, 31)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (64, 9, 35)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (65, 9, 39)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (67, 10, 18)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (68, 10, 24)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (69, 10, 28)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (70, 10, 32)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (71, 10, 36)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (72, 10, 40)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (1073, 1031, 3)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (1074, 1031, 15)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (1075, 1031, 19)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (1076, 1031, 25)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (1077, 1031, 28)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (1078, 1031, 32)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (1079, 1031, 36)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (2073, 1, 1045)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (2074, 1, 1045)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (2075, 1, 1045)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (2076, 1, 1045)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (3073, 1, 1045)
INSERT [dbo].[ComputerComponentRelationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (3074, 1, 1045)
SET IDENTITY_INSERT [dbo].[ComputerComponentRelationship] OFF
GO
SET IDENTITY_INSERT [dbo].[Computers] ON 

INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (1, N'Destroyer ', 1, N'https://i.ibb.co/4dqp17N/destroyer.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (2, N'TechnoMage', 1, N'https://i.ibb.co/wwJ3ZH3/technomage.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (3, N'DigitalDragon', 1, N'https://i.ibb.co/gvbrPF8/digitaldragon.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (4, N'VirtMaster', 1, N'https://i.ibb.co/1v3VszK/virtmaster.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (5, N'BSOD', 1, N'https://i.ibb.co/mGDMCTr/bsod.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (6, N'Workforce One', 2, N'https://i.ibb.co/Prk0b1P/workforceone.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (7, N'Business Machine', 2, N'https://i.ibb.co/CHRcJgj/businessmachine.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (8, N'Workhorse', 2, N'https://i.ibb.co/5K5NRKX/workhorse.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (9, N'The Brain', 2, N'https://i.ibb.co/wKRmkPY/thebrain.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (10, N'Productivity Engine', 2, N'https://i.ibb.co/zfBw092/productivityengine.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (11, N'Engine', 3, N'engine.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (12, N'Accelerator', 3, N'accelerator.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (13, N'NG+', 3, N'ngplus.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (14, N'Architect', 3, N'architect.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (15, N'Da Vinci', 3, N'davinci.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (16, N'DigitalDragon M', 4, N'digitaldragonm.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (17, N'Beast', 4, N'beast.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (18, N'Titan', 4, N'titan.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (19, N'Doomsday', 4, N'doomsday.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (20, N'4 Horsemen of the Apocalypse', 4, N'horsemen.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (21, N'Innovator', 5, N'innovator.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (22, N'Negotiator', 5, N'negotiator.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (23, N'Dealmaker', 5, N'dealmaker.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (24, N'EliteBook', 5, N'elitebook.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (25, N'SwiftBook', 5, N'swiftbook.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (26, N'Future', 6, N'future.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (27, N'Da Vinci M', 6, N'davincim.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (28, N'DigitalDragon Super M', 6, N'digitaldragonsuperm.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (29, N'Unstoppable', 6, N'unstoppable.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (30, N'MacPad Pro', 6, N'macpad.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (1031, N'Ноутбуки Игровые', 4, N'https://i.ibb.co/mTjxq0V/digital-cloud-data-storage-digital-concept-cloudscape-digital-online-service-global-network-database.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (2031, N'Test Computer', 1, N'test.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (2032, N'', 1, N'test.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (2033, N'Test Computer', 1, N'test.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (3031, N'Test Computer', 1, N'test.jpg')
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId], [ComputerPicPath]) VALUES (3032, N'Test Computer', 1, N'test.jpg')
SET IDENTITY_INSERT [dbo].[Computers] OFF
GO
SET IDENTITY_INSERT [dbo].[ComputerTypes] ON 

INSERT [dbo].[ComputerTypes] ([IdComputerType], [ComputerTypeName]) VALUES (1, N'Стационарные Игровые')
INSERT [dbo].[ComputerTypes] ([IdComputerType], [ComputerTypeName]) VALUES (2, N'Стационарные Офисные')
INSERT [dbo].[ComputerTypes] ([IdComputerType], [ComputerTypeName]) VALUES (3, N'Стационарные Професиональные')
INSERT [dbo].[ComputerTypes] ([IdComputerType], [ComputerTypeName]) VALUES (4, N'Ноутбуки Игровые')
INSERT [dbo].[ComputerTypes] ([IdComputerType], [ComputerTypeName]) VALUES (5, N'Ноутбуки Офисные')
INSERT [dbo].[ComputerTypes] ([IdComputerType], [ComputerTypeName]) VALUES (6, N'Ноутбуки Профессиональные')
SET IDENTITY_INSERT [dbo].[ComputerTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 

INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (1, N'AMD')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (2, N'Intel')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (3, N'Asrock')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (4, N'Gigabyte')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (5, N'MSI')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (6, N'Sapphire')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (7, N'Palit')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (8, N'ADATA')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (9, N'HyperX')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (10, N'DeepCool')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (11, N'AeroCool')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (12, N'IDCooling')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (13, N'Cougar')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (14, N'FSP')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (15, N'ASUS')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (16, N'TP-Link')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (17, N'Mikrotik')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (18, N'BEHRINGER')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (19, N'test')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (20, N'JBzzz')
INSERT [dbo].[Manufacturers] ([IdManufacturer], [ManufacturerName]) VALUES (21, N'Мало было')
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (3, 1, N'АААААААААААА', 5, 3, 3, CAST(N'2024-06-02' AS Date), N'XcHgk1')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (4, 2, N'Блок питания не работает :(', 7, 5, 3, CAST(N'2024-06-02' AS Date), N'K4uaCt')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (5, 2, N'Её нет!!!', 9, 5, 5, CAST(N'2024-06-02' AS Date), N'3yX4sR')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (1007, 2, N'НАКОПИТЕ МНЕ ПОЖАЛУЙСТА НА МАШИНУ', 28, 20, 5, CAST(N'2024-06-02' AS Date), N'F1rdyQ')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (1008, 2, N'Удивительно, но BSOD кидает BSOD. При просмотре температур во время рендеринга сцены в Blender пиковые температуры достигают 120°, а напряжение видеокарты прыгает до пятисот ватт. пробки вырубает)', 19, 5, 6, CAST(N'2024-06-02' AS Date), N'F1rdyп')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (1009, NULL, N'ЛОШАДКА ИГОГО ПОНИ ИГОГО А ОСЛИК НЕ ИГОГО ОСЛИК ИИИИААААА ИИИИААААА', 25, 6, 4, NULL, N'RRRRRR')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (1010, NULL, N'test', 19, 5, 4, NULL, N'KKKKKK')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (1011, NULL, N'testr', 19, 5, 4, NULL, N'bL1pzx')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (1012, NULL, N'slomalos ;(', 19, 8, 4, NULL, N'eOkhQt')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (2008, NULL, N'блин ну блин чёта пыхнуло блин и всё блин потухло блин', 35, 4, 4, NULL, N'UfcqOV')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (2009, NULL, N'Problema', 1, 5, 4, NULL, N'hXUig0')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (2010, NULL, N'Problema', 1, 5, 4, NULL, N'dtmHCr')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (2011, NULL, N'Problema', 1, 5, 4, NULL, N'9x2BKB')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (3008, 2, N'шошгчвршытвшоытвп', 19, 8, 4, CAST(N'2024-06-02' AS Date), N'Sw9ewX')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (4008, 1, N'Кулер крутится только если его "Подтолкнуть"', 32, 4, 3, CAST(N'2024-06-02' AS Date), N'mIDmYl')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (5008, NULL, N'Problema', 1, 5, 4, NULL, N'SLchUS')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (5009, NULL, N'Problema', 1, 5, 4, NULL, N'CZeP1Z')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (5010, NULL, N'Problema', 1, 5, 4, NULL, N'OgqzvW')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (6008, NULL, N'Problema', 1, 5, 4, NULL, N'GnKesb')
INSERT [dbo].[Orders] ([IdOrder], [MasterId], [OrderDescription], [ComponentId], [ComputerId], [OrderStatusId], [OrderExecDate], [OrderCode]) VALUES (6009, NULL, N'Problema', 1, 5, 4, NULL, N'1WbWS1')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatuses] ON 

INSERT [dbo].[OrderStatuses] ([IdOrderStatus], [OrderStatusName]) VALUES (1, N'В работе')
INSERT [dbo].[OrderStatuses] ([IdOrderStatus], [OrderStatusName]) VALUES (2, N'Выполнен')
INSERT [dbo].[OrderStatuses] ([IdOrderStatus], [OrderStatusName]) VALUES (3, N'Ожидание комплектующих')
INSERT [dbo].[OrderStatuses] ([IdOrderStatus], [OrderStatusName]) VALUES (4, N'В обработке')
INSERT [dbo].[OrderStatuses] ([IdOrderStatus], [OrderStatusName]) VALUES (5, N'Отменён')
INSERT [dbo].[OrderStatuses] ([IdOrderStatus], [OrderStatusName]) VALUES (6, N'Готов, ожидает клиента')
SET IDENTITY_INSERT [dbo].[OrderStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IdRole], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([IdRole], [RoleName]) VALUES (2, N'Master')
INSERT [dbo].[Roles] ([IdRole], [RoleName]) VALUES (3, N'Manager')
INSERT [dbo].[Roles] ([IdRole], [RoleName]) VALUES (4, N'Client')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IdUser], [LastName], [FirstName], [Patronymic], [Email], [Login], [Password], [RoleId]) VALUES (1, N'Админ', N'Админович', N'Админов', N'admin@example.com', N'admin', N'admin', 1)
INSERT [dbo].[Users] ([IdUser], [LastName], [FirstName], [Patronymic], [Email], [Login], [Password], [RoleId]) VALUES (2, N'Мастер', N'Мастерович', N'Мастеров', N'master@example.com', N'master', N'master', 2)
INSERT [dbo].[Users] ([IdUser], [LastName], [FirstName], [Patronymic], [Email], [Login], [Password], [RoleId]) VALUES (3, N'Менеджер', N'Менеджерович', N'Менеджеров', N'manager@example.com', N'manager', N'manager', 3)
INSERT [dbo].[Users] ([IdUser], [LastName], [FirstName], [Patronymic], [Email], [Login], [Password], [RoleId]) VALUES (4, N'Клиент', N'Клиентов', N'Клиентович', N'client@example.com', N'client', N'client', 4)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Components]  WITH CHECK ADD  CONSTRAINT [FK_Components_ComponentTypes] FOREIGN KEY([ComponentTypeId])
REFERENCES [dbo].[ComponentTypes] ([IdComponentType])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Components] CHECK CONSTRAINT [FK_Components_ComponentTypes]
GO
ALTER TABLE [dbo].[Components]  WITH CHECK ADD  CONSTRAINT [FK_Components_Manufacturers] FOREIGN KEY([ComponentManufacturerId])
REFERENCES [dbo].[Manufacturers] ([IdManufacturer])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Components] CHECK CONSTRAINT [FK_Components_Manufacturers]
GO
ALTER TABLE [dbo].[ComputerComponentRelationship]  WITH CHECK ADD  CONSTRAINT [FK_Computer_Component_Relationship_Components] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[Components] ([IdComponent])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComputerComponentRelationship] CHECK CONSTRAINT [FK_Computer_Component_Relationship_Components]
GO
ALTER TABLE [dbo].[ComputerComponentRelationship]  WITH CHECK ADD  CONSTRAINT [FK_Computer_Component_Relationship_Computers] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computers] ([ComputerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComputerComponentRelationship] CHECK CONSTRAINT [FK_Computer_Component_Relationship_Computers]
GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_ComputerTypes] FOREIGN KEY([ComputerTypeId])
REFERENCES [dbo].[ComputerTypes] ([IdComputerType])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_ComputerTypes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Components] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[Components] ([IdComponent])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Components]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Computers] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computers] ([ComputerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Computers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatuses] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatuses] ([IdOrderStatus])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatuses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([IdRole])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [cursed] SET  READ_WRITE 
GO
