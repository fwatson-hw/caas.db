CREATE TABLE [dbo].[FactEmbedContent] (
    [FactEmbedContentKey] BIGINT NOT NULL,
    [DateKey]             INT    NOT NULL,
    [ClientKey]           INT    NOT NULL,
    [URLKey]              INT    NOT NULL,
    [ContentKey]          INT    NOT NULL,
    [StatusKey]           INT    NOT NULL,
    [Requests]            INT    NOT NULL,
	CONSTRAINT PK_FactEmbedContent PRIMARY KEY CLUSTERED (FactEmbedContentKey)
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

