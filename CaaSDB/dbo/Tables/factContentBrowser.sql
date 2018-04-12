CREATE TABLE [dbo].[FactContentBrowser] (
    [FactContentBrowserKey] BIGINT IDENTITY (1, 1) NOT NULL,
    [ContentKey]            INT    NOT NULL,
    [DateKey]               INT    NOT NULL,
    [ClientKey]             INT    NOT NULL,
    [UserKey]               INT    NOT NULL,
    [ApplicationKey]        INT    NOT NULL,
    [EventKey]              INT    NOT NULL,
    [Counts]                INT    NOT NULL,
	CONSTRAINT PK_FactContentBrowser PRIMARY KEY CLUSTERED (FactContentBrowserKey),
	CONSTRAINT FK_FactContentBrowser_DimContent FOREIGN KEY (ContentKey) REFERENCES dbo.DimContent(ContentKey),
	CONSTRAINT FK_FactContentBrowser_DimDate FOREIGN KEY (DateKey) REFERENCES dbo.DimDate(DateKey),
	CONSTRAINT FK_FactContentBrowser_DimClient FOREIGN KEY (ClientKey) REFERENCES dbo.DimClient(ClientKey),
	CONSTRAINT FK_FactContentBrowser_DimUser FOREIGN KEY (UserKey) REFERENCES dbo.DimUser(UserKey),
	CONSTRAINT FK_FactContentBrowser_DimApplication FOREIGN KEY (ApplicationKey) REFERENCES dbo.DimApplication(ApplicationKey),
	CONSTRAINT FK_FactContentBrowser_DimEvent FOREIGN KEY (EventKey) REFERENCES dbo.DimEvent(EventKey)
);
GO
CREATE NONCLUSTERED INDEX IX_FactContentBrowser_ContentKey ON dbo.FactContentBrowser(ContentKey);
GO
CREATE NONCLUSTERED INDEX IX_FactContentBrowser_DateKey ON dbo.FactContentBrowser(DateKey);
GO
CREATE NONCLUSTERED INDEX IX_FactContentBrowser_ClientKey ON dbo.FactContentBrowser(ClientKey);
GO
CREATE NONCLUSTERED INDEX IX_FactContentBrowser_UserKey ON dbo.FactContentBrowser(UserKey);
GO
CREATE NONCLUSTERED INDEX IX_FactContentBrowser_ApplicationKey ON dbo.FactContentBrowser(ApplicationKey);
GO
CREATE NONCLUSTERED INDEX IX_FactContentBrowser_EventKey ON dbo.FactContentBrowser(EventKey);
GO
