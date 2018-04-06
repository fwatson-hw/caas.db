CREATE TABLE [Stg].[SplunkEmbedLogDetails] (
    [_time]      DATETIME        NULL,
    [cs_Referer] NVARCHAR (4000) NULL,
    [ecode]      NVARCHAR (500)  NULL,
    [topicId]    NVARCHAR (50)   NULL,
    [locale]     NVARCHAR (50)   NULL,
    [sc_status]  INT             NULL,
    [requests]   INT             NULL
);

