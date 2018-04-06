CREATE TABLE [Stg].[CaaSfactContentBrowser] (
    [FactContentBrowserKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [ContentKey]            INT    NOT NULL,
    [DateKey]               INT    NOT NULL,
    [ClientKey]             INT    NOT NULL,
    [UserKey]               INT    NOT NULL,
    [ApplicationKey]        INT    NOT NULL,
    [EventKey]              INT    NOT NULL,
    [Counts]                INT    NOT NULL
);

