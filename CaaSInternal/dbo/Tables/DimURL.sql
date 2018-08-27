CREATE TABLE [dbo].[DimURL] (
    [URLKey]             INT             NOT NULL,
    [URL]                NVARCHAR (4000) NOT NULL,
    [URLDomain]          NVARCHAR (500)  NOT NULL,
    [IsInferred]         BIT             NOT NULL,
    [CreatedDate]        DATETIME2 (7)   NOT NULL,
    [CreatedByPackageId] INT             NOT NULL
);

