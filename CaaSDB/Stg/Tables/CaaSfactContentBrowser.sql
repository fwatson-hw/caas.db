CREATE TABLE [Stg].[CaaSFactContentBrowser] (
    [FactContentBrowserKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [ContentKey]            INT    NOT NULL,
    [DateKey]               INT    NOT NULL,
    [ClientKey]             INT    NOT NULL,
    [UserKey]               INT    NOT NULL,
    [ApplicationKey]        INT    NOT NULL,
    [EventKey]              INT    NOT NULL,
    [Counts]                INT    NOT NULL,
	CONSTRAINT PK_CaasFactContentBrowser PRIMARY KEY CLUSTERED (FactContentBrowserKey)
);

