﻿CREATE TABLE [dbo].[DimDate] (
    [DateKey]                    INT          NOT NULL,
    [Date]                       DATE         NULL,
    [FullDate]                   CHAR (10)    NULL,
    [DayOfMonth]                 VARCHAR (2)  NULL,
    [DaySuffix]                  VARCHAR (4)  NULL,
    [DayName]                    VARCHAR (9)  NULL,
    [DayOfWeek]                  CHAR (1)     NULL,
    [DayOfWeekInMonthOccurrence] VARCHAR (2)  NULL,
    [DayOfWeekInYearOccurrence]  VARCHAR (2)  NULL,
    [DayOfQuarterOccurrence]     VARCHAR (3)  NULL,
    [DayOfYear]                  VARCHAR (3)  NULL,
    [WeekOfMonth]                VARCHAR (1)  NULL,
    [WeekOfQuarter]              VARCHAR (2)  NULL,
    [WeekOfYear]                 VARCHAR (2)  NULL,
    [Month]                      INT          NULL,
    [MonthName]                  VARCHAR (9)  NULL,
    [MonthOfQuarter]             VARCHAR (2)  NULL,
    [Quarter]                    INT          NULL,
    [QuarterName]                VARCHAR (9)  NULL,
    [Year]                       INT          NULL,
    [YearName]                   CHAR (7)     NULL,
    [MonthYear]                  CHAR (10)    NULL,
    [MMYYYY]                     CHAR (6)     NULL,
    [FirstDayOfMonth]            DATE         NULL,
    [LastDayOfMonth]             DATE         NULL,
    [FirstDayOfQuarter]          DATE         NULL,
    [LastDayOfQuarter]           DATE         NULL,
    [FirstDayOfYear]             DATE         NULL,
    [LastDayOfYear]              DATE         NULL,
    [IsHoliday]                  BIT          NULL,
    [IsWeekday]                  BIT          NULL,
    [Holiday]                    VARCHAR (50) NULL,
    [AuditID]                    BIGINT       NOT NULL,
    [IsInferred]                 BIT          NOT NULL,
    [CreatedDate]                DATETIME     NOT NULL,
    [CreatedByPackageID]         INT          NOT NULL,
	CONSTRAINT PK_DimDate PRIMARY KEY CLUSTERED (DateKey)
);
GO
CREATE NONCLUSTERED INDEX IX_DimDate_Date ON dbo.DimDate(Date);
GO