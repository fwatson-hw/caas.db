CREATE TABLE [dbo].[DimApplication] (
    [ApplicationKey]     INT            NOT NULL,
    [ApplicationId]      SMALLINT       NOT NULL,
    [ApplicationName]    NVARCHAR (255) NOT NULL,
    [IsInferred]         BIT            NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL
);

