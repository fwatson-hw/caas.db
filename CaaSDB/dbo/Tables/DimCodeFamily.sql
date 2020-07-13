CREATE TABLE [dbo].[DimCodeFamily] (
    [CodeFamilyKey]      INT            IDENTITY (1, 1) NOT NULL,
    [CodeFamily]         NVARCHAR (100) NOT NULL,
    [IsInferred]         BIT            CONSTRAINT [DF_DimCodeFamily_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
    CONSTRAINT [PK_DimCodeFamily] PRIMARY KEY CLUSTERED ([CodeFamilyKey] ASC)
);

