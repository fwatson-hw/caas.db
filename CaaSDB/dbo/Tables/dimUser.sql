CREATE TABLE [dbo].[dimUser] (
    [UserKey]             INT            IDENTITY (1, 1) NOT NULL,
    [Username]            NVARCHAR (255) NOT NULL,
    [ClientToken]         NVARCHAR (500) NOT NULL,
    [SalesforceContactId] NVARCHAR (18)  NULL,
    [IsInferred]          BIT            CONSTRAINT [DF_dimUser_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]         DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId]  INT            NOT NULL
);

