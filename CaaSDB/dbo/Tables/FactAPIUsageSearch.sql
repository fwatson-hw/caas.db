CREATE TABLE [dbo].[FactAPIUsageSearch] (
    [FactAPIUsageSearchKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [DateKey]               INT    NOT NULL,
    [ClientKey]             INT    NOT NULL,
    [CodeFamilyKey]         INT    NOT NULL,
    [SearchTermKey]         INT    NOT NULL,
    [StatusKey]             INT    NOT NULL,
    [Requests]              INT    NOT NULL,
    CONSTRAINT [PK_FactAPIUsageSearch] PRIMARY KEY CLUSTERED ([FactAPIUsageSearchKey] ASC),
    CONSTRAINT [FK_FactAPIUsageSearch_DimClient] FOREIGN KEY ([ClientKey]) REFERENCES [dbo].[DimClient] ([ClientKey]),
    CONSTRAINT [FK_FactAPIUsageSearch_DimCodeFamily] FOREIGN KEY ([CodeFamilyKey]) REFERENCES [dbo].[DimCodeFamily] ([CodeFamilyKey]),
    CONSTRAINT [FK_FactAPIUsageSearch_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactAPIUsageSearch_DimSearchTerm] FOREIGN KEY ([SearchTermKey]) REFERENCES [dbo].[DimSearchTerm] ([SearchTermKey]),
    CONSTRAINT [FK_FactAPIUsageSearch_DimStatus] FOREIGN KEY ([StatusKey]) REFERENCES [dbo].[DimStatus] ([StatusKey])
);

