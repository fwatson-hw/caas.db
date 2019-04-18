CREATE TABLE [dbo].[FactAPIUsageArticles] (
    [FactAPIUsageArticlesKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [DateKey]                 INT    NOT NULL,
    [ClientKey]               INT    NOT NULL,
    [ArticleKey]              INT    NOT NULL,
    [StatusKey]               INT    NOT NULL,
    [Requests]                INT    NOT NULL,
    CONSTRAINT [PK_FactAPIUsageArticles] PRIMARY KEY CLUSTERED ([FactAPIUsageArticlesKey] ASC),
    CONSTRAINT [FK_FactAPIUsageArticles_DimClient] FOREIGN KEY ([ClientKey]) REFERENCES [dbo].[DimClient] ([ClientKey]),
    CONSTRAINT [FK_FactAPIUsageArticles_DimContent_Article] FOREIGN KEY ([ArticleKey]) REFERENCES [dbo].[DimContent_Article] ([ArticleKey]),
    CONSTRAINT [FK_FactAPIUsageArticles_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactAPIUsageArticles_DimStatus] FOREIGN KEY ([StatusKey]) REFERENCES [dbo].[DimStatus] ([StatusKey])
);

