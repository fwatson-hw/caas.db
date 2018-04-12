CREATE TABLE [dbo].[DimApplication] (
    [ApplicationKey]     INT            IDENTITY (1, 1) NOT NULL,
    [ApplicationId]      SMALLINT       NOT NULL,
    [ApplicationName]    NVARCHAR (255) NOT NULL,
    [IsInferred]         BIT            CONSTRAINT [DF_DimApplication_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  CONSTRAINT [DF_DimApplication_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
	CONSTRAINT PK_DimApplication PRIMARY KEY CLUSTERED (ApplicationKey)
);
GO
CREATE NONCLUSTERED INDEX IX_DimApplication_ApplicationName ON dbo.DimApplication(ApplicationName);
GO
CREATE NONCLUSTERED INDEX IX_DimApplication_ApplicationId ON dbo.DimApplication(ApplicationId);
GO
CREATE NONCLUSTERED INDEX IX_DimApplication_Inferred ON dbo.DimApplication(IsInferred, ApplicationKey);
GO
