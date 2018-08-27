CREATE TABLE [dbo].[DimUser] (
    [UserKey]             INT            NOT NULL,
    [Username]            NVARCHAR (255) NOT NULL,
    [ClientToken]         NVARCHAR (500) NOT NULL,
    [SalesforceContactId] NVARCHAR (18)  NULL,
    [IsInferred]          BIT            NOT NULL,
    [CreatedDate]         DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId]  INT            NOT NULL
);

