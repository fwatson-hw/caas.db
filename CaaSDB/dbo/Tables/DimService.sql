CREATE TABLE [dbo].[DimService] (
    [ServiceKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ServiceName]        NVARCHAR (200) NOT NULL,
    [Path]               NVARCHAR (200) NOT NULL,
    [IsInferred]         BIT            CONSTRAINT [DF_DimService_IsInferred] DEFAULT ((0)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
    CONSTRAINT [PK_DimService] PRIMARY KEY CLUSTERED ([ServiceKey] ASC)
);

