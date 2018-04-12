CREATE TABLE [dbo].[FactEmbedContent] (
    [FactEmbedContentKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [DateKey]             INT    NOT NULL,
    [ClientKey]           INT    NOT NULL,
    [URLKey]              INT    NOT NULL,
    [ContentKey]          INT    NOT NULL,
    [StatusKey]           INT    NOT NULL,
    [Requests]            INT    NOT NULL,
	CONSTRAINT PK_FactEmbedContent PRIMARY KEY CLUSTERED(FactEmbedContentKey),
	CONSTRAINT FK_FactEmbedContent_DimDate FOREIGN KEY(DateKey) REFERENCES dbo.DimDate(DateKey),
	CONSTRAINT FK_FactEmbedContent_DimClient FOREIGN KEY(ClientKey) REFERENCES dbo.DimClient(ClientKey),
	CONSTRAINT FK_FactEmbedContent_DimURL FOREIGN KEY(URLKey) REFERENCES dbo.DimURL(URLKey),
	CONSTRAINT FK_FactEmbedContent_DimContent FOREIGN KEY(ContentKey) REFERENCES dbo.DimContent(ContentKey),
	CONSTRAINT FK_FactEmbedContent_DimStatus FOREIGN KEY(StatusKey) REFERENCES dbo.DimStatus(StatusKey)
);
GO
CREATE NONCLUSTERED INDEX IX_FactEmbedContent_DateKey ON dbo.FactEmbedContent(DateKey);
GO
CREATE NONCLUSTERED INDEX IX_FactEmbedContent_ClientKey ON dbo.FactEmbedContent(ClientKey);
GO
CREATE NONCLUSTERED INDEX IX_FactEmbedContent_URLKey ON dbo.FactEmbedContent(URLKey);
GO
CREATE NONCLUSTERED INDEX IX_FactEmbedContent_ContentKey ON dbo.FactEmbedContent(ContentKey);
GO
CREATE NONCLUSTERED INDEX IX_FactEmbedContent_StatusKey ON dbo.FactEmbedContent(StatusKey);
GO
