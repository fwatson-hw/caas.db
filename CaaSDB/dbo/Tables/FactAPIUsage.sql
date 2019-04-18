CREATE TABLE [dbo].[FactAPIUsage] (
    [FactAPIUsageKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [DateKey]         INT    NOT NULL,
    [ServiceKey]      INT    NOT NULL,
    [MethodKey]       INT    NOT NULL,
    [StatusKey]       INT    NOT NULL,
    [ClientKey]       INT    NOT NULL,
    [Count]           INT    NOT NULL,
    CONSTRAINT [PK_FactAPIUsage] PRIMARY KEY CLUSTERED ([FactAPIUsageKey] ASC),
    CONSTRAINT [FK_FactAPIUsage_DimClient] FOREIGN KEY ([ClientKey]) REFERENCES [dbo].[DimClient] ([ClientKey]),
    CONSTRAINT [FK_FactAPIUsage_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactAPIUsage_DimMethod] FOREIGN KEY ([MethodKey]) REFERENCES [dbo].[DimMethod] ([MethodKey]),
    CONSTRAINT [FK_FactAPIUsage_DimService] FOREIGN KEY ([ServiceKey]) REFERENCES [dbo].[DimService] ([ServiceKey]),
    CONSTRAINT [FK_FactAPIUsage_DimStatus] FOREIGN KEY ([StatusKey]) REFERENCES [dbo].[DimStatus] ([StatusKey])
);

