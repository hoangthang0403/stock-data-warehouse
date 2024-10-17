USE [stock_datawarehouse]
GO

/****** Object:  Table [dbo].[dim_quarter]    Script Date: 10/9/2024 12:38:36 AM ******/
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

