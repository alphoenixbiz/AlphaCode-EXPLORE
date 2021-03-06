USE [EskomDB_Team2]
GO
/****** Object:  Table [dbo].[AllStations]    Script Date: 3/20/2020 7:53:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllStations](
	[StationName] [nvarchar](50) NOT NULL,
	[TotalInstalledCapacity] [nvarchar](50) NULL,
	[TotalNominalCapacity] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[StationType] [nvarchar](50) NULL,
 CONSTRAINT [PK_AllStations] PRIMARY KEY CLUSTERED 
(
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectricityGenerated]    Script Date: 3/20/2020 7:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectricityGenerated](
	[ElectricityDistributed] [float] NULL,
	[Date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Population]    Script Date: 3/20/2020 7:53:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Population](
	[Year] [bigint] NULL,
	[Population_Size] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProvinceElectricity]    Script Date: 3/20/2020 7:53:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProvinceElectricity](
	[Province] [nvarchar](50) NULL,
	[Year] [smallint] NULL,
	[Households] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 3/20/2020 7:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Station](
	[StationID] [int] IDENTITY(1,1) NOT NULL,
	[StationName] [nvarchar](50) SPARSE  NULL,
	[Province] [nvarchar](50) NULL,
	[DateCommissioned] [smallint] NULL,
	[CapacityPlanned] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Coordinates] [nvarchar](50) NULL,
	[Operator] [nvarchar](50) NOT NULL,
	[PlannedDecommissioning] [nvarchar](50) NULL,
	[Notes] [nvarchar](100) NULL,
	[StationType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Stations_1] PRIMARY KEY CLUSTERED 
(
	[StationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Station]  WITH NOCHECK ADD  CONSTRAINT [FK_Stations_AllStations1] FOREIGN KEY([StationName])
REFERENCES [dbo].[AllStations] ([StationName])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Station] NOCHECK CONSTRAINT [FK_Stations_AllStations1]
GO
