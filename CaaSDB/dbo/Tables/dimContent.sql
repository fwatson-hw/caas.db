CREATE TABLE [dbo].[dimContent] (
    [ContentKey]         INT            IDENTITY (1, 1) NOT NULL,
    [TopicId]            NVARCHAR (100) NOT NULL,
    [Title]              NVARCHAR (500) NOT NULL,
    [DetailLevel]        NVARCHAR (50)  NOT NULL,
    [Locale]             NVARCHAR (50)  NOT NULL,
    [Concept]            NVARCHAR (100) NOT NULL,
    [Category]           NVARCHAR (100) NOT NULL,
    [IsInferred]         BIT            CONSTRAINT [DF_dimContent_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
	CONSTRAINT PK_dimContent PRIMARY KEY CLUSTERED (ContentKey)
);

