USE [stock_datawarehouse]
GO

/****** Object:  Table [dbo].[fact_finance_ratio]    Script Date: 10/9/2024 12:38:46 AM ******/
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

ALTER TABLE [dbo].[fact_finance_ratio]  WITH CHECK ADD  CONSTRAINT [FK_fact_ratio_finance_dim_company] FOREIGN KEY([ticker])
REFERENCES [dbo].[dim_company] ([ticker])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[fact_finance_ratio] CHECK CONSTRAINT [FK_fact_ratio_finance_dim_company]
GO

