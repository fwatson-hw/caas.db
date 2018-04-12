CREATE TABLE [dbo].[DimURL] (
    [URLKey]             INT             IDENTITY (1, 1) NOT NULL,
    [URL]                NVARCHAR (4000) NOT NULL,
    [URLDomain]          NVARCHAR (500)  NOT NULL,
    [IsInferred]         BIT             CONSTRAINT [DF_DimURL_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)   NOT NULL,
    [CreatedByPackageId] INT             NOT NULL,
	CONSTRAINT PK_DimURL PRIMARY KEY CLUSTERED (URLKey)
);
GO
CREATE NONCLUSTERED INDEX IX_DimURL_URL ON dbo.DimURL(URL);
GO
