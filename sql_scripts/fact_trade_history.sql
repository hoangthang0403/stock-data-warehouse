USE [stock_datawarehouse]
GO

/****** Object:  Table [dbo].[fact_trade_history]    Script Date: 10/9/2024 12:38:57 AM ******/
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

