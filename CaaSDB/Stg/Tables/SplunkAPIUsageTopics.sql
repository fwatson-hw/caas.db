CREATE TABLE [Stg].[SplunkAPIUsageTopics] (
    [SplunkAPIUsageTopicsID] BIGINT         IDENTITY (1, 1) NOT NULL,
    [Date]                   DATETIME       NULL,
    [clienttoken]            NVARCHAR (500) NULL,
    [topicId]                NVARCHAR (50)  NULL,
    [locale]                 NVARCHAR (50)  NULL,
    [sc_status]              INT            NULL,
    [jwtapplicationid]       NVARCHAR (200) NULL,
    [jwtscope]               NVARCHAR (400) NULL,
    [requests]               INT            NULL,
    CONSTRAINT [PK_SplunkAPIUsageTopics] PRIMARY KEY CLUSTERED ([SplunkAPIUsageTopicsID] ASC)
);



