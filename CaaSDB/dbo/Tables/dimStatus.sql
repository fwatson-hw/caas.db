CREATE TABLE [dbo].[DimStatus] (
    [StatusKey]          INT           IDENTITY (1, 1) NOT NULL,
    [StatusCode]         INT           NOT NULL,
    [IsInferred]         BIT           CONSTRAINT [DF_DimStatus_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7) NOT NULL,
    [CreatedByPackageId] INT           NOT NULL,
	CONSTRAINT PK_DimStatus PRIMARY KEY CLUSTERED (StatusKey)
);
GO
CREATE NONCLUSTERED INDEX IX_DimStatus_StatusCode ON dbo.DimStatus(StatusCode);
GO
CREATE NONCLUSTERED INDEX IX_DimStatus_Inferred ON dbo.DimStatus(IsInferred, StatusKey);
GO

