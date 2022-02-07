DROP TABLE ColorSample
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorSample]
(
	[ID]          [INT]      IDENTITY(1,1) NOT NULL,
	[ColorNumber] [INT]NOT NULL,
	[ColorName]   [CHAR](10) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ColorSample] ADD  CONSTRAINT [DF_ColorSample_Int]  DEFAULT (0) FOR [ColorNumber]
GO
