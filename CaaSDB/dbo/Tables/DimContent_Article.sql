CREATE TABLE [dbo].[DimContent_Article] (
    [ArticleKey]         INT            IDENTITY (1, 1) NOT NULL,
    [Hwid]               NVARCHAR (100) NOT NULL,
    [Title]              NVARCHAR (500) NOT NULL,
    [Type]               NVARCHAR (100) NOT NULL,
    [Family]             NVARCHAR (100) NOT NULL,
    [Locale]             NVARCHAR (50)  NOT NULL,
    [Version]            NVARCHAR (100) NOT NULL,
    [AuthoringVersion]   NVARCHAR (100) NOT NULL,
    [ReleaseDate]        DATE           NOT NULL,
    [IsInferred]         BIT            CONSTRAINT [DF_DimContent_Article_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
    CONSTRAINT [PK_DimContent_Article] PRIMARY KEY CLUSTERED ([ArticleKey] ASC)
);

