USE [master]
GO
/****** Object:  Database [stock_datawarehouse]    Script Date: 10/9/2024 12:41:43 AM ******/
CREATE DATABASE [stock_datawarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'stock_datawarehouse', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\stock_datawarehouse.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'stock_datawarehouse_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\stock_datawarehouse_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [stock_datawarehouse] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [stock_datawarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [stock_datawarehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [stock_datawarehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [stock_datawarehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET  ENABLE_BROKER 
GO
ALTER DATABASE [stock_datawarehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [stock_datawarehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET RECOVERY FULL 
GO
ALTER DATABASE [stock_datawarehouse] SET  MULTI_USER 
GO
ALTER DATABASE [stock_datawarehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [stock_datawarehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [stock_datawarehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [stock_datawarehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [stock_datawarehouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [stock_datawarehouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'stock_datawarehouse', N'ON'
GO
ALTER DATABASE [stock_datawarehouse] SET QUERY_STORE = ON
GO
ALTER DATABASE [stock_datawarehouse] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [stock_datawarehouse]
GO
/****** Object:  Table [dbo].[dim_company]    Script Date: 10/9/2024 12:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_company](
	[ticker] [nchar](3) NOT NULL,
	[exchange] [nchar](5) NOT NULL,
	[industry] [nvarchar](50) NOT NULL,
	[company_type] [nvarchar](35) NOT NULL,
	[no_shareholders] [bigint] NOT NULL,
	[foreign_percent] [float] NOT NULL,
	[outstanding_share] [float] NOT NULL,
	[issue_share] [float] NOT NULL,
	[established_year] [int] NOT NULL,
	[no_employees] [int] NOT NULL,
	[stock_rating] [float] NULL,
	[delta_in_week] [float] NULL,
	[delta_in_month] [float] NULL,
	[delta_in_year] [float] NULL,
	[short_name] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_dim_company] PRIMARY KEY CLUSTERED 
(
	[ticker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_date]    Script Date: 10/9/2024 12:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_date](
	[date] [date] NOT NULL,
	[month_id] [int] NOT NULL,
	[quarter_id] [int] NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_dim_date] PRIMARY KEY CLUSTERED 
(
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_month]    Script Date: 10/9/2024 12:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_month](
	[month_id] [int] NOT NULL,
	[month_name_short] [nchar](10) NOT NULL,
	[month_name_long] [nvarchar](10) NOT NULL,
	[month_number] [int] NOT NULL,
 CONSTRAINT [PK_dim_month] PRIMARY KEY CLUSTERED 
(
	[month_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_quarter]    Script Date: 10/9/2024 12:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_quarter](
	[quarter_id] [int] NOT NULL,
	[quarter_name_short] [nchar](10) NOT NULL,
	[quarter_name_long] [nchar](10) NOT NULL,
	[quarter_number] [int] NOT NULL,
 CONSTRAINT [PK_dim_quarter] PRIMARY KEY CLUSTERED 
(
	[quarter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_finance_ratio]    Script Date: 10/9/2024 12:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_finance_ratio](
	[ticker] [nchar](3) NOT NULL,
	[year] [char](4) NOT NULL,
	[market_capital] [bigint] NOT NULL,
	[price_to_earn] [float] NOT NULL,
	[price_to_book] [float] NOT NULL,
	[eps] [float] NOT NULL,
	[bvps] [float] NOT NULL,
	[roe] [float] NOT NULL,
	[roa] [float] NOT NULL,
	[net_profit_margin] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_trade_history]    Script Date: 10/9/2024 12:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_trade_history](
	[ticker] [nchar](3) NOT NULL,
	[date] [date] NOT NULL,
	[open] [float] NULL,
	[high] [float] NULL,
	[low] [float] NULL,
	[close] [float] NULL,
	[volume] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dim_date]  WITH CHECK ADD  CONSTRAINT [FK_dim_date_dim_month] FOREIGN KEY([month_id])
REFERENCES [dbo].[dim_month] ([month_id])
GO
ALTER TABLE [dbo].[dim_date] CHECK CONSTRAINT [FK_dim_date_dim_month]
GO
ALTER TABLE [dbo].[dim_date]  WITH CHECK ADD  CONSTRAINT [FK_dim_date_dim_quarter] FOREIGN KEY([quarter_id])
REFERENCES [dbo].[dim_quarter] ([quarter_id])
GO
ALTER TABLE [dbo].[dim_date] CHECK CONSTRAINT [FK_dim_date_dim_quarter]
GO
ALTER TABLE [dbo].[fact_finance_ratio]  WITH CHECK ADD  CONSTRAINT [FK_fact_ratio_finance_dim_company] FOREIGN KEY([ticker])
REFERENCES [dbo].[dim_company] ([ticker])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[fact_finance_ratio] CHECK CONSTRAINT [FK_fact_ratio_finance_dim_company]
GO
ALTER TABLE [dbo].[fact_trade_history]  WITH CHECK ADD  CONSTRAINT [FK_fact_trade_history_dim_company] FOREIGN KEY([ticker])
REFERENCES [dbo].[dim_company] ([ticker])
GO
ALTER TABLE [dbo].[fact_trade_history] CHECK CONSTRAINT [FK_fact_trade_history_dim_company]
GO
ALTER TABLE [dbo].[fact_trade_history]  WITH CHECK ADD  CONSTRAINT [FK_fact_trade_history_dim_date] FOREIGN KEY([date])
REFERENCES [dbo].[dim_date] ([date])
GO
ALTER TABLE [dbo].[fact_trade_history] CHECK CONSTRAINT [FK_fact_trade_history_dim_date]
GO
USE [master]
GO
ALTER DATABASE [stock_datawarehouse] SET  READ_WRITE 
GO
