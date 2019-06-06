CREATE TABLE [Stg].[CaaSFactAPIUsageTopics] (
    [FactAPIUsageTopicsKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [DateKey]               INT    NOT NULL,
    [ClientKey]             INT    NOT NULL,
    [ContentKey]            INT    NOT NULL,
    [StatusKey]             INT    NOT NULL,
    [Requests]              INT    NOT NULL,
    CONSTRAINT [PK_CaasFactAPIUsageTopics] PRIMARY KEY CLUSTERED ([FactAPIUsageTopicsKey] ASC)
);

