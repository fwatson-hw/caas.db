CREATE TABLE [Stg].[SplunkAPIUsage] (
    [Date]                   DATETIME       NULL,
    [serviceInfoServiceName] NVARCHAR (200) NULL,
    [path]                   NVARCHAR (200) NULL,
    [jwtContentVersion]      NVARCHAR (200) NULL,
    [method]                 NVARCHAR (200) NULL,
    [httpStatusCode]         NVARCHAR (200) NULL,
    [jwtClientToken]         NVARCHAR (200) NULL,
    [jwtApplicationId]       NVARCHAR (200) NULL,
    [jwtScope]               NVARCHAR (400) NULL,
    [Count]                  NVARCHAR (200) NULL
);



