USE [stock_datawarehouse]
GO

/****** Object:  Table [dbo].[dim_date]    Script Date: 10/9/2024 12:38:17 AM ******/
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

