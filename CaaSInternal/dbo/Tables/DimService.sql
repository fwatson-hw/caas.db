CREATE TABLE [dbo].[DimService] (
    [ServiceKey]         INT            NOT NULL,
    [ServiceName]        NVARCHAR (200) NOT NULL,
    [Path]               NVARCHAR (200) NOT NULL,
    [IsInferred]         BIT            NOT NULL,
    [CreatedDate]        DATETIME2 (7)  NOT NULL,
    [CreatedByPackageId] INT            NOT NULL,
    CONSTRAINT [PK_DimService] PRIMARY KEY CLUSTERED ([ServiceKey] ASC)
);

