CREATE TABLE [dbo].[dimApplication] (
    [ApplicationKey]     INT            IDENTITY (1, 1) NOT NULL,
    [ApplicationId]      SMALLINT       NOT NULL,
    [ApplicationName]    NVARCHAR (255) NOT NULL,
    [IsInferred]         BIT            CONSTRAINT [DF_dimApplication_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  CONSTRAINT [DF_dimApplication_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedByPackageId] INT            NOT NULL
);

