CREATE TABLE [dbo].[FactAPIUsageArticles] (
    [FactAPIUsageArticlesKey] BIGINT NOT NULL,
    [DateKey]                 INT    NOT NULL,
    [ClientKey]               INT    NOT NULL,
    [ArticleKey]              INT    NOT NULL,
    [StatusKey]               INT    NOT NULL,
    [Requests]                INT    NOT NULL,
    CONSTRAINT [PK_FactAPIUsageArticles] PRIMARY KEY CLUSTERED ([FactAPIUsageArticlesKey] ASC)
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