CREATE TABLE [Stg].[SplunkContentBrowserLogins] (
	SplunkContentBrowserLoginID INT IDENTITY(1,1) NOT NULL,
    EventDateTime               DATETIME       NULL,
    [username]            NVARCHAR (100) NULL,
    [clientToken]         NVARCHAR (500) NULL,
    [event]               NVARCHAR (50)  NULL,
    [application]         NVARCHAR (50)  NULL,
    [logins]              INT            NULL,
    [clientToken_varchar] VARCHAR (500)  NULL,
    [event_varchar]       VARCHAR (50)   NULL,
	CONSTRAINT PK_SplunkContentBrowserLogins PRIMARY KEY CLUSTERED (SplunkContentBrowserLoginID)
);

