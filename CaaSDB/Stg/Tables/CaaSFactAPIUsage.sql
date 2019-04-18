CREATE TABLE [Stg].[CaaSFactAPIUsage] (
    [FactAPIUsageKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [DateKey]         INT    NOT NULL,
    [ServiceKey]      INT    NOT NULL,
    [MethodKey]       INT    NOT NULL,
    [StatusKey]       INT    NOT NULL,
    [ClientKey]       INT    NOT NULL,
    [Count]           INT    NOT NULL,
    CONSTRAINT [PK_CaasFactAPIUsage] PRIMARY KEY CLUSTERED ([FactAPIUsageKey] ASC)
);

