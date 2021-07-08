CREATE TABLE [Stg].[SplunkEmbedLogDetails] (
	SplunkEmbedLogDetailID INT IDENTITY(1,1) NOT NULL,
    EventDateTime      DATETIME        NULL,
    [cs_Referrer] NVARCHAR (4000) NULL,
    [ecode]      NVARCHAR (500)  NULL,
    [topicId]    NVARCHAR (100)   NULL,
    [locale]     NVARCHAR (50)   NULL,
    [sc_status]  INT             NULL,
    [requests]   INT             NULL,
	CONSTRAINT PK_SplunkEmbedLogDetails PRIMARY KEY CLUSTERED (SplunkEmbedLogDetailID)
);

