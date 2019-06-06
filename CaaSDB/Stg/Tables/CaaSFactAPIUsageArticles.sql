CREATE TABLE [Stg].[CaaSFactAPIUsageArticles] (
    [FactAPIUsageArticlesKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [DateKey]                 INT    NOT NULL,
    [ClientKey]               INT    NOT NULL,
    [ArticleKey]              INT    NOT NULL,
    [StatusKey]               INT    NOT NULL,
    [Requests]                INT    NOT NULL,
    CONSTRAINT [PK_CaasFactAPIUsageArticles] PRIMARY KEY CLUSTERED ([FactAPIUsageArticlesKey] ASC)
);

