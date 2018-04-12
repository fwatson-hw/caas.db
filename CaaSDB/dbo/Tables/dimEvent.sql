CREATE TABLE [dbo].[dimEvent] (
    [EventKey]           INT           IDENTITY (1, 1) NOT NULL,
    [EventName]          VARCHAR (255) NOT NULL,
    [IsInferred]         BIT           CONSTRAINT [DF_dimEvent_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7) NOT NULL,
    [CreatedByPackageId] INT           NOT NULL,
	CONSTRAINT PK_dimEvent PRIMARY KEY CLUSTERED (EventKey)
);

