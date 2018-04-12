CREATE TABLE [dbo].[DimUser] (
    [UserKey]             INT            IDENTITY (1, 1) NOT NULL,
    [Username]            NVARCHAR (255) NOT NULL,
    [ClientToken]         NVARCHAR (500) NOT NULL,
    [SalesforceContactId] NVARCHAR (18)  NULL,
    [IsInferred]          BIT            CONSTRAINT [DF_dimUser_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]         DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId]  INT            NOT NULL,
	CONSTRAINT PK_DimUser PRIMARY KEY CLUSTERED (UserKey)
);
GO
CREATE NONCLUSTERED INDEX IX_DimUser_Lookup ON dbo.DimUser(Username, SalesforceContactId, ClientToken);
GO
CREATE NONCLUSTERED INDEX IX_DimUser_Inferred ON dbo.DimUser(IsInferred, UserKey);
GO
