CREATE TABLE [Stg].[SplunkContentBrowserEmbedCopies] (
	SplunkContentBrowserEmbedCopyID INT IDENTITY(1,1) NOT NULL,
    EventDateTime               DATETIME       NULL,
    [username]            NVARCHAR (100) NULL,
    [clientToken]         NVARCHAR (500) NULL,
    [event]               NVARCHAR (50)  NULL,
    [application]         NVARCHAR (50)  NULL,
    [categoryId]          NVARCHAR (50)  NULL,
    [conceptId]           NVARCHAR (50)  NULL,
    [topicId]             NVARCHAR (50)  NULL,
    [copies]              INT            NULL,
    [clientToken_varchar] VARCHAR (500)  NULL,
    [event_varchar]       VARCHAR (50)   NULL,
	CONSTRAINT PK_SplunkContentBrowserEmbedCopies PRIMARY KEY CLUSTERED (SplunkContentBrowserEmbedCopyID)
);

