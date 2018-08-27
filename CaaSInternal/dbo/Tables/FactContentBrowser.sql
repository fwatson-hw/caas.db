CREATE TABLE [dbo].[FactContentBrowser] (
    [FactContentBrowserKey] BIGINT NOT NULL,
    [ContentKey]            INT    NOT NULL,
    [DateKey]               INT    NOT NULL,
    [ClientKey]             INT    NOT NULL,
    [UserKey]               INT    NOT NULL,
    [ApplicationKey]        INT    NOT NULL,
    [EventKey]              INT    NOT NULL,
    [Counts]                INT    NOT NULL,
	CONSTRAINT PK_FactContentBrowser PRIMARY KEY CLUSTERED (FactContentBrowserKey)
);
GO
CREATE INDEX IX_FactContentBrowser_ContentKey ON dbo.FactContentBrowser(ContentKey);
GO
CREATE INDEX IX_FactContentBrowser_DateKey ON dbo.FactContentBrowser(DateKey);
GO
CREATE INDEX IX_FactContentBrowser_ClientKey ON dbo.FactContentBrowser(ClientKey);
GO
CREATE INDEX IX_FactContentBrowser_UserKey ON dbo.FactContentBrowser(UserKey);
GO
CREATE INDEX IX_FactContentBrowser_ApplicationKey ON dbo.FactContentBrowser(ApplicationKey);
GO
CREATE INDEX IX_FactContentBrowser_EventKey ON dbo.FactContentBrowser(EventKey);
GO

