USE [master]
GO
/****** Object:  Database [ShoesStore]    Script Date: 12/13/2023 8:05:39 PM ******/
CREATE DATABASE [FlowerShop]

GO
ALTER DATABASE [FlowerShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlowerShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlowerShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlowerShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlowerShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlowerShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlowerShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlowerShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlowerShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlowerShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlowerShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlowerShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlowerShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlowerShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlowerShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlowerShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlowerShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FlowerShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlowerShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlowerShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlowerShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlowerShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlowerShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlowerShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlowerShop] SET RECOVERY FULL 
GO
ALTER DATABASE [FlowerShop] SET  MULTI_USER 
GO
ALTER DATABASE [FlowerShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlowerShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlowerShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlowerShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlowerShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FlowerShop', N'ON'
GO
ALTER DATABASE [FlowerShop] SET QUERY_STORE = OFF
GO
USE [FlowerShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FlowerShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/13/2023 8:05:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[Fullname] [nvarchar](30) NOT NULL,
	[IsAdmin] [bit] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/13/2023 8:05:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/13/2023 8:05:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/13/2023 8:05:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/13/2023 8:05:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[img] [nvarchar](1000) NOT NULL,
	[CategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [IsAdmin], [Active]) VALUES (N'admin', N'admin', N'I am Admin', 1, 1)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Hoa Lan')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Hoa Hong')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Xuong Rong')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Description], [img], [CategoryId]) VALUES (1, N'Lan Vũ Nữ', 100, N'Cay Lan Vu Nu dep ', N'https://mobiagri.vn/wp-content/uploads/2023/05/cach-trong-lan-vu-nu-5.jpg', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Description], [img], [CategoryId]) VALUES (2, N'Lan Dendro', 110, N'Cay Lan Dendro doc la', N'https://vuonlan.com.vn/wp-content/uploads/2023/06/hoa-lan-dendro-784.jpg', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Description], [img], [CategoryId]) VALUES (3, N'Hoa HongDen', 144.97, N'Hoa Hong Den dep me nguoi', N'https://xwatch.vn/upload_images/images/2022/10/24/nguon-goc-hoa-hong-den.jpg', 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Description], [img], [CategoryId]) VALUES (4, N'Hoa HongDo', 144.97, N'Hoa Hong Do dep va dieu dang', N'https://cdn.tgdd.vn/Files/2021/01/19/1321035/hieu-ro-y-nghia-hoa-hong-giup-ban-chinh-phuc-nang-.jpg', 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Description], [img], [CategoryId]) VALUES (5, N'Xuong rong chau a', 1000, N'Hoa Hong den tu chau a', N'https://bizweb.dktcdn.net/100/275/164/products/img-6833-recovered.jpg?v=1620454764217', 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
USE [master]
GO
ALTER DATABASE [ShoesStore] SET  READ_WRITE 
GO
