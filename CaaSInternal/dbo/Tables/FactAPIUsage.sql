CREATE TABLE [dbo].[FactAPIUsage] (
    [FactAPIUsageKey] BIGINT NOT NULL,
    [DateKey]         INT    NOT NULL,
    [ServiceKey]      INT    NOT NULL,
    [MethodKey]       INT    NOT NULL,
    [StatusKey]       INT    NOT NULL,
    [ClientKey]       INT    NOT NULL,
    [Count]           INT    NOT NULL,
    CONSTRAINT [PK_FactAPIUsage] PRIMARY KEY CLUSTERED ([FactAPIUsageKey] ASC)
);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsage_ClientKey ON dbo.FactAPIUsage(ClientKey);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsage_DateKey ON dbo.FactAPIUsage(DateKey);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsage_MethodKey ON dbo.FactAPIUsage(MethodKey);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsage_ServiceKey ON dbo.FactAPIUsage(ServiceKey);
GO
CREATE NONCLUSTERED INDEX IX_FactAPIUsage_StatusKey ON dbo.FactAPIUsage(StatusKey);
GO
