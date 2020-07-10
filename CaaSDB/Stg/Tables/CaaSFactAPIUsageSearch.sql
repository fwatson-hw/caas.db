CREATE TABLE [Stg].[CaaSFactAPIUsageSearch] (
    [FactAPIUsageSearchKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [DateKey]               INT    NOT NULL,
    [ClientKey]             INT    NOT NULL,
    [CodeFamilyKey]         INT    NOT NULL,
    [SearchTermKey]         INT    NOT NULL,
    [StatusKey]             INT    NOT NULL,
    [Requests]              INT    NOT NULL,
    CONSTRAINT [PK_CaasFactAPIUsageSearch] PRIMARY KEY CLUSTERED ([FactAPIUsageSearchKey] ASC)
);

