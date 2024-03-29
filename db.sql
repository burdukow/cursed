USE [cursed]
GO
/****** Object:  Table [dbo].[Components]    Script Date: 28 Feb 2024 21:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Components](
	[IdComponent] [int] NOT NULL,
	[ComponentModel] [nvarchar](max) NOT NULL,
	[ComponentPrice] [decimal](19, 2) NOT NULL,
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
/****** Object:  Table [dbo].[ComponentTypes]    Script Date: 28 Feb 2024 21:23:40 ******/
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
/****** Object:  Table [dbo].[Computer_Component_Relationship]    Script Date: 28 Feb 2024 21:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computer_Component_Relationship](
	[PC_Comp_RelationId] [int] IDENTITY(1,1) NOT NULL,
	[ComputerId] [int] NOT NULL,
	[ComponentId] [int] NOT NULL,
 CONSTRAINT [PK_Computer_Component_Relationship] PRIMARY KEY CLUSTERED 
(
	[PC_Comp_RelationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Computers]    Script Date: 28 Feb 2024 21:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computers](
	[ComputerId] [int] IDENTITY(1,1) NOT NULL,
	[ComputerName] [nvarchar](50) NOT NULL,
	[ComputerTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Computers] PRIMARY KEY CLUSTERED 
(
	[ComputerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComputerTypes]    Script Date: 28 Feb 2024 21:23:40 ******/
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
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 28 Feb 2024 21:23:40 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 28 Feb 2024 21:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[MasterId] [int] NOT NULL,
	[OrderDescription] [nvarchar](300) NOT NULL,
	[ComponentId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[OrderExecDate] [date] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 28 Feb 2024 21:23:40 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 28 Feb 2024 21:23:40 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 28 Feb 2024 21:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
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
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (1, N'Ryzen 5 3600', CAST(5000.00 AS Decimal(19, 2)), 5347, N'100-000000031', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (2, N'Ryzen Threadripper PRO 5995WX', CAST(654328.00 AS Decimal(19, 2)), 23, N'100-000000444', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (3, N'Core i9-10980XE', CAST(140654.00 AS Decimal(19, 2)), 13, N'BX8069510980XE-SRGSG', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (4, N'Core i5-12400F', CAST(15496.00 AS Decimal(19, 2)), 5613, N'CM8071504650609-SRL5Z', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (5, N'Ryzen 5 7500F', CAST(20428.00 AS Decimal(19, 2)), 1234, N'100-000000597', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (6, N'Core i3-12100F', CAST(10452.00 AS Decimal(19, 2)), 5466, N'CM8071504651013-SRL63', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (7, N'Ryzen 3 3200G', CAST(5278.00 AS Decimal(19, 2)), 4176, N'YD3200C5FH', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (8, N'FX-4300', CAST(1778.00 AS Decimal(19, 2)), 1717, N'FD4300WMW4MHK', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (9, N'Ryzen Threadripper PRO 7995WX', CAST(1675127.00 AS Decimal(19, 2)), 0, N'100-000000884', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (10, N'Core Ultra 9 185H', CAST(68132.00 AS Decimal(19, 2)), 3, N'LP891695654898-SIRGA', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (11, N'Ryzen 7 7735U', CAST(31044.00 AS Decimal(19, 2)), 6, N'100-000000987', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (12, N'Ryzen 3 7320C', CAST(15631.00 AS Decimal(19, 2)), 9, N'100-000000774', 1, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (13, N'Core i3-1305U', CAST(6566.00 AS Decimal(19, 2)), 7, N'X1404VA-EB182', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (14, N'Celeron N5100', CAST(1243.00 AS Decimal(19, 2)), 109, N'CLRN-N51JSSHT', 2, 1)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (15, N'MEG Z790 GODLIKE', CAST(150689.00 AS Decimal(19, 2)), 20, N'981V-26901', 5, 2)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (16, N'B450M K', CAST(7075.00 AS Decimal(19, 2)), 782, N'GB-15WGMK', 4, 2)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (17, N'B760 Pro RS', CAST(16959.00 AS Decimal(19, 2)), 178, N'ASGF-2356G', 3, 2)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (18, N'TUF GAMING Z790-PLUS WIFI', CAST(30556.00 AS Decimal(19, 2)), 65, N'GAQ-1337', 15, 2)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (19, N'NVidia GeForce RTX 9090 TiSuperXTX', CAST(999999.00 AS Decimal(19, 2)), 95, N'NKLL-NUFF9', 7, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (20, N'AMD Radeon 9999XFTX', CAST(65468.00 AS Decimal(19, 2)), 89, N'LJKH-KLJHLK667', 6, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (21, N'3dfx Woodoo 5', CAST(176173.00 AS Decimal(19, 2)), 92, N'JKLHH-643FX', 4, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (22, N'NVidia GeForce GT1010', CAST(2095.00 AS Decimal(19, 2)), 98, N'LKJ-126GB', 3, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (23, N'AMD Radeon FX6021', CAST(1720.00 AS Decimal(19, 2)), 46, N'SKOLK-165GQA', 5, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (24, N'AMD Fakeon GL6516', CAST(9135.50 AS Decimal(19, 2)), 64, N'LA-10000-111', 1, 3)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (25, N'Predatel 15B 16G', CAST(9841.00 AS Decimal(19, 2)), 566, N'PRD3200-16G', 8, 4)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (26, N'Furry 169GF', CAST(5356.00 AS Decimal(19, 2)), 908, N'LFAK0-11199', 9, 4)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (27, N'GigaCHD-128T', CAST(98426.00 AS Decimal(19, 2)), 2, N'GIGAGA9999GA-125BW', 15, 4)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (28, N'SSHD SV3001500', CAST(9841.00 AS Decimal(19, 2)), 546, N'UV3000-5000-400', 8, 5)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (29, N'SSD O151HK ULTRA', CAST(99876.00 AS Decimal(19, 2)), 23, N'NVDA-4Q-U', 9, 5)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (30, N'HHD KKJJ2H-15TB', CAST(6535.00 AS Decimal(19, 2)), 843, N'JAJJ-1111', 13, 5)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (31, N'SSD WE556A', CAST(8956.00 AS Decimal(19, 2)), 390, N'AJKOLJ-1781', 10, 5)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (32, N'OKHKADITEL', CAST(6541.00 AS Decimal(19, 2)), 516, N'DL9-ARBU-ZA', 11, 6)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (33, N'ZH AR2', CAST(91685.00 AS Decimal(19, 2)), 45, N'LQ-1GHR327', 15, 6)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (34, N'GSS27', CAST(5594.00 AS Decimal(19, 2)), 92, N'NHR590', 10, 6)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (35, N'PNR1285', CAST(6562.00 AS Decimal(19, 2)), 543, N'SJKEJ3', 14, 7)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (36, N'GACH1K', CAST(50575.00 AS Decimal(19, 2)), 16, N'AJ2H38990', 13, 7)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (37, N'MOTHERLODE', CAST(9999999.00 AS Decimal(19, 2)), 65, N'5GYHY3ER', 10, 7)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (38, N'HN49LG', CAST(56616.00 AS Decimal(19, 2)), 99, N'5649FGKJK11', 12, 7)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (39, N'J5KRH38', CAST(10969.00 AS Decimal(19, 2)), 561, N'EHJTJS999', 14, 7)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (40, N'WiFi-BAD56', CAST(16968.00 AS Decimal(19, 2)), 98, N'Eth-1S-G00D', 17, 8)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (41, N'K100-1GG', CAST(5921.00 AS Decimal(19, 2)), 46, N'NoS4und', 16, 8)
INSERT [dbo].[Components] ([IdComponent], [ComponentModel], [ComponentPrice], [ComponentAmount], [ComponentArticle], [ComponentManufacturerId], [ComponentTypeId]) VALUES (42, N'JHUJI55', CAST(6512.00 AS Decimal(19, 2)), 613, N'JigSaw1', 18, 9)
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
SET IDENTITY_INSERT [dbo].[Computer_Component_Relationship] ON 

INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (1, 1, 1)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (2, 1, 18)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (3, 1, 20)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (4, 1, 31)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (5, 1, 25)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (6, 1, 32)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (7, 1, 36)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (8, 1, 40)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (9, 1, 42)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (10, 2, 3)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (11, 2, 17)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (12, 2, 20)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (13, 2, 25)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (14, 2, 28)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (15, 2, 33)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (16, 2, 35)
INSERT [dbo].[Computer_Component_Relationship] ([PC_Comp_RelationId], [ComputerId], [ComponentId]) VALUES (17, 2, 41)
SET IDENTITY_INSERT [dbo].[Computer_Component_Relationship] OFF
GO
SET IDENTITY_INSERT [dbo].[Computers] ON 

INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (1, N'Destroyer ', 1)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (2, N'TechnoMage', 1)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (3, N'DigitalDragon', 1)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (4, N'VirtMaster', 1)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (5, N'BSOD', 1)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (6, N'Workforce One', 2)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (7, N'Business Machine', 2)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (8, N'Workhorse', 2)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (9, N'The Brain', 2)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (10, N'Productivity Engine', 2)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (11, N'Engine', 3)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (12, N'Accelerator', 3)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (13, N'NG+', 3)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (14, N'Architect', 3)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (15, N'Da Vinci', 3)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (16, N'DigitalDragon M', 4)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (17, N'Beast', 4)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (18, N'Titan', 4)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (19, N'Doomsday', 4)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (20, N'4 Horsemen of the Apocalypse', 4)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (21, N'Innovator', 5)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (22, N'Negotiator', 5)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (23, N'Dealmaker', 5)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (24, N'EliteBook', 5)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (25, N'SwiftBook', 5)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (26, N'Future', 6)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (27, N'Da Vinci M', 6)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (28, N'DigitalDragon Super M', 6)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (29, N'Unstoppable', 6)
INSERT [dbo].[Computers] ([ComputerId], [ComputerName], [ComputerTypeId]) VALUES (30, N'MacPad Pro', 6)
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
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
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
ALTER TABLE [dbo].[Computer_Component_Relationship]  WITH CHECK ADD  CONSTRAINT [FK_Computer_Component_Relationship_Components] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[Components] ([IdComponent])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Computer_Component_Relationship] CHECK CONSTRAINT [FK_Computer_Component_Relationship_Components]
GO
ALTER TABLE [dbo].[Computer_Component_Relationship]  WITH CHECK ADD  CONSTRAINT [FK_Computer_Component_Relationship_Computers] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computers] ([ComputerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Computer_Component_Relationship] CHECK CONSTRAINT [FK_Computer_Component_Relationship_Computers]
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatuses] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatuses] ([IdOrderStatus])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatuses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([IdUser])
ON UPDATE CASCADE
ON DELETE CASCADE
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
