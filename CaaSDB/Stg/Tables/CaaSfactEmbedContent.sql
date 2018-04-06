CREATE TABLE [Stg].[CaaSfactEmbedContent] (
    [FactEmbedContentKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [DateKey]             INT    NOT NULL,
    [ClientKey]           INT    NOT NULL,
    [URLKey]              INT    NOT NULL,
    [ContentKey]          INT    NOT NULL,
    [StatusKey]           INT    NOT NULL,
    [Requests]            INT    NOT NULL
);

