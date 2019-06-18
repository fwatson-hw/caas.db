CREATE TABLE [Stg].[SplunkAPIUsageArticles] (
    [SplunkAPIUsageArticlesID] BIGINT         IDENTITY (1, 1) NOT NULL,
    [Date]                     DATETIME       NULL,
    [clienttoken]              NVARCHAR (500) NULL,
	[jwtHWCONTENTCONFIGID]     NVARCHAR (500) NULL,
    [articleId]                NVARCHAR (100) NULL,
    [locale]                   NVARCHAR (50)  NULL,
    [sc_status]                INT            NULL,
    [jwtapplicationid]         NVARCHAR (200) NULL,
    [jwtscope]                 NVARCHAR (400) NULL,
    [requests]                 INT            NULL,
    CONSTRAINT [PK_SplunkAPIUsageArticles] PRIMARY KEY CLUSTERED ([SplunkAPIUsageArticlesID] ASC)
);



