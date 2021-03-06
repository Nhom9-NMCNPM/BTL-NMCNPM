USE [master]
GO
/****** Object:  Database [dbCNPM]    Script Date: 11/30/2020 8:34:47 PM ******/
CREATE DATABASE [dbCNPM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbCNPM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbCNPM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbCNPM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbCNPM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbCNPM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbCNPM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbCNPM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbCNPM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbCNPM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbCNPM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbCNPM] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbCNPM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbCNPM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbCNPM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbCNPM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbCNPM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbCNPM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbCNPM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbCNPM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbCNPM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbCNPM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbCNPM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbCNPM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbCNPM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbCNPM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbCNPM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbCNPM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbCNPM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbCNPM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbCNPM] SET  MULTI_USER 
GO
ALTER DATABASE [dbCNPM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbCNPM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbCNPM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbCNPM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbCNPM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbCNPM] SET QUERY_STORE = OFF
GO
USE [dbCNPM]
GO
/****** Object:  Table [dbo].[CanBo]    Script Date: 11/30/2020 8:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CanBo](
	[id_CB] [varchar](20) NOT NULL,
	[id_Person] [int] NOT NULL,
	[ChucVu] [nvarchar](120) NOT NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](30) NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_CanBo] PRIMARY KEY CLUSTERED 
(
	[id_CB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 11/30/2020 8:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[PassWord] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 11/30/2020 8:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id_Person] [int] NOT NULL,
	[NamePerson] [nvarchar](120) NULL,
	[BirthDay] [date] NULL,
	[QueQuan] [nvarchar](120) NULL,
	[DanToc] [nvarchar](50) NULL,
	[NgheNghiep] [nvarchar](100) NOT NULL,
	[NoiLamViec] [nvarchar](120) NOT NULL,
	[SoCMND] [varchar](20) NULL,
	[NgayCap] [varchar](50) NULL,
	[NoiCap] [nvarchar](120) NULL,
	[DcThuongTru] [nvarchar](120) NOT NULL,
	[QuanHe] [nvarchar](50) NOT NULL,
	[id_SHK] [varchar](10) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id_Person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoHoKhau]    Script Date: 11/30/2020 8:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoHoKhau](
	[id_SHK] [varchar](10) NOT NULL,
	[TenChuHo] [nvarchar](120) NOT NULL,
	[SoNha] [int] NOT NULL,
	[Xom] [nvarchar](120) NOT NULL,
	[Xa] [nvarchar](120) NOT NULL,
	[Huyen] [nvarchar](120) NOT NULL,
	[Tinh] [nvarchar](120) NOT NULL,
	[Email] [varchar](120) NULL,
 CONSTRAINT [PK_SoHoKhau] PRIMARY KEY CLUSTERED 
(
	[id_SHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuKien]    Script Date: 11/30/2020 8:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuKien](
	[id_SK] [varchar](10) NOT NULL,
	[NameSK] [nvarchar](120) NOT NULL,
	[ThoiGian] [time](0) NOT NULL,
	[NgayBD] [date] NOT NULL,
 CONSTRAINT [PK_SuKien] PRIMARY KEY CLUSTERED 
(
	[id_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThamGia]    Script Date: 11/30/2020 8:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThamGia](
	[id_SK] [varchar](10) NOT NULL,
	[id_SHK] [varchar](10) NOT NULL,
	[Status] [bit] NOT NULL,
	[NguoiDaiDien] [nvarchar](120) NULL,
 CONSTRAINT [PK_ThamGia] PRIMARY KEY CLUSTERED 
(
	[id_SK] ASC,
	[id_SHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CanBo] ([id_CB], [id_Person], [ChucVu], [Phone], [Email], [GhiChu]) VALUES (N'cbHanhChinh', 29, N'Cán bộ hành chính', N'1548645456', N'cbHanhChinh@gmail.com', N'Quản lý lịch sinh hoạt, họp tổ dân phố, sử dụng nhà văn hóa, cấp thưởng')
INSERT [dbo].[CanBo] ([id_CB], [id_Person], [ChucVu], [Phone], [Email], [GhiChu]) VALUES (N'cbKeToan', 59, N'Cán bộ kế toán', N'5468654564', N'cbKeToan@gmail.com', N'Quản lý thu phí, đóng góp')
INSERT [dbo].[CanBo] ([id_CB], [id_Person], [ChucVu], [Phone], [Email], [GhiChu]) VALUES (N'cbToPho', 39, N'Tổ phó tổ dân phố', N'0938388888', N'topho@gmail.com', N'Phụ trách toàn bộ công việc trong tổ dân phố')
INSERT [dbo].[CanBo] ([id_CB], [id_Person], [ChucVu], [Phone], [Email], [GhiChu]) VALUES (N'cbToTruong', 40, N'Tổ trưởng tổ dân phố', N'0945648651', N'totruong@gmail.com', N'Phụ trách toàn bộ công việc trong tổ dân phố')
GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(1 AS Numeric(18, 0)), N'shk1', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(2 AS Numeric(18, 0)), N'shk2', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(3 AS Numeric(18, 0)), N'shk3', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(4 AS Numeric(18, 0)), N'shk4', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(5 AS Numeric(18, 0)), N'shk5', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(6 AS Numeric(18, 0)), N'shk6', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(7 AS Numeric(18, 0)), N'shk7', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(8 AS Numeric(18, 0)), N'shk8', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(9 AS Numeric(18, 0)), N'shk9', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(10 AS Numeric(18, 0)), N'shk10', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(11 AS Numeric(18, 0)), N'shk11', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(12 AS Numeric(18, 0)), N'shk12', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(13 AS Numeric(18, 0)), N'shk13', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(14 AS Numeric(18, 0)), N'shk14', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(15 AS Numeric(18, 0)), N'shk15', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(16 AS Numeric(18, 0)), N'shk16', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(17 AS Numeric(18, 0)), N'shk17', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(18 AS Numeric(18, 0)), N'shk18', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(19 AS Numeric(18, 0)), N'shk19', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(20 AS Numeric(18, 0)), N'shk20', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(21 AS Numeric(18, 0)), N'shk21', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(22 AS Numeric(18, 0)), N'shk22', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(25 AS Numeric(18, 0)), N'cbToTruong', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(26 AS Numeric(18, 0)), N'cbToPho', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(27 AS Numeric(18, 0)), N'cbKeToan', N'123456789')
INSERT [dbo].[Login] ([id], [UserName], [PassWord]) VALUES (CAST(28 AS Numeric(18, 0)), N'cbHanhChinh', N'123456789')
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (1, N'Mạc Trung Tình', CAST(N'1998-11-15' AS Date), N'Thái Nguyên', N'Tày', N'Sinh Viên', N'Hà Nội', N'000001', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk3')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (2, N'Mạc Văn Tuyến', CAST(N'1982-05-05' AS Date), N'Thái Nguyên', N'Tày', N'Cán bộ', N'Thái Nguyên', N'000002', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk3')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (3, N'Mạc Văn Cường', CAST(N'1994-06-30' AS Date), N'Thái Nguyên', N'Tày', N'Cán bộ', N'Thái Nguyên', N'000003', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk3')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (4, N'Mạc Văn Tuyền', CAST(N'1985-07-07' AS Date), N'Thái Nguyên', N'Tày', N'Cán bộ', N'Hưng Yên', N'000004', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk3')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (5, N'Mạc Thị Phương', CAST(N'1987-05-05' AS Date), N'Thái Nguyên', N'Tày', N'Nhân viên', N'Thái Nguyên', N'000005', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk3')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (6, N'Mạc Đình Tung', CAST(N'1960-01-09' AS Date), N'Thái Nguyên', N'Tày', N'Nông dân', N'Hà Nội', N'000006', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk3')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (7, N'Nguyễn Văn Nam', CAST(N'1970-10-10' AS Date), N'Vĩnh Phúc', N'Kinh', N'Công nhân', N'Hà Nội', N'000007', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk1')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (8, N'Nguyễn Hà Trang Anh', CAST(N'2001-03-09' AS Date), N'Vĩnh Phúc', N'Kinh', N'Sinh Viên', N'Hà Nội', N'000008', N'2018-09-09', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk1')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (9, N'Nguyễn Trúc Minh', CAST(N'1996-08-27' AS Date), N'Vĩnh Phúc', N'Kinh', N'Kĩ sư', N'Hà Nội', N'000009', N'2015-07-12', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk1')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (10, N'Lê Mai Hoa', CAST(N'1976-11-11' AS Date), N'Hà Nội', N'Kinh', N'Cán bộ', N'Hà Nội', N'000010', N'2014-09-08', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk1')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (11, N'Phạm Bá Chính', CAST(N'1973-02-02' AS Date), N'Vĩnh Phúc', N'Kinh', N'Cán bộ', N'Hà Nội', N'000011', N'2016-03-04', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk2')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (12, N'Phạm Thị Minh Châu', CAST(N'2000-09-08' AS Date), N'Vĩnh Phúc', N'Kinh', N'Sinh viên', N'Hà Nội', N'000012', N'2016-03-04', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk2')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (13, N'Phạm Bá Chiến', CAST(N'2001-06-07' AS Date), N'Vĩnh Phúc', N'Kinh', N'Nhân viên', N'Hà Nội', N'000013', N'2016-09-09', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk2')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (14, N'Lê Hoàng Lan', CAST(N'1978-09-08' AS Date), N'Vĩnh Phúc', N'Kinh', N'Nông dân', N'Hà Nội', N'000014', N'2015-09-07', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk2')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (15, N'Lê Xuân Hạnh', CAST(N'1970-03-04' AS Date), N'Thanh Hóa', N'Kinh', N'Kinh doanh', N'Hà Nội', N'000015', N'2016-09-07', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk4')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (16, N'Dương Thị Nga', CAST(N'1970-10-10' AS Date), N'Thanh Hóa', N'Kinh', N'Kinh doanh', N'Hà Nội', N'000016', N'2015-08-08', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk4')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (17, N'Lê Thị Trang', CAST(N'1997-12-03' AS Date), N'Thanh Hóa', N'Kinh', N'Sinh viên', N'Thái Nguyên', N'000017', N'2013-09-07', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk4')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (18, N'Lê Thị Vân', CAST(N'2000-04-14' AS Date), N'Thanh Hóa', N'Kinh', N'Sinh viên', N'Hà Nội', N'000018', N'2018-09-01', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk4')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (19, N'Dương Thi Thu Hà', CAST(N'1991-01-02' AS Date), N'Hà Nội', N'Kinh', N'Bác sĩ', N'Hà Nội', N'000019', N'2013-11-23', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk5')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (20, N'Nguyễn Thị Hà', CAST(N'1967-09-02' AS Date), N'Hà Nội', N'Kinh', N'Hưu trí', N'Hà Nội', N'000020', N'2010-09-07', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Mẹ', N'shk5')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (21, N'Phạm Thị An', CAST(N'1970-11-09' AS Date), N'Vĩnh Phúc', N'Kinh', N'Nông dân', N'Hà Nội', N'000021', N'2015-09-04', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk6')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (22, N'Phạm Trà My', CAST(N'1999-09-06' AS Date), N'Hà Nội', N'Kinh', N'Kế toán', N'Hà Nội', N'000022', N'2018-08-07', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk6')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (23, N'Phạm Minh Hiếu', CAST(N'1989-12-23' AS Date), N'Hà Nội', N'Kinh', N'Công an', N'Hà Nội', N'000023', N'2012-03-15', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk6')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (24, N'Nguyễn Thị Linh', CAST(N'1982-01-02' AS Date), N'Hà Nội', N'Kinh', N'Giám đốc', N'Hà Nội', N'000024', N'2017-03-02', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk7')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (25, N'Bùi Văn Toàn', CAST(N'1965-10-04' AS Date), N'Hà Nội', N'Kinh', N'Hưu trí', N'Hà Nội', N'000025', N'2012-03-07', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk8')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (26, N'Bùi Thanh Mai', CAST(N'1998-09-04' AS Date), N'Hà Nội', N'Kinh', N'Giáo viên', N'Hà Nội', N'000026', N'2017-03-12', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk8')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (27, N'Bùi Viết Tân', CAST(N'1989-11-27' AS Date), N'Hà Nội', N'Kinh', N'Lập trình viên', N'Hà Nội', N'000027', N'2018-03-22', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk8')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (28, N'Nguyễn Mai Anh', CAST(N'1970-09-21' AS Date), N'Hà Nội', N'Kinh', N'Hưu trí', N'Hà Nội', N'000028', N'2014-11-19', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk8')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (29, N'Lê Bảo Hưng', CAST(N'1980-01-23' AS Date), N'Thái Bình', N'Kinh', N'Lập trình viên', N'Hà Nội', N'000029', N'2015-09-09', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk9')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (30, N'Lê Mạnh Nam', CAST(N'2000-01-03' AS Date), N'Hà Nội', N'Kinh', N'Sinh viên', N'Hà Nội', N'000030', N'2018-02-03', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk9')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (31, N'Bùi Minh Hoa', CAST(N'1979-02-04' AS Date), N'Hà Nội', N'Kinh', N'Kế toán', N'Hà Nội', N'000031', N'2018-02-12', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk9')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (32, N'Nguyễn Hoàng Nam', CAST(N'1982-01-23' AS Date), N'Hà Nội', N'Kinh', N'Kinh doanh', N'Hà Nội', N'000032', N'2015-02-23', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk10')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (33, N'Nguyễn Ánh Mai', CAST(N'2007-01-23' AS Date), N'Hà Nội', N'Kinh', N'Học sinh', N'Hà Nội', N'', N'', N'', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk10')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (34, N'Nguyễn Mai Ánh', CAST(N'2007-01-23' AS Date), N'Hà Nội', N'Kinh', N'Học sinh', N'Hà Nội', N'', N'', N'', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk10')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (35, N'Lê Hoàng Khánh', CAST(N'1984-02-03' AS Date), N'Hà Nội', N'Kinh', N'Kinh doanh', N'Hà Nội', N'000035', N'2015-01-23', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk10')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (36, N'Nguyễn Hồng Anh', CAST(N'1974-02-04' AS Date), N'Hà Nội', N'Kinh', N'Diễn viên', N'Hà Nội', N'000036', N'2016-03-27', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk11')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (37, N'Hoàng Văn Mạnh', CAST(N'1972-09-19' AS Date), N'Hà Nội', N'Kinh', N'Diễn viên', N'Hà Nội', N'000037', N'2017-01-04', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chồng', N'shk11')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (38, N'Hoàng Nam Anh', CAST(N'2002-02-23' AS Date), N'Hà Nội', N'Kinh', N'Sinh viên', N'Hà Nội', N'000038', N'2020-01-23', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk12')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (39, N'Lê Nguyễn Mai', CAST(N'1950-03-23' AS Date), N'Hà Nội', N'Kinh', N'Hưu trí', N'Hà Nội', N'000039', N'2010-01-23', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Mẹ', N'shk12')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (40, N'Bùi Đình Quang', CAST(N'1980-11-28' AS Date), N'Hà Nội', N'Kinh', N'Quản lí ', N'Hà Nội', N'000040', N'2015-02-03', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk13')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (41, N'Bùi Hoàng Viết Bảo', CAST(N'2008-02-27' AS Date), N'Hà Nội', N'Kinh', N'Học sinh', N'Hà Nội', N'', N'', N'', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk13')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (42, N'Bùi Thanh Thảo', CAST(N'2005-12-30' AS Date), N'Hà Nội', N'Kinh', N'Học sinh', N'Hà Nội', N'', N'', N'', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk13')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (43, N'Hoàng Thu Lan', CAST(N'1985-06-19' AS Date), N'Hà Nội', N'Kinh', N'Giáo viên', N'Hà Nội', N'000043', N'2015-01-23', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk13')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (44, N'Dương Bá Tân', CAST(N'1976-01-23' AS Date), N'Hà Nội', N'Kinh', N'Giảng viên', N'Hà Nội', N'000044', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk14')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (45, N'Dương Thi Thu Hà', CAST(N'1999-02-23' AS Date), N'Hà Nội', N'Kinh', N'Bác sĩ', N'Hà Nội', N'000045', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk14')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (46, N'Dương Bá Cường', CAST(N'2002-01-28' AS Date), N'Hà Nội', N'Kinh', N'Sinh viên', N'Thái Bình', N'000046', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk14')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (47, N'Nguyễn Thị Thùy Linh', CAST(N'1980-11-29' AS Date), N'Hà Nội', N'Kinh', N'Nội trợ', N'Hà Nội', N'000047', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk14')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (48, N'Dương Bá Cấp', CAST(N'1950-01-23' AS Date), N'Hà Nội', N'Kinh', N'Hưu trí', N'Hà Nội', N'000048', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Bố', N'shk14')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (49, N'Nguyễn Văn Anh', CAST(N'1970-01-25' AS Date), N'Hà Nội', N'Kinh', N'Bảo vệ', N'Hà Nội', N'000049', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk15')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (50, N'Nguyễn Tiến Minh', CAST(N'1998-10-19' AS Date), N'Hà Nội', N'Kinh', N'Kiến trúc sư', N'Hà Nội', N'000050', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk15')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (51, N'Hoàng Bảo Xuân', CAST(N'1976-12-16' AS Date), N'Hà Nội', N'Kinh', N'Kinh doanh', N'Hà Nội', N'000051', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk15')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (52, N'Lê Viết Huy', CAST(N'1980-07-06' AS Date), N'Hà Nội', N'Kinh', N'Lập trình viên', N'Hà Nội', N'000052', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk16')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (53, N'Nguyễn Hoàng Anh Tuấn', CAST(N'1973-02-04' AS Date), N'Hà Nội', N'Kinh', N'Trưởng Phòng', N'Hà Nội', N'000053', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk17')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (54, N'Nguyễn Hoàng Thái', CAST(N'1998-02-06' AS Date), N'Hà Nội', N'Kinh', N'Giáo viên', N'Hà Nội', N'000054', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk17')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (55, N'Lê Thu Thảo', CAST(N'1978-02-16' AS Date), N'Hà Nội', N'Kinh', N'Giáo viên', N'Hà Nội', N'000055', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk17')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (56, N'Nguyễn Duy Tùng', CAST(N'1984-03-29' AS Date), N'Hải Dương', N'Kinh', N'Kế toán', N'Hà Nội', N'000056', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk18')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (57, N'Nguyễn Thắng Mạnh', CAST(N'1999-02-08' AS Date), N'Hải Dương', N'Kinh', N'Kế toán', N'Hà Nội', N'000057', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk18')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (58, N'Nguyễn Hạ Mai', CAST(N'1984-03-07' AS Date), N'Hải Dương', N'Kinh', N'Kế toán', N'Hà Nội', N'000058', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk18')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (59, N'Dương Hoàng Minh', CAST(N'1975-02-06' AS Date), N'Hà Nội', N'Kinh', N'Giám đốc', N'Hà Nội', N'000059', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk19')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (60, N'Dương Quang Hiếu', CAST(N'2000-03-29' AS Date), N'Hà Nội', N'Kinh', N'Sinh viên', N'Hà Nội', N'000060', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk19')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (61, N'Nguyễn Minh Châu', CAST(N'1978-12-19' AS Date), N'Hà Nội', N'Kinh', N'Trưởng phòng', N'Hà Nội', N'000061', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk19')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (62, N'Lê Vũ Văn', CAST(N'1984-07-19' AS Date), N'Hà Nội', N'Kinh', N'Tự do', N'Hà Nội', N'000062', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk20')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (63, N'Nguyễn Nam Hán', CAST(N'1978-03-27' AS Date), N'Hà Nội', N'Kinh', N'Công nhân', N'Hà Nội', N'000063', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk21')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (64, N'Nguyễn Văn Nguyên', CAST(N'2004-05-18' AS Date), N'Hà Nội', N'Kinh', N'Học sinh', N'Hà Nội', N'000064', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk21')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (65, N'Nguyễn Thảo Vân', CAST(N'1980-03-08' AS Date), N'Hà Nội', N'Kinh', N'Giáo viên', N'Hà Nội', N'000065', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk21')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (66, N'Hà Văn Hào', CAST(N'1970-03-08' AS Date), N'Hà Nội', N'Kinh', N'Bác sĩ', N'Hà Nội', N'000066', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Chủ hộ', N'shk22')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (67, N'Nguyễn Mai Trang', CAST(N'1970-04-09' AS Date), N'Hà Nội', N'Kinh', N'Y tá', N'Hà Nội', N'000067', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Vợ', N'shk22')
INSERT [dbo].[Person] ([id_Person], [NamePerson], [BirthDay], [QueQuan], [DanToc], [NgheNghiep], [NoiLamViec], [SoCMND], [NgayCap], [NoiCap], [DcThuongTru], [QuanHe], [id_SHK]) VALUES (68, N'Hà Nguyễn Trúc Mai', CAST(N'2000-04-27' AS Date), N'Hà Nội', N'Kinh', N'Sinh viên', N'Hà Nội', N'000068', N'2015-06-25', N'CA Hà Nội', N'Phương Liên, Đống Đa, Hà Nội', N'Con', N'shk22')
GO
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk1', N'Nguyễn Văn Nam', 1, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk10', N'Nguyễn Hà Trang Anh', 10, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk11', N'Nguyễn Hồng Anh', 11, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk12', N'Nguyễn Hoàng Nam', 12, N'Tổ 1 ', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk13', N'Bùi Đình Quang', 13, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk14', N'Dương Bá Tân', 14, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk15', N'Nguyễn Văn Anh', 15, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk16', N'Lê Viết Huy', 16, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk17', N'Nguyễn Hoàng Anh Tuấn', 17, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk18', N'Nguyễn Duy Tùng', 18, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk19', N'Dương Hoàng Minh', 19, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk2', N'Phạm Bá Chính', 2, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', N'nobitachauphong@gmail.com')
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk20', N'Lê Vũ Văn  ', 20, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk21', N'Nguyễn Nam Hán', 21, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk22', N'Hà Văn Hào', 22, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk3', N'Mạc Đình Tung', 3, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', N'tuantran.pltn@gmail.com')
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk4', N'Lê Xuân Hạnh', 7, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk5', N'Dương Thị Thu Hà', 4, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk6', N'Phạm Thị An', 5, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk7', N'Nguyễn Thị Linh', 6, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk8', N'Bùi Văn Toàn', 8, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[SoHoKhau] ([id_SHK], [TenChuHo], [SoNha], [Xom], [Xa], [Huyen], [Tinh], [Email]) VALUES (N'shk9', N'Lê Bảo Hưng', 9, N'Tổ 1', N'Phương Liên', N'Đống Đa', N'Hà Nội', NULL)
GO
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk1', N'Tổ chức ngày Quốc tế Thiếu nhi năm 2020', CAST(N'10:00:00' AS Time), CAST(N'2020-05-15' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk10', N'Ủng hộ ảnh hưởng nước mặn miền Tây', CAST(N'07:00:00' AS Time), CAST(N'2020-05-13' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk11', N'Ủng hộ ảnh hưởng sạt lở', CAST(N'13:00:00' AS Time), CAST(N'2020-10-07' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk12', N'Báo cáo phòng chống dịch COVID', CAST(N'13:00:00' AS Time), CAST(N'2020-12-07' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk13', N'Bàn về phòng chống tệ nạn tại nơi cư trú', CAST(N'14:00:00' AS Time), CAST(N'2021-03-06' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk14', N'Bầu tổ dân phố năm 2021', CAST(N'07:00:00' AS Time), CAST(N'2021-01-05' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk15', N'Tổ chức tri ân Hội người cao tuổi', CAST(N'08:00:00' AS Time), CAST(N'2021-03-06' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk16', N'Tổ chức Tết Trung thu 2019', CAST(N'14:00:00' AS Time), CAST(N'2019-08-03' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk17', N'Thông báo thay đổi đăng ký tạm trú, tạm vắng', CAST(N'16:00:00' AS Time), CAST(N'2020-03-13' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk18', N'Phòng chống dịch sốt xuất huyết', CAST(N'09:00:00' AS Time), CAST(N'2020-07-04' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk19', N'Phòng chống dịch H5N1', CAST(N'09:00:00' AS Time), CAST(N'2020-05-05' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk2', N'Ủng hộ đồng bào miền Trung', CAST(N'18:00:00' AS Time), CAST(N'2020-05-14' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk20', N'Cảnh báo và phòng chống viêm gan B', CAST(N'15:00:00' AS Time), CAST(N'2020-04-06' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk3', N'Bầu tổ dân phố năm 2020', CAST(N'08:00:00' AS Time), CAST(N'2020-01-03' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk4', N'Họp phòng chống dịch COVID', CAST(N'07:00:00' AS Time), CAST(N'2020-06-08' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk5', N'Tổng kết công tác năm 2019', CAST(N'18:00:00' AS Time), CAST(N'2019-12-31' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk6', N'Tổng kết công tác năm 2020', CAST(N'18:00:00' AS Time), CAST(N'2020-12-31' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk7', N'Tổ chức Tết Trung thu năm 2020', CAST(N'16:00:00' AS Time), CAST(N'2020-08-06' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk8', N'Tổ chức ngày Quốc tế Thiếu nhi năm 2019', CAST(N'10:00:00' AS Time), CAST(N'2019-05-14' AS Date))
INSERT [dbo].[SuKien] ([id_SK], [NameSK], [ThoiGian], [NgayBD]) VALUES (N'sk9', N'Tổ chức ngày Quốc tế Phụ nữ năm 2020', CAST(N'06:00:00' AS Time), CAST(N'2020-03-01' AS Date))
GO
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk1', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk10', 1, N'Nguyễn Mai Ánh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk11', 1, N'Hoàng Văn Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk12', 1, N'Lê Nguyễn Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk13', 1, N'Bùi Hoàng Viết Bảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk14', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk15', 1, N'Hoàng Bảo Xuân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk17', 1, N'Nguyễn Hoàng Anh Tuấn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk18', 1, N'Nguyễn Hạ Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk19', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk2', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk20', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk21', 1, N'Nguyễn Văn Nguyên')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk22', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk3', 1, N'Mạc Văn Tuyền')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk4', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk5', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk6', 1, N'Phạm Trà My')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk8', 1, N'Bùi Viết Tân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk1', N'shk9', 1, N'Lê Mạnh Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk1', 1, N'Nguyễn Văn Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk10', 1, N'Nguyễn Mai Ánh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk11', 1, N'Hoàng Văn Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk12', 1, N'Lê Nguyễn Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk13', 1, N'Bùi Hoàng Viết Bảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk14', 1, N'Dương Bá Cường')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk15', 1, N'Hoàng Bảo Xuân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk17', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk18', 1, N'Nguyễn Duy Tùng')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk19', 1, N'Dương Quang Hiếu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk2', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk21', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk22', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk3', 1, N'Mạc Thị Phương')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk4', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk5', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk6', 1, N'Phạm Trà My')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk8', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk10', N'shk9', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk1', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk10', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk11', 1, N'Nguyễn Hồng Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk12', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk13', 1, N'Bùi Hoàng Viết Bảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk14', 1, N'Dương Bá Cường')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk15', 1, N'Nguyễn Văn Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk17', 1, N'Lê Thu Thảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk19', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk2', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk20', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk21', 1, N'Nguyễn Văn Nguyên')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk22', 1, N'Nguyễn Mai Trang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk3', 1, N'Mạc Văn Tuyền')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk4', 1, N'Lê Xuân Hạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk5', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk6', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk8', 1, N'Bùi Viết Tân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk11', N'shk9', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk1', 1, N'Nguyễn Trúc Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk10', 1, N'Nguyễn Mai Ánh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk11', 1, N'Hoàng Văn Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk12', 1, N'Lê Nguyễn Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk13', 1, N'Bùi Đình Quang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk14', 1, N'Dương Bá Tân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk15', 1, N'Nguyễn Tiến Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk17', 1, N'Lê Thu Thảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk19', 1, N'Dương Quang Hiếu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk2', 1, N'Phạm Bá Chiến')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk21', 1, N'Nguyễn Thảo Vân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk22', 1, N'Hà Văn Hào')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk3', 1, N'Mạc Văn Cường')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk4', 1, N'Lê Thị Trang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk5', 1, N'Nguyễn Thị Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk6', 1, N'Phạm Minh Hiếu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk8', 1, N'Bùi Văn Toàn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk12', N'shk9', 1, N'Lê Mạnh Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk1', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk10', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk11', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk12', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk13', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk14', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk15', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk16', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk17', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk18', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk19', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk2', 0, N'')
GO
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk20', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk21', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk22', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk3', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk4', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk5', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk6', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk7', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk8', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk13', N'shk9', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk1', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk10', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk11', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk12', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk13', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk14', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk15', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk16', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk17', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk18', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk19', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk2', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk20', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk21', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk22', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk3', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk4', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk5', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk6', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk7', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk8', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk14', N'shk9', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk1', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk10', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk11', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk12', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk13', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk14', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk15', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk16', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk17', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk18', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk19', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk2', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk20', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk21', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk22', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk3', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk4', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk5', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk6', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk7', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk8', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk15', N'shk9', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk1', 1, N'Nguyễn Văn Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk10', 1, N'Nguyễn Ánh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk11', 1, N'Hoàng Văn Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk12', 1, N'Lê Nguyễn Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk13', 1, N'Bùi Hoàng Viết Bảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk14', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk15', 1, N'Nguyễn Tiến Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk16', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk17', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk19', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk2', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk20', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk21', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk22', 1, N'Nguyễn Mai Trang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk3', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk4', 1, N'Lê Thị Vân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk5', 1, N'Nguyễn Thị Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk6', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk8', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk16', N'shk9', 1, N'Bùi Minh Hoa')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk1', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk10', 1, N'Nguyễn Ánh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk11', 1, N'Hoàng Văn Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk12', 1, N'Lê Nguyễn Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk13', 1, N'Bùi Thanh Thảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk14', 1, N'Dương Bá Tân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk15', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk17', 1, N'Nguyễn Hoàng Thái')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk19', 1, N'Dương Hoàng Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk2', 1, N'Phạm Bá Chính')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk21', 1, N'Nguyễn Nam Hán')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk22', 1, N'Hà Văn Hào')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk3', 1, N'Mạc Văn Tuyền')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk4', 1, N'Lê Xuân Hạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk5', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk6', 1, N'Phạm Thị An')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk7', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk8', 1, N'Bùi Thanh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk17', N'shk9', 1, N'Lê Mạnh Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk1', 1, N'Nguyễn Văn Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk10', 1, N'Nguyễn Hoàng Nam')
GO
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk11', 1, N'Nguyễn Hồng Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk12', 1, N'Hoàng Nam Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk13', 1, N'Bùi Hoàng Viết Bảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk14', 1, N'Dương Bá Cường')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk15', 1, N'Nguyễn Tiến Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk17', 1, N'Nguyễn Hoàng Thái')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk19', 1, N'Dương Quang Hiếu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk2', 1, N'Phạm Bá Chính')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk21', 1, N'Nguyễn Văn Nguyên')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk22', 1, N'Hà Văn Hào')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk3', 1, N'Mạc Văn Cường')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk4', 1, N'Dương Thị Nga')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk5', 1, N'Nguyễn Thị Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk6', 1, N'Phạm Trà My')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk8', 1, N'Bùi Văn Toàn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk18', N'shk9', 1, N'Lê Mạnh Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk1', 1, N'Nguyễn Hà Trang Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk10', 1, N'Nguyễn Ánh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk11', 1, N'Nguyễn Hồng Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk12', 1, N'Lê Nguyễn Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk13', 1, N'Bùi Hoàng Viết Bảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk14', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk15', 1, N'Nguyễn Văn Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk17', 1, N'Lê Thu Thảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk19', 1, N'Dương Quang Hiếu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk2', 1, N'Phạm Thị Minh Châu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk21', 1, N'Nguyễn Văn Nguyên')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk22', 1, N'Hà Văn Hào')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk3', 1, N'Mạc Đình Tung')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk4', 1, N'Dương Thị Nga')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk5', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk6', 1, N'Phạm Thị An')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk8', 1, N'Bùi Thanh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk19', N'shk9', 1, N'Lê Mạnh Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk1', 1, N'Lê Mai Hoa')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk10', 1, N'Nguyễn Ánh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk11', 1, N'Hoàng Văn Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk12', 1, N'Lê Nguyễn Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk13', 1, N'Bùi Hoàng Viết Bảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk14', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk15', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk17', 1, N'Nguyễn Hoàng Anh Tuấn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk18', 1, N'Nguyễn Hạ Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk19', 1, N'Dương Hoàng Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk2', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk21', 1, N'Nguyễn Văn Nguyên')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk22', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk3', 1, N'Mạc Trung Tình')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk4', 1, N'Lê Thị Vân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk5', 1, N'Nguyễn Thị Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk6', 1, N'Phạm Minh Hiếu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk7', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk8', 1, N'Nguyễn Mai Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk2', N'shk9', 1, N'Bùi Minh Hoa')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk1', 1, N'Nguyễn Trúc Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk10', 1, N'Nguyễn Hoàng Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk11', 1, N'Nguyễn Hồng Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk12', 1, N'Hoàng Nam Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk13', 1, N'Bùi Hoàng Viết Bảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk14', 1, N'Dương Bá Tân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk15', 1, N'Nguyễn Tiến Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk17', 1, N'Nguyễn Hoàng Anh Tuấn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk19', 1, N'Nguyễn Minh Châu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk2', 1, N'Phạm Bá Chính')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk21', 1, N'Nguyễn Nam Hán')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk22', 1, N'Nguyễn Mai Trang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk3', 1, N'Mạc Văn Tuyến')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk4', 1, N'Dương Thị Nga')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk5', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk6', 1, N'Phạm Minh Hiếu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk8', 1, N'Bùi Văn Toàn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk20', N'shk9', 1, N'Lê Bảo Hưng')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk1', 1, N'Nguyễn Văn Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk10', 1, N'Nguyễn Mai Ánh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk11', 1, N'Hoàng Văn Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk12', 1, N'Hoàng Nam Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk13', 1, N'Bùi Thanh Thảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk14', 1, N'Dương Bá Tân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk15', 1, N'Nguyễn Văn Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk17', 1, N'Nguyễn Hoàng Anh Tuấn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk19', 1, N'Nguyễn Minh Châu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk2', 1, N'Phạm Thị Minh Châu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk21', 1, N'Nguyễn Văn Nguyên')
GO
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk22', 1, N'Hà Văn Hào')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk3', 1, N'Mạc Văn Tuyến')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk4', 1, N'Dương Thị Nga')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk5', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk6', 1, N'Phạm Trà My')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk8', 1, N'Bùi Thanh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk3', N'shk9', 1, N'Lê Mạnh Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk1', 1, N'Nguyễn Văn Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk10', 1, N'Nguyễn Mai Ánh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk11', 1, N'Hoàng Văn Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk12', 1, N'Hoàng Nam Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk13', 1, N'Hoàng Thu Lan')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk14', 1, N'Dương Bá Cường')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk15', 1, N'Nguyễn Tiến Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk17', 1, N'Nguyễn Hoàng Thái')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk18', 1, N'Nguyễn Duy Tùng')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk19', 1, N'Dương Hoàng Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk2', 1, N'Phạm Bá Chính')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk21', 1, N'Nguyễn Nam Hán')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk22', 1, N'Hà Văn Hào')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk3', 1, N'Mạc Văn Cường')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk4', 1, N'Lê Thị Trang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk5', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk6', 1, N'Phạm Trà My')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk8', 1, N'Bùi Thanh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk4', N'shk9', 1, N'Lê Mạnh Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk1', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk10', 1, N'Nguyễn Ánh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk11', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk12', 1, N'Lê Nguyễn Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk13', 1, N'Bùi Thanh Thảo')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk14', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk15', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk17', 1, N'Nguyễn Hoàng Thái')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk18', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk19', 1, N'Dương Quang Hiếu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk2', 1, N'Phạm Thị Minh Châu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk20', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk21', 1, N'Nguyễn Văn Nguyên')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk22', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk3', 1, N'Mạc Văn Cường')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk4', 1, N'Dương Thị Nga')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk5', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk6', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk8', 1, N'Bùi Viết Tân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk5', N'shk9', 1, N'Lê Mạnh Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk1', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk10', 1, N'Nguyễn Ánh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk11', 1, N'Nguyễn Hồng Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk12', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk13', 1, N'Hoàng Thu Lan')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk14', 1, N'Dương Bá Tân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk15', 1, N'Nguyễn Tiến Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk17', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk19', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk2', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk21', 1, N'Nguyễn Thảo Vân')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk22', 1, N'Nguyễn Mai Trang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk3', 1, N'Mạc Đình Tung')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk4', 1, N'Lê Thị Trang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk5', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk6', 1, N'Phạm Minh Hiếu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk8', 1, N'Nguyễn Mai Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk6', N'shk9', 1, N'Lê Bảo Hưng')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk1', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk10', 1, N'Nguyễn Mai Ánh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk11', 1, N'Hoàng Văn Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk12', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk13', 1, N'Bùi Đình Quang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk14', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk15', 1, N'Nguyễn Tiến Minh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk17', 1, N'Nguyễn Hoàng Thái')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk19', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk2', 1, N'Phạm Thị Minh Châu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk20', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk21', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk22', 1, N'Nguyễn Mai Trang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk3', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk4', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk5', 1, N'Nguyễn Thị Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk6', 1, N'Phạm Minh Hiếu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk8', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk7', N'shk9', 1, N'Lê Mạnh Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk1', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk10', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk11', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk12', 0, NULL)
GO
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk13', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk14', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk15', 1, N'Nguyễn Văn Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk16', 1, N'Lê Viết Huy')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk17', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk18', 1, N'Nguyễn Thắng Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk19', 1, N'Nguyễn Minh Châu')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk2', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk21', 1, N'Nguyễn Nam Hán')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk22', 1, N'Nguyễn Mai Trang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk3', 1, N'Mạc Văn Cường')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk4', 1, N'Lê Xuân Hạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk5', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk6', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk8', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk8', N'shk9', 1, N'Lê Mạnh Nam')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk1', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk10', 1, N'Nguyễn Ánh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk11', 1, N'Hoàng Văn Mạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk12', 1, N'Hoàng Nam Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk13', 1, N'Bùi Đình Quang')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk14', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk15', 1, N'Nguyễn Văn Anh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk16', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk17', 1, N'Nguyễn Hoàng Anh Tuấn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk18', 1, N'Nguyễn Hạ Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk19', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk2', 1, N'Phạm Bá Chiến')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk20', 1, N'Lê Vũ Văn')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk21', 0, N'')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk22', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk3', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk4', 1, N'Lê Xuân Hạnh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk5', 1, N'Dương Thi Thu Hà')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk6', 0, NULL)
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk7', 1, N'Nguyễn Thị Linh')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk8', 1, N'Bùi Thanh Mai')
INSERT [dbo].[ThamGia] ([id_SK], [id_SHK], [Status], [NguoiDaiDien]) VALUES (N'sk9', N'shk9', 1, N'Bùi Minh Hoa')
GO
/****** Object:  Index [IX_Login]    Script Date: 11/30/2020 8:34:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Login] ON [dbo].[Login]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_NoiLamViec]  DEFAULT (N'Hà Nội') FOR [NoiLamViec]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [nc_default]  DEFAULT ('2015-06-25') FOR [NgayCap]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_NoiCap]  DEFAULT (N'CA Hà Nội') FOR [NoiCap]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_DcThuongTru]  DEFAULT (N'Phương Liên, Đống Đa, Hà Nội') FOR [DcThuongTru]
GO
ALTER TABLE [dbo].[SoHoKhau] ADD  CONSTRAINT [DF_SoHoKhau_Xa]  DEFAULT (N'Phương Liên') FOR [Xa]
GO
ALTER TABLE [dbo].[SoHoKhau] ADD  CONSTRAINT [DF_SoHoKhau_Huyen]  DEFAULT (N'Đống Đa') FOR [Huyen]
GO
ALTER TABLE [dbo].[SoHoKhau] ADD  CONSTRAINT [DF_SoHoKhau_Tinh]  DEFAULT (N'Hà Nội') FOR [Tinh]
GO
ALTER TABLE [dbo].[ThamGia] ADD  CONSTRAINT [DF_ThamGia_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[CanBo]  WITH CHECK ADD  CONSTRAINT [FK_CanBo_Person] FOREIGN KEY([id_Person])
REFERENCES [dbo].[Person] ([id_Person])
GO
ALTER TABLE [dbo].[CanBo] CHECK CONSTRAINT [FK_CanBo_Person]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_SoHoKhau] FOREIGN KEY([id_SHK])
REFERENCES [dbo].[SoHoKhau] ([id_SHK])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_SoHoKhau]
GO
ALTER TABLE [dbo].[ThamGia]  WITH CHECK ADD  CONSTRAINT [FK_ThamGia_SoHoKhau] FOREIGN KEY([id_SHK])
REFERENCES [dbo].[SoHoKhau] ([id_SHK])
GO
ALTER TABLE [dbo].[ThamGia] CHECK CONSTRAINT [FK_ThamGia_SoHoKhau]
GO
ALTER TABLE [dbo].[ThamGia]  WITH CHECK ADD  CONSTRAINT [FK_ThamGia_SuKien] FOREIGN KEY([id_SK])
REFERENCES [dbo].[SuKien] ([id_SK])
GO
ALTER TABLE [dbo].[ThamGia] CHECK CONSTRAINT [FK_ThamGia_SuKien]
GO
USE [master]
GO
ALTER DATABASE [dbCNPM] SET  READ_WRITE 
GO
