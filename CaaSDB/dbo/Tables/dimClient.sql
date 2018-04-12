CREATE TABLE [dbo].[dimClient] (
    [ClientKey]             INT            IDENTITY (1, 1) NOT NULL,
    [ClientToken]           NVARCHAR (255) NOT NULL,
    [Token]                 NVARCHAR (255) NOT NULL,
    [AuthorizationClientId] NVARCHAR (255) NOT NULL,
    [ClientName]            NVARCHAR (255) NOT NULL,
    [UrlAlias]              NVARCHAR (500) NOT NULL,
    [IsInferred]            BIT            CONSTRAINT [DF_dimClient_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]           DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId]    INT            NOT NULL,
	CONSTRAINT PK_dimClient PRIMARY KEY CLUSTERED(ClientKey)
);

