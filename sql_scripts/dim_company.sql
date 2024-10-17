USE [stock_datawarehouse]
GO

/****** Object:  Table [dbo].[dim_company]    Script Date: 10/9/2024 12:38:05 AM ******/
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

