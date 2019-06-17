﻿CREATE TABLE [dbo].[DimMethod] (
    [MethodKey]          INT            NOT NULL,
    [MethodName]         NVARCHAR (200) NOT NULL,
    [IsInferred]         BIT            NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
    CONSTRAINT [PK_DimMethod] PRIMARY KEY CLUSTERED ([MethodKey] ASC)
);

