CREATE TABLE [dbo].[DimMethod] (
    [MethodKey]          INT            IDENTITY (1, 1) NOT NULL,
    [MethodName]         NVARCHAR (200) NOT NULL,
    [IsInferred]         BIT            CONSTRAINT [DF_DimMethod_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
    CONSTRAINT [PK_DimMethod] PRIMARY KEY CLUSTERED ([MethodKey] ASC)
);

