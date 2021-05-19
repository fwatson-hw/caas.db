CREATE TABLE [dbo].[DimSearchTerm] (
    [SearchTermKey]      INT            IDENTITY (1, 1) NOT NULL,
    [SearchTerm]         NVARCHAR (500) NOT NULL,
    [IsInferred]         BIT            CONSTRAINT [DF_DimSearchTerm_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
    CONSTRAINT [PK_DimSearchTerm] PRIMARY KEY CLUSTERED ([SearchTermKey] ASC)
);

