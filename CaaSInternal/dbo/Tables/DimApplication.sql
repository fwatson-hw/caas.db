CREATE TABLE [dbo].[DimApplication] (
    [ApplicationKey]     INT            NOT NULL,
    [ApplicationId]      SMALLINT       NOT NULL,
    [ApplicationName]    NVARCHAR (255) NOT NULL,
    [IsInferred]         BIT            NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
	CONSTRAINT PK_DimApplication PRIMARY KEY CLUSTERED(ApplicationKey)
);
GO
CREATE NONCLUSTERED INDEX IX_DimApplication_ApplicationId ON dbo.DimApplication(ApplicationId);
GO
