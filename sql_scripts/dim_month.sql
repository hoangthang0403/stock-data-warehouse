USE [stock_datawarehouse]
GO

/****** Object:  Table [dbo].[dim_month]    Script Date: 10/9/2024 12:38:28 AM ******/
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

