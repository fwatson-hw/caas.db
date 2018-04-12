CREATE TABLE [dbo].[DimEvent] (
    [EventKey]           INT           IDENTITY (1, 1) NOT NULL,
    [EventName]          VARCHAR (255) NOT NULL,
    [IsInferred]         BIT           CONSTRAINT [DF_DimEvent_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7) NOT NULL,
    [CreatedByPackageId] INT           NOT NULL,
	CONSTRAINT PK_DimEvent PRIMARY KEY CLUSTERED (EventKey)
);
GO
CREATE NONCLUSTERED INDEX IX_DimEvent_EventName ON dbo.DimEvent(EventName);
GO
CREATE NONCLUSTERED INDEX IX_DimEvent_Inferred ON dbo.DimEvent(IsInferred, EventKey);
GO
