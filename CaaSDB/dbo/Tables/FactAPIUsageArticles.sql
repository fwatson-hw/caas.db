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
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsageArticles_ClientKey ON dbo.FactAPIUsageArticles(ClientKey);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsageArticles_ArticleKey ON dbo.FactAPIUsageArticles(ArticleKey);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsageArticles_DateKey ON dbo.FactAPIUsageArticles(DateKey);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsageArticles_StatusKey ON dbo.FactAPIUsageArticles(StatusKey);
GO