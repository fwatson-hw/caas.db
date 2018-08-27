CREATE TABLE [dbo].[DimContent] (
    [ContentKey]         INT            NOT NULL,
    [TopicId]            NVARCHAR (100) NOT NULL,
    [Title]              NVARCHAR (500) NOT NULL,
    [DetailLevel]        NVARCHAR (50)  NOT NULL,
    [Locale]             NVARCHAR (50)  NOT NULL,
    [Concept]            NVARCHAR (100) NOT NULL,
    [Category]           NVARCHAR (100) NOT NULL,
    [IsInferred]         BIT            NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
	CONSTRAINT PK_DimContent PRIMARY KEY CLUSTERED (ContentKey)
);

