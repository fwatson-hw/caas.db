CREATE TABLE [dbo].[DimClient] (
    [ClientKey]             INT            IDENTITY (1, 1) NOT NULL,
    [ClientToken]           NVARCHAR (255) NOT NULL,
    [DefaultContentConfigurationId]                 NVARCHAR (500) NOT NULL,
    [ClientName]            NVARCHAR (255) NOT NULL,
    [UrlAlias]              NVARCHAR (500) NOT NULL,
    [IsInferred]            BIT            CONSTRAINT [DF_DimClient_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]           DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId]    INT            NOT NULL,
	CONSTRAINT PK_DimClient PRIMARY KEY CLUSTERED(ClientKey)
);
GO
CREATE NONCLUSTERED INDEX IX_DimClient_Lookup ON dbo.DimClient(ClientToken, DefaultContentConfigurationId);
GO
CREATE NONCLUSTERED INDEX IX_DimClient_Inferred ON dbo.DimClient(IsInferred, ClientKey);
GO