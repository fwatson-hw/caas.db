CREATE TABLE [dbo].[dimURL] (
    [URLKey]             INT             IDENTITY (1, 1) NOT NULL,
    [URL]                NVARCHAR (4000) NOT NULL,
    [URLDomain]          NVARCHAR (500)  NOT NULL,
    [IsInferred]         BIT             CONSTRAINT [DF_dimURL_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)   NOT NULL,
    [CreatedByPackageId] INT             NOT NULL
);

