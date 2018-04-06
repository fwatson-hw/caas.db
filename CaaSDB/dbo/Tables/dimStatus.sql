CREATE TABLE [dbo].[dimStatus] (
    [StatusKey]          INT           IDENTITY (1, 1) NOT NULL,
    [StatusCode]         INT           NOT NULL,
    [IsInferred]         BIT           CONSTRAINT [DF_dimStatus_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7) NOT NULL,
    [CreatedByPackageId] INT           NOT NULL
);

