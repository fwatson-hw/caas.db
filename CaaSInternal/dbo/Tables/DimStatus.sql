CREATE TABLE [dbo].[DimStatus] (
    [StatusKey]          INT           NOT NULL,
    [StatusCode]         INT           NOT NULL,
    [IsInferred]         BIT           NOT NULL,
    [CreatedDate]        DATETIME2 (7) NOT NULL,
    [CreatedByPackageId] INT           NOT NULL
);

