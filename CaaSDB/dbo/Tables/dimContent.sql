CREATE TABLE [dbo].[DimContent] (
    [ContentKey]         INT            IDENTITY (1, 1) NOT NULL,
    [TopicId]            NVARCHAR (100) NOT NULL,
    [Title]              NVARCHAR (500) NOT NULL,
    [DetailLevel]        NVARCHAR (50)  NOT NULL,
    [Locale]             NVARCHAR (50)  NOT NULL,
    [Concept]            NVARCHAR (100) NOT NULL,
    [Category]           NVARCHAR (100) NOT NULL,
    [IsInferred]         BIT            CONSTRAINT [DF_DimContent_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
	CONSTRAINT PK_DimContent PRIMARY KEY CLUSTERED (ContentKey)
);
GO
CREATE NONCLUSTERED INDEX IX_DimContent_Lookup ON dbo.DimContent(TopicId, Locale, Title, DetailLevel, Concept, Category);
GO
CREATE NONCLUSTERED INDEX IX_DimContent_Inferred ON dbo.DimContent(IsInferred, ContentKey);
GO

