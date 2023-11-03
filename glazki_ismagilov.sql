USE [master]
GO
/****** Object:  Database [Glazki_Ismagilov]    Script Date: 03.11.2023 9:11:07 ******/
CREATE DATABASE [Glazki_Ismagilov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Glazki_Ismagilov', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Glazki_Ismagilov.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Glazki_Ismagilov_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Glazki_Ismagilov_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Glazki_Ismagilov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Glazki_Ismagilov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET ARITHABORT OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Glazki_Ismagilov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Glazki_Ismagilov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Glazki_Ismagilov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Glazki_Ismagilov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Glazki_Ismagilov] SET  MULTI_USER 
GO
ALTER DATABASE [Glazki_Ismagilov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Glazki_Ismagilov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Glazki_Ismagilov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Glazki_Ismagilov] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Glazki_Ismagilov] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Glazki_Ismagilov]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
	[DirectorName] [nvarchar](100) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 03.11.2023 9:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (1, 1, N'СервисПив', N'email: znosov@vasilev.ru', N'+7  (922) 325-12-93', N'', N'840377, Рязанская область, город Щёлково, пл. Бухарестская, 42', 329, N'Никита Александрович Королёв', N'6861024038', N'218034630')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (2, 1, N'СантехСеверЛенМашина', N'email: pgorbacev@vasilev.net', N'+7 (812) 214-73-94', N'\agents\agent_99.png', N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', 201, N'Павел Максимович Рожков', N'3506691089', N'830713603')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (3, 3, N'ЭлектроРемОрионЛизинг', N'email: anfisa.fedotova@tvetkov.ru', N' +7 (495) 513-93-16', N'\agents\agent_93.png', N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', 198, N'Тарасова Дан Львович', N'1340072597', N'500478249')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (4, 2, N'РыбАлмазГаражСнаб', N'diana.gorbunov@gromov.ru', N' +7 (35222) 46-54-74', N'\agents\agent_29.png', N'278792, Воронежская область, город Люберцы, ул. Космонавтов, 07', 50, N'Власов Ян Львович', N'2135119617', N'916748563')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (5, 5, N'CибБашкирТекстиль', N'vzimina@zdanova.com', N' +7 (35222) 92-28-68', N'\agents\agent_94.png', N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', 218, N'Григорий Владимирович Елисеева', N'7392007090', N'576103661')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (6, 4, N'ЮпитерТяжОрионЭкспедиция', N'gblokin@orlov.net', N'+7 (812) 819-51-58', N'\agents\agent_69.png', N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', 446, N'Валерий Евгеньевич Виноградов', N'6843174002', N'935556458')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (7, 4, N'КазаньТекстиль', N'osimonova@andreeva.com', N'+7  (922) 936-37-67', N'\agents\agent_72.png', N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', 156, N'Александров Бронислав Максимович', N'4584384019', N'149680499')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (8, 4, N'МясИнфоМясТраст', N'dgulyev@krasilnikov.ru', N' +7 (812) 375-59-29', N'\agents\agent_43.png', N'873144, Курская область, город Талдом, проезд Домодедовская, 46', 16, N'Лихачёваа Оксана Романовна', N'6387079446', N'113956342')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (9, 2, N'АвтоТомскЦементЦентр', N'kabanov.valentina@subbotina.ru', N'+7 (35222) 24-98-18', N'\agents\agent_40.png', N'282009, Вологодская область, город Красногорск, пл. Домодедовская, 14', 71, N'Леонид Иванович Афанасьева', N'8317739640', N'940326934')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (10, 6, N'Радио', N'rtretykova@kozlov.ru', N'+7 (35222) 84-44-92', N'\agents\agent_68.png', N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', 221, N'Эмма Андреевна Колесникова', N'9077613654', N'657690787')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (11, 4, N'ДизайнФинансМикро', N'email: varvara15@belousov.ru', N'+7 (495) 223-67-97', N'', N'775051, Иркутская область, город Серебряные Пруды, спуск Домодедовская, 41', 462, N'Кузьма Борисович Королёва', N'2700182907', N'141912770')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (12, 1, N'Креп', N'savina.dominika@belousova.com', N'+7 (495) 315-25-86', N'\agents\agent_64.png', N'336489, Калининградская область, город Можайск, наб. Славы, 35', 371, N'Назар Алексеевич Григорьева', N'4880732317', N'258673591')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (13, 6, N'ЖелДорДизайнМетизТраст', N'lnikitina@kulikova.com', N'8-800-692-72-18', N'', N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', 290, N'Игорь Львович Агафонова', N'7669116841', N'906390137')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (14, 5, N'Асбоцемент', N'email: antonin19@panfilov.ru', N' +7 (812) 152-28-78', N'\agents\agent_59.png', N'030119, Курганская область, город Дмитров, пер. Славы, 47', 273, N'Никитинаа Антонина Андреевна', N'1261407459', N'745921890')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (15, 6, N'Мобайл', N'email: rafail22@orlov.ru', N' +7 (495) 532-54-42', N'\agents\agent_53.png', N'273144, Калужская область, город Наро-Фоминск, бульвар Чехова, 70', 40, N'Горшков Кузьма Фёдорович', N'3655195522', N'395816585')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (16, 1, N'ТекстильУралАвтоОпт', N'hkononova@pavlova.ru', N'+7 (495) 418-67-55', N'\agents\agent_97.png', N'028936, Магаданская область, город Видное, ул. Гагарина, 54', 176, N'Алина Сергеевна Дьячковаа', N'3930950057', N'678529397')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (17, 3, N'Башкир', N'iskra.sergeev@zykov.com', N'8-800-656-63-99', N'\agents\agent_33.png', N'513065, Рязанская область, город Одинцово, шоссе Славы, 93', 35, N'Одинцова Розалина Дмитриевна', N'3105334340', N'117513650')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (18, 2, N'ГорДор', N'maiy12@koklov.net', N'+7 (812) 364-46-64', N'\agents\agent_77.png', N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', 175, N'Нонна Львовна Одинцоваа', N'7088187045', N'440309946')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (19, 5, N'Компания Рос', N'email: odenisov@knyzeva.ru', N' +7 (35222) 32-99-94', N'', N'479740, Оренбургская область, город Наро-Фоминск, наб. Будапештсткая, 36', 252, N'Алёна Ивановна Тимофеева', N'5502989807', N'518320454')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (20, 4, N'КазЮпитерТомск', N'tgavrilov@frolov.ru', N' +7 (35222) 24-85-54', N'\agents\agent_85.png', N'393450, Тульская область, город Кашира, пр. 1905 года, 47', 244, N'Рафаил Андреевич Копылов', N'9201745524', N'510248846')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (21, 6, N'СеверГаз', N'smukina@evseev.com', N'+7 (812) 973-88-81', N'\agents\agent_15.png', N'509479, Орловская область, город Павловский Посад, спуск Бухарестская, 28', 83, N'Валериан Андреевич Кириллова', N'7908427926', N'249521550')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (22, 5, N'Компания КазАлмаз', N'irina.gusina@vlasova.ru', N' +7  (922) 692-21-57', N'\agents\agent_105.png', N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', 396, N'Марк Фёдорович Муравьёва', N'3084797352', N'123190924')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (23, 4, N'ЦементАсбоцементОрионТраст', N'igulyeva@kostina.ru', N'+7 (495) 979-36-66', N'\agents\agent_28.png', N'221534, Орловская область, город Серебряные Пруды, проезд Гагарина, 54', 441, N'Павлова Марк Александрович', N'2972154471', N'668972219')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (24, 5, N'Компания Электро', N'blokin.sofiy@terentev.ru', N'+7 (35222) 63-92-83', N'\agents\agent_41.png', N'183744, Рязанская область, город Клин, въезд Косиора, 29', 340, N'Кабанов Кирилл Максимович', N'4335399269', N'780051451')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (25, 1, N'БашкирЮпитерТомск', N'email: dyckov.veniamin@kotova.ru', N' +7 (812) 395-91-75', N'\agents\agent_84.png', N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', 139, N'Фадеева Раиса Александровна', N'1606315697', N'217799345')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (26, 1, N'ОрионВектор', N'email: subbotin.rostislav@zueva.org', N'+7  (922) 456-59-29', N'\agents\agent_22.png', N'138159, Свердловская область, город Подольск, спуск Балканская, 72', 496, N'Алексей Борисович Семёнова', N'5687675108', N'816451597')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (27, 3, N'Рос', N'potapov.abram@trofimova.org', N'+7  (922) 822-88-76', N'\agents\agent_36.png', N'412597, Калужская область, город Клин, пр. Гагарина, 57', 158, N'Никифороваа Рената Сергеевна', N'6729448041', N'935241906')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (28, 2, N'ДизайнВосток', N'efimova.timofei@tretykova.ru', N'+7  (922) 767-84-15', N'\agents\agent_17.png', N'680394, Оренбургская область, город Павловский Посад, спуск Косиора, 50', 188, N'Добрыня Сергеевич Кабанов', N'6222265808', N'245694799')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (29, 4, N'РемГаражЛифт', N'novikova.gleb@sestakov.ru', N' +7 (35222) 18-85-61', N'\agents\agent_90.png', N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', 374, N'Филатов Владимир Максимович', N'1656477206', N'988968838')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (30, 5, N'ПивГлав', N'email: sofiy.bolsakov@isakova.ru', N' 8-800-153-74-46', N'\agents\agent_27.png', N'244290, Астраханская область, город Талдом, проезд Космонавтов, 17', 329, N'Клим Иванович Юдин', N'3090235456', N'870818930')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (31, 5, N'Компания Гараж', N'email: asiryeva@andreeva.com', N' +7 (35222) 22-47-12', N'\agents\agent_91.png', N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', 413, N'Владлена Фёдоровна Ларионоваа', N'6190244524', N'399106161')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (32, 3, N'Монтаж', N'zakar.sazonova@gavrilov.ru', N'+7 (495) 783-36-97', N'\agents\agent_66.png', N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', 300, N'Блохина Сергей Максимович', N'6142194281', N'154457435')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (33, 4, N'ВодГараж', N'pmaslov@fomiceva.com', N' +7 (35222) 11-75-66', N'\agents\agent_92.png', N'988899, Саратовская область, город Раменское, пр. Славы, 40', 250, N'Лаврентий Фёдорович Логинова', N'5575072431', N'684290320')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (34, 5, N'Компания Метал', N'vasileva.tatyna@lebedeva.net', N' +7 (35222) 99-39-28', N'\agents\agent_16.png', N'908229, Иркутская область, город Истра, бульвар Бухарестская, 97', 167, N'Валентина Ивановна Громова', N'9933367989', N'856443865')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (35, 3, N'Бум', N'email: belova.vikentii@konstantinova.net', N' +7  (922) 282-82-91', N'\agents\agent_103.png', N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', 82, N'Татьяна Сергеевна Королёваа', N'1953785418', N'122905583')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (36, 6, N'Гор', N'rostislav.savelev@dmitrieva.ru', N'+7 (812) 327-52-23', N'\agents\agent_46.png', N'245009, Белгородская область, город Коломна, шоссе Домодедовская, 93', 85, N'Адриан Александрович Одинцов', N'6196739969', N'784512010')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (37, 1, N'МясРеч', N'bkozlov@volkov.ru', N' +7 (812) 256-74-95', N'\agents\agent_83.png', N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', 355, N'Белоусоваа Ирина Максимовна', N'9254261217', N'656363498')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (38, 4, N'МясТрансМоторЛизинг', N'email: vlad.sokolov@andreev.org', N' +7 (495) 489-75-57', N'\agents\agent_87.png', N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', 268, N'Тамара Дмитриевна Семёноваа', N'6148685143', N'196332656')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (39, 5, N'Компания ТелекомХмельГаражПром', N'qkolesnikova@kalinina.ru', N' 8-800-617-13-37', N'\agents\agent_96.png', N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', 457, N'Костина Татьяна Борисовна', N'1614623826', N'824882264')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (40, 5, N'МетизТехАвтоПроф', N'anastasiy.gromov@samsonova.com', N'8-800-192-74-77', N'\agents\agent_58.png', N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', 321, N'Егор Фёдорович Третьякова', N'2988890076', N'215491048')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (41, 5, N'РосАвтоМонтаж', N'lapin.inessa@isaeva.com', N' 8-800-468-91-51', N'\agents\agent_80.png', N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', 10, N'Диана Алексеевна Исаковаа', N'4735043946', N'263682488')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (42, 5, N'Компания КрепГаз', N'iturova@isakova.ru', N' 8-800-971-62-32', N'\agents\agent_48.png', N'415525, Воронежская область, город Орехово-Зуево, спуск Ленина, 14', 50, N'Эмилия Фёдоровна Шилова', N'2910821636', N'169856199')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (43, 1, N'БухТеле', N'vasilev.svetlana@saskov.org', N' +7 (35222) 89-78-68', N'\agents\agent_18.png', N'481781, Астраханская область, город Орехово-Зуево, спуск Ломоносова, 67', 171, N'Клавдия Романовна Савина', N'3547826061', N'581933218')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (44, 6, N'ТяжМяж', N'email: bzykov@baranov.com', N' +7 (812) 425-28-46', N'\agents\agent_55.png', N'255489, Самарская область, город Озёры, ул. Ломоносова, 09', 472, N'Юлия Львовна Горбунова', N'6391522710', N'209038885')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (45, 4, N'Тех', N'vasilisa99@belyev.ru', N' +7  (922) 113-94-49', N'\agents\agent_86.png', N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', 278, N'Аким Романович Логинова', N'9282924869', N'587356429')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (46, 3, N'ГлавITФлотПроф', N'email: savva.rybov@kolobov.ru', N'+7 (35222) 33-48-16', N'\agents\agent_89.png', N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', 62, N'Зыкова Стефан Максимович', N'2561361494', N'525678825')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (47, 3, N'Восток', N'nsitnikova@tikonova.org', N'+7 (495) 227-66-48', N'', N'284236, Воронежская область, город Павловский Посад, бульвар Ленина, 28', 380, N'Савинаа Нина Александровна', N'8929775900', N'788028687')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (48, 2, N'ТелекомЮпитер', N'kulikov.adrian@zuravlev.org', N'+7 (812) 798-33-53', N'\agents\agent_106.png', N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', 302, N'Калинина Татьяна Ивановна', N'9383182378', N'944520594')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (49, 1, N'МонтажВекторМобайлЦентр', N'pavel.davydova@tretykov.net', N'+7 (495) 566-98-62', N'\agents\agent_32.png', N'094869, Ленинградская область, город Ступино, наб. Ленина, 80', 372, N'Захар Александрович Панова', N'4433392652', N'757806909')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (50, 5, N'ВостокГлав', N'gordei95@kirillov.ru', N'+7  (922) 329-34-28', N'\agents\agent_88.png', N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', 107, N'Инга Фёдоровна Дмитриева', N'3580946305', N'405017349')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (51, 5, N'Компания КрепЦемент', N'email: rusakov.efim@nikiforov.ru', N'8-800-628-79-67', N'\agents\agent_75.png', N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', 426, N'Екатерина Львовна Суворова', N'3025099903', N'606083992')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (52, 1, N'ЖелДор', N'email: karitonova.fedosy@vasileva.net', N'+7 (35222) 26-55-64', N'\agents\agent_51.png', N'860124, Иркутская область, город Егорьевск, пер. Гагарина, 67', 429, N'Симоноваа Лариса Борисовна', N'9392505809', N'911026119')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (53, 5, N'Компания Хмель', N'email: ermakov.mark@isakova.ru', N'+7 (35222) 27-19-66', N'\agents\agent_67.png', N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', 2, N'Владимир Борисович Суворова', N'9004087602', N'297273898')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (54, 5, N'Цемент', N'email: panova.klementina@bobrov.ru', N' +7  (922) 859-19-97', N'\agents\agent_79.png', N'084315, Амурская область, город Шаховская, наб. Чехова, 62', 340, N'Анфиса Фёдоровна Буроваа', N'9662118663', N'650216214')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (55, 3, N'ЛенМобайлМикро', N'frolov.artem@zuravlev.ru', N' +7 (35222) 96-34-97', N'\agents\agent_52.png', N'737175, Ростовская область, город Одинцово, ул. Космонавтов, 99', 341, N'Изабелла Евгеньевна Дьячкова', N'6729041572', N'828657559')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (56, 5, N'Компания ТверьДизайн', N'email: ypotapov@kolesnikova.ru', N' 8-800-234-93-22', N'\agents\agent_37.png', N'672492, Калининградская область, город Москва, проезд Сталина, 64', 271, N'Доминика Александровна Никитинаа', N'3567301661', N'623881311')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (57, 1, N'ВодТверьХозМашина', N'tkrylov@baranova.net', N' +7 (495) 756-36-72', N'\agents\agent_81.png', N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', 8, N'Александра Дмитриевна Ждановаа', N'4174253174', N'522227145')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (58, 1, N'ТелеГлавВекторСбыт', N'nsitnikov@kovaleva.ru', N'+7  (922) 619-91-52', N'\agents\agent_56.png', N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', 185, N'Екатерина Фёдоровна Ковалёва', N'9504787157', N'419758597')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (59, 5, N'БашкирИнжКрепСбыт', N'email: vlad.molcanov@fomicev.ru', N'+7  (922) 495-46-18', N'\agents\agent_24.png', N'191420, Новосибирская область, город Ногинск, пер. Будапештсткая, 28', 475, N'Алиса Фёдоровна Архипова', N'6771467761', N'977595370')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (60, 2, N'ТрансТверь', N'dorofeev.milan@vorobeva.net', N'+7 (35222) 22-74-12', N'\agents\agent_25.png', N'818676, Томская область, город Павловский Посад, ул. Ладыгина, 27', 495, N'Алина Романовна Овчинникова', N'3311036393', N'590018934')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (61, 2, N'ТелеСеверМикро', N'koseleva.ylii@potapov.ru', N' +7 (35222) 66-26-65', N'\agents\agent_12.png', N'046300, Орловская область, город Ступино, бульвар Бухарестская, 13', 254, N'Селезнёв Василий Евгеньевич', N'9534974527', N'344691556')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (62, 1, N'CибПивОмскСнаб', N'evorontova@potapova.ru', N' +7 (812) 743-49-87', N'', N'816260, Ивановская область, город Москва, ул. Гагарина, 31', 477, N'Людмила Александровна Сафонова', N'5676173945', N'256512286')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (63, 3, N'ЛенБухМикро-H', N'email: rybov.tatyna@merkuseva.com', N'+7 (812) 421-59-75', N'\agents\agent_30.png', N'078797, Мурманская область, город Коломна, пр. Гоголя, 94', 242, N'Субботин Герасим Владимирович', N'5943902570', N'103426359')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (64, 2, N'ЮпитерЛенГараж-М', N'larkipova@gorbunov.ru', N'+7 (812) 229-34-18', N'\agents\agent_73.png', N'339507, Московская область, город Видное, ул. Космонавтов, 11', 470, N'Васильева Валерия Борисовна', N'2038393690', N'259672761')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (65, 4, N'МорВостокТомскПром', N'lev.efremov@frolov.ru', N' +7  (922) 258-96-16', N'\agents\agent_20.png', N'034623, Белгородская область, город Павловский Посад, проезд Ломоносова, 72', 198, N'Гавриил Евгеньевич Селиверстов', N'4082127026', N'544686044')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (66, 5, N'Компания ФинансСервис', N'email: robert.serbakov@safonova.ru', N' 8-800-358-54-99', N'\agents\agent_63.png', N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', 395, N'Клавдия Сергеевна Виноградова', N'7491491391', N'673621812')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (67, 5, N'Метиз', N'email: mersova@rodionova.ru', N' +7 (35222) 81-78-92', N'\agents\agent_54.png', N'455463, Ярославская область, город Серпухов, пер. Бухарестская, 01', 168, N'Ян Иванович Егоров', N'4433116074', N'949226221')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (68, 2, N'ФлотБух', N'tkuznetova@sukanova.ru', N'+7  (922) 155-75-21', N'\agents\agent_21.png', N'741647, Ульяновская область, город Наро-Фоминск, ул. 1905 года, 11', 385, N'Муравьёваа Мария Дмитриевна', N'4868711532', N'409331823')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (69, 4, N'КазХоз', N'istrelkova@fomin.ru', N'8-800-955-44-52', N'', N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', 213, N'Степанова Роман Иванович', N'6503377671', N'232279972')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (70, 6, N'Орион', N'aleksei63@kiselev.ru', N'+7 (35222) 58-77-96', N'\agents\agent_102.png', N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', 166, N'Мартынов Михаил Борисович', N'2670166502', N'716874456')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (71, 4, N'РечИнж', N'qloginova@antonov.com', N'+7 (812) 971-47-98', N'\agents\agent_8.png', N'862241, Кемеровская область, город Москва, пер. Славы, 63', 426, N'Донат Иванович Кудрявцев', N'9289300952', N'534867576')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (72, 4, N'РосПивТверь', N'vitalii.melnikov@kopylov.com', N' +7  (922) 692-73-72', N'\agents\agent_11.png', N'053965, Магаданская область, город Видное, наб. Балканская, 41', 368, N'Люся Фёдоровна Горшковаа', N'2857470864', N'732899890')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (73, 3, N'КрепТелекомТекстильМашина', N'ignatov.adam@kononova.org', N'+7  (922) 278-54-95', N'\agents\agent_39.png', N'754514, Тверская область, город Люберцы, пл. Домодедовская, 84', 259, N'Богданов Денис Максимович', N'7626613684', N'187506967')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (74, 4, N'МорГлавМонтажЭкспедиция', N'flukin@moiseeva.com', N' +7 (812) 161-96-49', N'\agents\agent_34.png', N'313619, Читинская область, город Чехов, ул. Ленина, 38', 329, N'Анастасия Львовна Субботинаа', N'8619846965', N'796144573')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (75, 6, N'ТекстильУралВод', N'email: obespalov@alekseev.org', N'+7 (495) 614-67-93', N'\agents\agent_9.png', N'872673, Ярославская область, город Видное, спуск Славы, 04', 28, N'Эльвира Фёдоровна Герасимова', N'8336124514', N'871193263')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (76, 3, N'Газ', N'ulyna.antonov@noskov.ru', N'8-800-278-78-32', N'\agents\agent_101.png', N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', 170, N'Терентьев Илларион Максимович', N'8876413796', N'955381891')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (77, 5, N'ТомскТранс', N'antonina.krasilnikov@nikonov.ru', N'+7 (35222) 66-22-46', N'\agents\agent_47.png', N'271624, Свердловская область, город Озёры, ул. Косиора, 21', 427, N'Архипова Юрий Дмитриевич', N'6523850838', N'970092830')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (78, 5, N'Компания ТехТеле', N'anfisa63@sobolev.ru', N'8-800-943-36-45', N'\agents\agent_42.png', N'285256, Магаданская область, город Дмитров, шоссе Ладыгина, 20', 465, N'Тихонова Валериан Владимирович', N'1553744119', N'713327632')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (79, 4, N'СофтИнжIT', N'yliy.efimov@zdanova.ru', N' 8-800-319-27-45', N'\agents\agent_50.png', N'146295, Тверская область, город Одинцово, въезд Бухарестская, 78', 460, N'Виктор Львович Михайлова', N'2368693812', N'791368408')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (80, 5, N'Компания Монтаж', N'afanasev.anastasiy@muravev.ru', N'+7 (495) 626-86-13', N'\agents\agent_100.png', N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', 124, N'Силин Даниил Иванович', N'6206428565', N'118570048')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (81, 4, N'СтройГорНефть', N'email: lysy.kolesnikova@molcanova.com', N'+7 (495) 852-82-84', N'\agents\agent_62.png', N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', 161, N'Тарасова Макар Максимович', N'5916775587', N'398299418')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (82, 4, N'ЦементХмельОрионНаладка', N'email: daniil.selezneva@safonova.com', N'+7  (922) 419-14-19', N'\agents\agent_49.png', N'014379, Кировская область, город Озёры, пр. Будапештсткая, 28', 61, N'Максим Евгеньевич Гурьева', N'2118874929', N'482607758')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (83, 5, N'Компания ОрионСтройЛифт', N'artemii.abramova@arkipov.ru', N'8-800-381-59-97', N'', N'819305, Воронежская область, город Талдом, шоссе Ломоносова, 36', 467, N'Щукина Искра Максимовна', N'8834229587', N'958311664')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (84, 3, N'Тяж', N'rodionova.ulyna@noskov.ru', N'+7  (922) 547-77-52', N'\agents\agent_35.png', N'650482, Смоленская область, город Коломна, проезд Косиора, 95', 207, N'Белов Влад Александрович', N'5484904441', N'943388774')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (85, 1, N'ЦементАсбоцемент', N'polykov.veronika@artemeva.ru', N' +7  (922) 133-68-96', N'\agents\agent_76.png', N'619540, Курская область, город Раменское, пл. Балканская, 12', 426, N'Воронова Мария Александровна', N'4345774724', N'352469905')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (86, 2, N'ГазДизайнЖелДор', N'email: elizaveta.komarov@rybakov.net', N' +7 (35222) 39-88-91', N'\agents\agent_74.png', N'695230, Курская область, город Красногорск, пр. Гоголя, 64', 236, N'Лев Иванович Третьяков', N'2396029740', N'458924890')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (87, 4, N'РемСантехОмскБанк', N'email: anisimov.mark@vorobev.ru', N' +7 (35222) 76-15-56', N'\agents\agent_82.png', N'289468, Омская область, город Видное, пер. Балканская, 33', 442, N'Фокина Искра Максимовна', N'6823050572', N'176488617')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (88, 3, N'Мясо', N'email: ulyna.antonov@noskov.ru', N' +7  (922) 315-51-42', N'\agents\agent_107.png', N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', 170, N'Терентьев Илларион Максимович', N'1876413796', N'955381891')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (89, 6, N'КрепГаражСантехМаш', N'vladlen84@ersova.net', N'+7 (495) 172-31-91', N'\agents\agent_10.png', N'207204, Пензенская область, город Одинцово, пер. Гагарина, 80', 330, N'Аркадий Романович Тихонов', N'7574946061', N'146206755')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (90, 3, N'ИнжITЖелДор-H', N'karitonov.aleksandra@samoilov.com', N'+7 (495) 324-18-82', N'\agents\agent_14.png', N'019291, Вологодская область, город Клин, ул. Космонавтов, 96', 129, N'Колесникова Август Владимирович', N'8103088511', N'604606043')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (91, 1, N'Рем', N'zanna25@nikiforova.com', N'+7 (35222) 46-69-69', N'\agents\agent_104.png', N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', 329, N'Шароваа Елизавета Львовна', N'3203830728', N'456254820')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (92, 6, N'ФинансТелеТверь', N'medvedev.klim@afanasev.com', N' +7 (495) 839-58-56', N'\agents\agent_70.png', N'687171, Томская область, город Лотошино, пл. Славы, 59', 100, N'Зайцеваа Дарья Сергеевна', N'2646091050', N'971874277')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (93, 3, N'Строй', N'email: soloveva.adam@andreev.ru', N'+7  (922) 129-57-13', N'\agents\agent_57.png', N'763019, Омская область, город Шатура, пл. Сталина, 56', 12, N'Кудрявцев Адриан Андреевич', N'6678884759', N'279288618')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (94, 1, N'ЭлектроITITСбыт', N'email: eliseeva.sofy@gorskov.net', N'+7 (812) 326-15-27', N'\agents\agent_23.png', N'855489, Вологодская область, город Серебряные Пруды, пл. Ломоносова, 57', 452, N'Якушеваа Варвара Романовна', N'1532104861', N'112607081')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (95, 2, N'ЛенХозМясБанк', N'email: bobrov.viktor@kazakova.ru', N'+7 (35222) 26-15-93', N'\agents\agent_31.png', N'702413, Саратовская область, город Люберцы, въезд Чехова, 15', 17, N'Арсений Алексеевич Виноградова', N'9266199692', N'335770867')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (96, 4, N'ЭлектроМоторТрансСнос', N'inessa.voronov@sidorova.ru', N'+7 (495) 951-23-53', N'\agents\agent_98.png', N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', 151, N'Людмила Евгеньевна Новиковаа', N'6608362851', N'799760512')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (97, 5, N'Компания СервисРадиоГор', N'nika.nekrasova@kovalev.ru', N'+7 (812) 871-21-15', N'\agents\agent_65.png', N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', 169, N'Попов Вадим Александрович', N'8880473721', N'729975116')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (98, 5, N'Компания МясДизайнДизайн', N'gleb.gulyev@belyeva.com', N'+7 (495) 752-21-98', N'\agents\agent_78.png', N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', 491, N'Клементина Сергеевна Стрелкова', N'8004989990', N'908629456')
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (99, 2, N'БашкирФлотМотор-H', N'morozova.nika@kazakova.ru', N'+7 (812) 737-79-77', N'\agents\agent_61.png', N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', 416, N'Марат Алексеевич Фролов', N'1657476072', N'934931159')
GO
INSERT [dbo].[Agent] ([ID], [AgentTypeID], [Title], [Email], [Phone], [Address], [Logo], [Priority], [DirectorName], [INN], [KPP]) VALUES (100, 4, N'СофтМонтажХозСбыт', N'zinaida90@filippov.org', N' +7 (495) 396-23-64', N'\agents\agent_44.png', N'860932, Калужская область, город Наро-Фоминск, ул. Балканская, 78', 403, N'Харитонов Антонин Владимирович', N'5408216010', N'737659265')
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentType] ON 

INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (1, N'ЗАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (2, N'МКК', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (3, N'МФО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (4, N'ОАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (5, N'ООО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (6, N'ПАО', NULL)
SET IDENTITY_INSERT [dbo].[AgentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (1, N'Маска на лицо открытого типа 4556', 4, N'7560408', 3, 3, CAST(1576.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (2, N'Очки прозрачные затемненные 2256', 4, N'76452269', 3, 9, CAST(342.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (3, N'Маска защитная закрытого типа 1359', 3, N'75996796', 4, 12, CAST(198.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (4, N'Защита глаз с клапаном 2579', 4, N'50785095', 3, 5, CAST(832.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (5, N'Маска на лицо затемненные 5068', 4, N'44451659', 3, 6, CAST(1713.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (6, N'Очки прозрачные открытого типа 2830', 1, N'67633308', 5, 2, CAST(1269.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (7, N'Маска на лицо с клапаном 3370', 2, N'81175619', 1, 3, CAST(822.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (8, N'Маска защитная затемненные 1396', 2, N'21739873', 2, 10, CAST(744.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (9, N'Защита глаз затемненные 1999', 1, N'83267291', 1, 8, CAST(1105.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (10, N'Маска защитная с клапаном 2921', 3, N'42906442', 4, 3, CAST(273.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (11, N'Очки красные затемненные 5288', 3, N'17973888', 5, 10, CAST(1383.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (12, N'Маска защитная закрытого типа 1508', 3, N'38631872', 5, 10, CAST(1521.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (13, N'Защита глаз от воды с клапаном 5141', 2, N'48232658', 2, 10, CAST(1754.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (14, N'Очки прозрачные с клапаном 4732', 4, N'9796980', 4, 5, CAST(1806.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (15, N'Маска на лицо открытого типа 3158', 2, N'47415783', 5, 1, CAST(1285.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (16, N'Очки прозрачные с клапаном 5034', 2, N'6783736', 3, 12, CAST(1475.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (17, N'Защита глаз затемненные 1922', 3, N'63567187', 4, 9, CAST(1562.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (18, N'Защита глаз от воды с клапаном 1498', 2, N'73250951', 5, 12, CAST(1868.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (19, N'Защита глаз от пыли затемненные 6614', 2, N'89589447', 1, 7, CAST(1370.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (20, N'Очки темные открытого типа 4067', 2, N'74666994', 2, 5, CAST(792.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (21, N'Защита глаз открытого типа 3465', 3, N'35778001', 2, 4, CAST(212.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (22, N'Защита глаз от воды закрытого типа 6052', 2, N'80684143', 2, 9, CAST(589.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (23, N'Очки прозрачные затемненные 5848', 4, N'86254159', 4, 8, CAST(878.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (24, N'Маска на лицо закрытого типа 4426', 2, N'78789007', 5, 8, CAST(185.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (25, N'Маска на лицо открытого типа 6456', 4, N'23804393', 3, 12, CAST(1343.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (26, N'Защита глаз открытого типа 2381', 4, N'80410937', 5, 2, CAST(1690.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (27, N'Очки прозрачные открытого типа 6480', 3, N'23552742', 5, 12, CAST(729.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (28, N'Маска на лицо затемненные 6914', 2, N'16837832', 1, 9, CAST(296.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (29, N'Защита глаз открытого типа 1876', 2, N'18274186', 1, 6, CAST(1754.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (30, N'Защита глаз с клапаном 2715', 2, N'65896850', 3, 11, CAST(1769.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (31, N'Защита глаз от воды с клапаном 2922', 1, N'32589387', 1, 3, CAST(1436.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (32, N'Маска защитная затемненные 3116', 2, N'16694924', 3, 4, CAST(1042.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (33, N'Маска защитная открытого типа 5493', 4, N'28669954', 4, 9, CAST(565.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (34, N'Очки темные с клапаном 4354', 2, N'26078631', 2, 6, CAST(1627.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (35, N'Защита глаз от пыли открытого типа 5443', 3, N'87162470', 5, 8, CAST(1180.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (36, N'Маска на лицо с клапаном 6789', 1, N'75277715', 2, 1, CAST(874.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (37, N'Защита глаз с клапаном 1456', 4, N'89728004', 3, 10, CAST(1676.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (38, N'Очки прозрачные закрытого типа 1090', 1, N'51936367', 2, 12, CAST(335.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (39, N'Защита глаз от воды закрытого типа 1351', 3, N'33766997', 4, 11, CAST(453.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (40, N'Защита глаз с клапаном 4657', 3, N'60888572', 3, 12, CAST(638.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (41, N'Очки прозрачные затемненные 2009', 2, N'60643813', 2, 10, CAST(1070.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (42, N'Очки темные с клапаном 2774', 3, N'74007987', 5, 11, CAST(534.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (43, N'Очки прозрачные затемненные 4299', 1, N'30033340', 1, 7, CAST(708.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (44, N'Защита глаз от воды закрытого типа 5795', 4, N'37743614', 1, 11, CAST(1790.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (45, N'Защита глаз от пыли с клапаном 6767', 2, N'57763347', 4, 5, CAST(371.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (46, N'Защита глаз затемненные 1433', 1, N'19163774', 3, 12, CAST(1301.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (47, N'Очки прозрачные с клапаном 2870', 1, N'14625901', 2, 1, CAST(1483.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (48, N'Очки прозрачные с клапаном 2928', 4, N'72314954', 1, 2, CAST(1467.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (49, N'Очки прозрачные закрытого типа 1153', 2, N'18277077', 3, 12, CAST(375.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (50, N'Маска на лицо закрытого типа 2053', 2, N'48084823', 5, 3, CAST(1617.00 AS Decimal(10, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (1, 82, 33, CAST(N'2014-06-25' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (2, 59, 42, CAST(N'2011-01-04' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (3, 98, 11, CAST(N'2015-07-03' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (4, 68, 21, CAST(N'2019-06-06' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (5, 6, 1, CAST(N'2014-03-28' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (6, 6, 31, CAST(N'2019-02-13' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (7, 41, 38, CAST(N'2012-04-26' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (8, 69, 2, CAST(N'2019-01-22' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (9, 85, 32, CAST(N'2017-12-09' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (10, 89, 35, CAST(N'2013-03-18' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (11, 72, 18, CAST(N'2016-11-06' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (12, 82, 18, CAST(N'2018-08-22' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (13, 13, 48, CAST(N'2012-08-06' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (14, 41, 28, CAST(N'2011-02-27' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (15, 68, 40, CAST(N'2016-01-09' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (16, 79, 41, CAST(N'2018-01-14' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (17, 88, 9, CAST(N'2010-07-20' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (18, 48, 6, CAST(N'2012-11-24' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (19, 77, 44, CAST(N'2017-12-15' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (20, 96, 23, CAST(N'2015-06-24' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (21, 74, 29, CAST(N'2018-03-05' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (22, 82, 33, CAST(N'2016-12-16' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (23, 86, 31, CAST(N'2019-03-10' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (24, 31, 33, CAST(N'2017-10-25' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (25, 89, 13, CAST(N'2013-06-16' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (26, 26, 8, CAST(N'2016-05-05' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (27, 43, 3, CAST(N'2018-05-01' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (28, 88, 34, CAST(N'2011-03-17' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (29, 80, 49, CAST(N'2010-05-08' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (30, 80, 37, CAST(N'2014-01-16' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (31, 31, 9, CAST(N'2010-09-13' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (32, 32, 17, CAST(N'2017-06-15' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (33, 47, 37, CAST(N'2011-01-06' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (34, 68, 12, CAST(N'2013-01-28' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (35, 89, 20, CAST(N'2014-09-13' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (36, 77, 14, CAST(N'2010-11-04' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (37, 93, 16, CAST(N'2017-12-19' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (38, 74, 37, CAST(N'2013-06-26' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (39, 68, 45, CAST(N'2012-10-15' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (40, 42, 47, CAST(N'2015-09-05' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (41, 41, 8, CAST(N'2012-08-26' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (42, 42, 44, CAST(N'2012-06-04' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (43, 43, 46, CAST(N'2012-06-11' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (44, 100, 8, CAST(N'2018-05-23' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (45, 45, 16, CAST(N'2013-08-24' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (46, 79, 16, CAST(N'2011-05-10' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (47, 47, 14, CAST(N'2013-02-03' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (48, 48, 41, CAST(N'2017-06-24' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (49, 92, 31, CAST(N'2010-09-13' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (50, 50, 18, CAST(N'2017-09-10' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (51, 93, 18, CAST(N'2016-09-17' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (52, 71, 14, CAST(N'2013-04-18' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (53, 93, 17, CAST(N'2010-08-27' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (54, 98, 14, CAST(N'2017-07-06' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (55, 100, 33, CAST(N'2013-07-10' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (56, 56, 29, CAST(N'2019-12-23' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (57, 57, 37, CAST(N'2019-11-07' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (58, 58, 34, CAST(N'2011-07-20' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (59, 59, 20, CAST(N'2011-02-05' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (60, 88, 8, CAST(N'2016-04-17' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (61, 77, 6, CAST(N'2018-02-06' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (62, 63, 12, CAST(N'2012-01-04' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (63, 63, 32, CAST(N'2018-12-07' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (64, 88, 8, CAST(N'2019-02-12' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (65, 65, 17, CAST(N'2010-11-10' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (66, 66, 9, CAST(N'2013-03-23' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (67, 99, 43, CAST(N'2019-09-26' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (68, 68, 49, CAST(N'2013-08-24' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (69, 69, 43, CAST(N'2015-10-18' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (70, 86, 5, CAST(N'2012-12-28' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (71, 71, 21, CAST(N'2019-08-09' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (72, 72, 41, CAST(N'2010-03-23' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (73, 74, 26, CAST(N'2010-12-21' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (74, 74, 26, CAST(N'2010-02-21' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (75, 99, 29, CAST(N'2014-03-24' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (76, 90, 12, CAST(N'2018-04-18' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (77, 77, 25, CAST(N'2011-11-12' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (78, 78, 19, CAST(N'2017-12-17' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (79, 79, 39, CAST(N'2018-06-24' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (80, 80, 31, CAST(N'2014-07-10' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (81, 81, 48, CAST(N'2019-03-05' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (82, 82, 50, CAST(N'2017-07-20' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (83, 96, 15, CAST(N'2019-01-08' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (84, 90, 26, CAST(N'2017-05-05' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (85, 85, 35, CAST(N'2013-01-12' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (86, 86, 3, CAST(N'2012-10-12' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (87, 87, 10, CAST(N'2014-04-12' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (88, 88, 47, CAST(N'2018-09-11' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (89, 89, 47, CAST(N'2018-01-18' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (90, 90, 50, CAST(N'2015-03-07' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (91, 91, 9, CAST(N'2012-10-08' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (92, 92, 17, CAST(N'2014-01-08' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (93, 93, 26, CAST(N'2011-10-27' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (94, 94, 43, CAST(N'2012-08-18' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (95, 95, 27, CAST(N'2011-11-01' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (96, 96, 48, CAST(N'2011-12-16' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (97, 100, 39, CAST(N'2013-04-18' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (98, 98, 49, CAST(N'2010-06-09' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (99, 99, 22, CAST(N'2015-02-12' AS Date), 12)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (100, 100, 24, CAST(N'2012-08-01' AS Date), 1)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (1, N' Закрытого типа', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N' Затемненные', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N' Открытого типа', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N' С клапаном', NULL)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [Glazki_Ismagilov] SET  READ_WRITE 
GO
