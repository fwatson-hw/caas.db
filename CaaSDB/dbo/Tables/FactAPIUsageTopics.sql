CREATE TABLE [dbo].[FactAPIUsageTopics] (
    [FactAPIUsageTopicsKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [DateKey]               INT    NOT NULL,
    [ClientKey]             INT    NOT NULL,
    [ContentKey]            INT    NOT NULL,
    [StatusKey]             INT    NOT NULL,
    [Requests]              INT    NOT NULL,
    CONSTRAINT [PK_FactAPIUsageTopics] PRIMARY KEY CLUSTERED ([FactAPIUsageTopicsKey] ASC),
    CONSTRAINT [FK_FactAPIUsageTopics_DimClient] FOREIGN KEY ([ClientKey]) REFERENCES [dbo].[DimClient] ([ClientKey]),
    CONSTRAINT [FK_FactAPIUsageTopics_DimContent] FOREIGN KEY ([ContentKey]) REFERENCES [dbo].[DimContent] ([ContentKey]),
    CONSTRAINT [FK_FactAPIUsageTopics_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactAPIUsageTopics_DimStatus] FOREIGN KEY ([StatusKey]) REFERENCES [dbo].[DimStatus] ([StatusKey])
);

