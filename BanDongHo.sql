USE [master]
GO
/****** Object:  Database [db_BanDongHo]    Script Date: 9/24/2021 7:45:43 PM ******/
CREATE DATABASE [db_BanDongHo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_BanDongHo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_BanDongHo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_BanDongHo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_BanDongHo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_BanDongHo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_BanDongHo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_BanDongHo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_BanDongHo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_BanDongHo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_BanDongHo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_BanDongHo] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_BanDongHo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_BanDongHo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_BanDongHo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_BanDongHo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_BanDongHo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_BanDongHo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_BanDongHo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_BanDongHo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_BanDongHo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_BanDongHo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_BanDongHo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_BanDongHo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_BanDongHo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_BanDongHo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_BanDongHo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_BanDongHo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_BanDongHo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_BanDongHo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_BanDongHo] SET  MULTI_USER 
GO
ALTER DATABASE [db_BanDongHo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_BanDongHo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_BanDongHo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_BanDongHo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_BanDongHo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_BanDongHo] SET QUERY_STORE = OFF
GO
USE [db_BanDongHo]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[MaBV] [int] IDENTITY(1,1) NOT NULL,
	[TenTKDang] [varchar](20) NOT NULL,
	[TenTKCapNhat] [varchar](20) NOT NULL,
	[NgayDang] [date] NOT NULL,
	[NgayCapNhat] [date] NOT NULL,
	[HinhDD] [nvarchar](max) NOT NULL,
	[TenBV] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BaiViet] PRIMARY KEY CLUSTERED 
