CREATE TABLE [dbo].[FactAPIUsageTopics] (
    [FactAPIUsageTopicsKey] BIGINT NOT NULL,
    [DateKey]               INT    NOT NULL,
    [ClientKey]             INT    NOT NULL,
    [ContentKey]            INT    NOT NULL,
    [StatusKey]             INT    NOT NULL,
    [Requests]              INT    NOT NULL,
    CONSTRAINT [PK_FactAPIUsageTopics] PRIMARY KEY CLUSTERED ([FactAPIUsageTopicsKey] ASC)
);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsageTopics_ClientKey ON dbo.FactAPIUsageTopics(ClientKey);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsageTopics_ContentKey ON dbo.FactAPIUsageTopics(ContentKey);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsageTopics_DateKey ON dbo.FactAPIUsageTopics(DateKey);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsageTopics_StatusKey ON dbo.FactAPIUsageTopics(StatusKey);
GO
