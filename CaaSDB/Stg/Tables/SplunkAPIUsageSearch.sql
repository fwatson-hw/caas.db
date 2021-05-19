CREATE TABLE [Stg].[SplunkAPIUsageSearch] (
    [Date]                 DATETIME       NULL,
    [clienttoken]          NVARCHAR (500) NULL,
    [jwtHWCONTENTCONFIGID] NVARCHAR (500) NULL,
    [q]                    NVARCHAR (500) NULL,
    [locale]               NVARCHAR (50)  NULL,
    [sc_status]            INT            NULL,
    [jwtapplicationid]     NVARCHAR (200) NULL,
    [jwtscope]             NVARCHAR (400) NULL,
    [requests]             INT            NULL
);