(
	[MaBV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDonHang]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonHang](
	[SoDH] [int] NOT NULL,
	[MaDH] [varchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaTien] [decimal](18, 0) NOT NULL,
	[ThanhTien] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_CTDonHangDH] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC,
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPhieuNhap]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuNhap](
	[SoPN] [int] NOT NULL,
	[MaDH] [varchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaTien] [decimal](18, 0) NOT NULL,
	[ThanhTien] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_CTPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[SoPN] ASC,
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DongHo]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongHo](
	[MaDH] [varchar](50) NOT NULL,
	[MaTH] [int] NOT NULL,
	[NguonGoc] [nvarchar](15) NOT NULL,
	[KieuMay] [nvarchar](20) NOT NULL,
	[KichCo] [varchar](30) NULL,
	[DoDay] [varchar](30) NULL,
	[ChatLieuVo] [nvarchar](50) NOT NULL,
	[ChatLieuDay] [nvarchar](20) NOT NULL,
	[ChatLieuKinh] [nvarchar](30) NOT NULL,
	[DoChiuNuoc] [nvarchar](30) NOT NULL,
	[ChucNangKhac] [nvarchar](100) NULL,
	[GioiTinh] [bit] NOT NULL,
	[HinhDD] [nvarchar](max) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[MoTaCT] [nvarchar](max) NULL,
	[GiaBan] [decimal](18, 0) NOT NULL,
	[GiamGia] [int] NULL,
	[BaoHanh] [nvarchar](10) NOT NULL,
	[TenTKDang] [varchar](20) NOT NULL,
	[TenTKCapNhat] [varchar](20) NOT NULL,
	[NgayDang] [date] NOT NULL,
	[NgayCapNhat] [date] NOT NULL,
 CONSTRAINT [PK_DongHo] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[SoDH] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoanKH] [varchar](20) NOT NULL,
	[TaiKhoanNV] [varchar](20) NULL,
	[NgayDat] [date] NOT NULL,
	[NgayGiao] [date] NULL,
	[SoDT] [varchar](10) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[TongSoMua] [int] NOT NULL,
	[ThanhToan] [decimal](18, 0) NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[MaTT] [int] NOT NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[TaiKhoan] [varchar](20) NOT NULL,
	[MatKhau] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SoDT] [varchar](10) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Email] [varchar](50) NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgayTao] [date] NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDT] [varchar](10) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[TaiKhoan] [varchar](20) NOT NULL,
	[MatKhau] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[SoDT] [varchar](10) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[MaNhom] [int] NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhom]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhom](
	[MaNhom] [int] IDENTITY(1,1) NOT NULL,
	[TenNhom] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Nhom] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[MaPH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[NgayGui] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ChuDe] [nvarchar](100) NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[MaPH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[SoPN] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NOT NULL,
	[TenTKLap] [varchar](20) NOT NULL,
	[TenTKCapNhat] [varchar](20) NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[NgayCapNhat] [date] NOT NULL,
	[TongSoNhap] [int] NOT NULL,
	[ThanhToan] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[SoPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaTH] [int] IDENTITY(1,1) NOT NULL,
	[TenTH] [varchar](50) NOT NULL,
	[HinhDD] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[MaTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 9/24/2021 7:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[TenTT] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BaiViet] ON 

INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1002, N'diemnt', N'longnt', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/chronograph-chronometer.jpg', N'CHRONOGRAPH VÀ CHRONOMETER – SỰ KHÁC BIỆT LÀ GÌ?', N'<p style="text-align:justify">Khi bước v&agrave;o thế giới đồng hồ, chắc hẳn bạn sẽ nghe đến 2 từ: Chronograph v&agrave; Chronometer. Ch&uacute;ng c&oacute; vẻ giống nhau ở tiền tố &ldquo;Chrono&rdquo; n&ecirc;n c&oacute; rất nhiều người hiểu nhầm hoặc sử dụng lẫn lộn. Nếu bạn cũng chưa chắc chắn về điều n&agrave;y th&igrave; b&agrave;i viết sau đ&acirc;y d&agrave;nh cho bạn.</p>

<h2 style="text-align:justify"><strong>1. Bản chất của Chronograph v&agrave; Chronometer</strong></h2>

<p style="text-align:justify"><strong><em>Chronograph</em></strong>&nbsp;l&agrave; chức năng bấm giờ của đồng hồ. Đồng hồ Chronograph l&agrave; đồng hồ c&oacute; chức năng bấm giờ, d&ugrave;ng đo lường ch&iacute;nh x&aacute;c một khoảng thời gian.</p>

<p style="text-align:justify"><strong><em>Chronometer</em></strong>&nbsp;l&agrave; một chứng nhận cao qu&yacute; về độ ch&iacute;nh x&aacute;c của đồng hồ được kiểm duyệt v&agrave; cấp bởi COSC (Contr&ocirc;le Officiel Suisse des Chronom&egrave;tres) - một tổ chức uy t&iacute;n hoạt động độc lập, chịu tr&aacute;ch nhiệm chứng nhận độ ch&iacute;nh x&aacute;c của đồng hồ ở Thụy Sĩ.</p>

<p style="text-align:justify">Vậy về bản chất, Chronograph v&agrave; Chronometer ho&agrave;n to&agrave;n kh&aacute;c biệt. Giờ th&igrave; ch&uacute;ng ta h&atilde;y t&igrave;m hiểu kỹ hơn về từng loại.</p>

<h2 style="text-align:justify"><strong>2. Chronograph v&agrave; đồng hồ Chronoraph</strong></h2>

<p style="text-align:justify">Đồng hồ Chronogaph ra đời từ năm 1816. Đặc điểm nhận diện một chiếc Chronograph l&agrave; ch&uacute;ng c&oacute; th&ecirc;m mặt số phụ hoặc mặt số điện tử (LCD) hiển thị thời gian bấm giờ. Mẫu Chronograph phổ biến nhất hiện nay c&oacute; 3 mặt số phụ v&agrave; 3 n&uacute;t điều chỉnh.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/image-0-compressed.jpg" style="height:349px; width:605px" /></p>

<p style="text-align:justify">T&ugrave;y từng thiết kế v&agrave; độ ch&iacute;nh x&aacute;c của ph&eacute;p đo m&agrave; c&aacute;c phi&ecirc;n bản Chronograph c&oacute; cấu tạo v&agrave; th&ocirc;ng số kh&aacute;c nhau.</p>

<h2 style="text-align:justify"><strong>3. Chronometer v&agrave; đồng hồ Chronometer</strong></h2>

<p style="text-align:justify">Để đạt được chứng nhận COSC, một chiếc đồng hồ phải trải qua h&agrave;ng loạt cuộc thử nghiệm khắc nghiệt được tiến h&agrave;nh trong 15 ng&agrave;y đ&ecirc;m li&ecirc;n tục ở 5 vị tr&iacute; v&agrave; 3 mức nhiệt độ kh&aacute;c nhau. Đồng hồ đạt ti&ecirc;u chuẩn ISO 1359, chỉ được ph&eacute;p sai số trong khoảng -4 đến +6 gi&acirc;y/ng&agrave;y sẽ được cấp giấy chứng nhận (Chronometer Certificate) v&agrave; một m&atilde; số x&aacute;c minh duy nhất.</p>

<p style="text-align:justify">Khi xuất xưởng, ch&uacute;ng được in d&ograve;ng chữ &ldquo;Chronometer&rdquo; tr&ecirc;n mặt số, nắp lưng hoặc trong m&aacute;y đồng hồ.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/image-1-compressed.jpg" style="height:402px; width:605px" /></p>

<p style="text-align:center"><strong><em>D&ograve;ng chữ Chronometer nằm ki&ecirc;u h&atilde;nh tr&ecirc;n mặt số của Rolex</em></strong></p>

<p style="text-align:justify">Tuy kh&ocirc;ng c&oacute; ti&ecirc;u chuẩn cụ thể n&agrave;o cho đồng hồ Quartz, nhưng COSC cũng tiến h&agrave;nh một quy tr&igrave;nh thử nghiệm tương tự như đồng hồ cơ.</p>

<p style="text-align:justify">Mỗi chiếc Quartz sẽ được thử nghiệm trong 11 ng&agrave;y li&ecirc;n tục ở 1 vị tr&iacute; v&agrave; 3 mức nhiệt kh&aacute;c nhau. Ngo&agrave;i ra, trong suốt 1 ng&agrave;y, n&oacute; phải quay cả 3 chiều trong kh&ocirc;ng gian để giả định như sử dụng ở thực tế b&ecirc;n ngo&agrave;i. Cuối c&ugrave;ng, n&oacute; phải chịu 200 c&uacute; sốc tương đương với 100G (mạnh hơn 100 lần so với lực hấp dẫn).</p>

<p style="text-align:justify">Một chiếc đồng hồ điện tử Chronometer c&oacute; độ ch&iacute;nh x&aacute;c gấp 10 lần so với đồng hồ quartz th&ocirc;ng thường. Hiện nay, chỉ c&oacute; 3% đồng hồ Thụy Sĩ sản xuất ra c&oacute; chứng nhận Chronometer, đủ để biết điều kiện đạt chuẩn Chronometer kh&oacute; đến mức n&agrave;o.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/image-2-compressed.jpg" style="height:293px; width:600px" /></p>

<p style="text-align:justify">Một chiếc đồng hồ Chronometer ho&agrave;n to&agrave;n c&oacute; thể c&oacute; chức năng Chronograph v&agrave; ngược lại. Nhưng một chiếc Chronometer kh&ocirc;ng đồng nghĩa với việc n&oacute; được t&iacute;ch hợp chức năng Chronograph. Hay chẳng đồng hồ Chronograph n&agrave;o nhất thiết phải c&oacute; chứng nhận Chronometer.</p>

<p style="text-align:justify">Như vậy, ch&uacute;ng ta đ&atilde; ph&acirc;n biệt v&agrave; hiểu r&otilde; hơn về Chronograph v&agrave; Chronometer. Bạn đ&atilde; tự tin hơn khi nhắc đến ch&uacute;ng trong c&aacute;c cuộc thảo luận li&ecirc;n quan đến đồng hồ rồi chứ?</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1003, N'diemnt', N'longnt', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/dong-ho-seiko-solar-chronograph.jpg', N'CHRONOGRAPH LÀ GÌ, BẠN ĐÃ THỰC SỰ HIỂU?', N'<p style="text-align:justify">Trong thế giới đồng hồ, những chiếc Chronograph &ldquo;chất&rdquo;, đa chức năng lu&ocirc;n thu h&uacute;t mạnh mẽ &aacute;nh mắt đầu ti&ecirc;n của ph&aacute;i mạnh.</p>

<p style="text-align:justify">Tuy nhi&ecirc;n, kh&ocirc;ng phải ai cũng biết Chronogaph l&agrave; g&igrave;, n&oacute; hoạt động ra sao, thậm ch&iacute; c&oacute; nhiều người đeo m&agrave; chưa bao giờ sử dụng đến. C&ograve;n bạn, liệu bạn đ&atilde; thực sự hiểu Chronograph l&agrave; g&igrave; v&agrave; chức năng Chronograhp l&agrave; g&igrave; chưa?</p>

<h2 style="text-align:justify"><strong>1. Đặc điểm nhận dạng đồng hồ Chronograph l&agrave; g&igrave;?</strong></h2>

<p style="text-align:justify">Chronograph bắt nguồn từ tiếng Hy Lạp mang nghĩa &ldquo;m&aacute;y ghi thời gian&rdquo;. Chronograph ch&iacute;nh x&aacute;c l&agrave; chức năng bấm giờ.</p>

<p style="text-align:justify"><em>Một số thắc mắc kh&aacute;c li&ecirc;n quan đến Chronograph:</em></p>

<ul>
	<li style="text-align:justify">Đồng hồ Chronograph l&agrave; g&igrave;: Đồng hồ c&oacute; t&iacute;ch hợp chức năng bấm giờ.</li>
	<li style="text-align:justify">Đồng hồ quartz chronograph l&agrave; g&igrave;: Đồng hồ quartz (đồng hồ thạch anh) c&oacute; chức năng bấm giờ.</li>
	<li style="text-align:justify">Đồng hồ automatic chronograph l&agrave; g&igrave;: Đồng hồ cơ l&ecirc;n d&acirc;y c&oacute;t tự động c&oacute; chức năng bấm giờ.</li>
</ul>

<p style="text-align:justify"><strong><em>Nhận dạng đồng hồ Chronograph:</em></strong>&nbsp;một điều tất yếu, ch&uacute;ng c&oacute; cấu tạo mặt số phức tạp hơn đồng hồ chỉ c&oacute; chức năng xem giờ th&ocirc;ng thường. Thang đo Chronograph thường được biểu thị bằng c&aacute;c mặt số phụ (2 v&ograve;ng tr&ograve;n nhỏ) tr&ecirc;n mặt số.</p>

<p style="text-align:justify">V&iacute; dụ: Quan s&aacute;t cấu tạo của chiếc Orient FTV02003D0 dưới đ&acirc;y:</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/chro-1.jpg" /></p>

<p style="text-align:justify">B&ecirc;n phải vỏ đồng hồ c&oacute; 3 chiếc n&uacute;m: 1 n&uacute;m ở trung t&acirc;m v&agrave; 2 n&uacute;t bấm ở b&ecirc;n cạnh. Trong đ&oacute;, chiếc n&uacute;m ở vị tr&iacute; trung t&acirc;m d&ugrave;ng để chỉnh ng&agrave;y, giờ, kh&ocirc;ng d&ugrave;ng cho chức năng Chronograph.</p>

<ul>
	<li style="text-align:justify">N&uacute;t bấm ở vị tr&iacute; 2 giờ: c&oacute; chức năng lần lượt: start/stop - &nbsp;khởi động v&agrave; dừng chức năng Chronograph.</li>
	<li style="text-align:justify">N&uacute;t bấm ở vị tr&iacute; 4 giờ: reset - c&agrave;i đặt kim gi&acirc;y Chronograph về vị tr&iacute; ban đầu (12 giờ)</li>
</ul>

<h2 style="text-align:justify"><strong>2. Th&ocirc;ng thường, một chiếc Chronograph thường c&oacute; 3 mặt số phụ đặc trưng:</strong></h2>

<p style="text-align:justify"><strong><em>Mặt số phụ 24 giờ</em></strong>: gi&uacute;p người xem ph&acirc;n biệt ng&agrave;y hay đ&ecirc;m.</p>

<p style="text-align:justify"><strong><em>Mặt số phụ 60 gi&acirc;y</em></strong>: hiển thị thời gian tr&ocirc;i quan theo gi&acirc;y thay cho chức năng của kim gi&acirc;y trung t&acirc;m ở những chiếc đồng hồ th&ocirc;ng thường. Với chiếc Orient Chronograph n&agrave;y, kim gi&acirc;y trung t&acirc;m d&ugrave;ng để bấm giờ Chronograph.</p>

<p style="text-align:justify"><strong><em>Mặt hiển thị phụ 60 ph&uacute;t</em></strong>: hiển thị thang đo Chronograph theo ph&uacute;t.</p>

<p style="text-align:justify">Orient Chronograph FTV02003D0 h&igrave;nh tr&ecirc;n c&oacute; đơn vị đo nhỏ nhất l&agrave; 1 gi&acirc;y, thời gian đo tối đa l&agrave; 60 ph&uacute;t.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/chro-2-400x201.jpg" /></p>

<p style="text-align:justify">T&ugrave;y từng thiết kế v&agrave; độ ch&iacute;nh x&aacute;c của ph&eacute;p đo m&agrave; c&aacute;c phi&ecirc;n bản Chronograph c&oacute; cấu tạo v&agrave; th&ocirc;ng số kh&aacute;c nhau.</p>

<p style="text-align:justify">Đồng hồ Chronograph mang chung phong c&aacute;ch năng động, khỏe khoắn. Ch&uacute;ng rất hữu dụng để song h&agrave;nh c&ugrave;ng bạn l&uacute;c tập luyện, khi tham gia những trận đấu gay cấn hay những hoạt động thể thao ngo&agrave;i trời.</p>

<p style="text-align:justify">Nếu như bạn y&ecirc;u phong c&aacute;ch mạnh mẽ đầy l&ocirc;i cuốn, Chronograph ho&agrave;n to&agrave;n sinh ra để d&agrave;nh cho bạn.</p>

<h2 style="text-align:justify"><strong>3. Hướng dẫn sử dụng đồng hồ chronograph</strong></h2>

<p style="text-align:justify">Cơ bản, chức năng bấm giờ ở đồng hồ Chronograph kh&ocirc;ng qu&aacute; kh&oacute;. Chronograph c&oacute; lẽ chỉ l&agrave;m bạn bối rối một ch&uacute;t trong lần đầu th&ocirc;i.</p>

<p style="text-align:justify">X&eacute;t v&iacute; dụ về c&aacute;c bước sử dụng d&ograve;ng Chronograph 3 mặt số phụ, 3 n&uacute;t bấm phổ biến nhất hiện nay: Trước khi sử dụng chức năng bấm giờ, bạn cần đảm bảo kim Chronograph đang nằm tại vị tr&iacute; 12 giờ.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/chro-3.jpg" /></p>

<p style="text-align:justify">Bước 1: Nhấn n&uacute;t Start (thường ở vị tr&iacute; 2 giờ) để bắt đầu.</p>

<p style="text-align:justify">Bước 2: Nhấn n&uacute;t Stop (thường ở vị tr&iacute; 4 giờ) để kết th&uacute;c.</p>

<p style="text-align:justify">Bước 3: Đọc giờ tr&ecirc;n c&aacute;c thang đo Chronograph tương ứng.</p>

<p style="text-align:justify">Bước 4: Đặt lại kim gi&acirc;y Chronograph về vị tr&iacute; ban đầu bằng c&aacute;ch nhấn n&uacute;t Reset.</p>

<h2 style="text-align:justify"><strong>4.Kh&ocirc;ng nhiều người biết Chronograph được khai sinh từ 200 năm trước</strong></h2>

<p style="text-align:justify">Năm 1816, chiếc Chronograph đầu ti&ecirc;n được ph&aacute;t minh bởi Louis Moinet &ndash; một họa sĩ, nh&agrave; chế t&aacute;c đồng hồ người Ph&aacute;p. Ng&agrave;y đ&oacute;, n&oacute; đơn thuần sử dụng một chiếc b&uacute;t đ&aacute;nh dấu tr&ecirc;n mặt đồng hồ, độ d&agrave;i cung tr&ograve;n biểu thị thời gian tr&ocirc;i qua.</p>

<p style="text-align:justify">Đến năm 1821, theo y&ecirc;u cầu của vua Louis XVIII, một người thợ kh&aacute;c t&ecirc;n Nicolas Mathieu Rieussec được ủy nhiệm chế tạo chiếc Chronograph thương mại h&oacute;a đầu ti&ecirc;n. Rieussec được xem l&agrave; nh&agrave; ph&aacute;t minh Chronograph cho đến khi người ta lật lại lịch sử v&agrave; kh&aacute;m ph&aacute; ra chiếc Chronograph bỏ t&uacute;i đầu ti&ecirc;n của Moinet.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/chro-4.jpg" /></p>

<p style="text-align:center"><strong><em>Cận cảnh 3 mặt số phụ Chronograph của cỗ m&aacute;y đến từ Longines</em></strong></p>

<p style="text-align:justify">Đồng hồ Chronograph về sau ng&agrave;y c&agrave;ng c&oacute; những bước cải tiến quan trọng v&agrave; được sử dụng rộng r&atilde;i nhất v&agrave;o thế kỷ XX.</p>

<p style="text-align:justify">Hiện nay, c&aacute;c h&atilde;ng đồng hồ tr&ecirc;n thế giới đều ph&aacute;t triển v&agrave; c&oacute; những bộ sưu tập Chronograph mang phong c&aacute;ch ri&ecirc;ng. Người d&ugrave;ng c&oacute; nhiều sự lựa chọn hơn với những mức gi&aacute; cũng đa dạng kh&ocirc;ng k&eacute;m.</p>

<h2 style="text-align:justify"><strong>5.Chronograph v&agrave; nhiều hơn thế nữa</strong></h2>

<p style="text-align:justify">Trước khi đồng hồ bấm giờ điện tử ra đời, đồng hồ Chronograph đ&oacute;ng vai tr&ograve; quan trọng trong việc ghi lại thời gian của c&aacute;c sự kiện: từ những cuộc đua ngựa, đua xe tới phục vụ ng&agrave;nh h&agrave;ng kh&ocirc;ng, hải qu&acirc;n, qu&acirc;n đội,&hellip;</p>

<p style="text-align:justify">C&aacute;c phi&ecirc;n bản Chronograph d&ugrave;ng cho hoạt động lặn biển được thiết kế đặc biệt với độ chống nước v&agrave; độ chống ăn m&ograve;n cao. Chronograph c&ograve;n đ&oacute;ng g&oacute;p lớn cho ng&agrave;nh h&agrave;ng kh&ocirc;ng vũ trụ, điển h&igrave;nh như chiếc Omega Speedmaster lừng lẫy một thời đ&atilde; ho&agrave;n th&agrave;nh sứ mệnh vẻ vang khi c&ugrave;ng c&aacute;c phi h&agrave;nh gia NASA&rsquo;s Apollo tr&ecirc;n mặt trăng thực hiện nhiệm vụ.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/chro-5.jpg" /></p>

<p style="text-align:center"><strong><em>Chronograph c&oacute; thang Tachymeter</em></strong></p>

<p style="text-align:justify">Để t&iacute;ch hợp th&ecirc;m c&aacute;c t&iacute;nh năng cho đồng hồ, một c&aacute;ch hữu dụng v&agrave; th&ocirc;ng minh, người ta sử dụng đến v&ograve;ng bezel. Từ những năm đầu thế kỷ XX, rất nhiều mẫu Chronograph c&oacute; v&ograve;ng bezel với thang đo Tachymeter đ&atilde; được tung ra. Chức năng n&agrave;y gi&uacute;p t&iacute;nh to&aacute;n số đơn vị tr&ecirc;n giờ, đặc biệt để d&ugrave;ng trong việc đo tốc độ km/giờ hoặc dặm/giờ.</p>

<p style="text-align:justify">Bạn cũng c&oacute; thể t&igrave;m thấy một chiếc Chronograph t&iacute;ch hợp thang Pulsometer để đo nhịp tim trong bệnh viện. Thậm ch&iacute; rất đơn giản, ch&uacute;ng được sử dụng như một c&ocirc;ng cụ đo thời gian nấu ăn trong nh&agrave; bếp.</p>

<p style="text-align:justify">Những kiến thức cung cấp trong b&agrave;i viết n&agrave;y c&oacute; lẽ vẫn c&ograve;n hạn chế so với lịch sử hơn 200 năm chuyển m&igrave;nh mạnh mẽ của một t&iacute;nh năng tuyệt vời như Chronograph. Ng&agrave;y nay, khi c&ocirc;ng nghệ số đang dần chiếm lĩnh thế giới th&igrave; những chiếc đồng hồ truyền thống, đồng hồ Chronograph vẫn nguy&ecirc;n vẹn gi&aacute; trị thời gian v&agrave; s&aacute;ng tạo của m&igrave;nh.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1004, N'diemnt', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/cac-loai-may-dong-ho-pho-bien.jpg', N'GIẢI MÃ CÁC LOẠI MÁY ĐỒNG HỒ PHỔ BIẾN', N'<p style="text-align:justify">Được v&iacute; như &ldquo;Linh hồn của những cỗ m&aacute;y thời gian&rdquo;, Movement đ&oacute;ng vai tr&ograve; vận h&agrave;nh, tạo ra nguồn năng lượng sống cho đồng hồ hoạt động! C&oacute; bao giờ bạn tự hỏi: Chiếc đồng hồ của bạn được r&aacute;p bộ m&aacute;y n&agrave;o v&agrave; gốc g&aacute;c lịch sử của m&aacute;y đ&oacute; chưa?</p>

<p dir="ltr" style="text-align:justify">H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i đi giải m&atilde; b&iacute; ẩn đằng sau những cỗ m&aacute;y đồng hồ Nhật Bản, Thụy Sĩ ngay trong b&agrave;i viết dưới đ&acirc;y nh&eacute;!&nbsp;&nbsp;&nbsp;</p>

<h2 dir="ltr" style="text-align:justify">1/ ETA Movement</h2>

<p dir="ltr" style="text-align:justify">L&agrave; linh hồn của h&agrave;ng triệu chiếc đồng hồ sản xuất ra mỗi năm, trong đ&oacute; phải kể đến Longines, Ogival, Tissot&hellip; ETA được mệnh danh l&agrave; h&atilde;ng sản xuất M&Aacute;Y ĐỒNG HỒ lớn nhất tr&ecirc;n thế giới.</p>

<p style="text-align:center"><img alt="Bộ máy đồng hồ ETA Movement" src="https://xwatch.vn/upload_images/images/2020/06/04/may-dong-ho-eta.jpg" style="height:533px; width:800px" /></p>

<p dir="ltr" style="text-align:justify">Tuy nhi&ecirc;n, t&ugrave;y từng d&ograve;ng đồng hồ từ đắt tiền đến rẻ tiền m&agrave; b&ecirc;n trong ch&uacute;ng sẽ sử dụng cỗ m&aacute;y ETA cấp độ kh&aacute;c nhau.C&aacute;c h&atilde;ng hồ sau khi nhập m&aacute;y về sẽ dựa tr&ecirc;n nền tảng c&oacute; sẵn v&agrave; s&aacute;ng tạo, thay đổi th&ecirc;m theo y&ecirc;u cầu của họ.</p>

<p dir="ltr" style="text-align:justify">Vậy c&oacute; bao nhi&ecirc;u cấp độ của ETA Movement&nbsp;v&agrave; ch&uacute;ng được x&aacute;c định như thế n&agrave;o? Dưới đ&acirc;y l&agrave; cấp độ cơ bản của m&aacute;y ETA với số hiệu thường thấy 2xxx - xx.</p>

<p style="text-align:center"><img alt="ETA Movement Thuỵ Sĩ" src="https://xwatch.vn/upload_images/images/2020/06/04/bo-may-eta-movement.jpg" style="height:500px; width:667px" /></p>

<p dir="ltr" style="text-align:justify">Được biết hiện nay, m&aacute;y ETA2xxx - xx&nbsp; được ph&acirc;n l&agrave;m 4 cấp độ từ thấp đến cao bao gồm: Standard, Elabore, Top Grade v&agrave; Chronometer. Để ph&acirc;n cấp 4 loại m&aacute;y n&agrave;y, người ta dựa v&agrave;o độ ho&agrave;n thiện, chất lượng linh kiện (d&acirc;y c&oacute;t, d&acirc;y t&oacute;c, bộ phận chống sốc&hellip;) v&agrave; mức sai số. Trong đ&oacute;, một trong những yếu tố quan trọng để đ&aacute;nh gi&aacute; ch&iacute;nh l&agrave; Incabloc (bộ phận chống sốc).</p>

<p dir="ltr" style="text-align:justify">C&aacute;c cấp độ m&aacute;y Elabore, Top Grade v&agrave; Chronometer của ETA đều c&oacute; Incabloc c&ograve;n Standard th&igrave; rất rất hiếm. Ch&iacute;nh v&igrave; thế, dựa v&agrave;o đ&acirc;y, 99% người ta c&oacute; thể nhận dạng ch&iacute;nh x&aacute;c được: đ&acirc;y c&oacute; phải ETA-Standard?</p>

<p dir="ltr" style="text-align:justify">Ngo&agrave;i ra, người ta c&ograve;n dựa v&agrave;o chất liệu mỗi b&aacute;nh răng, nh&ocirc;ng cốt v&agrave; ch&acirc;n k&iacute;nh trong m&aacute;y đồng hồ để ph&acirc;n biệt cấp độ.</p>

<p dir="ltr" style="text-align:justify">Ruby trong m&aacute;y Standard l&agrave; thủy tinh giả ngọc, trong khi ruby d&ugrave;ng trong c&aacute;c ph&acirc;n hạng cao hơn được nhấn mạnh l&agrave; gia c&ocirc;ng bởi thợ kim ho&agrave;n v&agrave; độ trong của m&agrave;u sắc vượt trội.</p>

<p dir="ltr" style="text-align:justify">Như vậy, ta cũng c&oacute; thể dễ d&agrave;ng ph&acirc;n biệt được m&aacute;y ETA-Standard với c&aacute;c cấp độ m&aacute;y kh&aacute;c. Vậy, ETA-Elabore v&agrave; ETA-Top Grade kh&aacute;c nhau như thế n&agrave;o?</p>

<p dir="ltr" style="text-align:justify">Điểm mấu chốt nằm ở Balance (b&aacute;nh xoay) - yếu tố quyết định đến độ ch&iacute;nh x&aacute;c của đồng hồ m&agrave; chỉ cần dựa v&agrave;o mắt thường, ta cũng c&oacute; thể nh&igrave;n thấy sự kh&aacute;c biệt. B&aacute;nh xoay m&aacute;y ETA-Top Grade ho&agrave;n thiện hơn cả về cấu tạo v&agrave; chất lượng. Đ&acirc;y ch&iacute;nh l&agrave; l&yacute; do m&agrave; hầu hết m&aacute;y ETA-Elabore sẽ sử dụng trong những chiếc đồng hồ b&igrave;nh thường c&ograve;n Top Grade được d&ugrave;ng trong sản phẩm cao cấp hơn.&nbsp;</p>

<p dir="ltr" style="text-align:justify">Cấp độ cao nhất của m&aacute;y ETA l&agrave; Chronometer. Thực chất, đ&acirc;y ch&iacute;nh l&agrave; ETA-Top Grade được COSC - Tổ chức kiểm định chất lượng đồng hồ Thụy Sĩ c&ocirc;ng nhận.&nbsp;</p>

<p dir="ltr" style="text-align:justify">Những m&aacute;y đồng hồ ETA-Top Grade được gửi đến COSC sẽ trải qua c&aacute;c b&agrave;i test cực kỳ gắt gao v&agrave; chỉ những cỗ m&aacute;y đạt chuẩn của COSC khi gửi về mới được chứng nhận Chronometer.</p>

<p dir="ltr" style="text-align:justify">C&aacute;c m&aacute;y ETA đạt được chứng nhận Chronometer sẽ được in số seri tr&ecirc;n th&acirc;n m&aacute;y như 1 dấu hiệu chỉ r&otilde; sự kh&aacute;c biệt với 1 m&aacute;y Topgrade.</p>

<p style="text-align:center"><img alt="Bộ máy ETA Swiss" src="https://xwatch.vn/upload_images/images/2020/06/04/may-dong-ho-eta-thuy-sy.jpg" style="height:450px; width:800px" /></p>

<p dir="ltr" style="text-align:justify">Tuy nhi&ecirc;n, điều m&agrave; d&acirc;n chơi đồng hồ đ&iacute;ch nhắm đến cuối c&ugrave;ng l&agrave; In-house movement. C&oacute; nhiều loại m&aacute;y in-house nổi tiếng trong đ&oacute; c&oacute; in-house của&nbsp;<a href="https://www.rolex.com/vi" rel="nofollow" target="_blank">Rolex</a>, Omega, Patek Philippe&hellip; nhưng kh&ocirc;ng phải tất cả ch&uacute;ng đều ho&agrave;n hảo.&nbsp;</p>

<p dir="ltr" style="text-align:justify">Nếu in-house l&agrave; Seiko (trừ Grand Seiko), Citizen, hay Poljot của Nga hoặc c&aacute;c h&atilde;ng Trung Hoa th&igrave; giới s&agrave;nh chơi khuy&ecirc;n: tốt nhất bạn n&ecirc;n x&agrave;i ETA.</p>

<p dir="ltr" style="text-align:justify">Hiện tại, ETA Thụy Sĩ vẫn đang được thế giới đ&aacute;nh gi&aacute; cao về chất lượng. D&ugrave; ETA ở cấp n&agrave;o th&igrave; chăng nữa th&igrave; vẫn l&agrave; h&agrave;ng tốt, c&aacute;c m&aacute;y ETA x&agrave;i 20 năm vẫn c&ograve;n ổn.&nbsp;</p>

<p dir="ltr" style="text-align:justify">Đ&oacute; l&agrave; l&yacute; do m&agrave; tr&ecirc;n Amazon nếu đồng hồ d&ugrave;ng Miyota (Citizen) chỉ tầm 200-300$, nếu x&agrave;i ETA th&igrave; cũng phải tầm 500$. Nhưng nếu bạn mua đồng hồ tr&ecirc;n 2000- 3000 USD th&igrave; h&atilde;y nghĩ đến in-house kh&aacute;c.</p>

<p dir="ltr" style="text-align:justify">Đ&oacute;ng vai tr&ograve; &ldquo;người anh h&ugrave;ng thầm lặng&rdquo; g&oacute;p phần l&agrave;m n&ecirc;n t&ecirc;n tuổi của c&aacute;c h&atilde;ng đồng hồ. ETA qu&aacute; l&agrave; tuyệt vời phải kh&ocirc;ng anh em?</p>

<h2 dir="ltr" style="text-align:justify">2/ Omega Co-Axial</h2>

<p dir="ltr" style="text-align:justify">Một trong những ph&aacute;t minh quan trọng nhất trong ng&agrave;nh c&ocirc;ng nghiệp sản xuất đồng hồ được Omega nắm giữ đ&oacute; l&agrave; cơ cấu hồi&nbsp;<a href="http://www.xwatch.vn/blog/dong-ho-omega-va-ky-thuat-co-axial-p2859.html" target="_blank">Co-Axial</a>&nbsp;Escapement. Hiện nay cơ cấu hồi đặc biệt n&agrave;y đ&atilde; c&oacute; mặt tr&ecirc;n hầu hết những mẫu đồng hồ cao cấp của Omega.</p>

<p dir="ltr" style="text-align:justify">Cơ cấu hồi Co-Axial Escapement do nh&agrave; sản xuất đồng hồ người Anh George Daniels đưa ra hơn 20 năm trước. George Daniels đ&atilde; nhận thấy một số vấn đề li&ecirc;n quan đến độ ch&iacute;nh x&aacute;c v&agrave; tin cậy của đồng hồ cơ kh&iacute;, đặc biệt l&agrave; ma s&aacute;t trượt giữa ch&acirc;n k&iacute;nh với răng của b&aacute;nh răng trong cơ cấu hồi.</p>

<p dir="ltr" style="text-align:justify">➤ Hạn chế của cơ cấu hồi nguy&ecirc;n bản</p>

<p dir="ltr" style="text-align:justify">Tr&ecirc;n cơ cấu hồi kiểu cổ điển của Thomas Mudge sử dụng c&aacute;c ch&acirc;n k&iacute;nh thực hiện cả chức năng kho&aacute; v&agrave; truyền lực từ hệ thống b&aacute;nh răng đến b&aacute;nh lắc (balance). V&agrave; ch&iacute;nh điều n&agrave;y đ&atilde; tạo ra c&aacute;c xung tr&ecirc;n bề mặt của ch&acirc;n k&iacute;nh, g&acirc;y ra hiện tượng trượt tr&ecirc;n bề mặt răng của b&aacute;nh răng cơ cấu hồi trong qu&aacute; tr&igrave;nh truyền lực.&nbsp;</p>

<p style="text-align:center"><img alt="Bộ máy đồng hồ Co-Axial Escapement" src="https://xwatch.vn/upload_images/images/2020/06/04/may-dong-ho-Co-Axial-Omega.jpg" style="height:550px; width:571px" /></p>

<p dir="ltr" style="text-align:justify">Hiện tượng trượt buộc c&aacute;c nh&agrave; sản xuất đồng hồ phải sử dụng loại dầu đặc biệt để b&ocirc;i trơn bề mặt sao cho ch&uacute;ng chuyển động thật trơn tru. Do c&oacute; hiện tượng d&iacute;nh ướt của dầu cho n&ecirc;n hiệu quả truyền lực bị giảm đ&aacute;ng kể dẫn đến giảm bi&ecirc;n độ dao động của b&aacute;nh lắc v&agrave; do đ&oacute; giảm độ ch&iacute;nh x&aacute;c của đồng hồ.</p>

<p dir="ltr" style="text-align:justify">➤ Cải tiến của cơ cấu hồi Co-Axial Escapement</p>

<p dir="ltr" style="text-align:justify">George Daniels đ&atilde; ph&aacute;t triển Co-Axial Escapement với mục đ&iacute;ch ph&acirc;n chia chức năng kho&aacute; v&agrave; truyền lực của cơ cấu hồi th&ocirc;ng qua bốn ch&acirc;n k&iacute;nh. B&aacute;nh răng A l&agrave; một b&aacute;nh răng thứ tư trong hệ b&aacute;nh răng đ&atilde; được thay đổi, cung cấp momen xoắn cho cơ cấu hồi. C v&agrave; D l&agrave; b&aacute;nh răng &ldquo;Co-Axial Wheel&rdquo;, c&oacute; chức năng như một b&aacute;nh răng hồi (escape wheel). Hai b&aacute;nh răng C v&agrave; D được gắn cứng với nhau tr&ecirc;n c&ugrave;ng một trục B v&agrave; đ&acirc;y l&agrave; nguồn gốc của t&ecirc;n gọi &ldquo;Co-Axial&rdquo; tức l&agrave; đồng trục.</p>

<p dir="ltr" style="text-align:justify">C&oacute; thể thấy rằng kh&ocirc;ng c&oacute; hiện tượng trượt giữ ch&acirc;n k&iacute;nh với bề mặt răng của b&aacute;nh răng trong qu&aacute; tr&igrave;nh truyền lực, ma s&aacute;t cũng được giảm đ&aacute;ng kể v&agrave; kh&ocirc;ng cần sử dụng dầu b&ocirc;i trơn, giữ cho bi&ecirc;n độ của b&aacute;nh lắc kh&ocirc;ng bị ảnh hưởng. Ch&iacute;nh điều n&agrave;y gi&uacute;p cho Co-Axial Escapement l&agrave; một giải ph&aacute;p tuyệt vời n&acirc;ng cao độ ch&iacute;nh x&aacute;c v&agrave; tin cậy của đồng hồ.</p>

<h2 dir="ltr" style="text-align:justify">3/ M&aacute;y Eco-Drive</h2>

<p dir="ltr" style="text-align:justify">Hơn 80% đồng hồ Citizen thuộc d&ograve;ng m&aacute;y Eco-Drive. Đ&oacute; l&agrave; con số khổng lồ mang đến sự lớn mạnh kh&ocirc;ng ngừng v&agrave; khả năng cạnh tranh khốc liệt của Citizen với bất kỳ thương hiệu n&agrave;o kh&aacute;c. Ngo&agrave;i ra, Eco - Drive Citizen sở hữu những t&iacute;nh năng nổi trội m&agrave; khiến nhiều người phải ngạc nhi&ecirc;n.</p>

<p style="text-align:center"><img alt="Máy đồng hồ Citizen Eco- Drive" src="https://xwatch.vn/upload_images/images/2020/06/04/may-dong-ho-eco-drive-citizen.jpg" style="height:400px; width:692px" /></p>

<p dir="ltr" style="text-align:justify">► Sau khi sạc đầy, d&ugrave; kh&ocirc;ng được tiếp x&uacute;c với &aacute;nh s&aacute;ng, đồng hồ vẫn c&oacute; thể chạy trong v&ograve;ng 6 th&aacute;ng, thậm ch&iacute; một năm.</p>

<p dir="ltr" style="text-align:justify">► Kh&ocirc;ng sử dụng pin chứa thủy ng&acirc;n th&ocirc;ng thường, n&ecirc;n rất th&acirc;n thiện với m&ocirc;i trường.</p>

<p style="text-align:center"><img alt="Cách hoạt động của máy Eco- Drive" src="https://xwatch.vn/upload_images/images/2020/06/04/citizen-eco-drive-movent.jpg" style="height:416px; width:800px" /></p>

<p dir="ltr" style="text-align:justify">► C&oacute; thể sạc từ đ&egrave;n huỳnh quang hoặc nến. Mặc d&ugrave; năng lượng t&iacute;ch trữ từ nguồn kh&ocirc;ng nhiều, nhưng vẫn đủ gi&uacute;p đồng hồ hoạt động đến s&aacute;ng h&ocirc;m sau.</p>

<p dir="ltr" style="text-align:justify">► Eco - Drive c&oacute; khả năng tự động điều chỉnh để tiết kiệm năng lượng. Nếu thiếu s&aacute;ng dưới mức cho ph&eacute;p, trong 1 thời gian d&agrave;i, đồng hồ sẽ ngưng hoạt động của kim gi&acirc;y v&agrave; kim ph&uacute;t, để tiết kiệm năng lượng phục vụ cho bộ nhớ đếm giờ. Khi tiếp x&uacute;c với &aacute;nh s&aacute;ng trở lại v&agrave; nạp đủ năng lượng đồng hồ sẽ tự động điều chỉnh quay kim đến giờ hiện tại.</p>

<p dir="ltr" style="text-align:justify">►Tuổi thọ của tấm panel mặt trời v&agrave; pin sạc bền từ 15-20 năm.</p>

<p dir="ltr" style="text-align:justify">Tuy nhi&ecirc;n d&ugrave;ng thời gian l&acirc;u cũng c&oacute; thể g&acirc;y ra hiện tượng chai pin. Khi đ&oacute; h&atilde;y mang đồng hồ tới c&aacute;c địa chỉ uy t&iacute;n để kịp thời sửa chữa.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1005, N'diemnt', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/swiss-made-la-gi.jpg', N'ĐỊNH NGHĨA ĐẦY ĐỦ VỀ SWISS MADE', N'<p style="text-align:justify">Trong thế giới đồng hồ, cụm từ Swiss Made hay Made in Switzerland ở vị tr&iacute; 6h, n&oacute; lại c&oacute; &yacute; nghĩa rất đặc biệt.</p>

<p style="text-align:justify"><strong><em>Swiss Made</em></strong>&nbsp;l&agrave; cụm từ được gắn tr&ecirc;n những sản phẩm được sản xuất tại Thụy Sĩ. Nếu trong sản xuất h&agrave;ng h&oacute;a, n&oacute; chỉ đơn thuần d&ugrave;ng &aacute;m chỉ nơi sản xuất sản phẩm ấy như&nbsp;<em>Made in China, Made in Vietnam</em>&nbsp;hay&nbsp;<em>Made in Japan</em>&nbsp;...</p>

<p style="text-align:justify">Tuy nhi&ecirc;n, trong thế giới đồng hồ, cụm từ&nbsp;<em><strong>Swiss Made</strong></em>&nbsp;hay&nbsp;<em><strong>Made in Switzerland</strong></em>&nbsp;ở vị tr&iacute; 6h, n&oacute; lại c&oacute; &yacute; nghĩa rất đặc biệt. Kh&ocirc;ng chỉ l&agrave; t&ecirc;n của nơi sản xuất, n&oacute; c&ograve;n l&agrave; đẳng cấp v&agrave; gi&aacute; trị của một chiếc đồng hồ thực thụ!</p>

<p style="text-align:justify">Để được gắn m&aacute;c&nbsp;<strong><em>Swiss Made</em></strong>, những cỗ m&aacute;y đo thời gian phải trải qua 1 quy tr&igrave;nh thẩm định nghi&ecirc;m ngặt của ch&iacute;nh phủ Thụy Sĩ. Những ti&ecirc;u chuẩn n&agrave;y thay đổi theo thời gian, ph&ugrave; hợp với sự ph&aacute;t triển của ng&agrave;nh đồng hồ thế giới.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-swiss-made.jpg" style="height:419px; width:700px" /></p>

<p style="text-align:justify">Ng&agrave;y 17/12/2014, cuộc họp của Hiệp hội đồng hồ thế giới đ&atilde; th&ocirc;ng qua những nguy&ecirc;n tắc cho việc điều chỉnh quy định từ năm 1971 trong việc gắn m&aacute;c&nbsp;<strong><em>Swiss Made</em></strong>&nbsp;cho đồng hồ. Hiện nay, một chiếc đồng hồ được xem l&agrave; Swiss Made cần đ&aacute;p ứng 3 ti&ecirc;u chuẩn sau:</p>

<p style="text-align:justify"><em>- Được trang bị movement Thụy Sĩ</em></p>

<p style="text-align:justify"><em>- Chứng minh tỷ lệ linh kiện Thụy Sĩ tối thiểu l&agrave; 60%</em></p>

<p style="text-align:justify"><em><em>- Bắt buộc phải thực hiện việc nghi&ecirc;n cứu v&agrave; ph&aacute;t triển kỹ thuật tại Thụy Sĩ</em></em></p>

<p style="text-align:justify">Quy định bắt buộc việc nghi&ecirc;n cứu v&agrave; ph&aacute;t triển kỹ thuật tại Thụy Sĩ (đặc biệt l&agrave; thiết kế v&agrave; l&agrave;m mẫu) để ph&ugrave; hợp với y&ecirc;u cầu Luật thương hiệu. Theo đ&oacute;,&nbsp;<strong><em>Swiss Made</em></strong>&nbsp;phải tương ứng với nơi thực hiện hoạt động l&agrave;m ra c&aacute;c sản phẩm đồng hồ - thể hiện sự h&ograve;a trộn giữa kỹ thuật v&agrave; thẩm mỹ, thiết kế v&agrave; mẫu m&atilde;, từ đ&oacute; m&agrave; to&aacute;t l&ecirc;n sự đặc trưng cho những sản phẩm mang danh Thụy Sĩ.</p>

<p style="text-align:justify">Năm 2007, Hiệp hội đồng hồ Thụy Sĩ đ&atilde; ban h&agrave;nh 1 dự thảo luật sửa đổi, nhưng phải đợi kết luận của Quốc hội để đưa v&agrave;o luật, trước khi bắt đầu sửa đổi v&agrave;o 6/2013. Người ta mong muốn mọi dự luật li&ecirc;n quan sẽ được Hội đồng ban h&agrave;nh v&agrave;o cuối năm 2015 v&agrave; được &aacute;p dụng v&agrave;o năm 2017.</p>

<p style="text-align:center"><img alt="Định nghĩa đầy đủ về Swiss Made" src="http://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-swiss-made-2.jpg" style="height:274px; width:700px" /></p>

<p style="text-align:justify">Tương lai, nh&atilde;n hiệu Swiss Made sẽ c&oacute; &yacute; nghĩa l&agrave;:</p>

<p style="text-align:justify"><em>-</em>&nbsp;<em>Tối thiểu 60% gi&aacute; trị Thụy Sĩ cấu th&agrave;nh movement</em></p>

<p style="text-align:justify"><em>- Việc lắp r&aacute;p v&agrave; kiểm định m&aacute;y cuối c&ugrave;ng được tiến h&agrave;nh ở Thụy Sĩ</em></p>

<p style="text-align:justify"><em>- Việc ph&aacute;t triển kỹ thuật của movement v&agrave; đồng hồ được tiến h&agrave;nh ở Thụy Sĩ.</em></p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1006, N'diemnt', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/may-eta-movement.jpg', N'ETA MOVEMENT - LINH HỒN CỦA CỖ MÁY THỜI GIAN', N'<p style="text-align:justify">Điều g&igrave; tạo n&ecirc;n gi&aacute; trị v&agrave; vẻ đẹp s&acirc;u k&iacute;n của mỗi chiếc đồng hồ Thụy Sĩ? Kh&ocirc;ng g&igrave; kh&aacute;c đ&oacute; ch&iacute;nh l&agrave; bộ m&aacute;y ETA Movement</p>

<p style="text-align:justify">Điều g&igrave; tạo n&ecirc;n gi&aacute; trị v&agrave; vẻ đẹp s&acirc;u k&iacute;n của mỗi chiếc đồng hồ Thụy Sĩ? Kh&ocirc;ng g&igrave; kh&aacute;c đ&oacute; ch&iacute;nh l&agrave; bộ m&aacute;y ETA Movement, tạo n&ecirc;n những chuyển động, sự sống v&agrave; linh hồn của cỗ m&aacute;y đo thời gian.</p>

<p style="text-align:justify">Hầu hết, c&aacute;c thương hiệu đồng hồ Thụy Sĩ đều sử dụng c&aacute;c cỗ m&aacute;y ETA l&agrave;m tr&aacute;i tim cho những đứa con của m&igrave;nh. V&agrave; trong c&ocirc;ng nghiệp chế t&aacute;c đồng hồ, ETA Movement cũng được chia th&agrave;nh nhiều cấp bậc. H&atilde;y c&ugrave;ng t&igrave;m hiểu!</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/may-eta-movement-compressed.jpg" style="height:363px; width:700px" /></p>

<p style="text-align:justify"><strong>Cấp độ 1:</strong>&nbsp;M&aacute;y in-house l&agrave; d&ograve;ng m&aacute;y do h&atilde;ng tự sản xuất, sử dụng cho đồng hồ của ri&ecirc;ng m&igrave;nh, v&agrave; thường c&oacute; gi&aacute; trị, gi&aacute; th&agrave;nh rất cao.</p>

<p style="text-align:justify"><em>V&iacute; dụ:</em>&nbsp;Patek Philippe, IWC, Vacheron Constantin, Jaeger-LeCoultre, Omega, Breitling, Rolex...</p>

<p style="text-align:justify"><strong>Cấp độ 2:</strong>&nbsp;M&aacute;y ETA l&agrave; d&ograve;ng m&aacute;y phổ biến được sử dụng trong c&aacute;c đồng hồ Thụy Sĩ hiện nay.</p>

<p style="text-align:justify"><em>V&iacute; dụ:</em>&nbsp;Omega, Longines, Tissot, Montblanc, Movado, Rado...</p>

<p style="text-align:justify"><strong>Cấp độ 3:</strong>&nbsp;M&aacute;y Sellita - C&ocirc;ng ty con của ETA trước đ&acirc;y.</p>

<p style="text-align:justify"><strong>Cấp độ 4:</strong>&nbsp;M&aacute;y Ronda - Chuy&ecirc;n sản xuất Swiss Quartz.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/may-eta-movement-3-compressed.jpg" style="height:379px; width:699px" /></p>

<p style="text-align:justify">B&agrave;i viết dưới đ&acirc;y sẽ đề cập đến m&aacute;y ETA cũng như h&atilde;ng ETA - h&atilde;ng sản xuất m&aacute;y v&agrave; linh kiện đồng hồ lớn nhất thế giới hiện nay. Từ đ&oacute;, bạn sẽ hiểu hơn về gi&aacute; trị của mỗi chiếc đồng hồ Thụy Sĩ mang lại.</p>

<p style="text-align:justify">H&atilde;ng ETA SA - Manufacture Horlogere Suisse (ETA SA Swiss Watch Manufacture), được h&atilde;ng Eterna v&agrave;o năm 1756; tuy nhi&ecirc;n một số ph&agrave;n d&acirc;y chuyền của n&oacute; lại ra đời từ năm 1793 của h&atilde;ng Fabriques d&#39;Horlogerie de Fontainemelon (FHF). Trụ sở ch&iacute;nh tại Grenchen, Thụy Sĩ.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/may-eta-movement-1-compressed.jpg" style="height:393px; width:700px" /></p>

<p style="text-align:justify">ETA c&oacute; khả năng sản xuất được tất cả c&aacute;c th&agrave;nh phần cần thiết của 1 chiếc đồng hồ ho&agrave;n chỉnh, do đ&oacute; n&oacute; được xem l&agrave; 1 nh&agrave; sản xuất d&#39;horlogerie. M&aacute;y của ETA được sử dụng cho c&aacute;c h&atilde;ng thuộc tập đo&agrave;n Swatch v&agrave; cả những h&atilde;ng đồng hồ nước ngo&agrave;i. Trải qua nhiều lần s&aacute;t nhập, ETA trở th&agrave;nh vị vu trong sản xuất linh kiện đồng hồ.</p>

<p style="text-align:justify">Hiện nay, ETA trở th&agrave;nh 1 c&ocirc;ng ty con của The Swatch Group sau khi r&uacute;t khỏi nh&oacute;m sản xuất đồng hồ danh tiếng: JLC của tập đo&agrave;n Richemont, Frederic Piguet v&agrave; Nouvelle Lemania (thuộc Swatch Group). H&atilde;ng n&agrave;y vẫn được coi l&agrave; h&atilde;ng cung cấp m&aacute;y, linh kiện đồng hồ lớn nhất thế giới; với số lượng 5 triệu m&aacute;y / năm m&agrave; kh&oacute; h&atilde;ng n&agrave;o c&oacute; thể vượt qua.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/may-eta-movement-2-compressed.jpg" style="height:362px; width:701px" /></p>

<p style="text-align:justify">Số lượng m&aacute;y ETA l&agrave;m ra c&oacute; thể gọi l&agrave; mass goods với số lượng khổng lồ. Hầu hết m&aacute;y Quartz, ETA phối hợp với c&aacute;c h&atilde;ng b&ecirc;n ngo&agrave;i Thụy Sĩ để c&oacute; gi&aacute; th&agrave;nh thấp. Tuy nhi&ecirc;n, phần l&otilde;i vẫn được sản xuất tại Thụy Sĩ. Trụ sở ch&iacute;nh của ETA tại Thụy Sĩ tập trung chủ yếu v&agrave;o c&aacute;c ph&aacute;t minh mới.</p>

<p style="text-align:justify">ETA cung cấp nhiều loại m&aacute;y Automatic c&oacute; k&iacute;ch cỡ v&agrave; chức năng kh&aacute;c nhau như m&aacute;y Chronograph (Cal.6497 v&agrave; 98) v&agrave; c&aacute;c loại m&aacute;y Manual Wind (Cal.1727 v&agrave; 7001). ETA c&oacute; thể đ&aacute;p ứng được hầu hết y&ecirc;u cầu của c&aacute;c h&atilde;ng đồng hồ, kể cả d&ograve;ng m&aacute;y Quartz.</p>

<p style="text-align:justify">Th&agrave;nh c&ocirc;ng vang dội của Swatch - đồng hồ thuần ETA 100%, h&agrave;ng triệu franc Thụy Sĩ đ&atilde; được đổ v&agrave;o đầu tư c&aacute;c kỹ thuật mới. ETA l&agrave; chủ sở hữu của hơn 20 cơ sở sản xuất tại Ph&aacute;p, Thụy Sĩ, Malaysia, Đức v&agrave; Th&aacute;i Lan.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/may-eta-movement-5-compressed.jpg" style="height:359px; width:700px" /></p>

<p style="text-align:justify">N&oacute;i đến m&aacute;y ETA, người ta hiểu n&oacute; theo những gi&aacute; trị kh&aacute;c nhau.</p>

<p style="text-align:justify"><em>V&iacute; dụ:</em>&nbsp;Cal.6498 gi&aacute; kh&ocirc;ng hề rẻ v&igrave; c&oacute; Incabloc anti-shock, Glycudur balance wheel with crews; c&ograve;n Cal. 6498-1 sẽ c&oacute; gi&aacute; cao hơn v&igrave; th&ecirc;m một v&agrave;i chi tiết.</p>

<p style="text-align:justify">Xem l&yacute; lịch của 1 chiếc đồng hồ lu&ocirc;n cần ch&uacute; &yacute; về m&aacute;y. Nếu l&agrave; m&aacute;y ETA nguy&ecirc;n gốc th&igrave; gi&aacute; kh&aacute; thấp; c&ograve;n m&aacute;y được modified lại (chế t&aacute;c v&agrave; chỉnh sửa tr&ecirc;n nền ETA gốc) sẽ c&oacute; gi&aacute; cao hơn rất nhiều.</p>

<p style="text-align:justify"><em>V&iacute; dụ:</em>&nbsp;Cal.6498 c&oacute; gi&aacute; khoảng $800; c&ograve;n 1 chiếc được modified th&ecirc;m 1 số chức năng như kỹ thuật hand-engraved d&ugrave;ng Cal.6498-1 c&oacute; gi&aacute; tr&ecirc;n $7500.</p>

<p style="text-align:justify">Ch&iacute;nh việc hiểu biết r&otilde; về loại m&aacute;y v&agrave; đặc điểm của cỗ m&aacute;y b&ecirc;n trong m&agrave; ch&uacute;ng ta định được gi&aacute; trị của 1 chiếc đồng hồ. Mong rằng qua b&agrave;i viết n&agrave;y, c&aacute;c bạn c&oacute; thể hiểu được phần n&agrave;o gi&aacute; trị thực sự của 1 chiếc đồng hồ Thụy Sĩ, biết được l&yacute; do v&igrave; sao lại c&oacute; những loại m&aacute;y ETA đắt rẻ.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1007, N'diemnt', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/chronometre-min.jpg', N'CẮT NGHĨA KHÁI NIỆM CHRONOMETER LÀ GÌ?', N'<p style="text-align:justify">Đối với những chiếc đồng hồ Thụy Sĩ cao cấp, chứng nhận Chronometer lu&ocirc;n l&agrave; một trong những ti&ecirc;u chuẩn h&agrave;ng đầu.</p>

<p style="text-align:justify">Đối với những chiếc đồng hồ Thụy Sĩ cao cấp, chứng nhận Chronometer lu&ocirc;n l&agrave; một trong những ti&ecirc;u chuẩn h&agrave;ng đầu, được ghi ở ph&iacute;a sau hoặc b&ecirc;n trong cỗ m&aacute;y. Vậy Chronometer l&agrave; g&igrave;? N&oacute; kh&aacute;c g&igrave; so với những chiếc đồng hồ th&ocirc;ng thường?</p>

<p style="text-align:justify"><strong><em>Chronometer v&agrave; Chronograph</em></strong></p>

<p style="text-align:justify">Đừng nhầm lẫn, đ&acirc;y l&agrave; 2 kh&aacute;i niệm ho&agrave;n to&agrave;n kh&aacute;c nhau! Chronograph l&agrave; chức năng bấm giờ thể thao. Chronometer l&agrave; giấy chứng nhận về độ ch&iacute;nh x&aacute;c của đồng hồ đeo tay.</p>

<p style="text-align:justify">Một chiếc đồng hồ được cấp chứng nhận chronometer l&agrave; chiếc đồng hồ c&oacute; độ ch&iacute;nh x&aacute;c cao được kiểm duyệt v&agrave; chứng thực bởi tổ chức COSC&nbsp;<em>(Contr&ocirc;le Officiel Suisse des Chronom&egrave;tres</em>) - chuy&ecirc;n chịu tr&aacute;ch nhiệm về việc kiểm nghiệm chất lượng đồng hồ.</p>

<p style="text-align:justify">Để nhận được chứng nhận Chronometer n&agrave;y, đồng hồ phải vượt qua h&agrave;ng loạt cuộc thử nghiệm khắc nghiệt được tiến h&agrave;nh trong 15 ng&agrave;y đ&ecirc;m li&ecirc;n tục ở 5 vị tr&iacute; v&agrave; 3 mức nhiệt độ kh&aacute;c nhau.</p>

<p style="text-align:justify">Những chiếc đồng hồ n&agrave;y chỉ sai số trong khoảng từ 4 đến 6 gi&acirc;y/ng&agrave;y.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-chronometer-min.jpg" style="height:342px; width:700px" /></p>

<p style="text-align:justify"><strong><em>C&aacute;c b&agrave;i kiểm tra</em></strong></p>

<p style="text-align:justify">COSC tiến h&agrave;nh ph&eacute;p thử độ ch&iacute;nh x&aacute;c của đồng hồ bằng c&aacute;ch sử dụng c&aacute;c camera v&agrave; m&aacute;y t&iacute;nh để ph&acirc;n t&iacute;ch dữ liệu; th&ecirc;m v&agrave;o đ&oacute; l&agrave; d&ugrave;ng 2 chiếc đồng hồ nguy&ecirc;n tử c&oacute; độ ch&iacute;nh x&aacute;c tuyệt đối.</p>

<p style="text-align:justify">Dựa v&agrave;o kết quả mỗi ng&agrave;y, ph&acirc;n t&iacute;ch dữ liệu, COSC sẽ tiến h&agrave;nh t&iacute;nh to&aacute;n 7 ph&eacute;p thử như quy định, bao gồm:</p>

<p style="text-align:justify"><strong>1.</strong>&nbsp;Tốc độ trung b&igrave;nh 1 ng&agrave;y: Sau 10 ng&agrave;y thử nghiệm, đồng hồ chỉ được ph&eacute;p sai lệch từ -4 đến +6 gi&acirc;y/ng&agrave;y.</p>

<p style="text-align:justify"><strong>2.</strong>&nbsp;Tốc độ thay đổi trung b&igrave;nh: COSC theo d&otilde;i đồng hồ ở 5 điểm kh&aacute;c nhau (2 chiều nằm ngang v&agrave; 3 chiều thẳng đứng) mỗi ng&agrave;y. Trong thời gian 10 ng&agrave;y sẽ c&oacute; 50 điểm v&agrave; sự sai lệch kh&ocirc;ng qu&aacute; 2s.</p>

<p style="text-align:justify"><strong>3.</strong>&nbsp;Tốc độ thay đổi lớn nhất ở 5 vị tr&iacute; kh&aacute;c nhau kh&ocirc;ng lớn hơn 5s/ng&agrave;y.</p>

<p style="text-align:justify"><strong>4.</strong>&nbsp;COSC trừ gi&aacute; trị trung trung b&igrave;nh theo chiều thẳng đứng cho gi&aacute; trị trung b&igrave;nh theo chiều nằm ngang, độ sai lệch phải nằm trong khoảng -6 đến +8s.</p>

<p style="text-align:center"><img alt="Cắt nghĩa khái niệm Chronometer" src="http://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-chronometer-4.jpg" style="height:383px; width:700px" /></p>

<p style="text-align:justify"><strong>5.</strong>&nbsp;Sự kh&aacute;c nhau giữa tốc độ lớn nhất trong ng&agrave;y với tốc độ trung b&igrave;nh trong ng&agrave;y kh&ocirc;ng qu&aacute; 10s/ng&agrave;y.</p>

<p style="text-align:justify"><strong>6.</strong>&nbsp;COSC thử nghiệm tốc độ đồng hồ tại 8 độ C v&agrave; 38 độ C; sự sai kh&aacute;c về thời gian kh&ocirc;ng được qu&aacute; 0.6 gi&acirc;y mỗi ng&agrave;y.</p>

<p style="text-align:justify"><strong>7.</strong>&nbsp;Sai số lũy tiến: được x&aacute;c định bằng sai số giữa tốc độ trung b&igrave;nh trong ng&agrave;y ở 2 ng&agrave;y thử nghiệm đầu ti&ecirc;n v&agrave; cuối c&ugrave;ng, sai lệch kh&ocirc;ng được vượt qu&aacute; 5s.</p>

<p style="text-align:justify">Vượt qua 7 cuộc thử nghiệm tr&ecirc;n, đồng hồ sẽ được chứng nhận Chronometer v&agrave; khắc biểu tượng của tổ chức n&agrave;y tr&ecirc;n m&aacute;y đồng hồ khi xuất xưởng.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-chronometer-1-min.jpg" style="height:422px; width:700px" /></p>

<p style="text-align:justify"><strong><em>Quartz Chronometer</em></strong></p>

<p style="text-align:justify">Một chiếc đồng hồ điện tử Chronometer c&oacute; độ ch&iacute;nh x&aacute;c gấp 10 lần so với đồng hồ quartz th&ocirc;ng thường. Hơn nữa, n&oacute; l&agrave; 1 sản phẩm độc quyền được sản xuất theo quy m&ocirc; nhỏ. Mỗi chiếc đồng hồ sẽ được thử nghiệm trong 11 ng&agrave;y li&ecirc;n tục ở 1 vị tr&iacute; v&agrave; 3 mức nhiệt kh&aacute;c nhau.</p>

<p style="text-align:justify">Ngo&agrave;i ra, trong suốt 1 ng&agrave;y, n&oacute; phải quay cả 3 chiều trong kh&ocirc;ng gian để giả định như sử dụng ở thực tế b&ecirc;n ngo&agrave;i. Cuối c&ugrave;ng, n&oacute; phải chịu 200 c&uacute; sốc tương đương với 100G (mạnh hơn 100 lần so với lực hấp dẫn).</p>

<p style="text-align:center"><img alt="Cắt nghĩa khái niệm Chronometer" src="http://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-chronometer-6.jpg" style="height:423px; width:700px" /></p>

<p style="text-align:justify">Hiện nay, chỉ c&oacute; 3% số đồng hồ đạt được chứng nhận n&agrave;y Rolex được coi l&agrave; &ocirc;ng vua trong chế tạo đồng hồ Chronometer, sau đ&oacute; l&agrave; Omega, Breitling, TAG Heuer v&agrave; Panerai; trong đ&oacute; Breitling - tất cả đồng hồ của h&atilde;ng đều được chứng nhận Chronometer trước khi xuất xưởng..</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1008, N'diemnt', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/dong-ho-gmt.jpg', N'ĐỒNG HỒ GMT - NHÀ DU HÀNH VƯỢT THỜI GIAN', N'<p style="text-align:justify">Trong thực tế đồng hồ GMT được sử dụng theo nhiều c&aacute;ch kh&aacute;c nhau, vậy GMT c&oacute; nghĩa như thế n&agrave;o?</p>

<p style="text-align:justify"><strong>GMT</strong>&nbsp;l&agrave; viết tắt của&nbsp;<strong>Greenwich Mean Time</strong>, l&agrave; giờ Mặt Trời tại Đ&agrave;i thi&ecirc;n văn Ho&agrave;ng Gia Greenwich tại Greenwich gần Lu&acirc;n Đ&ocirc;n, Anh. Nơi đ&acirc;y được&nbsp;quy ước nằm tr&ecirc;n kinh tuyến số 0 gọi l&agrave; gốc 0. Sau đ&oacute; c&aacute;c m&uacute;i giờ kh&aacute;c sẽ (+) hoặc (-) th&ecirc;m t&ugrave;y v&agrave;o việc nằm xa hay gần gốc 0. Như m&uacute;i giờ quốc tế của Việt Nam l&agrave; GMT (+7)</p>

<p style="text-align:justify"><strong><em>Đồng hồ GMT&nbsp;</em></strong>được ph&aacute;t triển chủ yếu cho mục đ&iacute;ch h&agrave;ng kh&ocirc;ng, bao gồm &ldquo;giờ địa phương&rdquo; v&agrave; &ldquo;giờ GMT&rdquo;, gi&uacute;p c&aacute;c phi c&ocirc;ng x&aacute;c định được giờ bay, giờ hạ c&aacute;nh khi đến v&ugrave;ng kh&aacute;c.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-gmt-1-compressed-1.jpg" style="height:435px; width:700px" /></p>

<p style="text-align:justify">Mặc d&ugrave; trong thực tế đồng hồ GMT được sử dụng theo nhiều c&aacute;ch kh&aacute;c nhau, giống như nếu bạn c&oacute; 1 c&ocirc; bạn g&aacute;i ở b&ecirc;n kia b&aacute;n cầu, muốn biết giờ n&agrave;y c&ocirc; ấy c&ograve;n thức kh&ocirc;ng để n&oacute;i chuyện chẳng hạn. GMT c&ograve;n được biết với c&aacute;i t&ecirc;n kh&aacute;c l&agrave; &ldquo;UTC&rdquo; ( đặc biệt l&agrave; trong 1 số đồng hồ của Đức)</p>

<p style="text-align:justify">Hầu hết c&aacute;c đồng hồ GMT đều c&oacute; 2 hệ kim hiển thị thời gian định dạng 12 giờ v&agrave; 24h điều chỉnh độc lập. Nếu hệ kim 24h kh&ocirc;ng phải điều chỉnh độc lập th&igrave; n&oacute; chỉ đơn thuần cho biết thời gian l&agrave; s&aacute;ng hay chiều (AM &ndash; PM) chứ ko phải giờ GMT. Song vẫn c&oacute; một số người lại th&iacute;ch đặt GMT về giờ địa phương để ph&acirc;n biệt giờ AM v&agrave; PM. Ch&iacute;nh v&igrave; vậy m&agrave; tr&ecirc;n mặt đồng hồ GMT phải &iacute;t nhất c&oacute; 1 mặt số phụ hiển thị thang giờ 24h.</p>

<p style="text-align:justify">Đồng hồ GMT thường được sử dụng để biết được thời gian ở 2 v&ugrave;ng bất kỳ, kh&ocirc;ng nhất thiết phải theo giờ địa phương của bạn. Ngo&agrave;i ra, bạn cũng c&oacute; thể theo d&otilde;i cả ở khu vực timezone thứ 3 nếu đồng hồ đ&oacute; c&oacute; thể xoay v&ograve;ng bezel 24h qua 1 v&agrave;i ph&eacute;p t&iacute;nh to&aacute;n nhỏ.</p>

<p style="text-align:justify">N&oacute;i chung chức năng GMT sẽ cực kỳ hữu dụng đối với những người hay đi du lịch hoặc phải di chuyển li&ecirc;n tục từ m&uacute;i giờ n&agrave;y sang m&uacute;i giờ kh&aacute;c. Mặt kh&aacute;c, chức năng n&agrave;y cũng l&agrave;m chiếc đồng hồ của bạn trở n&ecirc;n phức tạp v&agrave; hiện đại hơn.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-gmt-1-compressed.jpg" style="height:435px; width:700px" /></p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1009, N'lvphu', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/thep-904L.jpg', N'THÉP 904L - BÍ MẬT MANG TÊN ROLEX', N'<p style="text-align:justify">Hầu hết c&aacute;c thương hiệu đều d&ugrave;ng th&eacute;p 316L, chỉ ri&ecirc;ng Rolex l&agrave; sử dụng th&eacute;p 904L. Chất liệu n&agrave;y c&oacute; g&igrave; đặc biệt?</p>

<p style="text-align:justify">Trong c&ocirc;ng nghiệp chế t&aacute;c đồng hồ, hầu hết c&aacute;c thương hiệu đều d&ugrave;ng th&eacute;p 316L, chỉ ri&ecirc;ng Rolex l&agrave; sử dụng th&eacute;p 904L.&nbsp;Từ vỏ, linh kiện b&ecirc;n trong cho đến d&acirc;y đồng hồ. Rolex lu&ocirc;n c&oacute; 1 tư duy về tuổi thọ v&agrave; độ bền vĩnh cửu cho chiếc đồng hồ của họ, khiến họ kh&aacute;c biệt với phần c&ograve;n lại của thế giới.</p>

<h2 style="text-align:justify">►&nbsp;<strong>Tăng khả năng chống ăn m&ograve;n h&oacute;a học</strong></h2>

<p style="text-align:justify">- Với c&ocirc;ng thức h&oacute;a học : Fe, &lt;0.02% C , 19-23 % Cr , 23-28 % Ni , 4-5% Mo , &lt;2,0 % Mn , &lt;1.0 % Si , &lt; 0,045 % P &lt; 0,035 % S , 1.0-2.0 % Cu, Rolex gọi th&eacute;p 904L l&agrave; &ldquo;si&ecirc;u chống ăn m&ograve;n&rdquo; với tỷ lệ Chromium, Molypden, Nickel, Cu được tăng l&ecirc;n so với 316L. Điểu n&agrave;y gi&uacute;p cải thiện khả năng chống axit v&agrave; ăn m&ograve;n h&oacute;a học v&agrave; l&agrave;m tăng độ cứng cho th&eacute;p. Từ đ&oacute; đ&ograve;i hỏi việc sản xuất, tạo h&igrave;nh cho vỏ cũng như d&acirc;y đồng hồ cần một kỹ thuật luyện kim cực kỳ phức tạp. Điều n&agrave;y cũng tạo n&ecirc;n c&aacute;i gi&aacute; si&ecirc;u đắt của Rolex.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/Home/Pictures/news/rl4.jpg" style="height:395px; width:620px" /></p>

<p style="text-align:justify">Rolex kiểm so&aacute;t chất lượng th&eacute;p từ những điều nhỏ nhất. Sau khi nhận được th&eacute;p từ nh&agrave; m&aacute;y, Rolex sẽ cho qu&eacute;t qua k&iacute;nh hiển vi điện tử c&oacute; khả năng ph&aacute;t hiện c&aacute;c khiếm khuyết cấu tr&uacute;c hay tr&ecirc;n bề mặt. Họ sẵn s&agrave;ng gửi trả lại nếu th&eacute;p kh&ocirc;ng đạt y&ecirc;u cầu. Sau khi được kiểm tra, th&eacute;p sẽ được nung tan chảy trong ch&acirc;n kh&ocirc;ng để l&agrave;m sạch v&agrave; loại bỏ tạp chất, gi&uacute;p tăng khả năng kh&aacute;ng m&ograve;n của chất liệu. Từ đ&oacute; người ta mới tinh chế ra được th&eacute;p 904L ho&agrave;n hảo, đạt được đ&uacute;ng y&ecirc;u cầu của nh&agrave; sản xuất.</p>

<h2 style="text-align:justify">►<strong>&nbsp;Độ b&oacute;ng, độ sắc xảo v&agrave; khả năng ho&agrave;n thiện</strong></h2>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/Home/Pictures/news/rl1.jpg" style="height:488px; width:650px" /></p>

<p style="text-align:justify">Rolex bắt đầu sử dụng th&eacute;p kh&ocirc;ng gỉ 904L v&agrave;o năm 1985, nhưng m&atilde;i đến năm 2000 vật liệu n&agrave;y mới được Rolex d&ugrave;ng phổ biến thay thế cho th&eacute;p 316L. L&uacute;c ban đầu, Rolex chỉ d&ugrave;ng 904L cho vỏ đồng hồ, c&ograve;n d&acirc;y đeo vẫn l&agrave; th&eacute;p 316L. Nhưng sau đ&oacute;, kể từ năm 2006, Rolex d&ugrave;ng 904L cho to&agrave;n bộ th&agrave;nh phần vỏ, d&acirc;y v&agrave; n&uacute;m đồng hồ.</p>

<p style="text-align:justify">Khi so s&aacute;nh một mẫu Rolex với một mẫu đồng hồ Thụy Sỹ kh&aacute;c, bạn c&oacute; thể thấy r&otilde; r&agrave;ng sự kh&aacute;c biệt. Th&eacute;p 904L c&oacute; độ b&oacute;ng cao hơn, cứng hơn, sắc sảo hơn v&agrave; c&oacute; phần warm up hơn.&nbsp; &nbsp;Họ ch&uacute; &yacute; từng chi tiết d&ugrave; l&agrave; nhỏ nhất của chiếc đồng hồ - Thứ m&agrave; bạn sẽ mang l&ecirc;n tay h&agrave;ng ng&agrave;y v&agrave; lu&ocirc;n tự h&agrave;o về n&oacute;. Họ tạo ra những tuyệt t&aacute;c khiến bạn sẵn s&agrave;ng bỏ ra 1 số tiền c&oacute; thể mua cả 1 căn nh&agrave; m&agrave; kh&ocirc;ng hề hối tiếc.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/rolex-3optimized.jpg" style="height:400px; width:988px" /></p>

<p style="text-align:justify">Cảm ơn sự theo d&otilde;i của c&aacute;c bạn! Nhanh tay chia sẻ những kiến thức bổ &iacute;ch cho bạn b&egrave; v&agrave; người th&acirc;n nh&eacute;!</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1010, N'lvphu', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/vi-sao-phai-can-chan-kinh.jpg', N'VÌ SAO PHẢI CẦN CHÂN KÍNH?', N'<p style="text-align:justify">Đồng hồ l&agrave; một cỗ m&aacute;y phức tạp. Ch&uacute;ng ta h&atilde;y xem n&oacute; hoạt động thế n&agrave;o v&agrave; ch&acirc;n k&iacute;nh c&oacute; t&aacute;c dụng g&igrave; đối với chiếc đồng hồ?</p>

<p style="text-align:justify">Đồng hồ l&agrave; một cỗ m&aacute;y phức tạp. Ch&uacute;ng ta h&atilde;y xem n&oacute; hoạt động thế n&agrave;o v&agrave; ch&acirc;n k&iacute;nh c&oacute; t&aacute;c dụng g&igrave; đối với chiếc đồng hồ?</p>

<p style="text-align:justify">&nbsp; &nbsp; &nbsp;►C&aacute;c chi tiết đồng hồ đều hoạt động ở trạng th&aacute;i lắc, động lực l&agrave; d&acirc;y c&oacute;t đồng hồ tạo ra. Khi bạn l&ecirc;n d&acirc;y c&oacute;t đồng hồ tức l&agrave; bạn đang l&agrave;m cho d&acirc;y c&oacute;t cuộn chặt lại.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/Home/Pictures/news/ck0.jpg" style="height:300px; width:600px" /></p>

<p style="text-align:justify">&nbsp; &nbsp; &nbsp;►Động lực từ d&acirc;y c&oacute;t ch&iacute;nh qua bốn b&aacute;nh xe răng (gọi l&agrave; hệ truyền động) truyền đến b&aacute;nh xe c&acirc;n bằng. Hệ truyền động l&agrave;m cho kim tr&ecirc;n mặt đồng hồ di chuyển. B&aacute;nh xe c&acirc;n bằng c&oacute; t&aacute;c dụng như con lắc (quả lắc) của đồng hồ treo tường, n&oacute; l&agrave; tr&aacute;i tim của chiếc đồng hồ. V&acirc;y xung quanh b&aacute;nh xe c&acirc;n bằng l&agrave; những b&aacute;nh răng cực nhỏ điều khiển đồng hồ chạy nhanh hoặc chậm.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/13jewelsloc.jpg" style="height:434px; width:600px" /></p>

<p style="text-align:justify">&nbsp; &nbsp; &nbsp;►C&aacute;c loại b&aacute;nh răng n&oacute;i ở tr&ecirc;n đều lắp tr&ecirc;n trục v&agrave; ch&uacute;ng kh&ocirc;ng ngừng chuyển động, trong qu&aacute; tr&igrave;nh đ&oacute; sẽ sinh ra ma s&aacute;t. Để giảm ma s&aacute;t c&aacute;c trục b&aacute;nh răng đều được lắp tr&ecirc;n một miếng đ&aacute; đỏ, đ&aacute; lam hoặc đ&aacute; thạch lựu (những loại đ&aacute; n&agrave;y c&oacute; độ cứng tốt hơn kim loại như kim cương, sapphire, đ&aacute; rubi). Đ&oacute; ch&iacute;nh l&agrave; c&aacute;c ch&acirc;n k&iacute;nh. Ch&acirc;n k&iacute;nh c&agrave;ng nhiều th&igrave; ma s&aacute;t c&agrave;ng nhỏ, như vậy tổn hao của đồng hồ c&agrave;ng nhỏ, hiện tượng giảm tốc của c&aacute;c chi tiết chuyển động trong đồng hồ cũng sẽ chậm hơn.</p>

<p style="text-align:justify">&nbsp; &nbsp; ►Trước đ&acirc;y, số lượng jewel trong đồng hồ được phản &aacute;nh chất lượng v&agrave; độ phức tạp cũng như gi&aacute; trị của chiếc đồng hồ v&igrave; jewel thường được l&agrave;m từ đ&aacute; qu&yacute; hoặc kim cương. Tuy nhi&ecirc;n, ng&agrave;y nay th&igrave; điều đ&oacute; cũng kh&ocirc;ng c&ograve;n qu&aacute; quan trọng v&igrave; jewel được l&agrave;m dễ d&agrave;ng hơn từ những vật liệu tổng hợp.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1011, N'lvphu', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/dong-ho-co-perpetual-calendar.jpg', N'TÍNH NĂNG PERPETUAL CALENDAR CỦA ĐỒNG HỒ CAO CẤP', N'<p style="text-align:justify">Ng&agrave;y nay, c&ocirc;ng nghệ điện tử đem đến qu&aacute; nhiều lựa chọn về những cỗ m&aacute;y đếm giờ nhưng đồng hồ cao cấp kh&ocirc;ng v&igrave; thế m&agrave; tuyệt chủng.&nbsp;Ch&uacute;ng được xem như những m&oacute;n trang sức cao cấp, bao h&agrave;m nghệ thuật cơ kh&iacute; bậc thầy, sự tỉ mỉ, niềm đam m&ecirc; v&agrave; sức s&aacute;ng tạo k&igrave; kh&ocirc;i ẩn chứa trong những cỗ m&aacute;y b&eacute; nhỏ. B&agrave;i viết dưới đ&acirc;y sẽ giới thiệu một trong số những t&iacute;nh năng si&ecirc;u phức tạp của đồng hồ cao cấp: Perpetual Calendar.</p>

<p style="text-align:center"><img alt="Tính năng Perpetual Calendar" src="https://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-perpetual-calendar.jpg" style="height:289px; width:700px" /></p>

<p style="text-align:justify">Lịch vạn ni&ecirc;n l&agrave; một trong những ph&aacute;t minh hữu &iacute;ch v&agrave; l&atilde;ng mạn nhất của giới đồng hồ cao cấp. Th&ocirc;ng thường nhiều chiếc đồng hồ chỉ c&aacute;c ng&agrave;y trong th&aacute;ng qua một cửa sổ nhỏ tr&ecirc;n mặt, hay c&ograve;n gọi l&agrave; Annual Calendar.&nbsp;T&iacute;nh năng n&agrave;y cho ph&eacute;p chiếc đồng hồ c&oacute; thể đến ng&agrave;y ch&iacute;nh x&aacute;c của c&aacute;c th&aacute;ng, bao gồm th&aacute;ng c&oacute; 30 hay 31 ng&agrave;y. Người ta chỉ phải điều chỉnh đồng hồ c&oacute; lịch Annual Calendar một năm 1 lần v&agrave;o ng&agrave;y cuối c&ugrave;ng của th&aacute;ng 2, chuyển từ ng&agrave;y 29/2 s&aacute;ng ng&agrave;y 1/3.&nbsp;</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-perpetual-calendar-2.jpg" style="height:515px; width:720px" /></p>

<p style="text-align:justify">&nbsp;&nbsp;Lịch vạn ni&ecirc;n hay c&ograve;n gọi l&agrave; Perpetual Calendar phức tạp hơn gấp nhiều lần t&iacute;nh năng Annual Calendar, n&oacute; chỉ thứ, ng&agrave;y, th&aacute;ng, lịch mặt trăng, tự động chuyển số ng&agrave;y trong th&aacute;ng v&agrave; đến cả năm nhuận.&nbsp;Cỗ m&aacute;y chứa lịch vạn ni&ecirc;n thực sự l&agrave; một kiệt t&aacute;c kiến tr&uacute;c được thu nhỏ bởi c&aacute;c bậc thầy. Hơn thế nữa, lịch vạn ni&ecirc;n chỉ cần được điều chỉnh một lần một thế kỷ. V&acirc;ng, một lần trong một thế kỉ, hay ch&iacute;nh x&aacute;c hơn l&agrave; 122 năm.&nbsp;</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/tinh-nang-perpetual-calendar.jpg" style="height:516px; width:720px" /></p>

<p style="text-align:justify">&nbsp;&nbsp;Với c&aacute;c th&aacute;ng c&oacute; số ng&agrave;y kh&aacute;c nhau, từ 31, 30 cho đến 28 ng&agrave;y, thậm ch&iacute; 29 ng&agrave;y v&agrave;o th&aacute;ng Hai v&agrave;o c&aacute;c năm nhuận, việc đưa lịch v&agrave;o đồng hồ cơ l&agrave; một thử th&aacute;ch với c&aacute;c nghệ nh&acirc;n bởi họ phải t&aacute;i tạo c&aacute;c biến thể trong động cơ của cỗ m&aacute;y.&nbsp;Cỗ m&aacute;y Perpetual Calendar, được khai sinh từ cuối thế kỉ 18, c&oacute; thể chỉ số ng&agrave;y ch&iacute;nh x&aacute;c trong c&aacute;c th&aacute;ng bởi cỗ m&aacute;y được c&agrave;i đặt một bộ nhớ cơ kh&iacute; k&eacute;o d&agrave;i 1,461 ng&agrave;y, tức 4 năm. Hầu hết c&aacute;c cỗ m&aacute;y chứa lịch vạn ni&ecirc;n đều sử dụng những cơ chế chuyển động ri&ecirc;ng biệt với b&aacute;nh chỉ giờ, v&agrave; c&oacute; thể bao gồm h&agrave;ng trăm b&aacute;nh răng, b&aacute;nh đ&agrave;, đ&ograve;n bẩy v&agrave; c&aacute;c bộ phận kh&aacute;c.&nbsp;</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1012, N'lvphu', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/thep-316L.jpg', N'THÉP 316L - QUY CHUẨN TRONG CHẾ TẠO ĐỒNG HỒ', N'<p style="text-align:justify">D&ugrave; bạn l&agrave; 1 tay chơi đồng hồ l&acirc;u năm hay chỉ mới bắt đầu chơi, chắc hẳn c&aacute;c bạn đều đ&atilde; nghe đến th&eacute;p 316L trong c&ocirc;ng nghệ đồng hồ.</p>

<p style="text-align:justify">D&ugrave; bạn l&agrave; 1 tay chơi đồng hồ l&acirc;u năm hay chỉ mới bắt đầu chơi, chắc hẳn c&aacute;c bạn đều đ&atilde; nghe đến th&eacute;p 316L trong c&ocirc;ng nghệ đồng hồ.</p>

<p style="text-align:justify">Vậy tại sao hầu hết c&aacute;c thương hiệu đồng hồ lớn như Longines, Omega, Seiko, Ogival, Rado&hellip; đều sử dụng th&eacute;p 316L l&agrave;m quy chuẩn trong chế t&aacute;c. H&atilde;y c&ugrave;ng X-Watch t&igrave;m hiểu!</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/Home/Pictures/news/17692_748528351933009_7937290458491385239_n.jpg" style="height:472px; width:701px" /></p>

<p style="text-align:justify">Th&eacute;p 316L l&agrave; sự trộn lẫn của c&aacute;c th&agrave;nh phần: Crom(Cr), Niken(Ni), Molipđen(Mo), Nito(N) trong m&ocirc;i trường nhiệt độ cao từ 450 độ C đến 850 độ C để loại bỏ c&aacute;c tạp chất v&agrave; Cacbon(C), tạo ra c&aacute;c cấu tr&uacute;c tinh thể kh&aacute;c nhau với t&iacute;nh chất cơ-l&yacute; kh&aacute;c nhau.</p>

<p style="text-align:justify">Từ đ&oacute;, th&eacute;p c&oacute; khả năng chịu được sự ăn m&ograve;n v&agrave; &iacute;t bị biến m&agrave;u trong phạm vi nhiệt rộng, độ bền dẻo cao v&agrave; khả năng kh&aacute;ng từ t&iacute;nh tốt nhất.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/Home/Pictures/news/10417750_748528355266342_5879190940915492776_n.jpg" style="height:502px; width:699px" /></p>

<p style="text-align:justify">Crom, Niken, Nito, Molipden đều c&oacute; khả năng oxi h&oacute;a chống gỉ v&agrave; &iacute;t bị biến m&agrave;u nhất.</p>

<p style="text-align:justify">-&nbsp;<strong>Crom</strong>: th&agrave;nh phần chủ đạo tạo cho th&eacute;p c&oacute; khả năng oxi h&oacute;a chống gỉ trong điều kiện b&igrave;nh thường.</p>

<p style="text-align:justify">-&nbsp;<strong>Niken</strong>: th&agrave;nh phần th&ocirc;ng dụng tạo độ dẻo, dễ uốn, t&iacute;nh tạo h&igrave;nh tốt.</p>

<p style="text-align:justify">-&nbsp;<strong>Molipđen</strong>: tạo cho th&eacute;p khả năng chống ăn m&ograve;n cao trong m&ocirc;i trường oxi h&oacute;a.</p>

<p style="text-align:justify">-&nbsp;<strong>Nito</strong>: tạo sự ổn định cho th&eacute;p trong m&ocirc;i trường lạnh.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/Home/Pictures/news/11233545_748528358599675_191582783633553972_n.jpg" style="height:497px; width:700px" /></p>

<p style="text-align:justify">Th&eacute;p 316L hội tủ đầy đủ 4 yếu tố tr&ecirc;n. Ch&iacute;nh v&igrave; thế, n&oacute; được chọn l&agrave;m quy chuẩn trong chế t&aacute;c đồng hồ của c&aacute;c thương hiệu lớn.</p>

<p style="text-align:justify"><strong><u>Lưu &yacute;</u></strong>: Với đồng hồ nh&aacute;i, giả hầu như đều được tạo ra từ chất liệu rất k&eacute;m như th&eacute;p hợp kim Atimon hay những loại th&eacute;p kh&ocirc;ng đạt chuẩn dễ biến m&agrave;u, g&acirc;y dị ứng cho da, rất dễ nhiễm từ khiến đồng hồ bị nhanh chậm thất thường.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1013, N'lvphu', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/thuat-ngu-dong-ho.jpg', N'THUẬT NGỮ ĐƯỢC SỬ DỤNG TRONG ĐỒNG HỒ', N'<p style="text-align:justify">Bộ cẩm nang tập hợp 77/49 thuật ngữ phổ biến nhất trong ng&agrave;nh đồng hồ, được l&yacute; giải theo c&aacute;ch r&otilde; r&agrave;ng, dễ hiểu nhất.</p>

<p style="text-align:justify"><em>L&agrave;m sao để lựa chọn một chiếc đồng hồ ph&ugrave; hợp? Những thuật ngữ đồng hồ dưới đ&acirc;y sẽ gi&uacute;p bạn nắm bắt c&aacute;c t&iacute;nh năng của đồng hồ để trước khi quyết định sở hữu bất k&igrave; cỗ m&aacute;y thời gian n&agrave;o!</em></p>

<p style="text-align:justify"><strong>A</strong></p>

<p style="text-align:justify"><strong>Alpha hands</strong>: Kim dạng mảnh mai, hơi nhọn.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-2.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Altimeter</strong>: Chức năng đo độ cao bằng c&aacute;ch đo những thay đổi trong &aacute;p suất kh&iacute; quyển (rất phổ biến trong d&ograve;ng đồng hồ d&agrave;nh cho phi c&ocirc;ng / người leo n&uacute;i).</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-3.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Analog</strong>: C&aacute;ch hiển thị thời gian với mặt số v&agrave; kim.</p>

<p style="text-align:justify"><strong>Analog Chronograph</strong>: Đồng hồ c&oacute; chức năng bấm giờ hiển thị cả thời gian v&agrave; chức năng bấm giờ theo dạng analog. Đồng hồ quartz với chức năng analog chronograph thường hiển thị hai đơn vị: 1/10 gi&acirc;y v&agrave; 1/100 gi&acirc;y tr&ecirc;n c&aacute;c mặt nhỏ/phụ.</p>

<p style="text-align:justify"><strong>Analog Digital</strong>: Đồng hồ c&oacute; cả mặt số, kim v&agrave; một m&agrave;n h&igrave;nh số. Hai m&agrave;n h&igrave;nh n&agrave;y thường hoạt động độc lập với nhau.</p>

<p style="text-align:justify"><strong>Aperture:</strong>&nbsp;l&agrave; một cửa sổ được đặt trong mặt của đồng hồ, để hiển thị một chức năng. Chức năng thường hiển thị l&agrave; ng&agrave;y dương lịch, c&aacute;c ng&agrave;y trong tuần hoặc trong th&aacute;ng.</p>

<p style="text-align:justify"><strong>ATM</strong>: viết tắt 1 đơn vị của &aacute;p suất kh&iacute; quyển. Đồng hồ sử dụng đơn vị n&agrave;y để biểu thị khả năng chống nước.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-1.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Automatic Movement</strong>: m&aacute;y tự động với hệ thống cơ học v&agrave; d&acirc;y c&oacute;t tự cuộn. Một chiếc đồng hồ tự động sử dụng năng lượng được tạo ra bởi chuyển động của c&aacute;nh tay. M&aacute;y tự động chuyển đổi chuyển động của r&ocirc; to theo chuyển động của tay sang l&agrave;m năng lượng l&ecirc;n d&acirc;y c&oacute;t.</p>

<p style="text-align:justify"><strong>B</strong></p>

<p style="text-align:justify"><strong>Baton hands</strong>: Loại kim d&agrave;i thon, thẳng (c&oacute; loại hơi nhọn).</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-4.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Bezel</strong>: l&agrave; một v&ograve;ng đệm gắn v&agrave;o mặt đồng hồ.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-5.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Bi-directional rotating bezel</strong><strong>:</strong>&nbsp;v&ograve;ng bezel c&oacute; thể xoay theo cả hai chiều: thuận v&agrave; ngược với chiều kim đồng hồ.</p>

<p style="text-align:justify"><strong>C</strong></p>

<p style="text-align:justify"><strong>Case:</strong>&nbsp;Vỏ ngo&agrave;i của đồng hồ. Với đồng hồ nam, case thường c&oacute; đường k&iacute;nh từ 35mm trở l&ecirc;n, đồng hồ nữ case c&oacute; đường k&iacute;nh từ 34 mm hoặc nhỏ hơn.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-6.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Case back</strong>: nắp lưng/đ&aacute;y của vỏ đồng hồ. Cho ph&eacute;p mở ra để can thiệp v&agrave;o bộ m&aacute;y b&ecirc;n trong của đồng hồ.</p>

<p style="text-align:justify"><strong>Chronograph</strong>: L&agrave; loại đồng hồ c&oacute; chức năng bấm giờ để đo khoảng thời gian.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-7.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Chronometer</strong>: L&agrave; loại đồng hồ c&oacute; độ ch&iacute;nh x&aacute;c cao, được kiểm tra chất lượng bởi COSC (Controle Officiel Suisse des Chronometres) của Thuỵ Sĩ. COSC kiểm tra tại năm vị tr&iacute; kh&aacute;c nhau với nhiệt độ kh&aacute;c nhau v&agrave; trong nhiều ng&agrave;y li&ecirc;n tiếp để x&aacute;c định độ ch&iacute;nh x&aacute;c. Đồng hồ được chứng nhận COSC sẽ phải ghi cụ thể số chứng nhận COSC.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-8.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Complication:&nbsp;</strong>Chiếc đồng hồ n&agrave;y c&oacute; th&ecirc;m những chức năng kh&aacute;c b&ecirc;n cạnh chức năng thời gian cơ bản: Lịch, bấm giờ, b&aacute;o thức/động hoặc những t&iacute;nh năng được bổ sung th&ecirc;m&hellip;</p>

<p style="text-align:justify"><strong>Crown</strong>: N&uacute;t vặn ở b&ecirc;n cạnh để điều chỉnh ng&agrave;y v&agrave; giờ.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-9.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Crystal</strong>: Mặt k&iacute;nh của đồng hồ (chất liệu thường l&agrave; Plexiglas, Hardlex hoặc tinh thể Sapphire tổng hợp).</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-10.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>D</strong></p>

<p style="text-align:justify"><strong>Day-and-night indicator:&nbsp;</strong>Những chỉ thị (đ&aacute;nh dấu) tr&ecirc;n mặt số của đồng hồ, đ&aacute;nh dấu thời gian ban ng&agrave;y v&agrave; ban đ&ecirc;m.</p>

<p style="text-align:justify"><strong>Depth sensor</strong>: X&aacute;c định độ s&acirc;u v&agrave; đo &aacute;p lực nước (đồng hồ lặn).</p>

<p style="text-align:justify"><strong>Dive watch:&nbsp;</strong>Loại đồng hồ lặn phục vụ cho mục đ&iacute;ch lặn (biển). Những chiếc đồng hồ lặn bắt buộc phải vượt qua được ti&ecirc;u chuẩn của tổ chức ti&ecirc;u chuẩn quốc tế (International Standardization Organization - ISO) quy định, v&agrave; phải c&oacute; khả năng chịu nước ở &aacute;p suất 20 ATM (200 m&eacute;t/660 feet).</p>

<p style="text-align:justify"><strong>Double chronograph (hay rattrapante):</strong>&nbsp;Đồng hồ c&oacute; hai chức năng bấm giờ độc lập với nhau.</p>

<p style="text-align:justify"><strong>Dual time</strong>: Cho ph&eacute;p xem giờ ở hai m&uacute;i giờ c&ugrave;ng một l&uacute;c. M&agrave;n h&igrave;nh hiển thị c&oacute; thể c&oacute; hai mặt số, hoặc một mặt số ch&iacute;nh v&agrave; một mặt số analog hoặc digital nhỏ.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-11.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>E</strong></p>

<p style="text-align:justify"><strong>Elapsed-time bezel</strong>: V&ograve;ng để đo một khoảng c&aacute;ch thời gian bao phủ nhất định.</p>

<p style="text-align:justify"><strong>G</strong></p>

<p style="text-align:justify"><strong>Gasket:</strong>&nbsp;Gioăng. L&agrave; phần được đặt ở c&aacute;c n&uacute;t bấm, nắp lưng/đ&aacute;y v&agrave; mặt để tăng khả năng chịu nước của đồng hồ.</p>

<p style="text-align:justify"><strong>Guilloche</strong>: L&agrave; một mẫu đặc trưng trong thiết kế, l&agrave; m&ocirc; h&igrave;nh của c&aacute;c đường lằn gợn từ t&acirc;m ra ngo&agrave;i. Kết cấu n&agrave;y kh&aacute; phổ biến tr&ecirc;n con quay của đồng hồ.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-12.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>H</strong></p>

<p style="text-align:justify"><strong>Hairspring</strong>: V&agrave;nh t&oacute;c</p>

<p style="text-align:justify"><strong>Horology</strong>: N&oacute;i về lịch sử ng&agrave;nh nghề thủ c&ocirc;ng của đồng hồ v&agrave; c&aacute;c thiết bị đo thời gian kh&aacute;c.</p>

<p style="text-align:justify"><strong>J</strong></p>

<p style="text-align:justify"><strong>Jewels</strong>: Ch&acirc;n k&iacute;nh. Thường d&ugrave;ng l&agrave;m gi&aacute; đỡ/trục đỡ/đĩa đệm cho c&aacute;c bộ phận chuyển động trong m&aacute;y đồng hồ. C&oacute; &iacute;t nhất 17 jewels được d&ugrave;ng trong m&aacute;y.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-13.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Jump hour</strong>: Chỉ việc nhảy số đến giờ tiếp theo thay v&igrave; sử dụng kim v&agrave; mặt số truyền thống. Số ở cửa sổ Aperture sẽ nhảy đến giờ tiếp theo khi thời gian thay đổi.</p>

<p style="text-align:justify"><strong>K</strong></p>

<p style="text-align:justify"><strong>Kinetic</strong>: Thuật ngữ đồng hồ chỉ loại m&aacute;y đồng hồ sử dụng năng lượng được t&iacute;ch trữ từ việc chuyển ho&aacute; từ chuyển động của c&aacute;nh tay sang năng lượng điện (chuyển đổi từ dao động sang điện sạc v&agrave;o pin).</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-14.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>L</strong></p>

<p style="text-align:justify"><strong>Lap timer:</strong>&nbsp;Chức năng đo từng đoạn thời gian (thời gian từng v&ograve;ng trong cuộc đua), c&oacute; thể thiết lập để hiển thị thời gian mỗi v&ograve;ng đua b&ecirc;n cạnh tổng thời gian.</p>

<p style="text-align:justify"><strong>Lap-time memory</strong>: Khả năng lưu trữ thời gian từng v&ograve;ng để xem lại sau, thường c&oacute; ở đồng hồ quartz hiển thị mặt số (digital).</p>

<p style="text-align:justify"><strong>Lugs</strong>: Phần tai tr&ecirc;n vỏ đồng hồ để lắp d&acirc;y.</p>

<p style="text-align:justify"><strong>M</strong></p>

<p style="text-align:justify"><strong>Main plate</strong>: L&agrave; tấm khung cơ bản để to&agrave;n bộ m&aacute;y được gắn v&agrave;o.</p>

<p style="text-align:justify"><strong>Mainspring</strong>: D&acirc;y c&oacute;t, nơi giải ph&oacute;ng năng lượng khi bị quấn v&agrave;o v&agrave; thực hiện chức năng vận động cơ kh&iacute;.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-15.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Military time/24-hour time</strong>: Nhiều đồng hồ c&oacute; th&ecirc;m một mặt analog/digital phụ để đếm giờ theo định dạng 24h. N&oacute;i c&aacute;ch kh&aacute;c th&igrave; định dạng 24h cũng được hiểu như l&agrave; Military time.</p>

<p style="text-align:justify"><strong>Moon-phase dial</strong>: Chức năng n&agrave;y để theo d&otilde;i v&agrave; hiển thị c&aacute;c giai đoạn của th&aacute;ng &acirc;m lịch (mặt trăng). Một số đồng hồ c&ograve;n c&oacute; cả chức năng tương tự nhưng theo d&otilde;i mặt trời (trong chu kỳ 24h).</p>

<p style="text-align:justify"><strong>Movement</strong>: M&aacute;y, động cơ của chiếc đồng hồ.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-16.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>P</strong></p>

<p style="text-align:justify"><strong>Perpetual calendar</strong>: Lịch vạn ni&ecirc;n tự động chỉnh ng&agrave;y v&agrave;o cuối th&aacute;ng hoặc năm, đếm năm nhuận, để giữ độ ch&iacute;nh x&aacute;c của lịch.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-17.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Power reserve</strong>: Chỉ việc năng lượng dự trữ. Đồng hồ cơ hoặc tự động thường t&iacute;ch trữ năng lượng tối đa 36 tiếng.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-18.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Pulsimeter</strong>: L&agrave; chức năng c&oacute; trong những loại đồng hồ thể thao ti&ecirc;n tiến để đo nhịp tim của người đeo.</p>

<p style="text-align:justify"><strong>Q</strong></p>

<p style="text-align:justify"><strong>Quartz crystal</strong>: tinh thể thạch anh (thường l&agrave; loại tổng hợp) trong m&aacute;y quartz, tạo xung nhịp.</p>

<p style="text-align:justify"><strong>R</strong></p>

<p style="text-align:justify"><strong>Rotating bezel</strong>: Kiểu v&ograve;ng bezel c&oacute; thể xoay v&agrave; đặt c&aacute;c vị tr&iacute; kh&aacute;c nhau tr&ecirc;n mặt đồng hồ. C&oacute; chức năng để t&iacute;nh to&aacute;n/đo đạc. Thường c&oacute; hai loại: xoay hai chiều v&agrave; xoay một chiều.</p>

<p style="text-align:justify"><strong>S</strong></p>

<p style="text-align:justify"><strong>Screw-down crown</strong>: loại n&uacute;t vặn (giống như vặn ốc), kh&aacute;c với loại n&uacute;t k&eacute;o v&agrave; ấn. Loại n&agrave;y gi&uacute;p cho đồng hồ c&oacute; khả năng chịu nước cao hơn.</p>

<p style="text-align:justify"><strong>Shock resistance</strong>: Thuật ngữ đề cập đến độ bền của vỏ đồng hồ, khả năng bảo vệ m&aacute;y v&agrave; những vấn đề kh&aacute;c. Để được xem l&agrave; chống sốc, đồng hồ phải kh&ocirc;ng bị l&agrave;m sao khi đ&aacute;nh rơi từ độ cao 3 feet (0.9144m) xuống nền gỗ, hoặc chịu một t&aacute;c động c&oacute; lực tương đương.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-19.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Skeleton case</strong>: Vỏ được thiết kế để nh&igrave;n thấy m&aacute;y m&oacute;c, c&oacute; thể l&agrave; loại mặt mở hoặc nắp lưng bằng tinh thể trong suốt. Thiết kế n&agrave;y l&agrave;m nổi bật những chi tiết phức tạp trong m&aacute;y của đồng hồ.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/24/thuat-ngu-dong-ho-20.png" style="height:600px; width:800px" /></p>

<p style="text-align:justify"><strong>Solar-powered watch</strong>: Đồng hồ quartz sử dụng năng lượng mặt trời (c&oacute; tấm pin mặt trời tr&ecirc;n bề mặt) để sạc pin.</p>

<p style="text-align:justify"><strong>Split-seconds chronograph</strong>: Thuật ngữ chỉ vi&ecirc;c sử dụng 2 kim đồng hồ để đo khoảng thời gian. Hai kim n&agrave;y di chuyển c&ugrave;ng với nhau, nhưng một kim (được gọi l&agrave; kim fly-back) c&oacute; thể dừng lại độc lập để đ&aacute;nh dấu thời điểm, trong khi kim kia vẫn tiếp tục chạy. Kim fly-back c&oacute; thể tiếp tục quay trở lại (quay ngược chiều đến khi về vị tr&iacute; 12).</p>

<p style="text-align:justify"><strong>Sweep hand</strong>: l&agrave; kim gi&acirc;y tr&ecirc;n đồng hồ tự động, c&ograve;n được gọi l&agrave; sweep second hand, di chuyển kh&aacute; &ecirc;m &aacute;i.</p>

<p style="text-align:justify"><strong>Swiss-made movement</strong>: M&aacute;y Thuỵ Sĩ, nhưng kh&ocirc;ng phải l&agrave; 100% từ Thuỵ Sĩ m&agrave; phải c&oacute; c&aacute;c bộ phận của Thuỵ Sĩ chiếm một tỉ lệ theo quy định. M&aacute;y được lắp r&aacute;p tại Thuỵ Sĩ v&agrave; được đặt v&agrave;o vỏ tại Thuỵ Sĩ. Vỏ n&agrave;y kh&ocirc;ng cần phải sản xuất tại Thuỵ Sĩ, mặc d&ugrave; hầu hết c&aacute;c loại đồng hồ high-end đều c&oacute; vỏ được sản xuất tại Thuỵ Sĩ.</p>

<p style="text-align:justify"><strong>T</strong></p>

<p style="text-align:justify"><strong>Tachymeter</strong>: l&agrave; một cơ chế được sử dụng để đo tốc độ di chuyển tr&ecirc;n một qu&atilde;ng đường. Kết quả t&iacute;nh to&aacute;n của cơ chế n&agrave;y được đ&aacute;nh dấu tr&ecirc;n v&ograve;ng bezel ở mặt đồng hồ.</p>

<p style="text-align:justify"><strong>Telemeter</strong>: L&agrave; thước đo x&aacute;c định thời gian một &acirc;m thanh di chuyển từ vị tr&iacute; của đồng hồ đến vị tr&iacute; kh&aacute;c. Ph&eacute;p đo n&agrave;y chủ yếu được d&ugrave;ng để x&aacute;c định khoảng c&aacute;ch giữa hai điểm, v&agrave; cũng thường được thiết lập tr&ecirc;n v&ograve;ng bezel.</p>

<p style="text-align:justify"><strong>Tonneau case</strong>: L&agrave; thuật ngữ chỉ một kiểu thiết kế vỏ của đồng hồ. Bạn n&ecirc;n xem th&ecirc;m ở h&igrave;nh tr&ecirc;n để biết th&ecirc;m về c&aacute;c t&ecirc;n gọi (thuật ngữ) kh&aacute;c của c&aacute;c kiểu vỏ.</p>

<p style="text-align:justify"><strong>Tourbillon</strong>: L&agrave; một thiết kế đặc biệt nhằm giảm thiểu t&aacute;c động của trọng lực l&ecirc;n một số bộ phận của đồng hồ, nhằm tăng độ ch&iacute;nh x&aacute;c của đồng hồ.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/thuat-ngu-su-dung-trong-dong-ho-19-compressed.jpg" style="height:614px; width:800px" /></p>

<p style="text-align:justify">Một số đồng hồ được thiết kế c&oacute; cửa sổ để nh&igrave;n thấy r&otilde; tourbillion hoạt động như thế n&agrave;o, v&agrave; cũng l&agrave; một phần tạo n&ecirc;n t&iacute;nh thẩm mỹ của chiếc đồng hồ.</p>

<p style="text-align:justify"><strong>U</strong></p>

<p style="text-align:justify"><strong>Unidirectional rotating bezel</strong>: v&ograve;ng bezel chỉ quay theo một chiều.</p>

<p style="text-align:justify"><strong>W</strong></p>

<p style="text-align:justify"><strong>Waterproof</strong>: Kh&ocirc;ng thấm nước. Thuật ngữ đồng hồ n&agrave;y c&oacute; thể g&acirc;y hiểu nhầm. Kh&ocirc;ng c&oacute; đồng hồ n&agrave;o 100% kh&ocirc;ng thấm nước. Tuy nhi&ecirc;n, kh&aacute; nhiều đồng hồ c&oacute; khả năng chịu nước cao c&oacute; thể sử dụng thuật ngữ ngữ n&agrave;y.</p>

<p style="text-align:justify"><strong>Water resistance</strong>: Thuật ngữ chỉ khả năng chịu nước, ngăn độ ẩm th&acirc;m nhập v&agrave;o trong vỏ v&agrave; l&agrave;m hỏng m&aacute;y. Khả năng chịu nước được kiểm tra theo đơn vị &aacute;p suất ATM. Mỗi ATM biểu thị &aacute;p lực 10 m nước tĩnh. Nhiều đồng hồ sử dụng thuật ngữ &quot;water-resistant&quot; m&agrave; kh&ocirc;ng bổ sung th&ecirc;m th&ocirc;ng tin, c&oacute; thể hiểu l&agrave; khả năng chịu nước ở 1 ATM, chỉ chịu được nước ở mức nhỏ v&agrave; kh&ocirc;ng n&ecirc;n để ngập nước. Một chiếc đồng hồ được đ&aacute;nh gi&aacute; chịu nước l&agrave; 10 ATM, tức l&agrave; khả năng chịu được &aacute;p suất nước đến 100m; 20 ATM l&agrave; khả năng chịu nước đến 200 m. Những th&ocirc;ng số n&agrave;y thường được ghi rất chi tiết ở c&aacute;c d&ograve;ng đồng hồ lặn.</p>

<p style="text-align:justify"><strong>World time dial:&nbsp;</strong>&Aacute;m chỉ một v&ograve;ng bezel hoặc tr&ecirc;n m&eacute;p ngo&agrave;i của mặt số để cho ph&eacute;p người xem biết giờ tr&ecirc;n nhiều m&uacute;i giờ. Mỗi m&uacute;i giờ liệt k&ecirc; một th&agrave;nh phố ch&iacute;nh.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1014, N'lvphu', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/cac-loai-vo-dong-ho.jpg', N'CASE ĐỒNG HỒ LÀ GÌ? VÀ NHỮNG ĐIỀU BẠN CHƯA BIẾT', N'<p style="text-align:justify">Case l&agrave; g&igrave;? Case đồng hồ c&oacute; những g&igrave; đặc biệt? C&ugrave;ng kh&aacute;m ph&aacute; trong b&agrave;i viết dưới đ&acirc;y!</p>

<p style="text-align:justify">Trong những c&acirc;u chuyện đồng hồ, người ta thường b&agrave;n luận nhiều về bộ m&aacute;y, rằng ch&uacute;ng l&agrave; m&aacute;y Quartz&nbsp;hay cơ, thương hiệu Nhật hay Thụy Sĩ, In-house hay đặt ngo&agrave;i&hellip; c&ugrave;ng h&agrave;ng loạt th&ocirc;ng số, m&agrave; qu&ecirc;n mất một bộ phận quan trọng kh&ocirc;ng k&eacute;m: Case đồng hồ.</p>

<p style="text-align:justify">Vậy case l&agrave; g&igrave;? N&oacute; c&oacute; h&igrave;nh d&aacute;ng thế n&agrave;o v&agrave; tạo n&ecirc;n gi&aacute; trị g&igrave; cho chiếc đồng hồ của bạn? C&ugrave;ng t&igrave;m hiểu nh&eacute;!</p>

<h2 style="text-align:justify"><strong>1. Case đồng hồ l&agrave; g&igrave;?</strong></h2>

<p style="text-align:justify">Case l&agrave; vỏ ngo&agrave;i của đồng hồ - rất đơn giản theo đ&uacute;ng nghĩa đen. Để dễ h&igrave;nh dung hơn, bạn c&oacute; thể quan s&aacute;t h&igrave;nh b&ecirc;n dưới.</p>

<ul>
	<li style="text-align:justify">Case size (size đồng hồ): chỉ đường k&iacute;nh mặt đồng hồ, t&iacute;nh cả v&agrave;nh đồng hồ nhưng kh&ocirc;ng t&iacute;nh c&aacute;c n&uacute;m b&ecirc;n cạnh. Case size l&agrave; yếu tố quan trọng nhất để người d&ugrave;ng lựa chọn chiếc đồng hồ ph&ugrave; hợp với cổ tay của m&igrave;nh.</li>
	<li style="text-align:justify">Case back: nắp lưng đồng hồ, bạn c&oacute; thể mở v&agrave; can thiệp v&agrave;o bộ m&aacute;y b&ecirc;n trong.</li>
	<li style="text-align:justify">Case number: số vỏ m&aacute;y - một số h&atilde;ng đồng hồ in case number tr&ecirc;n case back. Mỗi số vỏ m&aacute;y l&agrave; duy nhất, tra cứu số vỏ m&aacute;y, bạn c&oacute; thể x&aacute;c định được đồng hồ c&oacute; phải ch&iacute;nh h&atilde;ng hay kh&ocirc;ng.</li>
</ul>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/18/case-dong-ho-la-gi-truong-hop-cai-hop-hay-cai-vo-dong-ho-1561386554-fjxii.jpg" style="height:521px; width:800px" /></p>

<p style="text-align:justify"><strong><em>Những dạng của &ldquo;case back&rdquo; v&agrave; độ chống nước của ch&uacute;ng:</em></strong></p>

<ul>
	<li style="text-align:justify"><strong><em>Đ&aacute;y cậy:</em></strong>&nbsp;Chống nước trung b&igrave;nh, một v&agrave;i loại chuy&ecirc;n dụng chống nước tốt.</li>
	<li style="text-align:justify"><strong><em>Đ&aacute;y xoay (vặn ren):</em></strong>&nbsp;Chống nước tốt.</li>
	<li style="text-align:justify"><strong><em>Đ&aacute;y bắt v&iacute;t:</em>&nbsp;</strong>Chống nước trung b&igrave;nh, một v&agrave;i loại chuy&ecirc;n dụng chống nước tốt.</li>
	<li style="text-align:justify"><strong><em>Đ&aacute;y lắp k&iacute;nh vặn ren hoặc &eacute;p gioăng</em></strong>&nbsp;c&oacute; thể nh&igrave;n r&otilde; bộ m&aacute;y b&ecirc;n trong (see through case back): Chống nước trung b&igrave;nh.</li>
</ul>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/18/CH6A7159-min.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><em><strong>Caseback xuy&ecirc;n thấu từ Ogival S&oacute;ng Cả, cỗ m&aacute;y Automatic Swiss Made</strong></em></p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/18/DSC04929-min(1).jpg" style="height:536px; width:800px" /></p>

<p style="text-align:center"><em><strong>C&ograve;n đ&acirc;y l&agrave; &quot;mặt tiền&quot; Skeleton của anh bạn Ogival M&atilde;nh Hổ</strong></em></p>

<p style="text-align:justify">T&ugrave;y v&agrave;o thiết kế m&agrave; case đồng hồ c&oacute; h&igrave;nh dạng, k&iacute;ch thước kh&aacute;c nhau như h&igrave;nh tr&ograve;n, thoi, lục gi&aacute;c, oval, h&igrave;nh chữ nhật, vu&ocirc;ng,... Một số kh&aacute;c c&ograve;n c&oacute; h&igrave;nh d&aacute;ng độc đ&aacute;o, ph&aacute; c&aacute;ch. Nhưng chung quy lại, ch&uacute;ng đều c&oacute; hai chức năng ch&iacute;nh: bảo vệ m&aacute;y đồng hồ khỏi c&aacute;c t&aacute;c nh&acirc;n b&ecirc;n ngo&agrave;i (nước, độ ẩm, bụi bẩn,...) v&agrave; tạo n&ecirc;n&nbsp;thẩm mỹ&nbsp;cho cỗ m&aacute;y thời gian.</p>

<h2 style="text-align:justify"><strong>2. Kh&ocirc;ng chỉ đơn thuần l&agrave; vỏ bọc &ndash; case đồng hồ cũng c&oacute; lịch sử ri&ecirc;ng</strong></h2>

<p style="text-align:justify">Phi&ecirc;n bản case đồng hồ đầu ti&ecirc;n thuộc về case của chiếc đồng hồ bỏ t&uacute;i (đồng hồ quả qu&yacute;t) của thế kỷ XVI. Ch&uacute;ng đơn giản chỉ gồm 2 phần vỏ kim loại trơn được h&agrave;n v&agrave;o nhau c&ugrave;ng với một d&acirc;y treo. Về sau ch&uacute;ng mới được chế t&aacute;c tinh xảo hơn v&agrave; chạm khắc th&ecirc;m hoạt tiết ở mặt ngo&agrave;i.</p>

<p style="text-align:justify">Qua gần 5 thế kỷ, đồng hồ đeo tay trở n&ecirc;n phổ biến, case đồng hồ cũng được &ldquo;thi&ecirc;n biến vạn h&oacute;a&rdquo; để ph&ugrave; hợp với chức năng của bộ m&aacute;y v&agrave; đ&aacute;p ứng nhu cầu thẩm mỹ ng&agrave;y c&agrave;ng cao của người sử dụng.</p>

<p style="text-align:justify">Ti&ecirc;u biểu như một chiếc case lớn hơn, c&oacute; v&ograve;ng bezel&nbsp;c&oacute; thể xoay được l&agrave; y&ecirc;u cầu bắt buộc với chiếc đồng hồ lặn hay đồng hồ Chronograph những năm 1950. Đến năm 60, 70 th&igrave; h&igrave;nh d&aacute;ng của case đồng hồ đ&atilde; qu&aacute; đa dạng, người ta gần như c&oacute; thể sản xuất case với mọi h&igrave;nh d&aacute;ng, k&iacute;ch thước.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/18/lam-sach-vo-dong-ho.png" style="height:394px; width:800px" /></p>

<h2 style="text-align:justify"><strong>3. Chất liệu tạo n&ecirc;n case đồng hồ</strong></h2>

<p style="text-align:justify">Chất liệu l&agrave; yếu tố đ&oacute;ng vai tr&ograve; chủ chốt trong việc sản xuất case đồng hồ. Vậy chất liệu tạo n&ecirc;n case l&agrave; g&igrave;?</p>

<h3 style="text-align:justify"><strong><em>Th&eacute;p 316L:</em></strong></h3>

<p style="text-align:justify">Ng&agrave;y nay, th&eacute;p kh&ocirc;ng gỉ 316L &ndash; th&eacute;p ti&ecirc;u chuẩn d&ugrave;ng trong chế t&aacute;c đồng hồ được sử dụng phổ biến nhất. Th&eacute;p 316L l&agrave; hỗn hợp của c&aacute;c kim loại Crom (Cr), Niken (Ni), Molipđen (Mo), Nito (N) trong m&ocirc;i trường nhiệt độ cao từ 450 độ C đến 850 độ C để loại bỏ c&aacute;c tạp chất v&agrave; Cacbon (C), tạo ra c&aacute;c cấu tr&uacute;c tinh thể kh&aacute;c nhau với t&iacute;nh chất cơ - l&yacute; kh&aacute;c nhau.</p>

<p style="text-align:justify">Từ đ&oacute;, case đồng hồ l&agrave;m bằng th&eacute;p 316L c&oacute; khả năng chịu được sự ăn m&ograve;n v&agrave; &iacute;t bị biến m&agrave;u trong phạm vi nhiệt rộng, độ bền dẻo cao v&agrave; khả năng kh&aacute;ng từ t&iacute;nh tốt nhất.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/18/DSC02284-min(1).jpg" style="height:534px; width:800px" /></p>

<h3 style="text-align:justify"><strong><em>Th&eacute;p 904L:</em></strong></h3>

<p style="text-align:justify">Từ năm 1985, chất liệu&nbsp;th&eacute;p 904L &ldquo;si&ecirc;u chống ăn m&ograve;n&rdquo; được Rolex sử dụng trong chế t&aacute;c case đồng hồ. So với th&eacute;p 316L, th&igrave; th&eacute;p 904L c&oacute; tỷ lệ Crom, Molipđen, Niken, Đồng lớn hơn hẳn. Điều n&agrave;y gi&uacute;p cải thiện khả năng kh&aacute;ng axit, ăn m&ograve;n h&oacute;a học v&agrave; l&agrave;m cho th&eacute;p c&oacute; độ cứng vượt trội.</p>

<p style="text-align:justify">Đến năm 2000, th&eacute;p 904L được sử dụng phổ biến hơn nhưng do đ&ograve;i hỏi kỹ thuật luyện kim cực kỳ phức tạp n&ecirc;n 904L vẫn l&agrave; c&ocirc;ng nghệ chế t&aacute;c độc quyền, tạo n&ecirc;n sự đắt đỏ của những chiếc đồng hồ Rolex.</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/18/Rolex-watch-materials.jpg" style="height:600px; width:800px" /></p>

<h3 style="text-align:justify"><strong><em>Titan:</em></strong></h3>

<p style="text-align:justify">Giữa những năm 70, Titan trở th&agrave;nh lựa chọn h&agrave;ng đầu cho c&aacute;c cỗ m&aacute;y thời gian c&oacute; chức năng đặc biệt, đ&ograve;i hỏi hoạt động ở những m&ocirc;i trường khắc nghiệt.</p>

<p style="text-align:justify">Chiếc đồng hồ lặn trong qu&acirc;n đội l&agrave; một điển h&igrave;nh, ch&uacute;ng cần một vỏ ngo&agrave;i chống va chạm v&agrave; chống ăn m&ograve;n rất cao. IWC v&agrave; Seiko v&agrave; hai thương hiệu đồng hồ đi đầu trong việc sử dụng kim loại n&agrave;y.</p>

<p style="text-align:justify">Với chất liệu kim loại, c&aacute;c case đồng hồ c&ograve;n được mạ v&agrave;ng. Dung dịch v&agrave;ng 18K gold v&agrave; c&ocirc;ng nghệ mạ PVD được coi l&agrave; c&ocirc;ng nghệ v&agrave; chất liệu mạ l&yacute; tưởng để tạo l&ecirc;n lớp mạ sang trọng, chống xước v&agrave; bền m&agrave;u.</p>

<h3 style="text-align:justify"><strong><em>Gốm chống xước:</em></strong></h3>

<p style="text-align:justify">Cũng khoảng năm 1970, chất liệu gốm chống xước (Scratchproof Ceramic) lần đầu ti&ecirc;n được h&atilde;ng RADO sử dụng.</p>

<p style="text-align:justify">Gần như người ta kh&ocirc;ng phủ th&ecirc;m lớp h&oacute;a chất n&agrave;o tr&ecirc;n gốm v&igrave; vậy, c&aacute;c case đồng hồ l&agrave;m từ gốm rất th&acirc;n thiện với người đeo. Ch&uacute;ng nhẹ, bền m&agrave;u, kh&ocirc;ng g&acirc;y k&iacute;ch ứng da, kh&ocirc;ng bị ảnh hưởng bởi từ t&iacute;nh v&agrave; ăn m&ograve;n h&oacute;a học. Tuy nhi&ecirc;n, c&aacute;c case bằng gốm lại dễ bị t&aacute;c động bởi lực mạnh v&agrave; kh&oacute; gia c&ocirc;ng do đặc điểm cấu tạo ph&acirc;n tử.</p>

<p style="text-align:justify">Từ đ&oacute; đến nay, rất nhiều h&atilde;ng tiếp tục sử dụng chất liệu n&agrave;y cho c&aacute;c d&ograve;ng sản phẩm của họ. C&oacute; thể kể đến d&ograve;ng Big Pilot Top Gun của IWC, chiếc Speedmaster Dark Side of the Moon của Omega được l&agrave;m ho&agrave;n to&agrave;n từ gốm sứ từ vỏ cho đến mặt số,...</p>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/18/20190715-Zenith-Defy-Classic-Ceramic-02.jpg" style="height:593px; width:800px" /></p>

<p style="text-align:justify"><strong><em>Chi&ecirc;m ngưỡng case chất liệu gốm c&ocirc;ng nghệ cao</em></strong></p>

<h3 style="text-align:justify"><strong><em>Chất liệu kh&aacute;c:</em></strong></h3>

<p style="text-align:justify">Gần đ&acirc;y khi cao su v&agrave; sợi Cacbon rất phổ biến nhờ c&ocirc;ng nghệ gia c&ocirc;ng ng&agrave;y c&agrave;ng tinh tế hơn, ch&uacute;ng được ưu ti&ecirc;n sử dụng ở d&ograve;ng đồng hồ thể thao ngo&agrave;i trời v&agrave; đồng hồ lặn. Hợp kim chống si&ecirc;u ăn m&ograve;n kh&aacute;c, hay thậm ch&iacute; cả ngọc b&iacute;ch cũng xuất hiện trong danh s&aacute;ch chất liệu d&ugrave;ng trong chế t&aacute;c case đồng hồ.</p>

<h2 style="text-align:justify"><strong>4. C&aacute;c loại size mặt đồng hồ phổ biến</strong></h2>

<p style="text-align:justify">Khi tư vấn, người b&aacute;n h&agrave;ng thường gọi &ldquo;size mặt đồng hồ&rdquo;, &ldquo;size đồng hồ&rdquo; thay cho &ldquo;case size&rdquo;. Size đồng hồ nằm trong khoảng 23 &ndash; 50mm.</p>

<p style="text-align:justify"><strong><em>C&aacute;c size mặt đồng hồ thường gặp:</em></strong></p>

<p style="text-align:justify"><em><strong>D&agrave;nh cho nữ:</strong></em></p>

<ul>
	<li style="text-align:justify">Women&rsquo;s Mini (đồng hồ nữ &ndash; size nhỏ): 23mm &ndash; 25mm</li>
	<li style="text-align:justify">Women&rsquo;s Regular (đồng hồ nữ &ndash; size th&ocirc;ng thường): 26mm &ndash; 29mm</li>
	<li style="text-align:justify">Midsize &ndash; Unisex (nam hoặc nữ đều đeo được): 34mm &ndash; 36mm</li>
</ul>

<p style="text-align:justify"><em><strong>D&agrave;nh cho nam:</strong></em></p>

<ul>
	<li style="text-align:justify">Men&rsquo;s Regular (đồng hồ nam &ndash; size th&ocirc;ng thường): 37mm &ndash; 39mm</li>
	<li style="text-align:justify">Men&rsquo;s Sport (đồng hồ nam &ndash; size thể thao): 40mm &ndash; 42mm</li>
	<li style="text-align:justify">Men&rsquo;s XL (đồng hồ nam &ndash; size lớn, rất lớn): 45mm</li>
</ul>

<p style="text-align:center"><img alt="" src="https://xwatch.vn/upload_images/images/2020/07/18/CH6A9997-min(1).jpg" style="height:534px; width:800px" /></p>

<p style="text-align:justify"><strong><em>Chọn size đồng hồ ph&ugrave; hợp gi&uacute;p t&ocirc;n l&ecirc;n vẻ đẹp của cả đồng hồ v&agrave; người đeo</em></strong></p>

<p style="text-align:justify">Chu vi cổ tay v&agrave; size mặt đồng hồ ph&ugrave; hợp với bạn c&oacute; li&ecirc;n quan mật thiết đến nhau đấy. Bạn c&oacute; thể &aacute;p dụng c&ocirc;ng thức sau đ&acirc;y để t&igrave;m được size đồng hồ ph&ugrave; hợp:</p>

<ul>
	<li style="text-align:justify"><em>Chu vi cổ tay / 4.5 = cỡ đồng hồ tối ưu</em></li>
	<li style="text-align:justify"><em>Chu vi cổ tay / 4 = cỡ đồng hồ tối đa</em></li>
	<li style="text-align:justify"><em>Chu vi cổ tay / 5 = cỡ đồng hồ tối thiểu</em></li>
</ul>

<p style="text-align:justify">Thật đơn giản phải kh&ocirc;ng? Tuy nhi&ecirc;n t&ugrave;y v&agrave;o sở th&iacute;ch, bạn vẫn c&oacute; thể lựa chọn những size mặt đồng hồ ph&aacute; c&aacute;ch để thể hiện c&aacute; t&iacute;nh.</p>

<p style="text-align:justify">&ldquo;Case l&agrave; g&igrave;? Case đồng hồ l&agrave; g&igrave;?&rdquo; - C&aacute;c bạn đ&atilde; t&igrave;m thấy c&acirc;u trả lời rồi chứ? Thế giới của những chiếc đồng hồ nhỏ b&eacute; thật kh&ocirc;ng b&eacute; nhỏ ch&uacute;t n&agrave;o. Từng chi tiết của chiếc đồng hồ tr&ecirc;n cổ tay bạn đều mang đến rất nhiều điều th&uacute; vị.</p>

<p style="text-align:justify">Ch&uacute;c c&aacute;c bạn sẽ t&igrave;m được chiếc đồng hồ&nbsp;đeo tay ưng &yacute; với case đồng hồ ph&ugrave; hợp nhất!</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1015, N'lvphu', N'thaonp', CAST(N'2021-09-14' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/cau-tao-cua-dong-ho-deo-tay.jpg', N'KHÁM PHÁ SƠ LƯỢC CẤU TẠO CỦA ĐỒNG HỒ ĐEO TAY', N'<p>Bộ m&aacute;y đồng hồ l&agrave; sự kết hợp của rất nhiều chi tiết cơ kh&iacute; si&ecirc;u nhỏ. Nếu kh&ocirc;ng phải l&agrave; chuy&ecirc;n vi&ecirc;n kĩ thuật, bạn sẽ kh&ocirc;ng cần phải tường tận mọi thứ về n&oacute;. Nhưng l&agrave; một người chơi đồng hồ đ&iacute;ch thực, hiểu biết về cấu tạo của đồng hồ đeo tay sẽ gi&uacute;p anh em th&aacute;o gỡ phần n&agrave;o kh&oacute; khăn khi lựa chọn hoặc sửa chữa cỗ m&aacute;y thời gian. Đừng qu&ecirc;n rằng mỗi cỗ m&aacute;y cơ, quartz, solar, kinetic&hellip; đều c&oacute; cấu tạo v&agrave; c&aacute;ch thiết kế kh&aacute;c nhau. Điều n&agrave;y phụ thuộc v&agrave;o kĩ thuật ri&ecirc;ng của h&atilde;ng sản xuất v&agrave; c&aacute;c nh&agrave; chế t&aacute;c. Tuy nhi&ecirc;n, trong b&agrave;i viết n&agrave;y, h&atilde;y c&ugrave;ng điểm mặt - gọi t&ecirc;n những bộ phận cơ bản m&agrave; người sử dụng đồng hồ n&ecirc;n biết.</p>

<h2><strong>1. Vỏ đồng hồ</strong></h2>

<p>Đầu ti&ecirc;n, kh&ocirc;ng thể bỏ qua lớp &aacute;o gi&aacute;p l&agrave;m nhiệm vụ che chở c&aacute;c chi tiết m&aacute;y b&ecirc;n trong cỗ m&aacute;y thời gian. Vỏ đồng hồ l&agrave; bộ phận tiếp x&uacute;c trực tiếp với l&agrave;n da người đeo, đồng thời l&agrave; một phần l&agrave;m n&ecirc;n vẻ thẩm mĩ của chiếc đồng hồ đeo tay. Ch&iacute;nh v&igrave; thế, vỏ đồng hồ được nh&agrave; chế t&aacute;c sử dụng rất nhiều chất liệu kh&aacute;c nhau, t&ugrave;y theo mục đ&iacute;ch v&agrave; gi&aacute; th&agrave;nh y&ecirc;u cầu.</p>

<p>C&oacute; thể kể đến 3 kiểu vỏ thường được đưa v&agrave;o trong c&aacute;c thiết kế:</p>

<ul>
	<li><em><strong>Vỏ th&eacute;p Inox hay th&eacute;p kh&ocirc;ng gỉ</strong></em>: phổ biến nhất trong c&aacute;c mẫu đồng hồ hiệu hiện nay, được nhận biết qua d&ograve;ng chữ Stainless hoặc All Steel. Chất liệu n&agrave;y c&oacute; đặc điểm l&agrave; bền bỉ, khả năng chống ăn m&ograve;n cao, kh&ocirc;ng g&acirc;y k&iacute;ch ứng cho l&agrave;n da người đeo. Đặc biệt gi&aacute; th&agrave;nh kh&ocirc;ng qu&aacute; cao khiến c&aacute;c nh&agrave; sản xuất lu&ocirc;n tin tưởng.</li>
</ul>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/05/1702172711991385102053222117876565204906001n-e1496049980763.jpg" style="height:700px; width:700px" /></p>

<ul>
	<li><em><strong>Vỏ mạ (base metal):</strong></em>&nbsp;chất lượng v&agrave; gi&aacute; th&agrave;nh k&eacute;m hơn. Đ&acirc;y l&agrave; loại vỏ đồng hồ l&agrave;m từ th&eacute;p thường, đồng hoặc Antimol để mạ. Một nhược điểm cực lớn so với th&eacute;p kh&ocirc;ng gỉ đ&oacute; l&agrave; chỉ sau 1- 3 năm sử dụng, vỏ mạ sẽ bị bong tr&oacute;c. Dấu hiệu cho anh em nhận biết c&iacute;nh l&agrave; d&ograve;ng chữ Stainless Steel Back hoặc Base Metal.</li>
	<li>Một số chất liệu kh&aacute;c: gốm, carbon, nh&ocirc;m, titanium&hellip; thường c&oacute; mặt tại những mẫu đồng hồ cao cấp.</li>
</ul>

<h2><strong>2. Kim đồng hồ</strong></h2>

<p>L&agrave; bộ phận rất quan trọng trong cấu tạo của đồng hồ đeo tay, kim đồng hồ đ&oacute;ng vai tr&ograve; thiết lập n&ecirc;n phong c&aacute;ch to&agrave;n thể của một chiếc đồng hồ. Cổ điển, sang trọng, năng động&hellip; tất cả c&oacute; thể được lựa chọn t&ugrave;y v&agrave;o thiết kế của kim đồng hồ. &nbsp; &nbsp;</p>

<p>Trong lịch sử hơn 400 năm của đồng hồ, kh&ocirc;ng dưới 1000 lại kim đ&atilde; được ra đời. V&igrave; vậy m&agrave; c&aacute;c bộ sưu tập đồng hồ vẫn lu&ocirc;n c&oacute; n&eacute;t kh&aacute;c biệt, độc đ&aacute;o so với bất k&igrave; thiết kế n&agrave;o trước đ&oacute;.</p>

<h2><strong>3. D&acirc;y đồng hồ</strong></h2>

<p>D&acirc;y đồng hồ l&agrave; bộ phận &ocirc;m lấy cổ tay người đeo, đồng thời mỗi loại d&acirc;y lại mang một sắc th&aacute;i. Điều đ&oacute; khiến rất nhiều người d&agrave;y c&ocirc;ng sưu tầm c&aacute;c mẫu d&acirc;y đồng hồ độc - lạ. Một v&agrave;i loại d&acirc;y thường được sử dụng như:</p>

<p>- D&acirc;y Inox hay th&eacute;p kh&ocirc;ng gỉ (Stainless Steel): c&oacute; độ bền cao, giảm thiểu tối đa qu&aacute; tr&igrave;nh oxy h&oacute;a hoặc bị ăn m&ograve;n.</p>

<p>- D&acirc;y mạ: L&agrave; loại d&acirc;y l&agrave;m bằng th&eacute;p thường hoặc bằng đồng, được mạ b&oacute;ng. Loại d&acirc;y n&agrave;y theo thời gian sẽ bị oxy ho&aacute;.</p>

<p>- D&acirc;y hợp kim Titanium</p>

<p>- D&acirc;y Inox hay th&eacute;p kh&ocirc;ng gỉ (Stainless Steel): Bền, kh&ocirc;ng bị oxy ho&aacute; hay gỉ.</p>

<p>- D&acirc;y da: d&acirc;y da thật (da đ&agrave; điểu, c&aacute; sấu&hellip;) hoặc d&acirc;y da tổng hợp PU.&nbsp;</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/05/1745803812136072287584501250769932823695665n-e1496050142270.jpg" style="height:469px; width:700px" /></p>

<p>- D&acirc;y nhựa, d&acirc;y vải, d&acirc;y cao su: chất liệu n&agrave;y lại được sử dụng kh&aacute; rộng r&atilde;i, tạo phong c&aacute;ch trẻ trung n&ecirc;n thường được c&aacute;c bạn trẻ ưa chuộng.</p>

<h2><strong>4. K&iacute;nh đồng hồ</strong></h2>

<p>Đ&ocirc;́i với đ&ocirc;̀ng h&ocirc;̀ nam hay đ&ocirc;̀ng h&ocirc;̀ nữ.lớp k&iacute;nh đồng hồ trong suốt, tưởng chừng như mỏng manh nhưng lại l&agrave; bộ phận bảo vệ cho mặt đồng hồ. C&oacute; thể tạm chia k&iacute;nh đồng hồ th&agrave;nh 4 loại:</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/hkpbvwl-e1496050552423.jpg" style="height:438px; width:700px" /></p>

<ul>
	<li>K&iacute;nh kho&aacute;ng (Mineral glass): C&oacute; khả năng chống xước nhẹ</li>
	<li>K&iacute;nh cứng (Hardness glass): Chống xước kh&aacute;, chống va đập</li>
	<li>K&iacute;nh tr&aacute;ng Sapphire (S. Sapphire): khả năng chống xước cao</li>
	<li>K&iacute;nh Sapphire (Sapphire glass, Sapphire crystal): Chống xước gần như ho&agrave;n hảo, thường trang bị ở những đồng hồ cao cấp.</li>
</ul>

<p>T&ugrave;y v&agrave;o đặc điểm thiết kế, t&iacute;nh năng, mỗi thương hiệu sẽ lựa chọn mặt k&iacute;nh ph&ugrave; hợp cho cỗ m&aacute;y thời gian.</p>

<h2><strong>5. Bộ m&aacute;y đồng hồ</strong></h2>

<p>N&oacute;i về đồng hồ, quan trọng nhất ch&iacute;nh l&agrave; bộ m&aacute;y (movement). Bộ m&aacute;y cũng l&agrave; bộ phận c&oacute; gi&aacute; trị cao nhất trong một chiếc đồng hồ. Cao cấp nhất hiện nay vẫn l&agrave; những bộ m&aacute;y đến từ &ocirc;ng lớn đồng hồ Thụy Sĩ. Nhưng phổ biến v&agrave; quen thuộc hơn cả với anh em y&ecirc;u đồng hồ vẫn l&agrave; bộ chuyển động của Nhật Bản. Theo cơ chế chuyển động của từng loại m&aacute;y, c&oacute; thể tạm chia ra th&agrave;nh 2 bộ m&aacute;y cơ bản:</p>

<p><em>M&aacute;y cơ (automatic)</em>: sử dụng hệ thống cơ kh&iacute; (b&aacute;nh xe) v&agrave; d&acirc;y c&oacute;t để gi&uacute;p đồng hồ hoạt động. Cỗ m&aacute;y lấy năng lượng ch&iacute;nh từ bộ c&oacute;t, th&ocirc;ng qua hệ thống b&aacute;nh răng, bộ t&oacute;c để điều h&ograve;a v&agrave; điều khiển kim đồng hồ hoạt động. Năng lượng sẽ được t&iacute;ch trữ bằng c&aacute;ch vặn n&uacute;m hoặc tự động l&ecirc;n gi&acirc;y c&oacute;t th&ocirc;ng qua &ldquo;quả lăng&rdquo;.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/05/1726468512020798165778582241578692135342941n-e1496050711341.jpg" style="height:464px; width:700px" /></p>

<p>Bộ m&aacute;y cơ th&ocirc;ng thường c&oacute; khoảng 130 bộ phận kh&aacute;c nhau, phục vụ 3 mục đ&iacute;ch ch&iacute;nh: cung cấp năng lượng, truyền tải v&agrave; hiển thị. C&agrave;ng c&oacute; nhiều chức năng ưu việt th&igrave; số lượng bộ phận c&agrave;ng tăng l&ecirc;n v&agrave; phức tạp hơn.</p>

<p><em>M&aacute;y quartz:</em>&nbsp;Đ&acirc;y l&agrave; loại m&aacute;y sử dụng tinh thể thạch anh để tạo xung nhịp đếm thời gian v&agrave; sử dụng pin để vận h&agrave;nh hệ thống điện tử (IC-modul) v&agrave; cơ kh&iacute; (hệ thống b&aacute;nh răng). Dao động của đ&aacute; thạch anh rất ổn định n&ecirc;n đồng hồ quartz c&oacute; t&iacute;nh ch&iacute;nh x&aacute;c cao. Đồng thời, th&acirc;n m&aacute;y của đồng hồ quartz&nbsp;sẽ mỏng, gọn nhẹ hơn so với đồng hồ cơ. Bộ m&aacute;y quartz cơ bản sẽ bao gồm: pin, IC, bộ mạch xử l&iacute;, tinh thể thạch anh, bộ điều h&ograve;a dao động, motor bước.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1016, N'lvphu', N'thaonp', CAST(N'2021-09-15' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/dong-ho-may-in-house.jpg', N'IN-HOUSE MOVEMENT LÀ GÌ?', N'<p style="text-align:justify">Giới chơi đồng hồ ai cũng muốn c&oacute; một chiếc đồng hồ &quot;in-house movement&quot;. Vậy &quot;in-house movement&quot; l&agrave; g&igrave;</p>

<p style="text-align:justify">Hiện nay, giới chơi&nbsp;đồng hồ&nbsp;ai cũng muốn c&oacute; một chiếc đồng hồ &quot;<strong>in-house movement</strong>&quot;. Vậy &quot;in-house movement&quot; l&agrave; g&igrave; v&agrave; tại sao lại được coi trọng như vậy?</p>

<p style="text-align:center"><img alt="in-house-movement-1" src="https://www.xwatch.vn/wp-content/uploads/2016/12/in-house-movement-1-min.jpg" style="height:393px; width:700px" /></p>

<p style="text-align:justify">► In-house movement (m&aacute;y đồng hồ in-house) l&agrave; bộ m&aacute;y cơ kh&iacute; b&ecirc;n trong chiếc đồng hồ. Những h&atilde;ng đồng hồ tự sản xuất ho&agrave;n to&agrave;n những chi tiết của m&aacute;y đồng hồ th&igrave; bộ m&aacute;y đ&oacute; gọi l&agrave; in - house movement. Th&ocirc;ng thường một số hoặc rất nhiều những bộ phận chi tiết của đồng hồ được mua bởi c&aacute;c nh&agrave; cung cấp b&ecirc;n ngo&agrave;i. Phổ biến l&agrave; m&aacute;y đồng hồ ETA của Tập đo&agrave;n Swatch&nbsp;(Thụy Sĩ) - được rất nhiều thương hiệu sử dụng cho những chiếc đồng hồ của họ.</p>

<p style="text-align:center"><img alt="in-house-movement-3" src="https://www.xwatch.vn/wp-content/uploads/2016/12/in-house-movement-3-min.jpg" style="height:245px; width:700px" /></p>

<p style="text-align:justify">► Những bộ m&aacute;y in-house lu&ocirc;n l&agrave; điều m&agrave; c&aacute;c nh&agrave; sản xuất đồng hồ hướng tới. Bởi n&oacute; thể hiện sự độc nhất, chất lượng cao hơn khi h&atilde;ng tự thiết kế v&agrave; hiểu r&otilde; c&aacute;c chi tiết m&aacute;y của họ. Hay đơn giản l&agrave; thể hiện truyền thống l&acirc;u năm trong ng&agrave;nh đồng hồ.</p>

<p style="text-align:center"><img alt="in-house-movement-4" src="https://www.xwatch.vn/wp-content/uploads/2016/12/in-house-movement-4-min.jpg" style="height:386px; width:700px" /></p>

<p style="text-align:justify">► Một số thương hiệu như Zenith, Frederique Constant, Vacheron &amp; Constantin, đều đ&atilde; tự sản xuất m&aacute;y đồng hồ nhưng cũng c&oacute; thương hiệu chỉ được sử dụng trong một số mẫu đồng hồ chứ kh&ocirc;ng phải tất cả c&aacute;c sản phẩm của họ.</p>

<p style="text-align:center"><img alt="in-house-movement-5" src="https://www.xwatch.vn/wp-content/uploads/2016/12/in-house-movement-5-min.jpg" style="height:461px; width:700px" /></p>

<p style="text-align:justify">► Phần lớn c&aacute;c m&aacute;y đồng hồ cơ kh&iacute; đều c&oacute; hệ thống v&agrave; những bộ phận cơ bản giống nhau để hoạt động, điều đ&oacute; c&oacute; nghĩa rằng hầu hết c&aacute;c m&aacute;y đồng hồ vốn dĩ đ&atilde; tương tự nhau. V&igrave; thế m&agrave; c&aacute;ch thiết kế, trang tr&iacute; v&agrave; cấu tạo của m&aacute;y đồng hồ l&agrave; những điều thực sự tạo ra sự kh&aacute;c nhau giữa c&aacute;c thương hiệu. Những người t&igrave;m kiếm chiếc đồng hồ được ho&agrave;n to&agrave;n lắp r&aacute;p bằng tay v&agrave; trang tr&iacute; lộng lẫy, tỉ mỉ, độc đ&aacute;o sẽ chỉ t&igrave;m thấy sự h&agrave;i l&ograve;ng trong c&aacute;c bộ m&aacute;y in-house movement.</p>

<p style="text-align:justify">► Đ&aacute;ng l&yacute; khi một c&ocirc;ng ty tự sản xuất, c&oacute; nghĩa l&agrave; n&oacute; c&oacute; thể kiểm so&aacute;t chi ph&iacute; v&agrave; v&igrave; thế m&agrave; gi&aacute; th&agrave;nh cũng sẽ thấp hơn khi phải mua b&ecirc;n ngo&agrave;i. Tuy nhi&ecirc;n trong sản xuất đồng hồ lại kh&ocirc;ng như thế, in-house movement thường đi k&egrave;m với mức gi&aacute; cao hơn l&agrave; m&aacute;y đồng hồ được mua từ b&ecirc;n thứ 3.</p>

<p style="text-align:justify">L&yacute; do g&igrave;? Một phần l&agrave; do c&aacute;c gi&aacute; trị cảm x&uacute;c trong c&aacute;c m&aacute;y in-house, phần kh&aacute;c l&agrave; do chi ph&iacute; thực tế rất lớn để hoạt động l&agrave; lắp đặt một nh&agrave; m&aacute;y sản xuất m&aacute;y đồng hồ.</p>

<p style="text-align:center"><img alt="in-house-movement-7" src="https://www.xwatch.vn/wp-content/uploads/2016/12/in-house-movement-7-min.jpg" style="height:420px; width:700px" /></p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1017, N'lvphu', N'thaonp', CAST(N'2021-09-15' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/vong-bezel-la-gi.jpg', N'KHÁM PHÁ 8 CHỨC NĂNG THÚ VỊ QUA VÒNG BEZEL', N'<p style="text-align:justify"><strong>Bezel l&agrave; g&igrave;?</strong>&nbsp;Đ&oacute; l&agrave; v&agrave;nh đồng hồ ( hay c&ograve;n gọi l&agrave; v&agrave;nh benzel) - bộ phận kết nối vỏ v&agrave; mặt k&iacute;nh đồng hồ. Một số cố định, một số c&oacute; thể xoay - xoay theo một chiều hoặc cả hai chiều. Ở những mẫu cổ điển, v&ograve;ng bezel đồng hồ thường chỉ c&oacute; t&aacute;c dụng trang tr&iacute;: trơn, mạ v&agrave;ng hoặc đ&iacute;nh đ&aacute;.</p>

<p style="text-align:justify">Nhưng từ năm 1950, những c&ocirc;ng ty chế t&aacute;c đồng hồ&nbsp;đ&atilde; nhận ra rằng, v&ograve;ng bezel l&agrave; một bộ phận ho&agrave;n hảo để t&iacute;ch hợp c&aacute;c t&iacute;nh năng đặc biệt cho cỗ m&aacute;y thời gian. H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i giải m&atilde; những t&aacute;c dụng đặc biệt của v&ograve;ng bezel v&agrave; c&aacute;ch sử dụng ch&uacute;ng.</p>

<h2 style="text-align:justify"><strong>1. Đếm thời gian tr&ocirc;i qua (Count up with a 0-60 scale)</strong></h2>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dong-ho-vong-benzel-8.jpg" style="height:500px; width:650px" /></p>

<p style="text-align:center"><em><strong>Vòng Bezel của m&acirc;̃u đ&ocirc;̀ng h&ocirc;̀ nam ROLEX</strong></em></p>

<p style="text-align:justify">Ch&uacute;ng ta thường thấy v&ograve;ng bezel xuất hiện ở những chiếc đồng hồ lặn (Dive Watch). Hệ thống chia vạch được đ&aacute;nh từ 0 - 60 tương ứng với 60 ph&uacute;t để người lặn theo d&otilde;i thời gian lặn, từ đ&oacute; t&iacute;nh to&aacute;n được độ s&acirc;u v&agrave; lượng kh&ocirc;ng kh&iacute; c&ograve;n lại.</p>

<ul>
	<li style="text-align: justify;">15 ph&uacute;t (hoặc 20 ph&uacute;t) đầu được ph&acirc;n chia 1 ph&uacute;t 1 vạch, gi&uacute;p t&iacute;nh to&aacute;n nhanh v&agrave; ch&iacute;nh x&aacute;c hơn. Phần c&ograve;n lại được chia 5 ph&uacute;t 1 vạch. Tr&ecirc;n v&ograve;ng bezel c&oacute; một điểm đ&aacute;nh dấu c&oacute; thể ph&aacute;t quang trong trường hợp thiếu s&aacute;ng.</li>
</ul>

<p style="text-align:justify"><em><strong>C&aacute;c thao t&aacute;c khi sử dụng v&ograve;ng bezel lặn:</strong></em></p>

<ul>
	<li style="text-align: justify;">Bước 1: Xoay v&ograve;ng bezel ngược chiều kim đồng hồ đến vị tr&iacute; vạch 0 tr&ecirc;n bezel tr&ugrave;ng với kim ph&uacute;t như h&igrave;nh tr&ecirc;n.</li>
	<li style="text-align: justify;">Bước 2: Theo d&otilde;i khoảng thời gian lặn bằng c&aacute;ch x&aacute;c định vị tr&iacute; của kim ph&uacute;t ứng với số bao nhi&ecirc;u v&ograve;ng bezel. Đ&oacute; ch&iacute;nh l&agrave; số ph&uacute;t lặn.</li>
</ul>

<h2 style="text-align:justify"><strong>2. Đếm thời gian ngược (Count down with a 60-0 scale)</strong></h2>

<p style="text-align:justify">Đặc điểm của v&ograve;ng bezel đếm ngược l&agrave; vạch số tr&ecirc;n v&ograve;ng bezel chạy từ 60 &ndash; 0 theo chiều kim đồng hồ.&nbsp;Chức năng n&agrave;y&nbsp;kh&ocirc;ng chỉ sử dụng cho lặn biển m&agrave; c&ograve;n rất hữu dụng cho phi c&ocirc;ng, qu&acirc;n sự hay cảnh s&aacute;t để đồng bộ thời gian trong những trường hợp đặc biệt.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dong-ho-vong-benzel-7.jpg" style="height:500px; width:650px" /></p>

<p style="text-align:center"><strong><em>Coutdown Bezel Số chỉ ngược từ 60 - 0</em></strong></p>

<p style="text-align:justify">Khi bắt đầu đếm ngược, bạn xoay v&ograve;ng bezel sao vạch số đ&aacute;nh dấu thời gian lặn tr&ugrave;ng vị tr&iacute; kim ph&uacute;t. V&iacute; dụ bạn muốn lặn 20 ph&uacute;t, h&atilde;y chỉnh mốc 20 tr&ecirc;n v&ograve;ng bezel tr&ugrave;ng với kim ph&uacute;t. Thời gian tr&ocirc;i qua, khi kim ph&uacute;t chỉ đến số 0 tr&ecirc;n v&ograve;ng bezel l&agrave; &ldquo;hết giờ&rdquo;.</p>

<h2 style="text-align:justify"><strong>3. Chức năng GMT</strong></h2>

<p style="text-align:justify">V&agrave;o khoảng năm 50, khi c&aacute;c chuyến bay h&agrave;ng kh&ocirc;ng ng&agrave;y c&agrave;ng phổ biến, h&atilde;ng h&agrave;ng kh&ocirc;ng Pan Am đ&atilde; y&ecirc;u cầu Rolex chế tạo cho họ chiếc đồng hồ c&oacute; thể hiện thị cả giờ địa phương v&agrave; giờ&nbsp;<a href="https://xwatch.vn/kien-thuc-chuyen-nganh/dong-ho-gmt-nha-du-hanh-vuot-thoi-gian-p2874-n11370.html">GMT</a>&nbsp;để sử dụng tr&ecirc;n những chuyến bay vượt Đại T&acirc;y Dương. Kết quả l&agrave; chiếc Rolex GMT Master diệu kỳ ra đời.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dong-ho-vong-benzel-6.jpg" style="height:500px; width:650px" /></p>

<p style="text-align:justify">V&ograve;ng bezel của đồng hồ GMT được chia 24 vạch &ndash; tương ứng với 24 m&uacute;i giờ. Đồng thời mặt số hiện diện th&ecirc;m một kim chỉ giờ GMT mang m&agrave;u sắc kh&aacute;c biệt.</p>

<p style="text-align:justify"><em><strong>Để sử dụng chức năng n&agrave;y, bạn l&agrave;m theo c&aacute;c bước sau:</strong></em></p>

<p style="text-align:justify"><strong><em>Bước 1:</em></strong>&nbsp;Kiểm tra, đảm bảo thang đo 24 giờ đang hiển thị ch&iacute;nh x&aacute;c giờ địa phương hiện tại.</p>

<p style="text-align:justify"><strong><em>Bước 2:&nbsp;</em></strong>T&iacute;nh to&aacute;n giờ ở địa điểm bạn cần&nbsp;chuyển đổi&nbsp;phải cộng hay trừ bao nhi&ecirc;u giờ so với giờ địa phương. Sau đ&oacute; xoay v&ograve;ng bezel sang tr&aacute;i hoặc sang phải từng đ&oacute; nấc.</p>

<p style="text-align:justify">Vậy l&agrave; bạn đ&atilde; c&oacute; chiếc đồng hồ thứ 2, kim giờ GMT l&uacute;c n&agrave;y chỉ giờ ở nơi bạn muốn x&aacute;c định.</p>

<p style="text-align:justify"><em><strong>V&iacute; dụ:</strong>&nbsp;</em>Bạn đang ở Việt Nam v&agrave; muốn biết giờ của Nhật Bản. Tại Việt Nam, l&uacute;c n&agrave;y l&agrave; 2:00 p.m tức kim giờ GMT phải chỉ 14:00. M&uacute;i giờ Nhật Bản hơn Việt Nam 2 giờ n&ecirc;n bạn xoay v&ograve;ng bezel sang tr&aacute;i 2 nấc. Khi đ&oacute;, mốc 12h &nbsp;nơi mặt số tr&ugrave;ng với vị tr&iacute; 2h của v&ograve;ng bezel. L&uacute;c n&agrave;y, kim giờ GMT chỉ số 16 tr&ecirc;n v&ograve;ng bezel, tức ở Nhật Bản đang l&agrave; 16:00 hay 4:00 p.m.</p>

<h2 style="text-align:justify"><strong>4. Chức năng la b&agrave;n (Compass)</strong></h2>

<p style="text-align:justify">Nhiều người kh&ocirc;ng nhận ra chiếc đồng hồ họ đang đeo tr&ecirc;n tay c&oacute; chức năng như một thiết bị la b&agrave;n thực thụ. H&atilde;y để &yacute; xem v&ograve;ng bezel của bạn c&oacute; thể xoay được 2 chiều v&agrave; c&oacute; 4 chữ c&aacute;i N, E, S, W kh&ocirc;ng?</p>

<p style="text-align:justify">Nếu c&oacute;, đ&oacute; ch&iacute;nh l&agrave; chức năng la b&agrave;n. N &ndash; North, E &ndash; East, S &ndash; South, W &ndash; West tương ứng với c&aacute;c hướng Bắc, Đ&ocirc;ng, Nam, T&acirc;y.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dong-ho-vong-benzel-5.jpg" style="height:500px; width:650px" /></p>

<p style="text-align:justify"><em><strong>Khi cần x&aacute;c định phương hướng, h&atilde;y l&agrave;m theo hướng dẫn sau:</strong></em></p>

<ul>
	<li style="text-align: justify;">Bước 1: Đảm bảo đồng hồ của bạn chạy đ&uacute;ng giờ v&agrave; x&aacute;c định bạn đang ở Bắc b&aacute;n cầu hay Nam b&aacute;n cầu.</li>
	<li style="text-align: justify;">Bước 2: Đặt chiếc đồng hồ tr&ecirc;n b&agrave;n tay sao cho chỉ kim giờ chỉ về hướng mặt trời.</li>
	<li style="text-align: justify;">Bước 3: Nếu bạn ở Bắc b&aacute;n cầu, xoay v&ograve;ng bezel đến khi chữ &nbsp;S nằm ở vị tr&iacute; giữa kim giờ v&agrave; mốc 12h. Thay v&agrave;o đ&oacute; l&agrave; chữ N nếu bạn ở Nam b&aacute;n cầu.</li>
	<li style="text-align: justify;">Bước 4: D&ugrave;ng định hướng tr&ecirc;n v&ograve;ng bezel sau khi điều chỉnh ở bước 3 để x&aacute;c định hướng bắc, nam, t&acirc;y, đ&ocirc;ng. Trong trường hợp bạn d&ugrave;ng la b&agrave;n để x&aacute;c định hướng đi trong nhiều giờ, h&atilde;y thiết lập lại v&ograve;ng bezel mỗi giờ một lần.</li>
</ul>

<h2 style="text-align:justify"><strong>5. Chức năng đo tốc độ (Tachymeter)</strong></h2>

<p style="text-align:justify">V&ograve;ng bezel tachymeter l&agrave; một trong những v&ograve;ng bezel cố định xuất hiện nhiều nhất ở d&ograve;ng đồng hồ Chronograph (đồng hồ c&oacute; chức năng bấm giờ). Với mục đ&iacute;nh x&aacute;c định tốc độ, ch&uacute;ng ra mắt lần đầu ở c&aacute;c cuộc đua m&ocirc; t&ocirc; những năm 60, 70. N&oacute;i một c&aacute;ch ch&iacute;nh x&aacute;c hơn, Tachymeter được d&ugrave;ng để t&iacute;nh to&aacute;n số đơn vị tr&ecirc;n giờ.</p>

<p style="text-align:justify">Ch&uacute;ng ta tiếp tục lấy v&iacute; dụ để dễ hiểu c&aacute;ch d&ugrave;ng: bạn muốn t&iacute;nh tốc độ của một chiếc &ocirc; t&ocirc; đang chạy tr&ecirc;n đường đua v&agrave; biết ch&iacute;nh x&aacute;c khoảng c&aacute;ch từ điểm A đến điểm B l&agrave; 1 km.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dong-ho-vong-benzel-4.jpg" style="height:500px; width:650px" /></p>

<p style="text-align:justify">Đầu ti&ecirc;n bạn c&agrave;i đặt kim gi&acirc;y Chronograph về vị tr&iacute; 0 giờ. Khi xe đi qua điểm A, nhấn n&uacute;t bắt đầu, khi xe đến điểm B, bạn nhấn kết th&uacute;c. Kim gi&acirc;y dừng lại chỉ thời gian tr&ecirc;n mặt số trung t&acirc;m v&agrave; chỉ tốc độ km/h của chiếc &ocirc; t&ocirc; ở v&ograve;ng bezel.</p>

<p style="text-align:justify">Bạn c&oacute; thể sử dụng chức năng n&agrave;y với mọi đơn vị t&iacute;nh. Nhưng cần đảm bảo thời gian đo trong v&ograve;ng 60 gi&acirc;y hoặc &iacute;t hơn.</p>

<p style="text-align:justify">Bạn cũng c&oacute; thể t&iacute;nh trung b&igrave;nh số sản phẩm sản xuất trong 1 giờ bằng c&aacute;ch bấm giờ Chronograph từ l&uacute;c bắt đầu đến khi kết th&uacute;c sản xuất 1 sản phẩm. Tại thời điểm dừng lại, kim gi&acirc;y sẽ chỉ số sản phẩm sản xuất/giờ.</p>

<p style="text-align:justify">Tương tự với việc t&iacute;nh trung b&igrave;nh số pha n&eacute;m b&oacute;ng mỗi giờ trong một trận b&oacute;ng ch&agrave;y, tốc độ g&otilde; b&agrave;n ph&iacute;m hoặc bất kỳ việc g&igrave; lặp đi lặp lại m&agrave; kh&ocirc;ng phụ thuộc v&agrave;o đơn vị.</p>

<h2 style="text-align:justify"><strong>6. Chức năng đo khoảng c&aacute;ch (Telemeter)</strong></h2>

<p style="text-align:justify">Cũng sử dụng t&iacute;nh năng bấm giờ Chronograph, nhưng thay v&igrave; tốc độ, Telemeter bezel đo khoảng c&aacute;ch. Ban đầu ch&uacute;ng được t&iacute;ch hợp tr&ecirc;n đồng hồ để những người l&iacute;nh t&iacute;nh to&aacute;n khoảng c&aacute;ch của bom trong những trận chiến. Hoặc với mục đ&iacute;nh kh&aacute;c &ldquo;th&acirc;n thiện hơn&rdquo; như đo khoảng c&aacute;ch s&eacute;t tới vị tr&iacute; của bạn trong một cơn b&atilde;o.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dong-ho-vong-benzel-2.jpg" style="height:500px; width:650px" /></p>

<p style="text-align:justify">Bắt đầu nhấn n&uacute;t Chronograph khi bạn nh&igrave;n thấy tia s&eacute;t, bấm kết th&uacute;c khi bạn nghe thấy tiếng sấm. Việc rất đơn giản tiếp theo l&agrave; quan s&aacute;t kim gi&acirc;y tr&ecirc;n mặt đồng hồ. Số tr&ecirc;n thang Telemeter m&agrave; kim gi&acirc;y chỉ đến ch&iacute;nh l&agrave; khoảng c&aacute;ch của bạn v&agrave; cơn b&atilde;o.</p>

<p style="text-align:justify">Đơn vị khoảng c&aacute;ch thường l&agrave; kilomet hoặc dặm đ&atilde; được mặc định v&agrave; ghi sẵn tr&ecirc;n mặt số đồng hồ. Bạn ho&agrave;n to&agrave;n c&oacute; thể thực hiện tương tự với c&aacute;c sự vật m&agrave; bạn vừa nh&igrave;n thấy &aacute;nh s&aacute;ng, vừa nghe thấy &acirc;m thanh của n&oacute;.</p>

<h2 style="text-align:justify"><strong>7. Chức năng đo nhịp tim (Pulsometer)</strong></h2>

<p style="text-align:justify">Chiếc v&ograve;ng bezel cố định Pulsometer xuất hiện ở d&ograve;ng đồng hồ d&agrave;nh cho b&aacute;c sỹ những năm 1940. Chức năng n&agrave;y tiếp tục sử dụng n&uacute;t Chronograph để theo d&otilde;i kim gi&acirc;y. Nhịp tim của bệnh nh&acirc;n nhanh ch&oacute;ng được chỉ ra m&agrave; kh&ocirc;ng cần bất kỳ t&iacute;nh to&aacute;n n&agrave;o. V&igrave; thế n&ecirc;n đồng hồ Pulsometer c&ograve;n được gọi với c&aacute;i t&ecirc;n &ldquo;đồng hồ y tế&rdquo;.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dong-ho-vong-benzel-1.jpg" style="height:500px; width:650px" /></p>

<p style="text-align:justify">Hệ thống thang đo Pulsometer ở v&ograve;ng bezel được mặc định d&ugrave;ng với một số nhịp đếm cụ thể, thường l&agrave; 15, 20 hoặc 30 nhịp (số n&agrave;y được ghi ở tr&ecirc;n mặt số của đồng hồ, chiếc Longines b&ecirc;n dưới &aacute;p dụng cho 30 nhịp đếm &ndash; Grade pour 30 pulsations)</p>

<p style="text-align:justify"><em><strong>Bạn sử dụng chức năng Pulsometer bằng c&aacute;ch:</strong></em>&nbsp;bấm n&uacute;t Chronograph bắt đầu khi ph&aacute;t hiện thấy mạch đập v&agrave; bấm kết th&uacute;c sau khi đếm xong số nhịp được mặc định (15, 20 hoặc 30). Vị tr&iacute; kim Chronograph tr&ecirc;n thang Pulsometer ch&iacute;nh bằng số nhịp tim tr&ecirc;n ph&uacute;t. Thật tiện lợi phải kh&ocirc;ng?</p>

<h2 style="text-align:justify"><strong>8. Chức năng t&iacute;nh to&aacute;n chuyển đổi (Slide Rule)</strong></h2>

<p style="text-align:justify">Slide Rule c&oacute; lẽ l&agrave;&nbsp;chiếc&nbsp;v&ograve;ng bezel th&ocirc;ng minh v&agrave; phức tạp nhất. Ch&uacute;ng kết hợp 2 thang đo logarit (logarithmic): một thang cố định v&agrave; một thang l&agrave; v&ograve;ng bezel c&oacute; thể xoay để t&iacute;nh to&aacute;n v&agrave; chuyển đổi đơn vị.</p>

<p style="text-align:justify">Những năm 50, h&atilde;ng đồng hồ Breitling danh tiếng đ&atilde; t&iacute;ch hợp th&agrave;nh c&ocirc;ng chức năng n&agrave;y cho cỗ m&aacute;y mang t&ecirc;n Breitling Navitimer. Ngay sau đ&oacute;, thiết bị trở th&agrave;nh c&ocirc;ng cụ đo lường ti&ecirc;u chuẩn d&agrave;nh cho phi c&ocirc;ng để t&iacute;nh nhanh tốc độ gi&oacute;, lượng nhi&ecirc;n liệu ti&ecirc;u thụ v&agrave; khoảng c&aacute;ch.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dong-ho-vong-benzel.jpg" style="height:500px; width:650px" /></p>

<p style="text-align:justify"><em><strong>&gt;&gt;&gt; Ch&uacute;ng ta thử h&igrave;nh dung về một ph&eacute;p nh&acirc;n đơn giản: 14x8.</strong></em></p>

<ul>
	<li style="text-align: justify;">Bước 1: Xoay v&ograve;ng bezel sao cho số 14 tr&ecirc;n v&ograve;ng bezel tr&ugrave;ng với số hệ số tr&ecirc;n thang đo cố định (người ta thường d&ugrave;ng hệ số l&agrave; 10 &ndash; một số đồng hồ in số 10 m&agrave;u đỏ để người d&ugrave;ng dễ nhận biết).</li>
	<li style="text-align: justify;">Bước 2: Giữ nguy&ecirc;n vị tr&iacute; đ&oacute; v&agrave; t&igrave;m số 8 tr&ecirc;n thang cố định, đối chiếu với v&ograve;ng bezel ta được kết quả: 122.</li>
</ul>

<p style="text-align:justify">Như vậy, qua những kiến thức tr&ecirc;n, kh&ocirc;ng những biết được bezel l&agrave; g&igrave;, ch&uacute;ng ta giải m&atilde; 8 t&aacute;c dụng đặc biệt của chiếc v&ograve;ng &ldquo;nhỏ nhưng c&oacute; v&otilde;&rdquo; n&agrave;y.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1018, N'longnt', N'thaonp', CAST(N'2021-09-15' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/chan-kinh-dong-ho.jpg', N'KHÁM PHÁ ĐIỀU THÚ VỊ VỀ CHÂN KÍNH ĐỒNG HỒ?', N'<p style="text-align:justify">Ch&acirc;n k&iacute;nh đồng hồ l&agrave; g&igrave;? Tại sao một chiếc đồng hồ ch&iacute;nh h&atilde;ng lại c&oacute; ch&acirc;n k&iacute;nh?</p>

<p style="text-align:justify">Ch&acirc;n k&iacute;nh l&agrave;m bằng g&igrave;? Bao nhi&ecirc;u ch&acirc;n k&iacute;nh l&agrave; đủ?</p>

<p style="text-align:justify">Tại sao th&ocirc;ng thường tổng số ch&acirc;n k&iacute;nh trong bộ cơ thường l&agrave; số lẻ?</p>

<p style="text-align:justify">Tất cả sẽ được giải đ&aacute;p trong b&agrave;i viết ngay dưới đ&acirc;y:</p>

<h2 style="text-align:justify"><strong>1. Tại sao lại cần ch&acirc;n k&iacute;nh?</strong></h2>

<p style="text-align:justify">Khi cỗ m&aacute;y thời gian hoạt động li&ecirc;n tục, sự dịch chuyển giữa c&aacute;c b&aacute;nh răng với trục sản sinh ra ma s&aacute;t rất lớn, g&acirc;y hao m&ograve;n v&agrave; dẫn đến hiện tượng giảm tốc của đồng hồ ch&iacute;nh h&atilde;ng</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/chan-kinh-1-1.jpg" style="height:478px; width:800px" /></p>

<p style="text-align:justify">V&igrave; vậy, để khắc phục t&igrave;nh trạng n&agrave;y, phải sử dụng c&aacute;c hạt ch&acirc;n k&iacute;nh (đ&aacute; qu&yacute;), đặt v&agrave;o những điểm chịu sự m&agrave;i m&ograve;n lớn để giảm tối đa t&aacute;c động của ma s&aacute;t.</p>

<h2 style="text-align:justify"><strong>2. Ch&acirc;n k&iacute;nh l&agrave;m bằng g&igrave;?</strong></h2>

<p style="text-align:justify">Để c&oacute; thể chịu đựng được bền bỉ lực ma s&aacute;t li&ecirc;n tục như vậy, hợp chất đ&aacute; qu&yacute; n&agrave;y phải c&oacute; độ cứng v&agrave; độ bền cao hơn kim loại.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/chan-kinh-dong-ho-3.jpg" style="height:436px; width:800px" /></p>

<p style="text-align:justify">Những loại đ&aacute; qu&yacute; được c&acirc;n nhắc c&oacute; thể kể đến kim cương, sapphire, ruby, trong đ&oacute;, sapphire v&agrave; ruby c&oacute; gi&aacute; th&agrave;nh thấp hơn kim cương, đồng thời cũng c&oacute; thể được tổng hợp nh&acirc;n tạo. V&igrave; vậy phần lớn ch&acirc;n k&iacute;nh trong đồng hồ ch&iacute;nh h&atilde;ng hiện nay được l&agrave;m từ ruby. Một số mẫu đẳng cấp, đắt tiền c&oacute; thể d&ugrave;ng kim cương l&agrave;m ch&acirc;n k&iacute;nh, tuy nhi&ecirc;n số lượng n&agrave;y &iacute;t.</p>

<h2 style="text-align:justify"><strong>3. C&oacute; bao nhi&ecirc;u loại ch&acirc;n k&iacute;nh?</strong></h2>

<p style="text-align:justify">Ch&acirc;n k&iacute;nh c&oacute; đường k&iacute;nh hiếm khi qu&aacute; 2mm v&agrave; độ d&agrave;y kh&ocirc;ng qu&aacute; 0,5mm. Trải qua c&ocirc;ng đoạn cắt gọt, đ&aacute;nh b&oacute;ng, khoan lỗ, kho&eacute;t trũng, trở th&agrave;nh những ch&acirc;n k&iacute;nh c&oacute; h&igrave;nh dạng kh&aacute;c nhau, đặt v&agrave;o những vị tr&iacute; kh&aacute;c nhau:</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/chan-kinh-dong-ho-4-1.jpg" style="height:330px; width:800px" /></p>

<p style="text-align:justify">Ch&acirc;n k&iacute;nh tr&ograve;n, c&oacute; lỗ xuy&ecirc;n t&acirc;m: sử dụng cho những điểm vận h&agrave;nh với vận tốc quay nhỏ, kh&ocirc;ng y&ecirc;u cầu cao lắm về độ sai số (rơ) v&agrave; chịu ảnh hưởng nhiều bởi lực t&aacute;c động vu&ocirc;ng g&oacute;c trục quay.</p>

<p style="text-align:justify">Ch&acirc;n k&iacute;nh tr&ograve;n, kh&ocirc;ng c&oacute; lỗ: sử dụng kết hợp với dạng 1 để &aacute;p dụng cho những điểm c&oacute; y&ecirc;u cầu cao về độ sai số, c&oacute; vận tốc quay lớn, chịu ảnh hưởng nhiều bởi lực t&aacute;c động dọc trục.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/chan-kinh-dong-ho-5-1.jpg" style="height:478px; width:800px" /></p>

<p style="text-align:justify">Ch&acirc;n k&iacute;nh dạng phiến, vu&ocirc;ng chữ nhật: sử dụng cho những điểm bị t&aacute;c động va đập trượt (ngang) l&agrave; hai đầu của ngựa (c&ograve; kho&aacute;, mở b&aacute;nh b&aacute;nh escape - hay c&ograve;n gọi b&aacute;nh nhện).</p>

<p style="text-align:justify">Ch&acirc;n k&iacute;nh dạng h&igrave;nh trụ: sử dụng gắn tr&ecirc;n b&aacute;nh balance để đ&aacute; &ldquo;ngựa&rdquo;, điểm bị t&aacute;c động va đập trượt (ngang).</p>

<h2 style="text-align:justify"><strong>4. Ch&acirc;n k&iacute;nh cần thiết cho những vị tr&iacute; như n&agrave;o?</strong></h2>

<p style="text-align:justify">Dưới đ&acirc;y l&agrave; h&igrave;nh ảnh minh họa chi tiết cho vị tr&iacute; ch&acirc;n k&iacute;nh trong một số bộ m&aacute;y đồng hồ cơ bản</p>

<p style="text-align:justify">Bộ m&aacute;y 7 jewels (manual): 1 roller (impulse) + 2 pallet (lever) + 2 hole (balance) + 2 cap (balance)</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/chan-kinh-dong-ho-7.jpg" style="height:562px; width:799px" /></p>

<p style="text-align:justify">Bộ m&aacute;y 11 jewels (manual): 1 roller (impulse) + 2 pallet (lever) + 2 hole (balance) + 2 cap (balance) + 2 hole (lever) + 2 hole (escape).</p>

<p style="text-align:justify">Bộ m&aacute;y 15 jewels (manual): 1 roller (impulse) + 2 pallet (lever) + 2 hole (balance) + 2 cap (balance) + 2 hole (lever) + 2 hole (escape) + 2 hole (4th wheel) + 2 hole (3rd wheel).</p>

<p style="text-align:justify">Bộ m&aacute;y 17 jewels (manual): 1 roller (impulse) + 2 pallet (lever) + 2 hole (balance) + 2 cap (balance) + 2 hole (lever) + 2 hole (escape) + 2 hole (4th wheel) + 2 hole (3rd wheel) + 2 hole (center wheel).</p>

<p style="text-align:justify">Bộ m&aacute;y 21 jewels (manual): 1 roller (impulse) + 2 pallet (lever) + 2 hole (balance) + 2 cap (balance) + 2 hole (lever) + 2 hole (escape) + 2 hole (4th wheel) + 2 hole (3rd wheel) + 2 hole (center wheel) + 2 cap (lever) + 2 cap (escape)</p>

<p style="text-align:justify">Bộ m&aacute;y 23 jewels (manual): 1 roller (impulse) + 2 pallet (lever) + 2 hole (balance) + 2 cap (balance) + 2 hole (lever) + 2 hole (escape) + 2 hole (4th wheel) + 2 hole (3rd wheel) + 2 hole (center wheel) + 2 cap (lever) + 2 cap (escape) + 2 hole (main spring)</p>

<p style="text-align:justify">Sử dụng ch&acirc;n k&iacute;nh ở đ&acirc;u, vị tr&iacute; n&agrave;o c&oacute; một &yacute; nghĩa rất quan trọng, bởi kh&ocirc;ng phải bất cứ vị tr&iacute; n&agrave;o cũng c&oacute; thể đặt ch&acirc;n k&iacute;nh, n&oacute; phải ph&ugrave; hợp với cường độ l&agrave;m việc của vị tr&iacute;.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/chan-kinh-dong-ho-9.jpg" style="height:491px; width:800px" /></p>

<h2 style="text-align:justify"><strong>5. Tại sao tổng số ch&acirc;n k&iacute;nh trong c&aacute;c bộ m&aacute;y cơ thường l&agrave; số lẻ</strong></h2>

<p style="text-align:justify">Tổng số ch&acirc;n k&iacute;nh thường được t&iacute;nh theo c&ocirc;ng thức sau:</p>

<p style="text-align:justify">Số ch&acirc;n k&iacute;nh = t&iacute;ch c&aacute;c cặp jewel + 1 (roller jewel - gạt).</p>

<p style="text-align:justify">C&aacute;c con số n&agrave;y đi theo chuỗi số 1, 5, 7, 9, 11, 13, 15, 17, 21, 23, 25, 27, 29... (kh&ocirc;ng c&oacute; 3 l&agrave; v&igrave; ch&acirc;n k&iacute;nh trục balance thường l&agrave; 2 cặp).</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/chan-kinh-dong-ho-10.jpg" style="height:531px; width:800px" /></p>

<p style="text-align:justify">Tuy nhi&ecirc;n, trong bộ cơ c&oacute; th&ecirc;m bộ phận tự động l&ecirc;n d&acirc;y c&oacute;t, n&oacute; sẽ tăng th&ecirc;m 2 hoặc 4 t&ugrave;y theo kết cấu (1 chiều hay 2 chiều l&ecirc;n d&acirc;y c&oacute;t) v&agrave; c&oacute; thể hơn ch&uacute;t nữa nhưng vẫn thường l&agrave; từng cặp. Trường hợp b&aacute;nh l&ecirc;n d&acirc;y (kh&ocirc;ng đối trọng, hay c&ograve;n gọi b&uacute;a) sử dụng 1 ch&acirc;n k&iacute;nh th&igrave; số chẵn mới xảy ra trong tổng số.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1019, N'longnt', N'thaonp', CAST(N'2021-09-15' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/dong-ho-may-quartz.jpg', N'ĐỒNG HỒ QUARTZ LÀ GÌ?', N'<p style="text-align:justify">B&ecirc;n cạnh những người th&iacute;ch chơi đồng hồ cơ cũng c&oacute; người th&iacute;ch sự nhẹ nh&agrave;ng, nhỏ nhắn của đồng hồ Quartz. Phải khẳng định một điều rằng, những cỗ m&aacute;y thời gian chạy bằng pin chưa bao giờ hết Hot tr&ecirc;n thị trường.</p>

<p style="text-align:justify">Vậy c&oacute; ai hiểu &ldquo;đồng hồ quartz l&agrave; g&igrave;&rdquo;, &quot;đồng hồ loại quartz l&agrave; đồng hồ g&igrave;&quot; v&agrave; ch&uacute;ng c&oacute; g&igrave; kh&aacute;c biệt? H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute;.</p>

<p style="text-align:justify"><strong>Đồng hồ quartz l&agrave; đồng hồ g&igrave;?</strong></p>

<p style="text-align:justify">Đồng hồ nam quartz l&agrave; danh từ chỉ chung cho những cỗ m&aacute;y chạy bằng pin. Đồng hồ m&aacute;y quartz l&agrave; g&igrave;? - c&acirc;u trả lời đơn giản l&agrave; đồng hồ chạy bằng pin.</p>

<p style="text-align:center"><img alt="đồng hồ máy quartz là gì" src="https://www.xwatch.vn/wp-content/uploads/2017/11/dong-ho-may-quartz-la-gi.jpg" style="height:462px; width:701px" /></p>

<p style="text-align:justify">Đồng hồ quartz (quartz movement) hoạt động tr&ecirc;n cơ chế điều động một tinh thể thạch anh. Tinh thể dao động được đặt trong một điện trường, cung cấp năng lượng cho đồng hồ hoạt động. D&ograve;ng điện chạy qua được cung cấp năng lượng từ pin. Do đ&oacute; m&agrave; kiểu m&aacute;y n&agrave;y cũng c&oacute; t&ecirc;n gọi l&agrave; đồng hồ chạy pin.</p>

<p style="text-align:justify"><strong>M&aacute;y quartz c&oacute; những loại n&agrave;o?</strong></p>

<p style="text-align:justify">C&ugrave;ng l&agrave; một cỗ m&aacute;y quartz, nhưng nguồn gốc sản xuất kh&aacute;c nhau cũng đưa đến những chất lượng kh&aacute;c nhau. M&aacute;y quartz hiện nay được sản xuất từ 3 nước ch&iacute;nh l&agrave; Trung Quốc, Nhật Bản v&agrave; c&aacute;i n&ocirc;i của ng&agrave;nh đồng hồ thế giới-Thụy Sỹ.</p>

<p style="text-align:justify"><strong><em>M&aacute;y quartz của Trung Quốc, Đ&agrave;i Loan</em></strong></p>

<p style="text-align:justify">Người chơi đồng hồ n&oacute;i ri&ecirc;ng hay c&aacute;c sản phẩm kh&aacute;c hầu như kh&ocirc;ng mấy thiện cảm với những mặt h&agrave;ng cao cấp mang chữ Made in China. M&aacute;y quartz đến từ đất nước của Vạn L&yacute; Trường Th&agrave;nh n&agrave;y thường c&oacute; chất lượng kh&ocirc;ng cao, độ bền thấp, thường được sử dụng trong những sản phẩm rẻ tiền hay h&agrave;ng nh&aacute;i, h&agrave;ng fake.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/11/dong-ho-may-quartz-dai-loan.jpg" style="height:386px; width:800px" /></p>

<p style="text-align:justify">Nhật Bản nổi tiếng thế giới một phần bởi con người kỉ luật, bền bỉ. Những sản phẩm của Nhật Bản cũng khiến người chơi đồng hồ y&ecirc;n t&acirc;m. M&aacute;y quartz ch&iacute;nh h&atilde;ng xuất xứ Nhật Bản c&oacute; độ bền ở mức trung b&igrave;nh-kh&aacute;, nhưng đạt độ ch&iacute;nh x&aacute;c cao. C&aacute;c phụ kiện được đầu tư, lắp r&aacute;p tỉ mỉ, ch&iacute;nh x&aacute;c.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/11/dong-ho-may-quartz-nhat-ban-1.jpg" style="height:456px; width:800px" /></p>

<p style="text-align:justify"><strong><em>M&aacute;y quartz Thụy Sỹ</em></strong></p>

<p style="text-align:justify">Thụy Sỹ-c&aacute;i n&ocirc;i của ng&agrave;nh đồng hồ thế giới. Do đ&oacute; m&agrave; những thiết kế được khai sinh từ nơi đ&acirc;y cũng đạt chất lượng, độ ch&iacute;nh x&aacute;c cao. Được chế t&aacute;c bởi những người thợ thủ c&ocirc;ng tỉ mỉ, tinh xảo, đầu tư những chi tiết đắt tiền, kh&ocirc;ng qu&aacute; ngoa khi n&oacute;i m&aacute;y quartz Thụy Sỹ đạt độ ch&iacute;nh x&aacute;c, bền bỉ.</p>

<p style="text-align:center"><img alt="đồng hồ máy quartz thụy sỹ" src="https://www.xwatch.vn/wp-content/uploads/2017/11/dong-ho-may-quartz-thuy-sy.jpg" style="height:359px; width:671px" /></p>

<p style="text-align:justify">Đ&atilde; l&agrave; những người đam m&ecirc; đồng hồ th&igrave; cơ hay quartz cũng đều mang những vẻ đẹp tiềm ẩn m&agrave; khiến người đam m&ecirc; khao kh&aacute;t kh&aacute;m ph&aacute; v&agrave; chinh phục. C&aacute;i thỏa m&atilde;n khi chơi đồng hồ kh&ocirc;ng chỉ l&agrave; sưu tập được những chiếc đồng hồ độc-lạ, m&agrave; c&ograve;n l&agrave; sự chi&ecirc;m nghiệm được những c&acirc;u chuyện đời đằng sau những cỗ m&aacute;y thời gian ấy.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1020, N'longnt', N'thaonp', CAST(N'2021-09-15' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/dong-ho-altimeter.jpg', N'ĐỒNG HỒ ALTIMETER', N'<p style="text-align:justify">&quot;Độ cao c&agrave;ng tăng th&igrave; &aacute;p suất kh&ocirc;ng kh&iacute; c&agrave;ng giảm, độ cao c&agrave;ng giảm th&igrave; &aacute;p suất kh&ocirc;ng kh&iacute; c&agrave;ng tăng&rdquo; &ndash; một kiến thức Vật l&yacute; phổ th&ocirc;ng được &aacute;p dụng th&agrave;nh c&ocirc;ng v&agrave;o những cỗ m&aacute;y thời gian tr&ecirc;n cổ tay. Đ&oacute; ch&iacute;nh l&agrave; Altimeter.</p>

<h3 style="text-align:justify"><strong>1. Altimeter l&agrave; g&igrave;?</strong></h3>

<p style="text-align:justify">Ngo&agrave;i chức năng xem giờ, c&aacute;c nh&agrave; chế t&aacute;c đồng hồ tr&ecirc;n thế giới lu&ocirc;n kh&ocirc;ng ngừng s&aacute;ng tạo, t&iacute;ch hợp v&agrave; cải tiến th&ecirc;m những chức năng hữu dụng, phục vụ đời sống con người. Thuật ngữ đồng hồ &ldquo;Altimeter&rdquo; m&agrave; ch&uacute;ng ta sẽ c&ugrave;ng nhau kh&aacute;m ph&aacute; ngay sau đ&acirc;y l&agrave; một chức năng như vậy.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dongho-altimeter-xwatch-1.jpg" style="height:491px; width:809px" /></p>

<p style="text-align:justify">Altimeter trong tiếng Anh mang nghĩa &ldquo;dụng cụ đo độ cao&rdquo;. Đồng hồ Altimeter l&agrave; đồng hồ c&oacute; t&iacute;nh năng đo độ cao th&ocirc;ng qua đo &aacute;p suất kh&ocirc;ng kh&iacute;. Khi sử dụng, Altimeter sẽ th&ocirc;ng b&aacute;o độ cao hiện tại của bạn so với mực nước biển. Chức năng được t&iacute;ch hợp ở cả m&aacute;y đồng hồ Quartz v&agrave; cơ.</p>

<h3 style="text-align:justify"><strong>2. Chức năng c&ugrave;ng bạn chinh phục những tầm cao</strong></h3>

<p style="text-align:justify">Bạn l&agrave; một d&acirc;n du lịch chuy&ecirc;n nghiệp lu&ocirc;n khao kh&aacute;t đặt ch&acirc;n đến những đỉnh n&uacute;i cao, những hẻm n&uacute;i hiểm trở hiếm người khai ph&aacute;? Một phi c&ocirc;ng cả cuộc đời gắn với những chuyến bay tr&ecirc;n kh&ocirc;ng phận? Hay một người y&ecirc;u th&iacute;ch m&ocirc;n thể thao nhảy d&ugrave; mạo hiểm nhưng đầy th&uacute; vị? Chắc chắn bạn sẽ c&ograve;n kh&ocirc;ng xa lạ với &ldquo;Altimeter&rdquo;.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dongho-altimeter-xwatch-2.jpg" style="height:584px; width:860px" /></p>

<p style="text-align:justify">Chức năng n&agrave;y phổ biến nhất trong ng&agrave;nh h&agrave;ng kh&ocirc;ng. Dụng cụ đo Altimeter gi&uacute;p phi c&ocirc;ng x&aacute;c định được khoảng c&aacute;ch từ m&aacute;y bay xuống dưới mặt đất để đảm bảo an to&agrave;n, t&iacute;nh to&aacute;n thời gian đ&aacute;p đất v&agrave; xử l&yacute; nhanh ch&oacute;ng c&aacute;c t&igrave;nh huống khẩn cấp. Đồng hồ Altimeter cũng c&oacute; c&ocirc;ng dụng tương tự với người nhảy d&ugrave;.&nbsp;Nếu l&agrave; d&acirc;n du lịch, một chiếc đồng hồ Altimeter c&ugrave;ng với bản đồ v&agrave; la b&agrave;n sẽ ph&aacute;t huy t&aacute;c dụng hơn một thiết bị định vị GPS hiện đại trong c&aacute;c trường hợp leo n&uacute;i hoặc th&aacute;m hiểm hang động, nơi m&agrave; s&oacute;ng GPS kh&ocirc;ng khả dụng.</p>

<p style="text-align:justify">Trong đời sống cũng sẽ c&oacute; rất nhiều hoạt động đặc biệt kh&aacute;c cần đến chức năng đo độ cao Altimeter. Thật th&uacute; vị khi tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục những tầm cao ta c&oacute; được người bạn đồng h&agrave;nh như chiếc Altimeter - nhỏ b&eacute; nhưng lu&ocirc;n hiện diện trong t&igrave;nh huống kh&oacute; khăn nhất.</p>

<h3 style="text-align:justify"><strong>3. Nguy&ecirc;n l&yacute; của người bạn Altimeter</strong></h3>

<p style="text-align:justify">Kỳ diệu như vậy nhưng người bạn Altimeter của ch&uacute;ng ta hoạt động theo một nguy&ecirc;n l&yacute; rất đơn giản. Thực chất, Altimeter kh&ocirc;ng trực tiếp đo độ cao m&agrave; ch&uacute;ng t&iacute;nh to&aacute;n, chuyển đổi độ cao từ việc đo &aacute;p suất kh&ocirc;ng kh&iacute;. Theo nguy&ecirc;n l&yacute; Vật l&yacute; m&agrave; t&ocirc;i đ&atilde; nhắc ở phần mở đầu: &ldquo;Độ cao c&agrave;ng tăng th&igrave; &aacute;p suất kh&ocirc;ng kh&iacute; c&agrave;ng giảm, độ cao c&agrave;ng giảm th&igrave; &aacute;p suất kh&ocirc;ng kh&iacute; c&agrave;ng tăng&rdquo; do lực h&uacute;t của Tr&aacute;i đất.</p>

<p style="text-align:justify">Phần lớn hiện nay đồng hồ Altimeter l&agrave; m&aacute;y Quartz, n&oacute;i ch&iacute;nh x&aacute;c hơn l&agrave; Digital Quartz. Ch&uacute;ng chứa c&aacute;c mạch điện tử để t&iacute;nh to&aacute;n. Đồng thời c&oacute; nhiều chức năng phụ trợ như chuyển đổi đơn vị m&eacute;t &ndash; feet, chia đơn vị nhỏ với độ ch&iacute;nh x&aacute;c cao. Tầm đo của đồng hồ Quartz Altimeter cũng rất ấn tượng: -700 đến 1.000m (-2.300 &ndash; 32.800 ft).</p>

<p style="text-align:center"><img alt="dongho-altimeter-xwatch-4" src="https://www.xwatch.vn/wp-content/uploads/2017/07/dongho-altimeter-xwatch-4-1.jpg" style="height:533px; width:800px" /></p>

<p style="text-align:center"><em>Đồng hồ cơ Automatic Oris với d&ograve;ng chữ Altimeter</em></p>

<p style="text-align:justify">Trong khi đ&oacute;, chức năng Altimeter kh&aacute; kh&oacute; t&igrave;m được ở những chiếc m&aacute;y cơ, ch&uacute;ng chỉ đo được độ cao tr&ecirc;n mặt nước biển. Tuy nhi&ecirc;n, những chiếc m&aacute;y cơ Altimeter c&oacute; cấu tạo độc đ&aacute;o, th&uacute; vị hơn bởi ch&uacute;ng được chế t&aacute;c ho&agrave;n to&agrave;n từ chất liệu kim kh&iacute; với chức năng hiển thị giờ v&agrave; đo độ cao ri&ecirc;ng biệt. Tức nếu hỏng một bộ phận, bộ phận c&ograve;n lại vẫn hoạt động b&igrave;nh thường.&nbsp;H&atilde;ng Casio nổi tiếng nhất trong việc t&iacute;ch hợp Altimeter cho đồng hồ Quartz trong d&ograve;ng Outdoor, Pro-trek v&agrave; G-shock. C&ograve;n ở m&aacute;y cơ, Oris v&agrave; Breva đi đầu trong phong tr&agrave;o n&agrave;y.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1021, N'longnt', N'thaonp', CAST(N'2021-09-15' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/dong-ho-skeleton.jpg', N'ĐỒNG HỒ SKELETON LÀ GÌ?', N'<p style="text-align:justify">The Bone Collector (Kẻ Sưu Tầm Xương &ndash; t&ecirc;n 1 bộ phim ly kỳ của Hollywood năm 1999) c&oacute; lẽ sẽ ph&aacute;t cuồng khi hắn nh&igrave;n thấy những tuyệt t&aacute;c đồng hồ lộ m&aacute;y tinh tế của nghệ thuật SKELETON!</p>

<p dir="ltr" style="text-align:justify">C&ograve;n bạn th&igrave; sao? Bạn c&oacute; phải t&iacute;n đồ của những chiếc đồng hồ Skeleton&nbsp;&ldquo;lộ xương&rdquo; độc đ&aacute;o v&agrave; m&ecirc; hoặc đến từng chi tiết? Nếu vậy, đừng bỏ qua b&agrave;i viết giải m&atilde; điều l&agrave;m n&ecirc;n gi&aacute; trị, đẳng cấp của những tuyệt t&aacute;c triệu đ&ocirc; Skeleton ngay dưới đ&acirc;y nh&eacute;!</p>

<h2 dir="ltr" style="text-align:justify">I/ Giải M&atilde; Đồng Hồ Skeleton</h2>

<p dir="ltr" style="text-align:justify">SKELETON - &ldquo;Khung xương&rdquo; của đồng hồ. Như một truyền thống, đồng hồ Skeleton với bộ m&aacute;y hở lộ cơ gợi cảm, trở th&agrave;nh những t&aacute;c phẩm nghệ thuật tinh xảo, đỉnh cao của nghệ thuật chế t&aacute;c đồng hồ.</p>

<p style="text-align:center"><img alt="Đồng Hồ Skeleton Là Gì?" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-la-gi.jpg" style="height:500px; width:703px" /></p>

<p dir="ltr" style="text-align:justify">Skeleton từ l&acirc;u đ&atilde; trở th&agrave;nh một trong những d&ograve;ng đồng hồ nằm ở bậc nhất trong bảng xếp về mọi kh&iacute;a cạnh &ndash; độ tinh xảo, phức tạp, chất lượng v&agrave; gi&aacute; cả &ndash; thậm ch&iacute; c&oacute; thể s&aacute;nh ngang với những tuyệt t&aacute;c đồng hồ si&ecirc;u phức tạp (grand complication).&nbsp;</p>

<p style="text-align:center"><img alt="Bộ máy đồng hồ Skeleton" src="https://xwatch.vn/upload_images/images/2020/06/01/bo-may-dong-ho-skeleton.jpg" style="height:500px; width:687px" /></p>

<p dir="ltr" style="text-align:justify">Chi&ecirc;m ngưỡng tuyệt phẩm Skeleton - Vacheron Constantin Les Cabinotiers Openworked tourbillon High Jewellery&nbsp;</p>

<p dir="ltr" style="text-align:justify">Để tạo ra một cỗ m&aacute;y Skeleton sắc n&eacute;t, tinh xảo, độ phức tạp v&agrave; thời gian ti&ecirc;u tốn c&oacute; thể gấp v&agrave;i lần thậm ch&iacute; v&agrave;i chục lần so với một chiếc đồng hồ thường c&ugrave;ng loại. Số lượng chi tiết cũng tăng vọt v&agrave; đi k&egrave;m với đ&oacute; qu&aacute; tr&igrave;nh lắp r&aacute;p tỉ mỉ, ch&iacute;nh x&aacute;c cao độ.</p>

<p style="text-align:center"><img alt="Glashutte Original Senator Moon Phase Skeletonized" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-glashutte.jpg" style="height:500px; width:515px" /></p>

<p dir="ltr" style="text-align:justify">Th&ocirc;ng thường đồng hồ sẽ c&oacute; phần bridge v&agrave; plate, hai phần đ&oacute; l&agrave; cần thiết nhưng sẽ che đi mất kết cấu b&ecirc;n trong, v&ocirc; h&igrave;nh chung che đi cả một c&ocirc;ng tr&igrave;nh nghệ thuật được x&acirc;y bằng bao c&ocirc;ng sức của người thợ. Ch&iacute;nh v&igrave; lẽ đ&oacute;, c&aacute;c nh&agrave; chế t&aacute;c đ&atilde; tăng khoảng hở để người d&ugrave;ng chi&ecirc;m ngưỡng được vẻ đẹp của bộ m&aacute;y đồ sộ đ&oacute;, giống như để lộ &ldquo;bộ xương&rdquo;, phần khung của đồng hồ, &ldquo;skeleton&rdquo; ch&iacute;nh l&agrave; thế!</p>

<p dir="ltr" style="text-align:justify">Để c&oacute; một sản phẩm Skeleton, người nghệ nh&acirc;n chế t&aacute;c đồng hồ đ&atilde; phải mất rất nhiều giờ để kho&eacute;t trổ c&aacute;c ổ đĩa, c&aacute;c bộ phận cầu để đỡ v&agrave; li&ecirc;n kết c&aacute;c bộ phận nhằm tạo khoảng hở tối đa, cho ph&eacute;p người đeo ngắm nh&igrave;n những chuyển động nhịp nh&agrave;ng giữa c&aacute;c b&aacute;nh răng.</p>

<p style="text-align:center"><img alt="Chân kính đồng hồ Skeleton" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-chan-kinh-skeleton.jpg" style="height:478px; width:800px" /></p>

<p dir="ltr" style="text-align:justify">Kh&ocirc;ng chỉ vậy, để đảm bảo t&iacute;nh thẩm mỹ v&agrave; độ ch&iacute;nh x&aacute;c, người nghệ nh&acirc;n phải t&iacute;nh to&aacute;n đến từng milimet. Nếu chạm khắc qu&aacute; đ&agrave;, mối li&ecirc;n kết giữa c&aacute;c bộ phận quan trọng trong cỗ m&aacute;y trở n&ecirc;n lỏng lẻo, v&agrave; hoạt động của m&aacute;y sẽ chịu ảnh hưởng lớn từ những va đập hoặc sự thay đổi nhiệt độ rất nhỏ. Nếu cắt qu&aacute; &iacute;t, sẽ kh&ocirc;ng thể ph&ocirc; diễn to&agrave;n bộ hoạt động của bộ m&aacute;y b&ecirc;n trong.</p>

<p dir="ltr" style="text-align:justify">Bộ khung Skeleton sau khi được cắt gọt sẽ được mạ PVD hoặc trạm trổ những hoa văn v&agrave; gắn đ&aacute; qu&yacute; l&ecirc;n từng chi tiết để tạo n&ecirc;n một kiệt t&aacute;c nghệ thuật đẹp đến từng chi tiết. Chỉ những cỗ m&aacute;y đạt ti&ecirc;u chuẩn mới được r&aacute;p v&agrave;o th&agrave;nh phẩm.</p>

<p style="text-align:center"><img alt="Đồng hồ Skeleton Bovet" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-bovet.jpg" style="height:500px; width:715px" /></p>

<p dir="ltr" style="text-align:justify">Ch&iacute;nh v&igrave; sự tinh xảo, phức tạp đ&aacute;ng ngưỡng mộ đ&oacute; m&agrave; đồng hồ Skeleton trở th&agrave;nh niềm khao kh&aacute;t ch&aacute;y bỏng của bất kỳ t&iacute;n đồ đam m&ecirc; đồng hồ n&agrave;o!</p>

<p style="text-align:center"><img alt="Đồng hồ Skeleton Zenith" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-Zenith.jpg" style="height:472px; width:800px" /></p>

<h2 dir="ltr" style="text-align:justify">II/ Điểm Danh Những Chiếc Đồng Hồ Skeleton Đẹp Nhất, Độc Đ&aacute;o Nhất</h2>

<h3 dir="ltr" style="text-align:justify">1/ Đồng Hồ Ogival Skeleton Thụy Sĩ Tinh Xảo Cho Giới Doanh Nh&acirc;n Cao Cấp</h3>

<p dir="ltr" style="text-align:justify">T&aacute;o Bạo &amp; Quyến Rũ đến chết người, đ&oacute; l&agrave; c&aacute;ch Ogival Skeleton khiến giới mộ điệu đổ gục ngay từ lần đầu chạm mặt!</p>

<p dir="ltr" style="text-align:justify">Vươn ra khỏi việc chỉ mở một cửa sổ đơn giản nhằm thể hiện nhịp đập của quả lắc, c&aacute;c nghệ nh&acirc;n kh&eacute;o l&eacute;o tạo những d&aacute;ng h&igrave;nh khung xương SKELETON ngay tr&ecirc;n mặt đồng hồ! Từ đ&acirc;y, ta c&oacute; thể chi&ecirc;m ngưỡng được trọn vẹn những chuyển động ăn khớp, nhịp nh&agrave;ng của b&aacute;nh răng, con ốc&hellip;</p>

<p style="text-align:center"><img alt="Đồng Hồ Ogival Skeleton Thụy Sĩ" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-ogival-thuy-sy.jpg" style="height:449px; width:800px" /></p>

<p dir="ltr" style="text-align:justify">Thương hiệu Ogival đ&atilde; tr&igrave;nh l&agrave;ng đồng hồ thế giới những tuyệt t&aacute;c Skeleton thuộc h&agrave;ng tuyệt kỹ trong c&ocirc;ng nghệ chế t&aacute;c đồng hồ. Ẩn chứa trong từng thiết kế l&agrave; linh hồn của phương Đ&ocirc;ng qua h&igrave;nh ảnh linh vật biểu tượng của ch&acirc;u &Aacute;. H&igrave;nh ảnh b&aacute;t m&atilde; truy phong mang đến thăng tiến, tiền t&agrave;i, Ogival Song Long Chầu Nguyệt hay biểu tượng c&aacute; nhảy may mắn&hellip; mỗi h&igrave;nh ảnh l&agrave; một &yacute; nghĩa tinh thần tuyệt vời m&agrave; Ogival gửi gắm đến từng kh&aacute;ch h&agrave;ng của m&igrave;nh.</p>

<p dir="ltr" style="text-align:justify">Tr&aacute;i tim của Ogival Skeleton l&agrave; cỗ m&aacute;y Sellita SW200 mang &acirc;m hưởng của ETA 2824-2&nbsp; - chuy&ecirc;n sử dụng cho những cỗ m&aacute;y cơ của Longines, Tissot...&nbsp; M&aacute;y Selita đ&atilde; được Ogival modified lại mang tới sự ch&iacute;nh x&aacute;c v&agrave; chất lượng hơn hẳn.</p>

<p style="text-align:center"><img alt="Cổ máy Ogival Skeleton Sellita SW200" src="https://xwatch.vn/upload_images/images/2020/06/01/may-Sellita-dong-ho-skeleton.jpg" style="height:400px; width:779px" /></p>

<p dir="ltr" style="text-align:justify">M&aacute;y đồng hồ Sellita SW200 c&oacute; tới 26 ch&acirc;n k&iacute;nh, c&ugrave;ng tần số dao động l&ecirc;n đến 28800 VPH, đảm bảo độ ch&iacute;nh x&aacute;c cao. Cụ thể, sai số của m&aacute;y chỉ khoảng +5/-5s/ng&agrave;y ở c&aacute;c tư thế đặt m&aacute;y kh&aacute;c nhau, hoặc c&aacute;c mức nhiệt độ từ 8 - 38 độ C. Đ&acirc;y l&agrave; một căn cứ quan trọng để tin tưởng rằng bộ m&aacute;y vẫn giữ sai số chấp nhận được sau khi bị cắt gọt c&aacute;c đĩa v&agrave; cầu nối.</p>

<p style="text-align:center"><img alt="Máy Sellita SW200 Thuỵ Sỹ" src="https://xwatch.vn/upload_images/images/2020/06/01/Sellita-SW200-dong-ho-skeleton.jpg" style="height:600px; width:708px" /></p>

<p dir="ltr" style="text-align:justify">Mặt kh&aacute;c, m&aacute;y Sellita SW200 được trang bị chi tiết chống sốc Incabloc hoặc Novodiac, cầu nối b&aacute;nh xe tho&aacute;t cũng được l&agrave;m bằng đ&aacute; qu&yacute; độ cứng cao. Ch&uacute;ng ta đều biết, c&aacute;c bộ m&aacute;y Skeleton đều rất nhạy cảm với va đập (do mối li&ecirc;n kết giữa c&aacute;c b&aacute;nh răng l&agrave; đĩa v&agrave; cầu nối đều được cắt giảm đến mức tối thiểu). V&igrave; vậy, c&aacute;c chi tiết cứng v&agrave; chống sốc cao cấp khiến bộ m&aacute;y trở n&ecirc;n chắc chắn v&agrave; ổn định hơn rất nhiều khi đưa v&agrave;o sử dụng.</p>

<p dir="ltr" style="text-align:justify">Chất lượng từ cỗ m&aacute;y cơ bền bỉ ch&iacute;nh x&aacute;c c&ugrave;ng với thiết kế Skeleton thuộc h&agrave;ng tuyệt kỹ của ng&agrave;nh chế t&aacute;c đồng hồ đ&atilde; cho thấy Ogival kh&ocirc;ng hề k&eacute;m cạnh những h&atilde;ng đồng hồ Thụy Sĩ danh tiếng. V&igrave; vậy, x&eacute;t tr&ecirc;n gi&aacute; th&agrave;nh Ogival lu&ocirc;n lọt top đồng hồ Skeleton gi&aacute; rẻ với chất lượng &ldquo;đ&aacute;ng đồng tiền b&aacute;t gạo&rdquo;.</p>

<p style="text-align:center"><img alt="Đồng hồ Ogival Skeleton Song Long" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-ogival-song-long.jpg" style="height:533px; width:800px" /></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:center"><img alt="Đồng hồ Ogival Skeleton Bát Mã Truy Phong" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-ogival-bat-ma.jpg" style="height:533px; width:800px" /></p>

<p dir="ltr" style="text-align:justify">Kh&ocirc;ng ngẫu nhi&ecirc;n những mẫu đồng hồ Ogival b&aacute;n chạy nhất lại mang thiết kế Skeleton. Được tạo n&ecirc;n từ những chất liệu si&ecirc;u sang, đường n&eacute;t đầy tinh xảo c&ugrave;ng &yacute; nghĩa tuyệt vời. Ogival Skeleton ph&ugrave; hợp để đồng h&agrave;nh c&ugrave;ng c&aacute;c doanh nh&acirc;n trong những buổi gặp gỡ đối t&aacute;c, những buổi k&yacute; hợp đồng quan trọng.&nbsp;&nbsp;</p>

<p dir="ltr" style="text-align:justify">H&atilde;y chi&ecirc;m ngưỡng đồng hồ Ogival Skeleton ngay dưới đ&acirc;y v&agrave; đừng ngần ngại lựa chọn ch&acirc;n d&agrave;i sexy n&agrave;y về b&ecirc;n m&igrave;nh.&nbsp;</p>

<p style="text-align:center"><img alt="Ogival Bát Mã Truy Phong" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-ogival-bat-ma2.jpg" style="height:600px; width:600px" /></p>

<p dir="ltr" style="text-align:center">Ogival B&aacute;t M&atilde; Truy Phong - Tuyệt t&aacute;c giới hạn 999 chiếc&nbsp;</p>

<p style="text-align:center"><img alt="Đồng hồ Ogival Độc Long" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-ogival-doc-long.jpg" style="height:533px; width:800px" /></p>

<p dir="ltr" style="text-align:center">Ogival Độc Long Rồng V&agrave;ng nhả ngọc, biểu tượng của uy quyền bậc đế vương</p>

<p style="text-align:center"><img alt="Đồng hồ Ogival Cá Nhảy May Mắn" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-ogival-ca-nhay.jpg" style="height:533px; width:800px" /></p>

<p dir="ltr" style="text-align:center">Ogival C&aacute; Nhảy may mắn mang đến phước l&agrave;nh v&agrave; t&igrave;nh y&ecirc;u</p>

<p style="text-align:center"><img alt="Ogival Lưỡng Long Chầu Nguyệt" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-ogival-luong-long-chau-nguyet.jpg" style="height:533px; width:800px" /></p>

<p dir="ltr" style="text-align:center">Ogival Lưỡng Long Chầu Nguyệt phi&ecirc;n bản LIMITED - đẳng cấp Thụy Sĩ&nbsp;</p>

<h3 dir="ltr" style="text-align:justify">2/ Đồng Hồ &ldquo;Biến Dạng&rdquo; Độc Lạ - Crash Skeleton Cho Tay Chơi Th&iacute;ch &ldquo;Của Lạ&rdquo;!</h3>

<p dir="ltr" style="text-align:justify">Lấy cảm hứng từ một vụ tai nạn bốc ch&aacute;y xe hơi, Cartier tung ra mẫu thiết kế Crash độc bản với mặt đồng hồ m&eacute;o m&oacute; lập dị nhưng v&ocirc; c&ugrave;ng sang trọng. Kế thừa trọn vẹn tinh hoa của d&ograve;ng đồng hồ &ldquo;Crash&rdquo;,&nbsp; phi&ecirc;n bản Crash Skeleton ra đời như biểu tượng về kỹ thuật chế t&aacute;c đồng hồ phức tạp của Cartier.</p>

<p style="text-align:center"><img alt="Đồng Hồ Cartier Crash Skeleton" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-cartier.jpg" style="height:534px; width:800px" /></p>

<p dir="ltr" style="text-align:justify"><strong>a/&nbsp; Bắt đầu từ 1 vụ ch&aacute;y nổ xe hơi thảm khốc&hellip;.</strong></p>

<p dir="ltr" style="text-align:justify">Chuyện kể rằng, năm 1960 vị ph&oacute; chủ tịch của Cartier gặp tai nạn xe &ocirc; t&ocirc; v&agrave; đ&atilde; tử nạn v&igrave; xe bốc ch&aacute;y. Chiếc đồng hồ Cartier Baignoire Allong&eacute;e (kiểu d&aacute;ng Oval d&agrave;i) &ocirc;ng đang đeo tr&ecirc;n tay bị biến dạng, tan chảy dưới t&aacute;c động của nhiệt. H&igrave;nh ảnh n&agrave;y gợi nhớ đến những chiếc đồng hồ m&eacute;o m&oacute;, th&uacute; vị trong c&aacute;c bức tranh si&ecirc;u thực của họa sĩ Salvador Dali. Từ đ&oacute;, Cartier cho ra mắt mẫu đồng hồ &ldquo;Crash&rdquo; độc đ&aacute;o v&agrave; hiếm c&oacute; n&agrave;y.</p>

<p dir="ltr" style="text-align:justify">Ban đầu, đồng hồ Cartier Crash được thiết kế chủ yếu d&agrave;nh ri&ecirc;ng cho ph&aacute;i nữ với những mẫu đ&iacute;nh đ&aacute; kim cương, chế t&aacute;c từ v&agrave;ng hồng ngọt ng&agrave;o hoặc v&agrave;ng trắng tinh khiết.</p>

<p dir="ltr" style="text-align:justify">Nhưng đến năm 2015, phi&ecirc;n bản Crash Skeleton với thiết kế trưng diện to&agrave;n bộ phần m&aacute;y b&ecirc;n trong d&agrave;nh ri&ecirc;ng cho c&aacute;nh nam giới được ra mắt c&ocirc;ng ch&uacute;ng.</p>

<p dir="ltr" style="text-align:justify"><strong>b/ Giải m&atilde; chiếc đồng hồ &ldquo;biến dạng&rdquo; Crash Skeleton d&agrave;nh cho ph&aacute;i mạnh</strong></p>

<p dir="ltr" style="text-align:justify">Chiếc đồng hồ Crash Skeleton g&acirc;y ấn tượng với thiết kế lộ m&aacute;y v&agrave; h&igrave;nh dạng &ldquo;tan chảy&rdquo; kỳ dị của n&oacute;. Xuy&ecirc;n qua lớp khung giữ m&aacute;y, người đeo c&oacute; thể dễ d&agrave;ng quan s&aacute;t bộ m&aacute;y hoạt động Calibre 9618 MC l&ecirc;n d&acirc;y c&oacute;t bằng tay.</p>

<p dir="ltr" style="text-align:justify">Chiếc đồng hồ c&oacute; 1-0-2&nbsp; n&agrave;y được lắp r&aacute;p từ 138 chi tiết với 28.800 dao động/giờ v&agrave; khả năng dự trữ năng lượng l&ecirc;n đến 72 giờ.</p>

<p style="text-align:center"><img alt="Đồng hồ Crash Skeleton Cartier" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-Cartier-Crash.jpg" style="height:524px; width:800px" /></p>

<p dir="ltr" style="text-align:justify">To&agrave;n bộ phần vỏ m&aacute;y đồng hồ Crash Skeleton đều được l&agrave;m bằng chất liệu Bạch kim kết hợp với d&acirc;y đeo da c&aacute; sấu m&agrave;u đen thanh lịch. Ở vị tr&iacute; cạnh sườn l&agrave; chi tiết n&uacute;m vặn được chế t&aacute;c từ đ&aacute; Sapphire Cabochon m&agrave;u xanh nước biển đậm. Phủ b&ecirc;n tr&ecirc;n bề mặt của đồng hồ Crash Skeleton l&agrave; lớp vật liệu kho&aacute;ng chất c&oacute; khả năng chống xước ho&agrave;n hảo.</p>

<p style="text-align:center"><img alt="Đồng hồ Crash Skeleton Cartier giá 78.500 USD" src="https://xwatch.vn/upload_images/images/2020/06/01/dong-ho-skeleton-Cartier-Crash2.jpg" style="height:500px; width:652px" /></p>

<p dir="ltr" style="text-align:justify">Gi&aacute; cho mỗi chiếc đồng hồ Crash Skeleton của h&atilde;ng Cartier l&agrave; 78.500 USD (tương đương 1,8 tỷ đồng).</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1022, N'longnt', N'longnt', CAST(N'2021-09-15' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/do-chong-nuoc-cua-dong-ho.jpg', N'Ý NGHĨA ĐỘ CHỊU NƯỚC WATER RESISTANT ATM LÀ GÌ?', N'<p style="text-align:justify">Water Resistant, Water Resist hay WR l&agrave; một trong những thuật ngữ phổ biến nhất trong Thế giới đồng hồ. Ch&uacute;ng lu&ocirc;n k&egrave;m theo chỉ số mang đơn vị ATM (hoặc Bar, M, Ft) được in tr&ecirc;n mặt số, nắp lưng đồng hồ.</p>

<p style="text-align:justify">Vậy những d&ograve;ng chữ 5 ATM Water Resistant, 200M, 3 ATM l&agrave; g&igrave; v&agrave; ch&uacute;ng c&oacute; &yacute; nghĩa như thế n&agrave;o? H&atilde;y đặc biệt quan t&acirc;m đến vấn đề n&agrave;y bởi n&oacute; quyết định sự sống c&ograve;n của chiếc đồng hồ bạn đeo tr&ecirc;n tay.</p>

<h2 style="text-align:justify"><strong>1.Thuật ngữ Water Resistant</strong></h2>

<p style="text-align:justify">Water Resistant/Water Resist theo nghĩa tiếng Việt l&agrave; &ldquo;c&oacute; sức chịu nước&rdquo; hay &ldquo;c&oacute; sức chống nước&rdquo;. Đ&uacute;ng theo nghĩa đ&oacute;, trong ng&agrave;nh c&ocirc;ng nghiệp chế t&aacute;c đồng hồ, Water Resistant được d&ugrave;ng để chỉ khả năng chống nước của đồng hồ.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/water-resistant-atm.jpg" style="height:347px; width:615px" /></p>

<p style="text-align:justify">V&agrave;o những năm 60, người ta tranh c&atilde;i về việc sử dụng từ Water Proof hay Water Resistant. Tuy nhi&ecirc;n Water Proof mang nghĩa &ldquo;kh&ocirc;ng thấm nước&rdquo;, rất dễ g&acirc;y hiểu nhầm cho người sử dụng rằng đồng hồ kh&ocirc;ng thể thấm nước trong bất kỳ &nbsp;trường hợp n&agrave;o. M&agrave; thực tế, trong những điều kiện c&aacute; biệt, mọi thứ đều c&oacute; thể bị r&ograve; rỉ.</p>

<p style="text-align:justify">V&igrave; vậy Water Resistant được Ủy ban Thương mại li&ecirc;n bang Hoa Kỳ đ&atilde; thống nhất sử dụng để biểu thị khả năng chống nước của đồng hồ.</p>

<h2 style="text-align:justify"><strong>2. &Yacute; nghĩa của những con số mang đơn vị ATM</strong></h2>

<p style="text-align:justify">ATM l&agrave; chữ viết tắt của đơn vị &aacute;p suất atmosphere. Trong đồng hồ, n&oacute; thể hiện mức độ chống nước của đồng hồ. Số ATM ch&iacute;nh l&agrave; &aacute;p suất của cột nước m&agrave; đồng hồ c&oacute; thể chịu đựng được.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/water-resistant-atm-2.jpg" style="height:391px; width:604px" /></p>

<p style="text-align:center"><strong><em>D&ograve;ng chữ &ldquo;3AMT WR&rdquo; biểu thị độ chống nước</em></strong></p>

<p style="text-align:justify">Bar, Ft (feet) hoặc M (meter) cũng thường được sử dụng để thể hiện mức chịu nước của đồng hồ. Bar l&agrave; đơn vị &aacute;p suất giống ATM. Ft v&agrave; M l&agrave; đơn vị đo độ d&agrave;i. Số Ft hoặc số M chỉ độ d&agrave;i cột nước c&oacute; &aacute;p suất m&agrave; đồng hồ c&oacute; thể chịu được.</p>

<p style="text-align:justify">1 ATM = 1 Bar = 10 M = 33 Ft</p>

<p style="text-align:justify">T&ugrave;y theo từng quốc gia hay nh&agrave; sản xuất m&agrave; đồng hồ sử dụng c&aacute;c đơn vị đo kh&aacute;c nhau.</p>

<h2 style="text-align:justify"><strong>3. C&aacute;c độ chịu nước của đồng hồ thường gặp</strong></h2>

<p style="text-align:justify">Bao gồm c&aacute;c mức: 1 ATM, 3 ATM, 5 ATM, 10 ATM, 20 ATM. &Yacute; nghĩa của những độ chịu nước lần lượt như sau:</p>

<ul>
	<li style="text-align: justify;">Độ chịu nước 1 ATM: chống v&agrave;o nước th&ocirc;ng thường, c&oacute; thể sử dụng trong trường hợp rửa tay, đi mưa.</li>
	<li style="text-align: justify;">Độ chịu nước 3 ATM: người d&ugrave;ng c&oacute; thể rửa tay, đi mưa, rửa xe.</li>
	<li style="text-align: justify;">Độ chịu nước 5 ATM: c&oacute; thể rửa tay, đi mưa, rửa xe, đi tắm.</li>
	<li style="text-align: justify;">Độ chịu nước 10 ATM: sử dụng c&aacute;c trường hợp th&ocirc;ng thường, đ&atilde; c&oacute; thể bơi bội, lặn v&ugrave;ng s&ocirc;ng nước, kh&ocirc;ng sử dụng khi chơi thể thao mạnh dưới nước.</li>
	<li style="text-align: justify;">Độ chịu nước 20 ATM: đ&atilde; c&oacute; thể lặn s&ocirc;ng nước, bơi ở biển, chơi thể thao dưới nước, nhưng chưa thể lặn biển.</li>
	<li style="text-align: justify;">Loại Diver&rsquo;s watch 200 M: đồng hồ lặn biển chuy&ecirc;n dụng, sử dụng trong mọi trường hợp.</li>
</ul>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/07/water-resistant-atm-3.jpg" style="height:418px; width:603px" /></p>

<p style="text-align:justify">Như vậy, bạn đ&atilde; c&oacute; thể hiểu được cơ bản về độ chống nước, &yacute; nghĩa c&aacute;c chỉ số M, Bar, Ft, ATM l&agrave; g&igrave;,...hay những thắc mắc thường ng&agrave;y như độ chịu nước 3 atm l&agrave; g&igrave;, độ chịu nước 5 atm l&agrave; g&igrave;, 10 atm l&agrave; g&igrave;, v.v.. để sử dụng v&agrave; bảo vệ chiếc đồng hồ trong những trường hợp tiếp x&uacute;c với nước.</p>

<p style="text-align:justify">Nếu đang c&oacute; &yacute; định mua đồng hồ, h&atilde;y chọn cho m&igrave;nh chiếc đồng hồ c&oacute; độ chịu nước ph&ugrave; hợp nhất với nhu cầu của bản th&acirc;n tại những hệ thống ph&acirc;n phối đồng hồ ch&iacute;nh h&atilde;ng đ&aacute;ng tin cậy nh&eacute;!</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1023, N'longnt', N'longnt', CAST(N'2021-09-15' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/dong-ho-ma-vang.jpg', N'LỚP MẠ TRONG ĐỒNG HỒ', N'<p style="text-align:justify">Để mạ c&aacute;c chi tiết đồng hồ như vỏ, d&acirc;y, v&agrave;nh v&agrave; c&aacute;c chi tiết kh&aacute;c, người ta d&ugrave;ng nhiều c&ocirc;ng nghệ mạ kh&aacute;c nhau.</p>

<p style="text-align:justify">Để mạ c&aacute;c chi tiết đồng hồ như vỏ, d&acirc;y, v&agrave;nh v&agrave; c&aacute;c chi tiết kh&aacute;c, người ta d&ugrave;ng nhiều c&ocirc;ng nghệ mạ kh&aacute;c nhau. Mỗi c&ocirc;ng nghệ cho đồng hồ một vẻ đẹp v&agrave; độ bền kh&aacute;c nhau. Dưới đ&acirc;y l&agrave; những c&ocirc;ng nghệ mạ được phổ biến hiện nay:</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/cong-nghe-ma-dong-ho-min.jpg" style="height:422px; width:700px" /></p>

<p style="text-align:justify">-&nbsp;<strong><em>PVD&nbsp;</em></strong>(Physical Vapour Depostion &ndash; Mạ lắng hơi Tự nhi&ecirc;n: Mạ v&agrave; để kh&ocirc; tự nhi&ecirc;n): Đ&acirc;y l&agrave; c&ocirc;ng nghệ mạ hiện đại nhất hiện nay, cho đồng hồ c&oacute; lớp mạ bền v&agrave; đẹp. C&aacute;c loại đồng hồ cao cấp thường mạ theo c&ocirc;ng nghệ n&agrave;y. Với c&ocirc;ng nghệ n&agrave;y độ bền khoảng từ 4-5 năm nếu d&ugrave;ng giữ g&igrave;n.</p>

<p style="text-align:justify">-&nbsp;<strong><em>MGP</em></strong>&nbsp;( Multi Gold Planting - Mạ v&agrave;ng nhiều lớp)</p>

<p style="text-align:justify">-&nbsp;<strong><em>CVD</em></strong>&nbsp;( Chemical Vapour Deposition - Mạ lắng hơi ho&aacute; chất: Mạ xong l&agrave;m kh&ocirc; theo ho&aacute; chất)</p>

<p style="text-align:justify">-&nbsp;<strong><em>IP</em></strong>&nbsp;( Ion plating - Mạ Ion): Điện t&iacute;ch&nbsp;<em>(-)</em>&nbsp;hay&nbsp;<em>(+)</em>&nbsp;ho&agrave; v&agrave;o kết cấu mạng tinh thể kim loại tạo nước mạ thấm s&acirc;u v&agrave; kh&oacute; ph&acirc;n r&atilde;, theo nghĩa đơn giản l&agrave; mạ điện t&iacute;ch).</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/cong-nghe-ma-dong-ho-1-min.jpg" style="height:467px; width:700px" /></p>

<p style="text-align:justify"><strong><em>Ch&uacute; &yacute;</em></strong>: Đối với c&aacute;c đồng hồ d&ugrave;ng c&ocirc;ng nghệ mạ, kể cả l&agrave; tốt đi chăng nữa, cũng n&ecirc;n d&ugrave;ng giữ g&igrave;n. Tr&aacute;nh tiếp x&uacute;c với c&aacute;c h&oacute;a chất tẩy rửa như x&agrave; ph&ograve;ng, nước rửa...Như vậy th&igrave; m&agrave;u mạ sẽ lu&ocirc;n s&aacute;ng v&agrave; bền m&agrave;u.</p>

<p style="text-align:justify">Bạn đ&atilde; hiểu hơn về c&ocirc;ng nghệ mạ đồng hồ?</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1024, N'longnt', N'longnt', CAST(N'2021-09-15' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/tourbillon.jpg', N'TOURBILLON LÀ GÌ TRONG CHẾ TÁC ĐỒNG HỒ?', N'<p style="text-align:justify">&Yacute; tưởng về chiếc Tourbillon đầu ti&ecirc;n ra đời từ thế kỉ XVIII thuộc về 2 vĩ nh&acirc;n của l&agrave;ng chế t&aacute;c đồng hồ.</p>

<p style="text-align:justify">Tính năng&nbsp;<strong>Tourbillon&nbsp;</strong>(theo tiếng Ph&aacute;p nghĩa l&agrave; lốc xo&aacute;y)</p>

<p style="text-align:justify">&Yacute; tưởng về chiếc Tourbillon đầu ti&ecirc;n ra đời từ thế kỉ XVIII thuộc về 2 vĩ nh&acirc;n của l&agrave;ng chế t&aacute;c đồng hồ: John Arnold v&agrave; Abraham Louis Breguet.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/333-e1484214989694.jpg" style="height:460px; width:700px" /></p>

<p style="text-align:justify">Đầu thế kỉ XVIII, những chiếc đồng hồ bỏ t&uacute;i l&ecirc;n ng&ocirc;i, đặc biệt trong giới thượng lưu phương T&acirc;y. Ch&iacute;nh khoảng thời gian đ&oacute;, t&iacute;nh ch&iacute;nh x&aacute;c của đồng hồ ng&agrave;y c&agrave;ng trở n&ecirc;n quan trọng trong bối cảnh những cuộc viễn chinh th&aacute;m hiểm thế giới đặt ra một th&aacute;ch thức kh&ocirc;ng nhỏ cho những nh&agrave; l&agrave;m đồng hồ l&uacute;c bấy giờ.</p>

<p style="text-align:justify">Trọng lực c&oacute; 1 t&aacute;c động ti&ecirc;u cực đến hoạt động của đồng hồ quả qu&yacute;t. Nếu bạn đ&atilde; từng nh&igrave;n thấy bộ chuyển động của 1 cỗ m&aacute;y đồng hồ, c&oacute; thể bạn sẽ đọc được d&ograve;ng chữ nhỏ: &ldquo;<em>Adjusted to five positions</em>&rdquo;, &aacute;m chỉ việc cần thiết phải thường xuy&ecirc;n điều chỉnh chiếc đồng hồ bỏ t&uacute;i đến 5 vị tr&iacute; kh&aacute;c nhau (<em>dial up, dial down, crown up, crown down, vertical</em>) để giảm những ảnh hưởng của trọng lực đến độ ch&iacute;nh x&aacute;c của đồng hồ.</p>

<p style="text-align:justify">Chỉ đến năm 1800, hai ng&agrave;y trước đ&ecirc;m Gi&aacute;ng sinh năm ấy, Bộ Nội vụ Ph&aacute;p c&ocirc;ng bố bản quyền s&aacute;ng chế cho cỗ m&aacute;y mang c&aacute;i t&ecirc;n lạ l&ugrave;ng &ldquo;Tourbillon&rdquo; (trong tiếng Ph&aacute;p c&oacute; nghĩa l&agrave; lốc xo&aacute;y) của Abraham Breguet (thời điểm n&agrave;y, người bạn đồng h&agrave;nh của &ocirc;ng, người c&ugrave;ng &ocirc;ng s&aacute;ng tạo ra cỗ m&aacute;y n&agrave;y l&agrave; John Arnold - cha đẻ của h&atilde;ng Arnold &amp; Son đ&atilde; qua đời), mở đầu cho một kỉ nguy&ecirc;n mới của những cỗ m&aacute;y đồng hồ thuộc h&agrave;ng si&ecirc;u phức tạp.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/image-1-compressed-12.jpg" style="height:383px; width:700px" /></p>

<p style="text-align:justify">Chiếc&nbsp;<strong>Tourbillon</strong>&nbsp;thời bấy giờ hoạt động dựa tr&ecirc;n sự quay đều đặn quanh một trục cố định. Cỗ m&aacute;y bao gồm chiếc lồng, đặt b&ecirc;n trong l&agrave; ch&iacute;nh bộ c&acirc;n bằng của đồng hồ, nhờ đ&oacute; li&ecirc;n tục đặt động cơ của đồng hồ v&agrave;o những bị tr&iacute; kh&aacute;c nhau, tạo sự c&acirc;n bằng dựa tr&ecirc;n nguy&ecirc;n l&iacute; triệt ti&ecirc;u, h&oacute;a giải tối đa t&aacute;c động của trọng lực.</p>

<p style="text-align:justify">Kh&oacute; để c&oacute; thể m&ocirc; tả 1 c&aacute;ch to&agrave;n diện về cấu tạo của cỗ m&aacute;y phức tạp n&agrave;y, bởi kh&ocirc;ng phải bất cứ nh&agrave; chế t&aacute;c n&agrave;o cũng c&oacute; thể am hiểu trọn vẹn v&agrave; chế tạo được một chiếc&nbsp;<strong>tourbillon</strong>&nbsp;ho&agrave;n chỉnh về h&igrave;nh thức lẫn hoạt động.</p>

<p style="text-align:justify">Theo ghi ch&eacute;p sơ bộ, trong suốt qu&atilde;ng thời gian từ năm 1800 đến 1945, với lực lượng khoảng 250 nghệ nh&acirc;n đồng hồ, chỉ c&oacute; khoảng 600 đến 850 cỗ m&aacute;y tourbillon được sản xuất, đồng nghĩa với việc trung b&igrave;nh mỗi năm l&uacute;c ấy, chỉ c&oacute; 6 chiếc đồng hồ tr&ecirc;n thế giới ra đời với sự c&oacute; mặt của cỗ m&aacute;y phức tạp n&agrave;y.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/image-0-compressed-13.jpg" style="height:401px; width:700px" /></p>

<p style="text-align:justify">Th&aacute;ch thức lớn nhất khi chế tạo tourbillon l&agrave; k&iacute;ch thước qu&aacute; nhỏ của n&oacute;. Do lồng quay trong động cơ tourbillon thu nhận nguồn năng lượng từ l&ograve; xo ch&iacute;nh, chiếc tourbillon cần được thiết kế với k&iacute;ch cỡ tối thiểu để hạn chế phần năng lượng thất tho&aacute;t cho hoạt động ch&iacute;nh của đồng hồ.</p>

<p style="text-align:justify">Ng&agrave;y nay, những kim loại bền, nhẹ được sử dụng để tạo n&ecirc;n những cỗ m&aacute;y tourbillon l&agrave; tổ hợp của 40 đến 90 bộ phận nhưng khối lượng chỉ 0.2 đến 0.6g, v&agrave; k&iacute;ch thước của một chiếc lồng ước t&iacute;nh cũng chỉ khoảng 8mm. Với khoa học kĩ thuật hiện đại, 1 nh&agrave; chế t&aacute;c c&oacute; thể sản xuất được số lượng 20 đến 30 cỗ m&aacute;y đồng hồ chứa tourbillon mỗi năm.</p>

<p style="text-align:justify">Tuy nhi&ecirc;n, để l&agrave;m n&ecirc;n kiệt t&aacute;c&nbsp;<strong>tourbillon</strong>, nh&agrave; chế t&aacute;c c&ograve;n cần c&oacute; trong m&igrave;nh sự tỉ mỉ v&agrave; hiểu biết. Hầu hết những chiếc đồng hồ chứa tourbillon đều nằm trong ph&acirc;n kh&uacute;c của mặt h&agrave;ng xa xỉ. Chiếc đồng hồ bỏ t&uacute;i đầu ti&ecirc;n t&iacute;ch hợp tourbillon được chế t&aacute;c bởi ch&iacute;nh Breguet cho 1 nh&agrave; qu&yacute; tộc người Ba Lan v&agrave;o năm 1809 được b&aacute;n với gi&aacute; l&agrave; 4600 francs Ph&aacute;p, đồng thời, được trong cuộc đấu gi&aacute; đầu thập ni&ecirc;n 90, được b&aacute;n lại ở mức gi&aacute; $750,000. Hiện nay, gi&aacute; th&agrave;nh cho một chiếc đồng hồ&nbsp;<strong>tourbillon</strong>&nbsp;rơi v&agrave;o khoảng $50000 - $90000.</p>

<p style="text-align:justify">Từ năm 1986 đ&atilde; từng c&oacute; nhiều tranh c&atilde;i về c&ocirc;ng dụng của&nbsp;<strong>tourbillon</strong>. Nguy&ecirc;n l&yacute; hoạt động của&nbsp;<strong>tourbillon</strong>&nbsp;g&oacute;p phần đem lại độ ch&iacute;nh x&aacute;c cao cho một chiếc đồng hồ bỏ t&uacute;i, nhưng khi ứng dụng v&agrave;o đồng hồ đeo tay, được lu&acirc;n chuyển li&ecirc;n tục tới mọi vị tr&iacute; c&ugrave;ng người đeo, 1 v&agrave;i người cho rằng việc d&agrave;nh nhiều thời gian, c&ocirc;ng sức v&agrave; của cải cho những cỗ m&aacute;y&nbsp;<strong>tourbillon</strong>&nbsp;l&agrave; kh&ocirc;ng thiết thực.</p>

<p style="text-align:justify">Tuy nhi&ecirc;n, ng&agrave;y nay, chiếc tourbillon đ&atilde; vượt ra khỏi c&ocirc;ng dụng của n&oacute; để l&ecirc;n tầm biểu tượng. Người mua h&agrave;ng c&oacute; thể chỉ mất tới $2000 để c&oacute; được một chiếc đồng hồ chronometer (chứng nhận độ ch&iacute;nh x&aacute;c cao), nhưng họ sẵn s&agrave;ng bỏ ra số tiền lớn hơn gấp 30 lần để săn l&ugrave;ng những chiếc đồng hồ tourbillon, bởi vẻ đẹp thẩm mỹ sống động, 1 dấu ấn về sự cống hiến m&agrave; những nghệ nh&acirc;n đồng hồ đem lại v&agrave; l&agrave; lời cam kết cho độ ch&iacute;nh x&aacute;c.</p>

<p style="text-align:center"><img alt="" src="http://www.xwatch.vn/wp-content/uploads/2016/12/DV_TourbillonBlue_52853442103001_tetiere_large-e1484215331189.jpg" style="height:342px; width:834px" /></p>

<p style="text-align:justify">N&oacute; l&agrave; biểu tượng cho sự tr&acirc;n trọng, ph&aacute;t triển, g&igrave;n giữ tinh hoa của nghệ thuật chế t&aacute;c đồng hồ nh&acirc;n loại trong suốt mấy trăm năm qua. Những gi&aacute; trị ấy đ&atilde; khiến cho tourbillon thực sự l&agrave; 1 cỗ m&aacute;y m&agrave; mỗi c&aacute; nh&acirc;n trong giới đồng hồ trong suốt hai thế kỉ qua v&agrave; tương lai sau n&agrave;y kh&ocirc;ng khỏi ngưỡng mộ.</p>
')
INSERT [dbo].[BaiViet] ([MaBV], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat], [HinhDD], [TenBV], [NoiDung]) VALUES (1025, N'longnt', N'longnt', CAST(N'2021-09-15' AS Date), CAST(N'2021-09-15' AS Date), N'/Assets/Images/BaiViet/dong-ho-kinetic.jpg', N'THẾ NÀO LÀ KINETIC?', N'<p style="text-align:justify">Kinetic l&agrave; c&ocirc;ng nghệ độc quyền của Seiko, biến chuyển động của c&aacute;nh tay th&agrave;nh điện năng để đồng hồ hoạt động.</p>

<p style="text-align:justify">Kinetic l&agrave; c&ocirc;ng nghệ độc quyền của Seiko, biến chuyển động của c&aacute;nh tay (khi đeo đồng hồ) th&agrave;nh điện năng để đồng hồ hoạt động.</p>

<p style="text-align:justify">Tại Basel năm 1986, Seiko giới thiệu nguy&ecirc;n mẫu đầu ti&ecirc;n của m&aacute;y kinetic dưới t&ecirc;n l&agrave;: &quot;<strong>AGM</strong>&quot; - l&agrave; chiếc đồng hồ đầu ti&ecirc;n tr&ecirc;n thế giới chuyển đổi động năng th&agrave;nh điện năng. Đ&acirc;y l&agrave; bước đi đầu ti&ecirc;n trong sự ph&aacute;t triển của m&aacute;y Kinetic. Sau gần 30 năm, từ &quot;Kinetic&quot; đồng nghĩa với sự th&acirc;n thiện với m&ocirc;i trường, hiệu suất cao, v&agrave; tiện lợi l&acirc;u d&agrave;i cho người d&ugrave;ng tr&ecirc;n to&agrave;n thế giới.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/dong-ho-kinetic-min.jpg" style="height:389px; width:700px" /></p>

<p style="text-align:justify">Từ năm 1988 đến nay, hơn 8 triệu chiếc đồng hồ Kinetic đ&atilde; được b&aacute;n cho người ti&ecirc;u d&ugrave;ng tr&ecirc;n to&agrave;n thế giới với những đặc điểm nổi bật sau:</p>

<p style="text-align:justify">&nbsp; &nbsp; &nbsp; + Sự kết hợp 2 trong 1: Độ ch&iacute;nh x&aacute;c như đồng hồ quartz nhưng gần như kh&ocirc;ng phải thay pin - đặc điểm của đồng hồ Automatic.</p>

<p style="text-align:justify">&nbsp; &nbsp; &nbsp; + Một số c&oacute; chức năng tự động chỉnh giờ khi đeo lại sau một thời gian kh&ocirc;ng đeo (đối với đồng hồ Kinetic Perpetual)</p>

<p style="text-align:justify">&nbsp; &nbsp; &nbsp; + C&oacute; chế độ tiết kiệm năng lượng (đối với đồng hồ Kinetic Perpetual)</p>

<p style="text-align:justify">&nbsp; &nbsp; &nbsp; + Th&acirc;n thiện với m&ocirc;i trường</p>

<p style="text-align:justify"><strong>* C&aacute;ch nhận biết:&nbsp;</strong>tr&ecirc;n mặt số c&oacute; in chữ&nbsp;<em><strong>Kinetic</strong></em></p>
')
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
GO
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'SG57514601', 1, CAST(2790000 AS Decimal(18, 0)), CAST(2790000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'SG999934602GLA', 1, CAST(9950000 AS Decimal(18, 0)), CAST(9950000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'SL10564602TE', 1, CAST(1800000 AS Decimal(18, 0)), CAST(1800000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'FAG00004D0', 1, CAST(6900000 AS Decimal(18, 0)), CAST(6900000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'SG20894102RNT', 1, CAST(2900000 AS Decimal(18, 0)), CAST(2900000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'SL66541303', 1, CAST(2950000 AS Decimal(18, 0)), CAST(2950000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'SUN049P2', 2, CAST(9800000 AS Decimal(18, 0)), CAST(19600000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'SG57514601', 2, CAST(2790000 AS Decimal(18, 0)), CAST(5580000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'SG999934602GLA', 2, CAST(9950000 AS Decimal(18, 0)), CAST(19900000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'SL10564602TE', 1, CAST(1800000 AS Decimal(18, 0)), CAST(1800000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([SoDH], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'SL66541303', 1, CAST(2950000 AS Decimal(18, 0)), CAST(2950000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'96A118', 30, CAST(12300000 AS Decimal(18, 0)), CAST(369000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'96A119', 30, CAST(12300000 AS Decimal(18, 0)), CAST(369000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'96S167', 30, CAST(6500000 AS Decimal(18, 0)), CAST(195000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'97P121', 30, CAST(11100000 AS Decimal(18, 0)), CAST(333000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'98A161', 30, CAST(20500000 AS Decimal(18, 0)), CAST(615000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'98A165', 30, CAST(13150000 AS Decimal(18, 0)), CAST(394500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'98B301', 30, CAST(13150000 AS Decimal(18, 0)), CAST(394500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'98M130', 30, CAST(8100000 AS Decimal(18, 0)), CAST(243000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'98S143', 30, CAST(8100000 AS Decimal(18, 0)), CAST(243000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'98W215', 30, CAST(12500000 AS Decimal(18, 0)), CAST(375000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'BL1784-252KBB-S2M-DMK-GL-D-TRAI', 30, CAST(10150000 AS Decimal(18, 0)), CAST(304500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'BL1801-A2WWB-S-DLS-GL-T', 30, CAST(5700000 AS Decimal(18, 0)), CAST(171000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'BL1805-101BKWD-MK-GL-T', 30, CAST(2160000 AS Decimal(18, 0)), CAST(64800000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'BL1806-20MKNN-MK-GL-X', 30, CAST(3610000 AS Decimal(18, 0)), CAST(108300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'BL1806-20MWBI-MS-D', 30, CAST(3620000 AS Decimal(18, 0)), CAST(108600000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'BL1827-101LKCD-DLK-GL-T', 30, CAST(3070000 AS Decimal(18, 0)), CAST(92100000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'BL1831-25MTWI-AMSK-T', 30, CAST(6180000 AS Decimal(18, 0)), CAST(185400000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'BL1853-10LTCA-R-LSR-T', 30, CAST(3480000 AS Decimal(18, 0)), CAST(104400000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (1, N'BL1856-102LWDI-LW-N', 30, CAST(2310000 AS Decimal(18, 0)), CAST(69300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'FAC07002W0', 30, CAST(6500000 AS Decimal(18, 0)), CAST(195000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'FAG00004D0', 30, CAST(6500000 AS Decimal(18, 0)), CAST(195000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'FAG03001D0', 30, CAST(7390000 AS Decimal(18, 0)), CAST(221700000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'FETAF004W0', 30, CAST(5090000 AS Decimal(18, 0)), CAST(152700000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'FSW02003D0', 30, CAST(5390000 AS Decimal(18, 0)), CAST(161700000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'FUNG2004F0', 30, CAST(2600000 AS Decimal(18, 0)), CAST(78000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'KB0003S10B', 30, CAST(6300000 AS Decimal(18, 0)), CAST(189000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'RA-AG0017Y10B', 30, CAST(6940000 AS Decimal(18, 0)), CAST(208200000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (2, N'SER0200JB', 30, CAST(14000000 AS Decimal(18, 0)), CAST(420000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'BE9170-56A', 30, CAST(3350000 AS Decimal(18, 0)), CAST(100500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'CA0346-59L', 30, CAST(12600000 AS Decimal(18, 0)), CAST(378000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'CA4330-81L', 30, CAST(6650000 AS Decimal(18, 0)), CAST(199500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'ER0201-72A', 30, CAST(3400000 AS Decimal(18, 0)), CAST(102000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'EW1582-54A', 30, CAST(5770000 AS Decimal(18, 0)), CAST(173100000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'EX1420-84E', 30, CAST(6250000 AS Decimal(18, 0)), CAST(187500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'EX1480-15D', 30, CAST(5400000 AS Decimal(18, 0)), CAST(162000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'FC8008-88D', 30, CAST(10850000 AS Decimal(18, 0)), CAST(325500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'NH8363-14H', 30, CAST(5380000 AS Decimal(18, 0)), CAST(161400000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (3, N'NY0040-09E', 30, CAST(6350000 AS Decimal(18, 0)), CAST(190500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'E096-L367-K1', 30, CAST(5250000 AS Decimal(18, 0)), CAST(157500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'E109-L441', 30, CAST(6490000 AS Decimal(18, 0)), CAST(194700000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'E126-L521-K1', 30, CAST(5910000 AS Decimal(18, 0)), CAST(177300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'E128-L533', 30, CAST(5300000 AS Decimal(18, 0)), CAST(159000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'E129-L539', 30, CAST(5300000 AS Decimal(18, 0)), CAST(159000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'F1108502', 30, CAST(1500000 AS Decimal(18, 0)), CAST(45000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'F167483', 30, CAST(2810000 AS Decimal(18, 0)), CAST(84300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'F200054', 30, CAST(3900000 AS Decimal(18, 0)), CAST(117000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'F200092', 30, CAST(3700000 AS Decimal(18, 0)), CAST(111000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'F202543', 30, CAST(4200000 AS Decimal(18, 0)), CAST(126000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'F202762', 30, CAST(3800000 AS Decimal(18, 0)), CAST(114000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'F203584', 30, CAST(2640000 AS Decimal(18, 0)), CAST(79200000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'F203901', 30, CAST(3000000 AS Decimal(18, 0)), CAST(90000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (4, N'F68473', 30, CAST(6910000 AS Decimal(18, 0)), CAST(207300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (5, N'F1108601', 30, CAST(1500000 AS Decimal(18, 0)), CAST(45000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (5, N'F7102805', 30, CAST(2770000 AS Decimal(18, 0)), CAST(83100000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (5, N'F7106203', 30, CAST(2770000 AS Decimal(18, 0)), CAST(83100000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (5, N'FL1100572', 30, CAST(1960000 AS Decimal(18, 0)), CAST(58800000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (5, N'OG1929-24AGK-T', 30, CAST(16260000 AS Decimal(18, 0)), CAST(487800000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (5, N'OG1930LSR-D', 30, CAST(7800000 AS Decimal(18, 0)), CAST(234000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (5, N'OG30399DLK-V', 30, CAST(32350000 AS Decimal(18, 0)), CAST(970500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (5, N'OG385-032LSK-T', 30, CAST(8460000 AS Decimal(18, 0)), CAST(253800000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (5, N'OG3862DLK-T', 30, CAST(14580000 AS Decimal(18, 0)), CAST(437400000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (5, N'OG829-65AGSK-T', 30, CAST(27530000 AS Decimal(18, 0)), CAST(825900000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (6, N'OP130-03LK-GL-T', 30, CAST(1910000 AS Decimal(18, 0)), CAST(57300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (6, N'OP130-07MK-GL-T', 30, CAST(2090000 AS Decimal(18, 0)), CAST(62700000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (6, N'OP68322DSK-T', 30, CAST(3760000 AS Decimal(18, 0)), CAST(112800000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (6, N'OP990-133AMSK-T', 30, CAST(5000000 AS Decimal(18, 0)), CAST(150000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (6, N'OP990-45ADDGS-GL-T', 30, CAST(7890000 AS Decimal(18, 0)), CAST(236700000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (6, N'OP9908-88AGSK-GL-T', 30, CAST(8090000 AS Decimal(18, 0)), CAST(242700000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (6, N'OPA580501LS-GL-T', 30, CAST(3450000 AS Decimal(18, 0)), CAST(103500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (6, N'OPA58082LSK-T', 30, CAST(3980000 AS Decimal(18, 0)), CAST(119400000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SG20894102RNT', 30, CAST(2840000 AS Decimal(18, 0)), CAST(85200000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SG57514601', 30, CAST(2740000 AS Decimal(18, 0)), CAST(82200000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SG58714601', 30, CAST(2890000 AS Decimal(18, 0)), CAST(86700000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SG999934602GLA', 30, CAST(9090000 AS Decimal(18, 0)), CAST(272700000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SKA691P1', 30, CAST(6040000 AS Decimal(18, 0)), CAST(181200000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SKA745P1', 30, CAST(6730000 AS Decimal(18, 0)), CAST(201900000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SKA878P1', 30, CAST(11680000 AS Decimal(18, 0)), CAST(350400000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SL10564102TE', 30, CAST(1550000 AS Decimal(18, 0)), CAST(46500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SL10564602TE', 30, CAST(1740000 AS Decimal(18, 0)), CAST(52200000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SL10721102TE', 30, CAST(1600000 AS Decimal(18, 0)), CAST(48000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SL66541303', 30, CAST(2890000 AS Decimal(18, 0)), CAST(86700000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SNK805K2', 30, CAST(2940000 AS Decimal(18, 0)), CAST(88200000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SRW821P1', 30, CAST(6500000 AS Decimal(18, 0)), CAST(195000000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SSA794J1', 30, CAST(12830000 AS Decimal(18, 0)), CAST(384900000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SSC483P1', 30, CAST(12070000 AS Decimal(18, 0)), CAST(362100000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SUN049P2', 30, CAST(9150000 AS Decimal(18, 0)), CAST(274500000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SUT275P1', 30, CAST(7020000 AS Decimal(18, 0)), CAST(210600000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuNhap] ([SoPN], [MaDH], [SoLuong], [GiaTien], [ThanhTien]) VALUES (7, N'SUT300J1', 30, CAST(12760000 AS Decimal(18, 0)), CAST(382800000 AS Decimal(18, 0)))
GO
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'96A118', 2, N'Hoa Kỳ', N'Automatic', N'42 mm', NULL, N'Thép không gỉ', N'Thép không gỉ', N'Kính cứng', N'30 m', NULL, 1, N'/Assets/Images/DongHo/96a118.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Bulova 96A118" src="https://xwatch.vn/upload_images/images/2020/05/18/dong-ho-bulova-96A118.jpg" style="height:850px; width:850px" /></p>
', CAST(13300000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'96A119', 2, N'Hoa Kỳ', N'Automatic', N'42 mm', NULL, N'Thép không gỉ', N'Thép không gỉ', N'Kính cứng', N'30 m', N'<p>Đồng hồ 24h, Open heart</p>
', 1, N'/Assets/Images/DongHo/bulova-96a119_1562217342.jpg', 30, N'<p style="text-align:center"><img alt="ĐỒNG HỒ BULOVA 96A119" src="https://xwatch.vn/upload_images/images/2020/05/18/dong-ho-bulova-96A119.jpg" style="height:853px; width:1000px" /></p>
', CAST(13300000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'96S167', 2, N'Hoa Kỳ', N'Quartz', N'24 mm', NULL, N'Thép không gỉ', N'Thép không gỉ', N'Kính cứng', N'30 m', NULL, 0, N'/Assets/Images/DongHo/96s167.jpg', 30, NULL, CAST(7300000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'97P121', 2, N'Hoa Kỳ', N'Automatic', N'34 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính cứng', N'30 m', NULL, 0, N'/Assets/Images/DongHo/97p121.jpg', 30, NULL, CAST(12000000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'98A161', 2, N'Hoa Kỳ', N'Quartz', N'44 mm', NULL, N'Thép không gỉ', N'Dây cao su', N'Kính Sapphire', N'30 m', NULL, 1, N'/Assets/Images/DongHo/98a161-1-1.jpg', 30, NULL, CAST(21700000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'98A165', 2, N'Hoa Kỳ', N'Automatic', N'45 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính cứng', N'100 m', NULL, 1, N'/Assets/Images/DongHo/98a165-1-1.jpg', 30, NULL, CAST(13900000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'98B301', 2, N'Hoa Kỳ', N'Quartz', N'43 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính cứng', N'100 m', NULL, 1, N'/Assets/Images/DongHo/98B301.jpg', 30, NULL, CAST(13900000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'98M130', 2, N'Hoa Kỳ', N'Quartz', N'35 mm', NULL, N'Thép không gỉ', N'Thép không gỉ', N'Kính cứng', N'30 m', NULL, 0, N'/Assets/Images/DongHo/98m130-1.jpg', 30, NULL, CAST(8500000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'98S143', 2, N'Hoa Kỳ', N'Quartz', N'26 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'30 m', NULL, 0, N'/Assets/Images/DongHo/98s143.jpg', 30, NULL, CAST(8500000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'98W215', 2, N'Hoa Kỳ', N'Quartz', N'30 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'30 m', NULL, 0, N'/Assets/Images/DongHo/98w215.jpg', 30, NULL, CAST(13300000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'BE9170-56A', 3, N'Nhật Bản', N'Quartz', N'39 mm', N'9 mm', N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính cứng', N'50 m', NULL, 1, N'/Assets/Images/DongHo/citizen-be9170-56a_1621845941.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu đồng hồ Citizen" src="https://xwatch.vn/upload_images/images/2021/06/17/citizen-BM7330-67L-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước đồng hồ Citizen" src="https://xwatch.vn/upload_images/images/2021/06/17/citizen-BM7330-67L-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(8).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen BE9170-56A" src="https://xwatch.vn/upload_images/images/2021/06/19/dong-ho-citizen-BE9170-56A-(12).jpg" style="width:1200px" /></p>
', CAST(3700000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'BL1784-252KBB-S2M-DMK-GL-D-TRAI', 1, N'Đức', N'Automatic', N'43 mm', N'13.5 mm', N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire chống lóa', N'50m', N'<p>Hiển thị 24h</p>
', 1, N'/Assets/Images/DongHo/bl1784-252kbb-s2m-dmk-gl-d-trai_1581665316.jpg', 30, NULL, CAST(10950000 AS Decimal(18, 0)), 5, N'2 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'BL1801-A2WWB-S-DLS-GL-T', 1, N'Đức', N'Quartz', N'30 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính Sapphire', N'30 m', N'<p>Lịch ng&agrave;y</p>
', 0, N'/Assets/Images/DongHo/bently-bl1801-a2wwb-s-dls-gl-t_1568629192.jpg', 30, NULL, CAST(6000000 AS Decimal(18, 0)), 5, N'2 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'BL1805-101BKWD-MK-GL-T', 1, N'Đức', N'Quartz', N'38 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire', N'30 m', N'<p>Lịch ng&agrave;y</p>
', 1, N'/Assets/Images/DongHo/bl1805-101bkwd-mk-gl-t-avatar_1620788406.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu đồng hồ Bentley" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1784-152WCB-MS-GL-T-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước đồng hồ Bentley" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1784-152WCB-MS-GL-T-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(8).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(12).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(13).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1805-101BKWD-MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1805-101BKWD-MK-GL-T-(14).jpg" style="width:1200px" /></p>
', CAST(2360000 AS Decimal(18, 0)), 5, N'2 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'BL1806-20MKNN-MK-GL-X', 1, N'Đức', N'Quartz', N'40 mm', N'9mm', N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire', N'50 m', N'<p>Lịch ng&agrave;y, thứ, th&aacute;ng, lịch tuần trăng</p>
', 1, N'/Assets/Images/DongHo/bentley-bl1806-20mknn-mk-gl-x_1587350867.jpg', 30, NULL, CAST(3830000 AS Decimal(18, 0)), 5, N'2 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'BL1806-20MWBI-MS-D', 1, N'Đức', N'Quartz', N'40 mm', N'9 mm', N'Thép không gỉ 316L', N'Thép không gỉ', N'Kính Sapphire', N'50 m', N'<p>Lịch ng&agrave;y, lịch thứ, lịch th&aacute;ng, lịch tuần trăng</p>
', 1, N'/Assets/Images/DongHo/bentley-bl1806-20mwbi-ms-d_1587353353.jpg', 30, NULL, CAST(3820000 AS Decimal(18, 0)), 5, N'2 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'BL1827-101LKCD-DLK-GL-T', 1, N'Đức', N'Quartz', N'33 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire', N'30 m', N'<p>Lịch ng&agrave;y</p>
', 0, N'/Assets/Images/DongHo/bently-bl1827-101lkcd-dlk-gl-t_1568687482.jpg', 30, NULL, CAST(3270000 AS Decimal(18, 0)), 5, N'2 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'BL1831-25MTWI-AMSK-T', 1, N'Đức', N'Automatic', N'40 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ', N'Kính Sapphire', N'50 m', NULL, 1, N'/Assets/Images/DongHo/bl1831-25mtwi-amsk-t-avatar_1620789814.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu đồng hồ Bentley" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1784-152WCB-MS-GL-T-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước đồng hồ Bentley" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1784-152WCB-MS-GL-T-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(8).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Bentley BL1831-25MTWI-AMSK-T" src="https://xwatch.vn/upload_images/images/2021/06/23/bentley-BL1831-25MTWI-AMSK-T-(12).jpg" style="width:1200px" /></p>
', CAST(6410000 AS Decimal(18, 0)), 5, N'2 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'BL1853-10LTCA-R-LSR-T', 1, N'Đức', N'Quartz', N'32 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ', N'Kính Sapphire', N'30 m', N'<p>Lịch ng&agrave;y</p>
', 0, N'/Assets/Images/DongHo/bently-bl1853-10ltca-r-lsr-t_1568694584.jpg', 30, NULL, CAST(3680000 AS Decimal(18, 0)), 5, N'2 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'BL1856-102LWDI-LW-N', 1, N'Đức', N'Quartz', N'28 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ', N'Kính Sapphire', N'30 m', NULL, 0, N'/Assets/Images/DongHo/bently-bl1856-102lwdi-lw-n_1568703262.jpg', 30, NULL, CAST(2410000 AS Decimal(18, 0)), 5, N'2 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'CA0346-59L', 3, N'Nhật Bản', N'Eco-Drive', N'43 mm', NULL, N'Titanium', N'Titanium', N'Kính Sapphire', N'100 m', N'<p>Lịch ng&agrave;y. Chronograph</p>
', 1, N'/Assets/Images/DongHo/avatar_ca0346-59l.png', 30, NULL, CAST(13500000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'CA4330-81L', 3, N'Nhật Bản', N'Eco-Drive', N'44,8mm', NULL, N'Thép không gỉ', N'Thép không gỉ', N'Kính cứng chịu lực', N'100M', NULL, 1, N'/Assets/Images/DongHo/citizen-ca4330-81l_1562169287.jpg', 30, NULL, CAST(7200000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'E096-L367-K1', 4, N'Ba Lan', N'Quartz', N'38 mm', NULL, N'Thép không gỉ', N'Dây da', N'Kính cứng', N'30 m', NULL, 0, N'/Assets/Images/DongHo/E096-L367-K1.jpg', 30, NULL, CAST(5650000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'E109-L441', 4, N'Ba Lan', N'Quartz', N'36 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính cứng', N'30 m', N'<p>Chronograph</p>
', 0, N'/Assets/Images/DongHo/dong-ho-elixa-e109-l441_1577951411.jpg', 30, NULL, CAST(6990000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'E126-L521-K1', 4, N'Ba Lan', N'Quartz', N'36 m', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính cứng', N'30 m', NULL, 0, N'/Assets/Images/DongHo/e126-l521-k1-ava.jpg', 30, N'<h1 style="text-align:justify">Đồng hồ Elixa E126-L521-K1: Mạnh mẽ v&agrave; mềm mại!</h1>

<p style="text-align:justify">Trong suốt d&ograve;ng chảy lịch sử của thương hiệu, mặc cho ng&agrave;nh chế t&aacute;c đồng hồ thay đổ ch&oacute;ng mặt thế n&agrave;o, khốc liệt ra sao? th&igrave; Elixa vẫn vẫn giữ đ&uacute;ng tinh thần nghệ thuật t&ocirc;n vinh vẻ đẹp thuần khiết, vẻ đẹp năng động, mạnh mẽ v&agrave; hiện đại của người phụ nữ.</p>

<p style="text-align:center"><img alt="Elixa E126-L521-K1" src="https://elixa.vn/wp-content/uploads/2018/08/img_prod5984_1_o.jpg" style="height:1024px; width:1280px" /></p>

<p style="text-align:justify">Sẽ kh&ocirc;ng qu&aacute; khi n&oacute;i rằng, nh&agrave; Elixa chưa một lần ngừng lại khả năng s&aacute;ng tạo v&agrave; kh&aacute;m ph&aacute; biến mọi sự vật trong đời sống th&agrave;nh niềm cảm hứng s&aacute;ng tạo để khơi gợi mọi vẻ đẹp, để tạo ra điều tuyệt vời nhất cho phụ nữ. V&agrave; bản th&acirc;n ch&iacute;nh mẫu đồng hồ Elixa E126-L521-K1 &ndash; thể hiện bản h&ograve;a ca của sự s&aacute;ng tạo bất diện v&agrave; nghệ thuật chế t&aacute;c kim ho&agrave;n đỉnh cao.</p>

<p style="text-align:center"><img alt="Elixa E126-L521-K1" src="https://elixa.vn/wp-content/uploads/2018/08/img_prod5984_3_o.jpg" style="height:1080px; width:1080px" /></p>

<p style="text-align:justify">Những t&iacute;n đồ đ&atilde; v&agrave; đang đồng hồ Elixa E126-L521-K1 th&igrave; cho rằng, sản phẩm như l&agrave; một thứ năng lượng b&iacute; hiểm c&oacute; khả năng đ&aacute;nh thức vẻ đẹp tiềm ẩn của c&aacute; nh&acirc;n người sở hữu đồng hồ. V&acirc;ng! Điều đ&oacute; đ&uacute;ng v&agrave; đ&uacute;ng với dụng &yacute; của h&atilde;ng Elixa trong việc t&ocirc;n vinh vẻ đẹp thuần khiết, mềm mại v&agrave; c&oacute; đan xen yếu tố mạnh mẽ, đầy nghị lực của &ldquo;một nửa thế giới&rdquo;.</p>

<p style="text-align:center"><img alt="Elixa E126-L521-K1" src="https://elixa.vn/wp-content/uploads/2018/08/img_prod5984_2_o.jpg" style="height:1080px; width:1080px" /></p>

<p style="text-align:justify">C&ograve;n ch&uacute;ng t&ocirc;i cũng tin rằng, Elixa E126-L521-K1 khiến vẻ đẹp ẩn s&acirc;u b&ecirc;n trong của phụ nữ bừng tỉnh, đồng hồ mang đến một thứ năng lượng v&ocirc; h&igrave;nh nhưng mạnh mẽ, đồng thời tiếp th&ecirc;m ngọn lửa tự tin cho người phụ nữ trong mọi h&agrave;nh tr&igrave;nh, mọi kh&ocirc;ng gian v&agrave; ho&agrave;n cảnh.</p>
', CAST(6310000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'E128-L533', 4, N'Ba Lan', N'Quartz', N'34 mm', NULL, N'Thép không gỉ', N'Dây da', N'Kính cứng', N'30 m', NULL, 0, N'/Assets/Images/DongHo/e128-l533-ava.jpg', 30, NULL, CAST(5650000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'E129-L539', 4, N'Ba Lan', N'Quartz', N'32,5mm', NULL, N'Thép không gỉ', N'Dây da', N'Kính cứng', N'30 m', NULL, 0, N'/Assets/Images/DongHo/E129-L539.jpg', 30, NULL, CAST(5650000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'ER0201-72A', 3, N'Nhật Bản', N'Quartz', N'26 mm', N'7 mm', N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính cứng', N'50 m', NULL, 0, N'/Assets/Images/DongHo/dong-ho-citizen-er0201-72a-5_1588128227.jpg', 30, NULL, CAST(3600000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'EW1582-54A', 3, N'Nhật Bản', N'Eco-Drive', N'26 mm', N'7 mm', N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'30 m', N'<p>Lịch ng&agrave;y</p>
', 0, N'/Assets/Images/DongHo/dong-ho-citizen-ew1582-54a-11_1588130512.jpg', 30, NULL, CAST(6270000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'EX1420-84E', 3, N'Nhật Bản', N'Eco-Drive', N'23 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính cứng', N'30 m', NULL, 0, N'/Assets/Images/DongHo/dong-ho-citizen-ex1420-84e-1_1587441927.jpg', 30, NULL, CAST(6700000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'EX1480-15D', 3, N'Nhật Bản', N'Eco-Drive', N'27,4 mm', N'6 mm', N'Thép không gỉ 316L', N'Dây da', N'Kính Sapphire (chống trầy)', N'50 m', NULL, 0, N'/Assets/Images/DongHo/citizen-nu-ex1480-15d_1587551886.jpg', 30, NULL, CAST(5800000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F1108502', 5, N'Pháp', N'Quartz (Pin)', N'30 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính cứng', N'50 m', NULL, 0, N'/Assets/Images/DongHo/dong-ho-f1108502_1570764915.jpg', 30, NULL, CAST(1550000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F1108601', 6, N'Pháp', N'Quartz (Pin)', N'30 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính cứng', N'50 m', NULL, 0, N'/Assets/Images/DongHo/dong-ho-f1108601_1570765052.jpg', 30, NULL, CAST(1550000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F167483', 5, N'Tây Ban Nha', N'Quartz', N'30,6 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ', N'Kính cứng', N'50M', N'<p>Lịch ng&agrave;y</p>
', 0, N'/Assets/Images/DongHo/f167483.jpg', 30, NULL, CAST(2910000 AS Decimal(18, 0)), 5, N'2 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F200054', 5, N'Thụy Sỹ', N'Quartz (Pin)', N'40 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính Sapphire', N'100 m', N'<p>Lịch ng&agrave;y</p>
', 1, N'/Assets/Images/DongHo/festina-f20005-4_1566898608.jpg', 30, NULL, CAST(4150000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F200092', 5, N'Thụy Sỹ', N'Quartz (Pin)', N'29 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính Sapphire', N'100 m', N'<p>Lịch ng&agrave;y</p>
', 0, N'/Assets/Images/DongHo/festina-f20009-2_1566898860.jpg', 30, NULL, CAST(3820000 AS Decimal(18, 0)), 5, N'2 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F202543', 5, N'Tây Ban Nha', N'Quartz', N'29 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính cứng', N'30M', NULL, 0, N'/Assets/Images/DongHo/f202543-1.jpg', 30, NULL, CAST(4440000 AS Decimal(18, 0)), 5, N'2 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F202762', 5, N'Tây Ban Nha', N'Quartz', N'41 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính cứng', N'50M', NULL, 1, N'/Assets/Images/DongHo/f202762-1.jpg', 30, NULL, CAST(3930000 AS Decimal(18, 0)), 5, N'2 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F203584', 5, N'Tây Ban Nha', N'Quartz', N'41 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính cứng', N'100M', N'<p>Lịch ng&agrave;y, lịch thứ</p>
', 1, N'/Assets/Images/DongHo/f203584-1.jpg', 30, NULL, CAST(2740000 AS Decimal(18, 0)), 5, N'2 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F203901', 5, N'Tây Ban Nha', N'Quartz', N'30.5 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính cứng', N'50M', NULL, 0, N'/Assets/Images/DongHo/f203901-1.jpg', 30, NULL, CAST(3130000 AS Decimal(18, 0)), 5, N'2 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F68473', 5, N'Tây Ban Nha', N'Automatic', N'40.8 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính cứng', N'50M', NULL, 1, N'/Assets/Images/DongHo/f68473-1.jpg', 30, NULL, CAST(7510000 AS Decimal(18, 0)), 5, N'2 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F7102805', 6, N'Pháp', N'Quartz (Pin)', N'30 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính cứng', N'50 m', N'<p>Giờ, ph&uacute;t, gi&acirc;y</p>
', 0, N'/Assets/Images/DongHo/freelook-f7102805_1570701593.jpg', 30, NULL, CAST(2940000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'F7106203', 6, N'Pháp', N'Quartz (Pin)', N'30 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ', N'Kính cứng', N'30 m', NULL, 0, N'/Assets/Images/DongHo/free-look-f7106203_1570764753.jpg', 30, NULL, CAST(2940000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'FAC07002W0', 9, N'Nhật Bản', N'Automatic', N'35.5 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire', N'50 m', NULL, 0, N'/Assets/Images/DongHo/avatarfac07002w0.jpg', 30, NULL, CAST(6900000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'FAG00004D0', 9, N'Nhật Bản', N'Automatic', N'43mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính cứng', N'50M', N'<p>Open heart</p>
', 1, N'/Assets/Images/DongHo/orient-fag00004d0_1621847061.jpg', 29, N'<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu Orient" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước Orient" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(8).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Orient Caballero FAG00004D0" src="https://xwatch.vn/upload_images/images/2021/06/25/orient-FAG00004D0-(12).jpg" style="width:1200px" /></p>
', CAST(6900000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-09-18' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'FAG03001D0', 9, N'Nhật Bản', N'Automatic', N'38.5 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính Sapphire', N'50M', NULL, 1, N'/Assets/Images/DongHo/orient-fag03001d0_1621847166.jpg', 30, N'<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu Orient" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/08/11/chi-tiet-FAG03001D0.jpg" style="height:554px; width:1200px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước Orient" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(12).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(13).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(14).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Orient Golden Eye II FAG03001D0" src="https://xwatch.vn/upload_images/images/2021/05/19/orient-FAG03001D0-(15).jpg" style="width:1200px" /></p>
', CAST(7990000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'FC8008-88D', 3, N'Nhật Bản', N'Eco-Drive', N'35.8 mm', N'9.3 mm', N'Thép không gỉ 316L', N'Thép không gỉ', N'Kính Sapphire', N'50 m', N'<p>Lịch ng&agrave;y</p>
', 0, N'/Assets/Images/DongHo/citizen-fc8008-88d_1586579040.jpg', 30, NULL, CAST(11550000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'FETAF004W0', 9, N'Nhật Bản', N'Automatic', N'32,5 x 38mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính cứng', N'50M', NULL, 1, N'/Assets/Images/DongHo/avatar_fetaf004w0.png', 30, NULL, CAST(5390000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'FL1100572', 6, N'Pháp', N'Quartz (Pin)', N'35 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính cứng', N'50M', NULL, 0, N'/Assets/Images/DongHo/freelook-fl1100572-min_1582876846.jpg', 30, NULL, CAST(2000000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'FSW02003D0', 9, N'Nhật Bản', N'Quartz', N'35 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính cứng', N'50 m', NULL, 0, N'/Assets/Images/DongHo/avatar_fsw02003d0.png', 30, NULL, CAST(5990000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'FUNG2004F0', 9, N'Nhật Bản', N'Quartz', N'42 mm', NULL, N'Thép không gỉ', N'Dây dù', N'Kính cứng', N'50M', N'<p>Lịch ng&agrave;y</p>
', 1, N'/Assets/Images/DongHo/fung2004f0-1.jpg', 30, N'<h3 style="text-align:justify">Niềm tự h&agrave;o Nhật Bản</h3>

<p style="text-align:justify">Orient ra đời năm 1950 tại đất nước mặt trời mọc với &yacute; nghĩa l&agrave; &quot;phương Đ&ocirc;ng&quot;. Từ khi ra đời tới nay, Orient đ&atilde; trở th&agrave;nh 1 thương hiệu phổ biến tr&ecirc;n thế giới</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/banner-orient.jpg" style="height:323px; width:1024px" /></p>

<h3 style="text-align:justify">Chất lượng tốt, gi&aacute; trong tầm tay</h3>

<p style="text-align:justify">Sử dụng m&aacute;y in-house do h&atilde;ng trực tiếp sản xuất. Orient bảo đảm về chất lượng v&agrave; mức gi&aacute; ph&ugrave; hợp!</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/orient-fung2004f0-banner-2.jpg" style="height:499px; width:1024px" /></p>

<h3 style="text-align:justify">Đơn giản l&agrave; số 1!</h3>

<p style="text-align:justify">Đơn giản lu&ocirc;n l&agrave; vẻ đẹp ho&agrave;n hảo nhất, tinh tế nhất! Kh&ocirc;ng hoa mĩ hay cầu kỳ trong thiết kế, điểm nhấn lại ch&iacute;nh l&agrave; mặt số đơn giản nhưng đầy sức h&uacute;t đ&atilde; tạo n&ecirc;n n&eacute;t ri&ecirc;ng biệt cho Orient</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/orient-fung2004f0-banner-3.jpg" style="height:499px; width:1024px" /></p>

<p style="text-align:justify">Mặt k&iacute;nh chuy&ecirc;n dụng</p>

<p style="text-align:justify">FUNG2004F0 với nhiều lớp bảo vệ, loại k&iacute;nh chuy&ecirc;n dụng của Orient c&oacute; thể chống va đập tốt hơn nhiều so với c&aacute;c loại k&iacute;nh th&ocirc;ng thường kh&aacute;c.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/orient-fung2004f0-banner-4.jpg" style="height:499px; width:1024px" /></p>

<h3 style="text-align:justify">Khả năng chống nước ho&agrave;n hảo</h3>

<p style="text-align:justify">Bạn c&oacute; thể thoải m&aacute;i sử dụng FUNG2004F0&nbsp;trong điều kiện h&agrave;ng ng&agrave;y: Đi mưa, rửa tay m&agrave; kh&ocirc;ng lo đồng hồ bị v&agrave;o nước với mức Water Resistant 50m</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/orient-fung2004f0-banner-5.jpg" style="height:499px; width:1024px" /></p>

<h3 style="text-align:justify">Bộ m&aacute;y Orient - Tinh thần Nhật Bản</h3>

<p style="text-align:justify">Sử dụng m&aacute;y ORIENT caliber 40P51 được sản xuất tại Nhật Bản.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/orient-fung2004f0-banner-6.jpg" style="height:479px; width:1024px" /></p>
', CAST(2700000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'KB0003S10B', 9, N'Nhật Bản', N'Quartz (Pin)', N'34 mm', N'8 mm', N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính cứng', N'30M', N'<p>Lịch tuần trăng</p>
', 0, N'/Assets/Images/DongHo/dong-ho-orient-ra-kb0003s10b_1608172760.jpg', 30, NULL, CAST(6700000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'NH8363-14H', 3, N'Nhật Bản', N'Automatic', N'41 mm', N'11.2 mm', N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính cứng', N'50 m', N'<p>Lịch ng&agrave;y, lịch thứ</p>
', 1, N'/Assets/Images/DongHo/dong-ho-citizen-nh8363-14h_1626421180.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(1).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu đồng hồ Citizen" src="https://xwatch.vn/upload_images/images/2021/06/17/citizen-BM7330-67L-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(2).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(3).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(4).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(5).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(6).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(7).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước đồng hồ Citizen" src="https://xwatch.vn/upload_images/images/2021/06/17/citizen-BM7330-67L-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(8).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(9).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(10).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Citizen NH8363-14H" src="https://xwatch.vn/upload_images/images/2021/08/03/citizen-NH8363-14H-nam-(11).jpg" style="width:1500px" /></p>
', CAST(5780000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'NY0040-09E', 3, N'Nhật Bản', N'Automatic', N'40 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây cao su', N'Kính cứng', N'200 m', NULL, 1, N'/Assets/Images/DongHo/avatarny0040-09e.jpg', 30, N'<p style="text-align:center">&nbsp;<img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/05/citizen-ny0040-09e-1.jpg" style="height:847px; width:1200px" />&nbsp;<img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/05/citizen-ny0040-09e-2.jpg" style="height:847px; width:1200px" />&nbsp;<img alt="" src="https://www.xwatch.vn/wp-content/uploads/2017/05/citizen-ny0040-09e-3.jpg" style="height:847px; width:1200px" /></p>
', CAST(6700000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OG1929-24AGK-T', 7, N'Thụy Sỹ', N'Automatic', N'40 mm', N'10 mm', N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'50 m', N'<p>Lịch ng&agrave;y, l&ecirc;n c&oacute;t tay, dừng kim gi&acirc;y</p>
', 1, N'/Assets/Images/DongHo/dong-ho-ogival-og1929-24agk-t_1625476864.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu Ogival" src="https://xwatch.vn/upload_images/images/2021/05/12/OG358_52AGR-GL-chi-tiet-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước đồng hồ" src="https://xwatch.vn/upload_images/images/2021/05/12/OG358_52AGR-GL-chi-tiet-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(8).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(12).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG1929-24AGK-T" src="https://xwatch.vn/upload_images/images/2021/07/22/ogival-OG1929-24AGK-T-chi-tiet-(13).jpg" style="width:1200px" /></p>
', CAST(17560000 AS Decimal(18, 0)), 5, N'2 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OG1930LSR-D', 7, N'Thụy Sỹ', N'Quartz', N'30 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính Sapphire', N'30M', NULL, 0, N'/Assets/Images/DongHo/og1930lsr-d1.png', 30, NULL, CAST(8500000 AS Decimal(18, 0)), 5, N'2 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OG30399DLK-V', 7, N'Thụy Sỹ', N'Automatic', N'28 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'100M', NULL, 0, N'/Assets/Images/DongHo/og30399dlk-v.jpg', 30, N'<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/banner-ogival.jpg" style="height:328px; width:1024px" /></p>

<h3 style="text-align:justify">Những vi&ecirc;n đ&aacute; lấp l&aacute;nh</h3>

<p style="text-align:justify">Xung quanh v&agrave;nh đồng hồ l&agrave; những v&ograve;ng đ&aacute; ngoằm Swarovski - 1 trong những loại đ&aacute; được sử dụng để l&agrave;m kim cương nh&acirc;n tạo. Với m&agrave;u sắc, gi&aacute;c cắt, size, tỷ lệ chiếu s&aacute;ng v&agrave; độ cứng của vi&ecirc;n đ&aacute; đạt đến mức độ ho&agrave;n hảo.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og30399dlk-v-banner-1.jpg" style="height:499px; width:1024px" /></p>

<h3 style="text-align:justify">Trang sức d&agrave;nh cho ph&aacute;i nữ</h3>

<p style="text-align:justify">L&agrave; sự kết hợp giữa vẻ đẹp quyến rũ của m&oacute;n đồ nữ trang v&agrave; nghệ thuật chế t&aacute;c đồng hồ đặc biệt, chiếc OG30399DLK thực sự l&agrave; thứ đồ trang sức đầy nữ t&iacute;nh v&agrave; duy&ecirc;n d&aacute;ng.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og30399dlk-v-banner-2.jpg" style="height:500px; width:1024px" /></p>

<h3 style="text-align:justify">Những v&ograve;ng tay duy&ecirc;n d&aacute;ng</h3>

<p style="text-align:justify">Bạn muốn 1 chiếc đồng hồ nữ t&iacute;nh v&agrave; dịu d&agrave;ng giống như 1 chiếc v&ograve;ng tay bạn đeo h&agrave;ng ng&agrave;y? OG30399DLK ch&iacute;nh l&agrave; lựa chọn d&agrave;nh cho bạn.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og30399dlk-v-banner-3.jpg" style="height:498px; width:1024px" /></p>

<h3 style="text-align:justify">C&ocirc;ng nghệ mạ PVD</h3>

<p style="text-align:justify">C&ocirc;ng nghệ mạ PVD (Physical Vapor Deposition) cho ph&eacute;p tạo ra những bề mặt m&agrave; c&oacute; m&agrave;u sắc s&aacute;ng tạo v&agrave; độ bền đẹp vượt trội. Lớp mạ niken ph&iacute;a trong gia tăng độ cứng v&agrave; tạo n&ecirc;n m&agrave;u sắc trung thực của bề mặt PVD</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og30399dlk-v-banner-4.jpg" style="height:498px; width:1024px" /></p>

<h3 style="text-align:justify">Sự ch&iacute;nh x&aacute;c gần như tuyệt đối.</h3>

<p style="text-align:justify">Thuỵ Sỹ - biểu tượng cho sự ho&agrave;n hảo v&agrave; ch&iacute;nh x&aacute;c - được xem l&agrave; ti&ecirc;u chuẩn trong ng&agrave;nh đồng hồ. Được trang bị ETA movement với mức độ sai số dưới 10s/ ng&agrave;y, mang lại sự ch&iacute;nh x&aacute;c đến từng gi&acirc;y.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og30399dlk-v-banner-5.jpg" style="height:498px; width:1024px" /></p>

<h3 style="text-align:justify">Thoả sức thể hiện c&aacute; t&iacute;nh</h3>

<p style="text-align:justify">Đồng hồ OG30399DLK mang đến cho bạn cảm gi&aacute;c thoải m&aacute;i v&agrave; an to&agrave;n khi sử dụng. Với khả năng chống nước l&ecirc;n đến 30m, c&ugrave;ng mặt k&iacute;nh sapphire chống xước, gi&uacute;p bạn thoải m&aacute;i thể hiện c&aacute; t&iacute;nh trong c&ocirc;ng việc cũng như hoạt động ngo&agrave;i trời.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og30399dlk-v-banner-6.jpg" style="height:498px; width:1024px" /></p>
', CAST(35350000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OG385-032LSK-T', 7, N'Thụy Sỹ', N'Quartz', N'26 mm', N'5 mm', N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'30 m', NULL, 0, N'/Assets/Images/DongHo/avatarog385-032lsk-t1.jpg', 30, NULL, CAST(9230000 AS Decimal(18, 0)), 5, N'2 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OG3862DLK-T', 7, N'Thụy Sỹ', N'Quartz', N'30 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'30M', NULL, 0, N'/Assets/Images/DongHo/og3862dlk-t.jpg', 30, N'<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/banner-ogival.jpg" style="height:328px; width:1024px" /></p>

<h3 style="text-align:justify">Những vi&ecirc;n đ&aacute; lấp l&aacute;nh</h3>

<p style="text-align:justify">Xung quanh v&agrave;nh đồng hồ l&agrave; những v&ograve;ng đ&aacute; ngoằm Swarovski - 1 trong những loại đ&aacute; được sử dụng để l&agrave;m kim cương nh&acirc;n tạo. Với m&agrave;u sắc, gi&aacute;c cắt, size, tỷ lệ chiếu s&aacute;ng v&agrave; độ cứng của vi&ecirc;n đ&aacute; đạt đến mức độ ho&agrave;n hảo.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og3862dlk-t-banner-1.jpg" style="height:499px; width:1024px" /></p>

<h3 style="text-align:justify">Trang sức d&agrave;nh cho ph&aacute;i nữ</h3>

<p style="text-align:justify">L&agrave; sự kết hợp giữa vẻ đẹp quyến rũ của m&oacute;n đồ nữ trang v&agrave; nghệ thuật chế t&aacute;c đồng hồ đặc biệt, chiếc OG3862DLW thực sự l&agrave; thứ đồ trang sức đầy nữ t&iacute;nh v&agrave; duy&ecirc;n d&aacute;ng.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og3862dlk-t-banner-2.jpg" style="height:500px; width:1024px" /></p>

<h3 style="text-align:justify">Những v&ograve;ng tay duy&ecirc;n d&aacute;ng</h3>

<p style="text-align:justify">Bạn muốn 1 chiếc đồng hồ nữ t&iacute;nh v&agrave; dịu d&agrave;ng giống như 1 chiếc v&ograve;ng tay bạn đeo h&agrave;ng ng&agrave;y? OG3862DLW ch&iacute;nh l&agrave; lựa chọn d&agrave;nh cho bạn.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og3862dlk-t-banner-3.jpg" style="height:498px; width:1024px" /></p>

<h3 style="text-align:justify">C&ocirc;ng nghệ mạ PVD</h3>

<p style="text-align:justify">C&ocirc;ng nghệ mạ PVD (Physical Vapor Deposition) cho ph&eacute;p tạo ra những bề mặt m&agrave; c&oacute; m&agrave;u sắc s&aacute;ng tạo v&agrave; độ bền đẹp vượt trội. Lớp mạ niken ph&iacute;a trong gia tăng độ cứng v&agrave; tạo n&ecirc;n m&agrave;u sắc trung thực của bề mặt PVD</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og3862dlk-t-banner-4.jpg" style="height:498px; width:1024px" /></p>

<h3 style="text-align:justify">Sự ch&iacute;nh x&aacute;c gần như tuyệt đối.</h3>

<p style="text-align:justify">Thuỵ Sỹ - biểu tượng cho sự ho&agrave;n hảo v&agrave; ch&iacute;nh x&aacute;c - được xem l&agrave; ti&ecirc;u chuẩn trong ng&agrave;nh đồng hồ. Được trang bị ETA movement với mức độ sai số dưới 10s/ ng&agrave;y, mang lại sự ch&iacute;nh x&aacute;c đến từng gi&acirc;y.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og3862dlk-t-banner-5.jpg" style="height:498px; width:1024px" /></p>

<h3 style="text-align:justify">Thoả sức thể hiện c&aacute; t&iacute;nh</h3>

<p style="text-align:justify">Đồng hồ OG3862DLW mang đến cho bạn cảm gi&aacute;c thoải m&aacute;i v&agrave; an to&agrave;n khi sử dụng. Với khả năng chống nước l&ecirc;n đến 30m, c&ugrave;ng mặt k&iacute;nh sapphire chống xước, gi&uacute;p bạn thoải m&aacute;i thể hiện c&aacute; t&iacute;nh trong c&ocirc;ng việc cũng như hoạt động ngo&agrave;i trời.</p>

<p style="text-align:center"><img alt="" src="https://www.xwatch.vn/wp-content/uploads/2016/12/ogival-og3862dlk-t-banner-6.jpg" style="height:498px; width:1024px" /></p>
', CAST(15680000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OG829-65AGSK-T', 7, N'Thụy Sỹ', N'Automatic', N'40 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'50M', N'<p>Skeleton (Lộ m&aacute;y to&agrave;n bộ)</p>
', 1, N'/Assets/Images/DongHo/ogival-og829-65agsk-t_1621218275.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(1).jpg" style="width:1600px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu Ogival" src="https://xwatch.vn/upload_images/images/2021/05/12/OG358_52AGR-GL-chi-tiet-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(2).jpg" style="width:1600px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(3).jpg" style="width:1600px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(4).jpg" style="width:1600px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(5).jpg" style="width:1600px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(6).jpg" style="width:1600px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(7).jpg" style="width:1600px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước đồng hồ" src="https://xwatch.vn/upload_images/images/2021/05/12/OG358_52AGR-GL-chi-tiet-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(8).jpg" style="width:1600px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(9).jpg" style="width:1600px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(10).jpg" style="width:1600px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Ogival OG829-65AGSK-T" src="https://xwatch.vn/upload_images/images/2021/08/27/ogival-OG829-65AGSK-T-chitiet-(11).jpg" style="width:1600px" /></p>
', CAST(29730000 AS Decimal(18, 0)), 5, N'2 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OP130-03LK-GL-T', 8, N'Nhật Bản', N'Quartz (Pin)', N'26 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire', N'30M', NULL, 0, N'/Assets/Images/DongHo/olympianus-op130-03lk-gl-t_1582188947.jpg', 30, NULL, CAST(2010000 AS Decimal(18, 0)), 5, N'2 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OP130-07MK-GL-T', 8, N'Nhật Bản', N'Quartz', N'38 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire', N'30M', N'<p>Lịch ng&agrave;y</p>
', 1, N'/Assets/Images/DongHo/olym-pianus-op130-07mk-gl-t_1625476982.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu đồng hồ OP" src="https://xwatch.vn/upload_images/images/2021/05/12/OP99141-71AGS-GL-T-CV-chi-tiet-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Bảng chống nước đồng hồ" src="https://xwatch.vn/upload_images/images/2021/05/12/OP99141-71AGS-GL-T-CV-chi-tiet-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(8).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(12).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP130-07MK-GL-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP130-07MK-GL-T-chitiet-(13).jpg" style="width:1200px" /></p>
', CAST(2190000 AS Decimal(18, 0)), 5, N'2 năm', N'longnt', N'longnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OP68322DSK-T', 8, N'Nhật Bản', N'Quartz (Pin)', N'25 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'30 m', N'<p>Lịch ng&agrave;y</p>
', 0, N'/Assets/Images/DongHo/olym-pianus-op68322dsk-t-1_1626236844.jpg', 30, NULL, CAST(3840000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OP990-133AMSK-T', 8, N'Nhật Bản', N'Automatic', N'42 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính Sapphire', N'30 m', N'<p>L&ecirc;n c&oacute;t tay, dừng kim gi&acirc;y</p>
', 1, N'/Assets/Images/DongHo/dong-ho-olym-pianus-op990-133amsk-t_1625820111.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu đồng hồ OP" src="https://xwatch.vn/upload_images/images/2021/05/12/OP99141-71AGS-GL-T-CV-chi-tiet-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Bảng chống nước đồng hồ" src="https://xwatch.vn/upload_images/images/2021/05/12/OP99141-71AGS-GL-T-CV-chi-tiet-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(8).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Olym Pianus OP990-133AMSK-T" src="https://xwatch.vn/upload_images/images/2021/07/23/olym-pianus-OP990-133AMSK-T-chitiet-(12).jpg" style="width:1200px" /></p>
', CAST(5270000 AS Decimal(18, 0)), 5, N'2 năm', N'longnt', N'longnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OP990-45ADDGS-GL-T', 8, N'Nhật Bản', N'Automatic', N'42 mm', NULL, N'Thép không gỉ 316L/Mạ màu PVD', N'Dây cao su', N'Kính Sapphire', N'50M', N'<p>Lịch ng&agrave;y, lịch thứ, đ&iacute;nh đ&aacute;</p>
', 1, N'/Assets/Images/DongHo/olym-pianus-op990-45addgs-gl-t_1625453596.jpg', 30, NULL, CAST(8150000 AS Decimal(18, 0)), 5, N'1 năm', N'longnt', N'longnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OP9908-88AGSK-GL-T', 8, N'Nhật Bản', N'Automatic', N'40 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire', N'50M', N'<p>Power Reserve, Hacking Stop, Handwinding</p>
', 1, N'/Assets/Images/DongHo/olym-pianus-op9908-88agsk-gl-t_1622713371.jpg', 30, N'<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(8).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(12).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(13).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/images/products/2020/04/24/original/Dong-ho-OP-OP9908-88AGSK-GL-T-11_1587703921.jpg.jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(14).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Olym Pianus OP9908-88AGSK-GL-T" src="https://xwatch.vn/upload_images/images/2021/05/12/OP9908-88AGSK-GL-T-chi-tiet-(15).jpg" style="width:1200px" /></p>
', CAST(8270000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OPA580501LS-GL-T', 8, N'Thụy Sỹ', N'Quartz', N'24 mm', N'6 mm', N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire', N'30 m', NULL, 0, N'/Assets/Images/DongHo/opa580501ls-gl-t_1562145984.jpg', 30, N'<p style="text-align:center"><img alt="" src="https://xwatch.vn/images/products/2020/04/17/original/dong-ho-OP-nu-OPA580501LS-GL-T-(6)_1587097472.jpg.jpg" style="height:1000px; width:1000px" /></p>
', CAST(3620000 AS Decimal(18, 0)), 5, N'2 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'OPA58082LSK-T', 8, N'Thụy Sỹ', N'Quartz', N'28 mm', N'5 mm', N'Thép không gỉ/Mạ PVD', N'Thép không gỉ', N'Kính Sapphire', N'30 m', NULL, 0, N'/Assets/Images/DongHo/dong-ho-olympia-star-opa58082lsk-t_1625820738.jpg', 30, NULL, CAST(4130000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'RA-AG0017Y10B', 9, N'Nhật Bản', N'Automatic', N'36 mm', NULL, N'Thép không gỉ', N'Dây da', N'Kính cứng', N'30 m', N'<p>L&ecirc;n c&oacute;t tay</p>
', 0, N'/Assets/Images/DongHo/dong-ho-orient-ra-ag0017y10b_1574666630.jpg', 30, NULL, CAST(7440000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SER0200JB', 9, N'Nhật Bản', N'Automatic', N'44.1 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính Sapphire', N'50 m', N'<p>Phi&ecirc;n bản giới hạn 2015 chiếc</p>
', 1, N'/Assets/Images/DongHo/avatarser0200jb-min.jpg', 30, NULL, CAST(15000000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SG20894102RNT', 11, N'Nhật Bản', N'Quartz (Pin)', N'40 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính cong Sapphire', N'50 m', NULL, 1, N'/Assets/Images/DongHo/srwatch-sg20894102rnt_1621847707.jpg', 29, N'<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu đồng hồ Srwatch" src="https://xwatch.vn/upload_images/images/2021/06/28/lich-su-thuong-hieu-srwatch.jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước đồng hồ Srwatch" src="https://xwatch.vn/upload_images/images/2021/06/28/Bang-chong-nuoc-dong-ho-srwatch.jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(8).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-SG2089_4102RNT-(12).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG2089.4102RNT" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" style="width:1200px" /></p>
', CAST(2900000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-09-18' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SG57514601', 11, N'Nhật Bản', N'Quartz (Pin)', N'39 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire', N'50 m', N'<p>Lịch ng&agrave;y</p>
', 1, N'/Assets/Images/DongHo/srwatch-sg57514601_1572320750.jpg', 28, NULL, CAST(2790000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'admin', CAST(N'2021-07-04' AS Date), CAST(N'2021-09-23' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SG58714601', 11, N'Nhật Bản', N'Quartz (Pin)', N'39 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire', N'50 m', N'<p>Lịch ng&agrave;y</p>
', 1, N'/Assets/Images/DongHo/dong-ho-srwatch-sg58714601_1626497437.jpg', 30, NULL, CAST(2950000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SG999934602GLA', 11, N'Nhật Bản', N'Automatic', N'41 mm', N'12 mm', N'Thép không gỉ 316L', N'Dây da', N'Kính Sapphire', N'50 m', N'<p>Lịch ng&agrave;y, đ&iacute;nh đ&aacute;, dạ quang</p>
', 1, N'/Assets/Images/DongHo/srwatch-sg999934602gla_1622171831.jpg', 28, N'<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(1).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu đồng hồ Srwatch" src="https://xwatch.vn/upload_images/images/2021/06/28/lich-su-thuong-hieu-srwatch.jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(2).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(3).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(4).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(5).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(6).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(7).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước đồng hồ Srwatch" src="https://xwatch.vn/upload_images/images/2021/06/28/Bang-chong-nuoc-dong-ho-srwatch.jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(8).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(9).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(10).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(11).jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SG99993.4602GLA" src="https://xwatch.vn/upload_images/images/2021/06/28/srwatch-%20SG99993_4602GLA-(12).jpg" style="width:1200px" /></p>
', CAST(9950000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'admin', CAST(N'2021-07-04' AS Date), CAST(N'2021-09-23' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SKA691P1', 10, N'Nhật Bản', N'Kinetic', N'44 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính Sapphire chống lóa', N'100m', NULL, 1, N'/Assets/Images/DongHo/avatarska691p1.jpg', 30, NULL, CAST(6630000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SKA745P1', 10, N'Nhật Bản', N'Kinetic', N'44.7 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ', N'Hardlex Crystal', N'100 m', N'<p>Xem lịch</p>
', 1, N'/Assets/Images/DongHo/avatarska745p1.jpg', 30, NULL, CAST(7360000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SKA878P1', 10, N'Nhật Bản', N'Kinetic', N'37 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'100 m', NULL, 1, N'/Assets/Images/DongHo/avatarska878p1.jpg', 30, NULL, CAST(12580000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SL10564102TE', 11, N'Nhật Bản', N'Quartz', N'30 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính Sapphire', N'30 m', NULL, 0, N'/Assets/Images/DongHo/dong-ho-srwatch-sl1056_1625557440.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(1).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu đồng hồ Srwatch" src="https://xwatch.vn/upload_images/images/2021/06/28/lich-su-thuong-hieu-srwatch.jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(2).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(3).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(4).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(5).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(6).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(7).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước đồng hồ Srwatch" src="https://xwatch.vn/upload_images/images/2021/06/28/Bang-chong-nuoc-dong-ho-srwatch.jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(8).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(9).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(10).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1056.4102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1056_4102TE-(11).jpg" style="width:1500px" /></p>
', CAST(1600000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SL10564602TE', 11, N'Nhật Bản', N'Quartz', N'30 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính Sapphire', N'50 m', N'<p>Lịch ng&agrave;y</p>
', 0, N'/Assets/Images/DongHo/srwatch-sl10564602te_1572333188.jpg', 29, NULL, CAST(1800000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'admin', CAST(N'2021-07-04' AS Date), CAST(N'2021-09-23' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SL10721102TE', 11, N'Nhật Bản', N'Quartz', N'30 mm', NULL, N'Thép không gỉ 316L', N'Thép không gỉ 316L', N'Kính Sapphire', N'30 m', N'<p>Lịch ng&agrave;y</p>
', 0, N'/Assets/Images/DongHo/dong-ho-srwatch-sl1072_1625557548.jpg', 30, N'<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(1).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Lịch sử thương hiệu đồng hồ Srwatch" src="https://xwatch.vn/upload_images/images/2021/06/28/lich-su-thuong-hieu-srwatch.jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(2).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(3).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(4).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(5).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(6).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(7).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Bảng thông số chống nước đồng hồ Srwatch" src="https://xwatch.vn/upload_images/images/2021/06/28/Bang-chong-nuoc-dong-ho-srwatch.jpg" style="width:1200px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(8).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(9).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(10).jpg" style="width:1500px" /></p>

<p style="text-align:center"><img alt="Đồng hồ Srwatch SL1072.1102TE" src="https://xwatch.vn/upload_images/images/2021/08/03/srwatch-nu-SL1072_1102TE-(11).jpg" style="width:1500px" /></p>
', CAST(1650000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SL66541303', 11, N'Nhật Bản', N'Quartz', N'26 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'30 m', NULL, 0, N'/Assets/Images/DongHo/srwatch-sl66541303_1572320099.jpg', 28, NULL, CAST(2950000 AS Decimal(18, 0)), 5, N'1 năm', N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-09-18' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SNK805K2', 10, N'Nhật Bản', N'Automatic', N'37 mm', NULL, N'Thép không gỉ 316L', N'Dây vải Nato', N'Kính cứng', N'30M', NULL, 1, N'/Assets/Images/DongHo/2-37-min.jpg', 30, NULL, CAST(3260000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SRW821P1', 10, N'Nhật Bản', N'Quartz', N'34 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Thép không gỉ', N'Kính Sapphire chống lóa', N'100 m', NULL, 0, N'/Assets/Images/DongHo/avatarsrw821p1.jpg', 30, NULL, CAST(7200000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SSA794J1', 10, N'Nhật Bản', N'Automatic', N'34 mm', N'11.3 mm', N'Thép không gỉ/Mạ PVD', N'Thép không gỉ/Mạ PVD', N'Kính Sapphire', N'100 m', N'<p>Open heart, l&ecirc;n c&oacute;t tay</p>
', 0, N'/Assets/Images/DongHo/dong-ho-seiko-ssa794j1_1588750665.jpg', 30, NULL, CAST(13830000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SSC483P1', 10, N'Nhật Bản', N'Solar', N'44.2 mm', NULL, N'Thép không gỉ 316L', N'Dây da', N'Kính Sapphire', N'100 m', NULL, 1, N'/Assets/Images/DongHo/avatarssc483p1.jpg', 30, NULL, CAST(13070000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SUN049P2', 10, N'Nhật Bản', N'Kinetic', N'45,6 mm', NULL, N'Thép', N'Dây dù', N'Kính cứng', N'100M', N'<p>Worldtime</p>
', 1, N'/Assets/Images/DongHo/seiko-sun049p2-avatar_1562270400.jpg', 28, NULL, CAST(9800000 AS Decimal(18, 0)), 5, N'1 năm', N'thaonp', N'thaonp', CAST(N'2021-07-04' AS Date), CAST(N'2021-09-18' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SUT275P1', 10, N'Nhật Bản', N'Quartz Solar', N'30 mm', NULL, N'Titanium', N'Titanium', N'Kính khoáng', N'100 m', NULL, 0, N'/Assets/Images/DongHo/avatarsut275p1.jpg', 30, NULL, CAST(7620000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
INSERT [dbo].[DongHo] ([MaDH], [MaTH], [NguonGoc], [KieuMay], [KichCo], [DoDay], [ChatLieuVo], [ChatLieuDay], [ChatLieuKinh], [DoChiuNuoc], [ChucNangKhac], [GioiTinh], [HinhDD], [SoLuong], [MoTaCT], [GiaBan], [GiamGia], [BaoHanh], [TenTKDang], [TenTKCapNhat], [NgayDang], [NgayCapNhat]) VALUES (N'SUT300J1', 10, N'Nhật Bản', N'Solar', N'32 mm', NULL, N'Thép không gỉ/Mạ PVD', N'Dây da', N'Kính Sapphire chống lóa', N'100 m', NULL, 0, N'/Assets/Images/DongHo/sut300j101.jpg', 30, NULL, CAST(13760000 AS Decimal(18, 0)), 5, N'1 năm', N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date))
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([SoDH], [TaiKhoanKH], [TaiKhoanNV], [NgayDat], [NgayGiao], [SoDT], [DiaChi], [TongSoMua], [ThanhToan], [GhiChu], [MaTT]) VALUES (1, N'changhoasi', N'thaonp', CAST(N'2021-09-18' AS Date), NULL, N'0917481645', N'21 Nguyễn Tri Phương', 3, CAST(14540000 AS Decimal(18, 0)), NULL, 5)
INSERT [dbo].[DonHang] ([SoDH], [TaiKhoanKH], [TaiKhoanNV], [NgayDat], [NgayGiao], [SoDT], [DiaChi], [TongSoMua], [ThanhToan], [GhiChu], [MaTT]) VALUES (2, N'changhoasi', NULL, CAST(N'2021-09-18' AS Date), NULL, N'0917481645', N'21 Nguyễn Tri Phương', 5, CAST(32350000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[DonHang] ([SoDH], [TaiKhoanKH], [TaiKhoanNV], [NgayDat], [NgayGiao], [SoDT], [DiaChi], [TongSoMua], [ThanhToan], [GhiChu], [MaTT]) VALUES (3, N'changhoasi', NULL, CAST(N'2021-09-18' AS Date), NULL, N'0917481645', N'21 Nguyễn Tri Phương', 6, CAST(30230000 AS Decimal(18, 0)), NULL, 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
INSERT [dbo].[KhachHang] ([TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [SoDT], [DiaChi], [Email], [GioiTinh], [NgayTao], [TrangThai]) VALUES (N'changhoasi', N'thanh1909', N'Quách Phú Thành', CAST(N'1996-09-19' AS Date), N'0917481645', N'21 Nguyễn Tri Phương', N'thanhqp@gmail.com', 1, CAST(N'2021-05-22' AS Date), 1)
INSERT [dbo].[KhachHang] ([TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [SoDT], [DiaChi], [Email], [GioiTinh], [NgayTao], [TrangThai]) VALUES (N'hiepsigiay', N'kien2311', N'Trịnh Y Kiện', CAST(N'2000-11-23' AS Date), N'0916581634', N'300 Nam Kỳ Khởi Nghĩa', N'kienty@gmail.com', 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[KhachHang] ([TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [SoDT], [DiaChi], [Email], [GioiTinh], [NgayTao], [TrangThai]) VALUES (N'vuakungfu', N'kinh3012', N'Ngô Kinh', CAST(N'2002-12-30' AS Date), N'0812747312', N'28 Võ Văn Tần', N'kinhngo@gmail.com', 1, CAST(N'2021-04-07' AS Date), 1)
INSERT [dbo].[KhachHang] ([TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [SoDT], [DiaChi], [Email], [GioiTinh], [NgayTao], [TrangThai]) VALUES (N'vydapchai', N'vy2104', N'Luong Triệu Vỹ', CAST(N'1999-04-21' AS Date), N'0963868285', N'84 Nguyễn Chí Thanh', N'vyluong@gmail.com', 1, CAST(N'2021-01-10' AS Date), 1)
INSERT [dbo].[KhachHang] ([TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [SoDT], [DiaChi], [Email], [GioiTinh], [NgayTao], [TrangThai]) VALUES (N'vylady', N'vy0507', N'Triệu Vy', CAST(N'2003-07-05' AS Date), N'0812565691', N'99 Võ Thị Sáu', N'vy0507@gmail.com', 0, CAST(N'2021-02-12' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (1, N'Công ty Cổ Phần Anh Khuê Watch', N'104 Hùng Vương, Phường 2, TP.Tân An, Tỉnh Long An', N'1900068676')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (2, N'Orient Việt Nam', N'291 Giảng Võ, Ba Đình, Hà Nội', N'0903472299')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (3, N'Công ty TNHH Watch Hut', N'Số 10 Phan Ngữ, Phường Đa Kao, Quận 1, TP.Hồ Chí Minh', N'0961781417')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (4, N'Công ty TopTen', N'102-104 Thạch Thị Thanh, Quận 1, TP.Hồ Chí Minh', N'38203204')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (5, N'Công ty TNHH Trường Hoan', N'31 Đinh Tiên Hoàng, Phường Hàng Bạc, Quận Hoàn Kiếm, Hà Nội', N'38266858')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (6, N'Công ty Cổ Phần trực tuyến Đăng Quang', N'Số 55 Trần Đăng Ninh, Cầu Giấy, Hà Nội', N'18006005')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (7, N'Công ty TNHH Phân Phối Sản Phẩm Cao Cấp LPD', N'41 Phố Thi Sách, P.Phạm Đình Hổ, Q.Hai Bà Trưng, Hà Nội', N'18006785')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
INSERT [dbo].[NhanVien] ([TaiKhoan], [MatKhau], [HoTen], [SoDT], [DiaChi], [NgaySinh], [GioiTinh], [MaNhom], [TrangThai]) VALUES (N'admin', N'admin', N'Huỳnh Tấn Phát', N'0928561814', N'58 Hai Bà Trưng', CAST(N'1995-03-25' AS Date), 1, 1, 1)
INSERT [dbo].[NhanVien] ([TaiKhoan], [MatKhau], [HoTen], [SoDT], [DiaChi], [NgaySinh], [GioiTinh], [MaNhom], [TrangThai]) VALUES (N'diemnt', N'diemdth', N'Ngô Thị Diễm', N'0946817632', N'87 Thành Thái', CAST(N'1998-07-10' AS Date), 0, 2, 1)
INSERT [dbo].[NhanVien] ([TaiKhoan], [MatKhau], [HoTen], [SoDT], [DiaChi], [NgaySinh], [GioiTinh], [MaNhom], [TrangThai]) VALUES (N'longnt', N'longdapchai', N'Nguyễn Thành Long', N'0927691684', N'44 3 tháng 2', CAST(N'1999-02-10' AS Date), 1, 2, 0)
INSERT [dbo].[NhanVien] ([TaiKhoan], [MatKhau], [HoTen], [SoDT], [DiaChi], [NgaySinh], [GioiTinh], [MaNhom], [TrangThai]) VALUES (N'lvphu', N'phule', N'Lê Văn Phú', N'0826529166', N'14 Minh Phụng', CAST(N'1998-05-05' AS Date), 1, 2, 1)
INSERT [dbo].[NhanVien] ([TaiKhoan], [MatKhau], [HoTen], [SoDT], [DiaChi], [NgaySinh], [GioiTinh], [MaNhom], [TrangThai]) VALUES (N'thaonp', N'thaokute', N'Nguyễn Phương Thảo', N'0826581659', N'50 Cách mạng tháng Tám', CAST(N'2000-11-13' AS Date), 0, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Nhom] ON 

INSERT [dbo].[Nhom] ([MaNhom], [TenNhom]) VALUES (1, N'Quản lý')
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom]) VALUES (2, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[Nhom] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 

INSERT [dbo].[PhanHoi] ([MaPH], [HoTen], [NgayGui], [Email], [ChuDe], [NoiDung], [TrangThai]) VALUES (1, N'Nguyễn Thị Bưởi', CAST(N'2021-08-20' AS Date), N'buoint@gmail.com', N'Góp ý', N'Website load chậm và lag', 1)
INSERT [dbo].[PhanHoi] ([MaPH], [HoTen], [NgayGui], [Email], [ChuDe], [NoiDung], [TrangThai]) VALUES (2, N'Nguyễn Văn A', CAST(N'2021-08-21' AS Date), N'nqhung@gmail.com', N'Dh1', N'Thiếu ghi chú', 0)
INSERT [dbo].[PhanHoi] ([MaPH], [HoTen], [NgayGui], [Email], [ChuDe], [NoiDung], [TrangThai]) VALUES (3, N'Nguyễn Văn A', CAST(N'2021-08-21' AS Date), N'nqhung@gmail.com', N'Dh2', N'Thiếu giá bán', 0)
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([SoPN], [MaNCC], [TenTKLap], [TenTKCapNhat], [NgayNhap], [NgayCapNhat], [TongSoNhap], [ThanhToan]) VALUES (1, 1, N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date), 570, CAST(4739400000 AS Decimal(18, 0)))
INSERT [dbo].[PhieuNhap] ([SoPN], [MaNCC], [TenTKLap], [TenTKCapNhat], [NgayNhap], [NgayCapNhat], [TongSoNhap], [ThanhToan]) VALUES (2, 2, N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date), 270, CAST(1821300000 AS Decimal(18, 0)))
INSERT [dbo].[PhieuNhap] ([SoPN], [MaNCC], [TenTKLap], [TenTKCapNhat], [NgayNhap], [NgayCapNhat], [TongSoNhap], [ThanhToan]) VALUES (3, 3, N'diemnt', N'diemnt', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date), 300, CAST(1980000000 AS Decimal(18, 0)))
INSERT [dbo].[PhieuNhap] ([SoPN], [MaNCC], [TenTKLap], [TenTKCapNhat], [NgayNhap], [NgayCapNhat], [TongSoNhap], [ThanhToan]) VALUES (4, 4, N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date), 420, CAST(1821300000 AS Decimal(18, 0)))
INSERT [dbo].[PhieuNhap] ([SoPN], [MaNCC], [TenTKLap], [TenTKCapNhat], [NgayNhap], [NgayCapNhat], [TongSoNhap], [ThanhToan]) VALUES (5, 5, N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date), 300, CAST(3479400000 AS Decimal(18, 0)))
INSERT [dbo].[PhieuNhap] ([SoPN], [MaNCC], [TenTKLap], [TenTKCapNhat], [NgayNhap], [NgayCapNhat], [TongSoNhap], [ThanhToan]) VALUES (6, 6, N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date), 240, CAST(1085100000 AS Decimal(18, 0)))
INSERT [dbo].[PhieuNhap] ([SoPN], [MaNCC], [TenTKLap], [TenTKCapNhat], [NgayNhap], [NgayCapNhat], [TongSoNhap], [ThanhToan]) VALUES (7, 7, N'lvphu', N'lvphu', CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date), 540, CAST(3391800000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (1, N'Bentley', N'/Assets/Images/ThuongHieu/hang-bentley.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (2, N'Bulova', N'/Assets/Images/ThuongHieu/hang-bulova.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (3, N'Citizen', N'/Assets/Images/ThuongHieu/hang-citizen.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (4, N'Elixa', N'/Assets/Images/ThuongHieu/hang-elixa.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (5, N'Festina', N'/Assets/Images/ThuongHieu/hang-festina.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (6, N'Freelook', N'/Assets/Images/ThuongHieu/hang-freelook.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (7, N'Ogival', N'/Assets/Images/ThuongHieu/hang-ogival.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (8, N'OP Olym Pianus - Olympia Star', N'/Assets/Images/ThuongHieu/hang-op.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (9, N'Orient', N'/Assets/Images/ThuongHieu/hang-orient.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (10, N'Seiko', N'/Assets/Images/ThuongHieu/hang-seiko.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhDD]) VALUES (11, N'SRWATCH', N'/Assets/Images/ThuongHieu/hang-srwatch.png')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
GO
SET IDENTITY_INSERT [dbo].[TrangThai] ON 

INSERT [dbo].[TrangThai] ([MaTT], [TenTT]) VALUES (1, N'Chưa duyệt')
INSERT [dbo].[TrangThai] ([MaTT], [TenTT]) VALUES (2, N'Đã duyệt')
INSERT [dbo].[TrangThai] ([MaTT], [TenTT]) VALUES (3, N'Đang vận chuyển')
INSERT [dbo].[TrangThai] ([MaTT], [TenTT]) VALUES (4, N'Giao hàng thành công')
INSERT [dbo].[TrangThai] ([MaTT], [TenTT]) VALUES (5, N'Hủy')
SET IDENTITY_INSERT [dbo].[TrangThai] OFF
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BaiViet_TaiKhoanCapNhat] FOREIGN KEY([TenTKCapNhat])
REFERENCES [dbo].[NhanVien] ([TaiKhoan])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_BaiViet_TaiKhoanCapNhat]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BaiViet_TaiKhoanDang] FOREIGN KEY([TenTKDang])
REFERENCES [dbo].[NhanVien] ([TaiKhoan])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_BaiViet_TaiKhoanDang]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_DongHo] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DongHo] ([MaDH])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_DongHo]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_DonHang] FOREIGN KEY([SoDH])
REFERENCES [dbo].[DonHang] ([SoDH])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_DonHang]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhap_DongHo] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DongHo] ([MaDH])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK_CTPhieuNhap_DongHo]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhap_PhieuNhap] FOREIGN KEY([SoPN])
REFERENCES [dbo].[PhieuNhap] ([SoPN])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK_CTPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [FK_DongHo_TaiKhoanCapNhat] FOREIGN KEY([TenTKCapNhat])
REFERENCES [dbo].[NhanVien] ([TaiKhoan])
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [FK_DongHo_TaiKhoanCapNhat]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [FK_DongHo_TaiKhoanDang] FOREIGN KEY([TenTKDang])
REFERENCES [dbo].[NhanVien] ([TaiKhoan])
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [FK_DongHo_TaiKhoanDang]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [FK_DongHo_ThuongHieu] FOREIGN KEY([MaTH])
REFERENCES [dbo].[ThuongHieu] ([MaTH])
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [FK_DongHo_ThuongHieu]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([TaiKhoanKH])
REFERENCES [dbo].[KhachHang] ([TaiKhoan])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NhanVien] FOREIGN KEY([TaiKhoanNV])
REFERENCES [dbo].[NhanVien] ([TaiKhoan])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NhanVien]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_TrangThai] FOREIGN KEY([MaTT])
REFERENCES [dbo].[TrangThai] ([MaTT])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_TrangThai]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_Nhom] FOREIGN KEY([MaNhom])
REFERENCES [dbo].[Nhom] ([MaNhom])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_Nhom]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVienCapNhat] FOREIGN KEY([TenTKCapNhat])
REFERENCES [dbo].[NhanVien] ([TaiKhoan])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVienCapNhat]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVienLap] FOREIGN KEY([TenTKLap])
REFERENCES [dbo].[NhanVien] ([TaiKhoan])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVienLap]
GO
USE [master]
GO
ALTER DATABASE [db_BanDongHo] SET  READ_WRITE 
GO
