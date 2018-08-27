CREATE TABLE [dbo].[DimEvent] (
    [EventKey]           INT           NOT NULL,
    [EventName]          VARCHAR (255) NOT NULL,
    [IsInferred]         BIT           NOT NULL,
    [CreatedDate]        DATETIME2 (7) NOT NULL,
    [CreatedByPackageId] INT           NOT NULL
);

