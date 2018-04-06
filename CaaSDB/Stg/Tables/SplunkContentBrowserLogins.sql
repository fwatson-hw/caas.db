CREATE TABLE [Stg].[SplunkContentBrowserLogins] (
    [_time]               DATETIME       NULL,
    [username]            NVARCHAR (100) NULL,
    [clientToken]         NVARCHAR (500) NULL,
    [event]               NVARCHAR (50)  NULL,
    [application]         NVARCHAR (50)  NULL,
    [logins]              INT            NULL,
    [clientToken_varchar] VARCHAR (500)  NULL,
    [event_varchar]       VARCHAR (50)   NULL
);

