CREATE TABLE [dbo].[DimClient] (
    [ClientKey]          INT            NOT NULL,
    [ClientToken]        NVARCHAR (255) NOT NULL,
    [KeyId]              NVARCHAR (500) NOT NULL,
    [ClientName]         NVARCHAR (255) NOT NULL,
    [UrlAlias]           NVARCHAR (50)  NOT NULL,
    [IsInferred]         BIT            CONSTRAINT [DF_DimClient_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL
);

