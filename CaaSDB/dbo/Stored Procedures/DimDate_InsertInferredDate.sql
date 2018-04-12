CREATE PROC [dbo].[DimDate_InsertInferredDate]
    @StartDate DATETIME, @EndDate DATETIME = NULL
    , @CreatedByPackageID INT = 0
    , @Debug BIT = 0
AS
BEGIN --Proc
SET NOCOUNT ON;

DECLARE @DimDate TABLE (
	[DateKey] [int] NOT NULL,
	[Date] [datetime] NULL,
	[FullDate] [char](10) NULL,
	[DayOfMonth] [varchar](2) NULL,
	[DaySuffix] [varchar](4) NULL,
	[DayName] [varchar](9) NULL,
	[DayOfWeek] [char](1) NULL,
	[DayOfWeekInMonthOccurrence] [varchar](2) NULL,
	[DayOfWeekInYearOccurrence] [varchar](2) NULL,
	[DayOfQuarterOccurrence] [varchar](3) NULL,
	[DayOfYear] [varchar](3) NULL,
	[WeekOfMonth] [varchar](1) NULL,
	[WeekOfQuarter] [varchar](2) NULL,
	[WeekOfYear] [varchar](2) NULL,
	[Month] TINYINT NULL,
	[MonthName] [varchar](9) NULL,
	[MonthOfQuarter] [varchar](2) NULL,
	[Quarter] TINYINT NULL,
	[QuarterName] [varchar](9) NULL,
	[Year] int NULL,
	[YearName] [char](7) NULL,
	[MonthYear] [char](10) NULL,
	[MMYYYY] [char](6) NULL,
	[FirstDayOfMonth] [date] NULL,
	[LastDayOfMonth] [date] NULL,
	[FirstDayOfQuarter] [date] NULL,
	[LastDayOfQuarter] [date] NULL,
	[FirstDayOfYear] [date] NULL,
	[LastDayOfYear] [date] NULL,
	[IsHoliday] [bit] NULL,
	[IsWeekday] [bit] NULL,
	[Holiday] [varchar](50) NULL,
	[AuditID] [bigint] NOT NULL,
	[IsInferred] [bit] NOT NULL DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getutcdate()),
	[CreatedByPackageID] [int] NOT NULL DEFAULT ((0))
);

IF @EndDate IS NULL
SET @EndDate = @StartDate

--Temporary Variables To Hold the Values During Processing of Each Date of Year
DECLARE
	@DayOfWeekInMonthOccurrence INT,
	@DayOfWeekInYearOccurrence INT,
	@DayOfQuarterOccurrence INT,
	@WeekOfMonth INT,
	@CurrentYear INT,
	@CurrentMonth INT,
	@CurrentQuarter INT

/*Table Data type to store the day of week count for the month and year*/
DECLARE @DayOfWeek TABLE (DOW INT, MonthCount INT, QuarterCount INT, YearCount INT)

INSERT INTO @DayOfWeek VALUES (1, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (2, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (3, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (4, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (5, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (6, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (7, 0, 0, 0)

--Extract and assign various parts of Values from Current Date to Variable

DECLARE @CurrentDate AS DATETIME = @StartDate
SET @CurrentMonth = DATEPART(MM, @CurrentDate)
SET @CurrentYear = DATEPART(YY, @CurrentDate)
SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)

/********************************************************************************************/
--Proceed only if Start Date(Current date ) is less than End date you specified above

WHILE @CurrentDate <= @EndDate
BEGIN
 
/*Begin day of week logic*/

         /*Check for Change in Month of the Current date if Month changed then 
          Change variable value*/
	IF @CurrentMonth != DATEPART(MM, @CurrentDate) 
	BEGIN
		UPDATE @DayOfWeek
		SET MonthCount = 0
		SET @CurrentMonth = DATEPART(MM, @CurrentDate)
	END

        /* Check for Change in Quarter of the Current date if Quarter changed then change 
         Variable value*/

	IF @CurrentQuarter != DATEPART(QQ, @CurrentDate)
	BEGIN
		UPDATE @DayOfWeek
		SET QuarterCount = 0
		SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)
	END
       
        /* Check for Change in Year of the Current date if Year changed then change 
         Variable value*/
	

	IF @CurrentYear != DATEPART(YY, @CurrentDate)
	BEGIN
		UPDATE @DayOfWeek
		SET YearCount = 0
		SET @CurrentYear = DATEPART(YY, @CurrentDate)
	END
	
        -- Set values in table data type created above from variables 

	UPDATE @DayOfWeek
	SET 
		MonthCount = MonthCount + 1,
		QuarterCount = QuarterCount + 1,
		YearCount = YearCount + 1
	WHERE DOW = DATEPART(DW, @CurrentDate)

	SELECT
		@DayOfWeekInMonthOccurrence = MonthCount,
		@DayOfQuarterOccurrence = QuarterCount,
		@DayOfWeekInYearOccurrence = YearCount
	FROM @DayOfWeek
	WHERE DOW = DATEPART(DW, @CurrentDate)
	
/*End day of week logic*/


/* Populate Dimension Table with values*/
	
	INSERT INTO @DimDate
	        ( [DateKey] ,
	          [Date] ,
	          [FullDate] ,
	          [DayOfMonth] ,
	          [DaySuffix] ,
	          [DayName] ,
	          [DayOfWeek] ,
	          [DayOfWeekInMonthOccurrence] ,
	          [DayOfWeekInYearOccurrence] ,
	          [DayOfQuarterOccurrence] ,
	          [DayOfYear] ,
	          [WeekOfMonth] ,
	          [WeekOfQuarter] ,
	          [WeekOfYear] ,
	          [Month] ,
	          [MonthName] ,
	          [MonthOfQuarter] ,
	          [Quarter] ,
	          [QuarterName] ,
	          [Year] ,
	          [YearName] ,
	          [MonthYear] ,
	          [MMYYYY] ,
	          [FirstDayOfMonth] ,
	          [LastDayOfMonth] ,
	          [FirstDayOfQuarter] ,
	          [LastDayOfQuarter] ,
	          [FirstDayOfYear] ,
	          [LastDayOfYear] ,
	          [IsHoliday] ,
	          [IsWeekday] ,
	          [Holiday] ,
	          [AuditID]
	        )

	SELECT
		
		CONVERT (char(8),@CurrentDate,112) as DateKey,
		@CurrentDate AS Date,
		CONVERT (char(10),@CurrentDate,101) as FullDate,
		DATEPART(DD, @CurrentDate) AS DayOfMonth,
		--Apply Suffix values like 1st, 2nd 3rd etc..
		CASE 
			WHEN DATEPART(DD,@CurrentDate) IN (11,12,13) 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th'
			WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 1 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'st'
			WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 2 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'nd'
			WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 3 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'rd'
			ELSE CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th' 
		END AS DaySuffix,
		
		DATENAME(DW, @CurrentDate) AS DayName,
		DATEPART(DW, @CurrentDate) AS DayOfWeek,
		
		@DayOfWeekInMonthOccurrence AS DayOfWeekInMonthOccurrence,
		@DayOfWeekInYearOccurrence AS DayOfWeekInYearOccurrence,
		@DayOfQuarterOccurrence AS DayOfQuarterOccurrence,
		DATEPART(DY, @CurrentDate) AS DayOfYear,
		DATEPART(WW, @CurrentDate) + 1 - DATEPART(WW, CONVERT(VARCHAR, 
		DATEPART(MM, @CurrentDate)) + '/1/' + CONVERT(VARCHAR, 
		DATEPART(YY, @CurrentDate))) AS WeekOfMonth,
		(DATEDIFF(DD, DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0), @CurrentDate) / 7) + 1 AS WeekOfQuarter,
		DATEPART(WW, @CurrentDate) AS WeekOfYear,
		DATEPART(MM, @CurrentDate) AS Month,
		DATENAME(MM, @CurrentDate) AS MonthName,
		CASE
			WHEN DATEPART(MM, @CurrentDate) IN (1, 4, 7, 10) THEN 1
			WHEN DATEPART(MM, @CurrentDate) IN (2, 5, 8, 11) THEN 2
			WHEN DATEPART(MM, @CurrentDate) IN (3, 6, 9, 12) THEN 3
		END AS MonthOfQuarter,
		DATEPART(QQ, @CurrentDate) AS Quarter,
		CASE DATEPART(QQ, @CurrentDate)
			WHEN 1 THEN 'First'
			WHEN 2 THEN 'Second'
			WHEN 3 THEN 'Third'
			WHEN 4 THEN 'Fourth'
		END AS QuarterName,
		DATEPART(YEAR, @CurrentDate) AS Year,
		'CY ' + CONVERT(VARCHAR, DATEPART(YEAR, @CurrentDate)) AS YearName,
		LEFT(DATENAME(MM, @CurrentDate), 3) + '-' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) AS MonthYear,
		RIGHT('0' + CONVERT(VARCHAR, DATEPART(MM, @CurrentDate)),2) + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) AS MMYYYY,
		CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, @CurrentDate) - 1), @CurrentDate))) AS FirstDayOfMonth,
		CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, (DATEADD(MM, 1, @CurrentDate)))), DATEADD(MM, 1, @CurrentDate)))) AS LastDayOfMonth,
		DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0) AS FirstDayOfQuarter,
		DATEADD(QQ, DATEDIFF(QQ, -1, @CurrentDate), -1) AS LastDayOfQuarter,
		CONVERT(DATETIME, '01/01/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS FirstDayOfYear,
		CONVERT(DATETIME, '12/31/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS LastDayOfYear,
		NULL AS IsHoliday,
		CASE DATEPART(DW, @CurrentDate)
			WHEN 1 THEN 0
			WHEN 2 THEN 1
			WHEN 3 THEN 1
			WHEN 4 THEN 1
			WHEN 5 THEN 1
			WHEN 6 THEN 1
			WHEN 7 THEN 0
		END AS IsWeekday,
		NULL AS Holiday,
		0 AS AuditID

	SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END

/********************************************************************************************/
/*Update HOLIDAY Field in dimension*/
	
 	/*THANKSGIVING - Fourth THURSDAY in November*/
	UPDATE @DimDate
		SET Holiday = 'Thanksgiving Day'
	WHERE
		[Month] = 11 
		AND [DayOfWeek] = 'Thursday' 
		AND DayOfWeekInMonthOccurrence = 4

	/*CHRISTMAS*/
	UPDATE @DimDate
		SET Holiday = 'Christmas Day'
		
	WHERE [Month] = 12 AND [DayOfMonth]  = 25

	/*4th of July*/
	UPDATE @DimDate
		SET Holiday = 'Independence Day'
	WHERE [Month] = 7 AND [DayOfMonth] = 4

	/*New Years Day*/
	UPDATE @DimDate
		SET Holiday = 'New Year''s Day'
	WHERE [Month] = 1 AND [DayOfMonth] = 1

	/*Memorial Day - Last Monday in May*/
	UPDATE @DimDate
		SET Holiday = 'Memorial Day'
	FROM @DimDate
	WHERE DateKey IN 
		(
		SELECT
			MAX(DateKey)
		FROM @DimDate
		WHERE
			[MonthName] = 'May'
			AND [DayOfWeek]  = 'Monday'
		GROUP BY
			[Year],
			[Month]
		)

	/*Labor Day - First Monday in September*/
	UPDATE @DimDate
		SET Holiday = 'Labor Day'
	FROM @DimDate
	WHERE DateKey IN 
		(
		SELECT
			MIN(DateKey)
		FROM @DimDate
		WHERE
			[MonthName] = 'September'
			AND [DayOfWeek] = 'Monday'
		GROUP BY
			[Year],
			[Month]
		)

	/*Valentine's Day*/
	UPDATE @DimDate
		SET Holiday = 'Valentine''s Day'
	WHERE
		[Month] = 2 
		AND [DayOfMonth] = 14

	/*Saint Patrick's Day*/
	UPDATE @DimDate
		SET Holiday = 'Saint Patrick''s Day'
	WHERE
		[Month] = 3
		AND [DayOfMonth] = 17

	/*Martin Luthor King Day - Third Monday in January starting in 1983*/
	UPDATE @DimDate
		SET Holiday = 'Martin Luthor King Jr Day'
	WHERE
		[Month] = 1
		AND [DayOfWeek]  = 'Monday'
		AND [Year] >= 1983
		AND DayOfWeekInMonthOccurrence = 3

	/*President's Day - Third Monday in February*/
	UPDATE @DimDate
		SET Holiday = 'President''s Day'
	WHERE
		[Month] = 2
		AND [DayOfWeek] = 'Monday'
		AND DayOfWeekInMonthOccurrence = 3

	/*Mother's Day - Second Sunday of May*/
	UPDATE @DimDate
		SET Holiday = 'Mother''s Day'
	WHERE
		[Month] = 5
		AND [DayOfWeek] = 'Sunday'
		AND DayOfWeekInMonthOccurrence = 2

	/*Father's Day - Third Sunday of June*/
	UPDATE @DimDate
		SET Holiday = 'Father''s Day'
	WHERE
		[Month] = 6
		AND [DayOfWeek] = 'Sunday'
		AND DayOfWeekInMonthOccurrence = 3

	/*Halloween 10/31*/
	UPDATE @DimDate
		SET Holiday = 'Halloween'
	WHERE
		[Month] = 10
		AND [DayOfMonth] = 31

	/*Election Day - The first Tuesday after the first Monday in November*/
	BEGIN
	DECLARE @Holidays TABLE (ID INT IDENTITY(1,1), 
	DateID int, Week TINYINT, Year CHAR(4), Day CHAR(2))

		INSERT INTO @Holidays(DateID, [Year],[Day])
		SELECT
			DateKey,
			[Year],
			[DayOfMonth] 
		FROM @DimDate
		WHERE
			[Month] = 11
			AND [DayOfWeek] = 'Monday'
		ORDER BY
			YEAR,
			DayOfMonth 

		DECLARE @CNTR INT, @POS INT, @STARTYEAR INT, @ENDYEAR INT, @MINDAY INT

		SELECT
			@CURRENTYEAR = MIN([Year])
			, @STARTYEAR = MIN([Year])
			, @ENDYEAR = MAX([Year])
		FROM @Holidays

		WHILE @CURRENTYEAR <= @ENDYEAR
		BEGIN
			SELECT @CNTR = COUNT([Year])
			FROM @Holidays
			WHERE [Year] = @CURRENTYEAR

			SET @POS = 1

			WHILE @POS <= @CNTR
			BEGIN
				SELECT @MINDAY = MIN(DAY)
				FROM @Holidays
				WHERE
					[Year] = @CURRENTYEAR
					AND [Week] IS NULL

				UPDATE @Holidays
					SET [Week] = @POS
				WHERE
					[Year] = @CURRENTYEAR
					AND [Day] = @MINDAY

				SELECT @POS = @POS + 1
			END

			SELECT @CURRENTYEAR = @CURRENTYEAR + 1
		END

		UPDATE @DimDate
			SET Holiday  = 'Election Day'				
		FROM @DimDate DT
			JOIN @Holidays HL ON (HL.DateID + 1) = DT.DateKey
		WHERE
			[Week] = 1
	END
	--set flag for holidays in Dimension
	UPDATE @DimDate
     SET IsHoliday = CASE WHEN Holiday  IS NULL THEN 0 WHEN Holiday  IS NOT NULL THEN 1 END
/*****************************************************************************************/

IF @Debug = 1
    SELECT * FROM @DimDate AS dd


;WITH DimDate_CTE AS (
    SELECT *
    FROM @DimDate
)
MERGE dbo.dimDate AS mytarget
USING DimDate_CTE
     ON DimDate_CTE.[DateKey] = myTarget.[DateKey]
WHEN MATCHED THEN UPDATE SET 
    [Date] = DimDate_CTE.[Date],
    [FullDate] = DimDate_CTE.[FullDate],
    [DayOfMonth] = DimDate_CTE.[DayOfMonth],
    [DaySuffix] = DimDate_CTE.[DaySuffix],
    [DayName] = DimDate_CTE.[DayName],
    [DayOfWeek] = DimDate_CTE.[DayOfWeek],
    [DayOfWeekInMonthOccurrence] = DimDate_CTE.[DayOfWeekInMonthOccurrence],
    [DayOfWeekInYearOccurrence] = DimDate_CTE.[DayOfWeekInYearOccurrence],
    [DayOfQuarterOccurrence] = DimDate_CTE.[DayOfQuarterOccurrence],
    [DayOfYear] = DimDate_CTE.[DayOfYear],
    [WeekOfMonth] = DimDate_CTE.[WeekOfMonth],
    [WeekOfQuarter] = DimDate_CTE.[WeekOfQuarter],
    [WeekOfYear] = DimDate_CTE.[WeekOfYear],
    [Month] = DimDate_CTE.[Month],
    [MonthName] = DimDate_CTE.[MonthName],
    [MonthOfQuarter] = DimDate_CTE.[MonthOfQuarter],
    [Quarter] = DimDate_CTE.[Quarter],
    [QuarterName] = DimDate_CTE.[QuarterName],
    [Year] = DimDate_CTE.[Year],
    [YearName] = DimDate_CTE.[YearName],
    [MonthYear] = DimDate_CTE.[MonthYear],
    [MMYYYY] = DimDate_CTE.[MMYYYY],
    [FirstDayOfMonth] = DimDate_CTE.[FirstDayOfMonth],
    [LastDayOfMonth] = DimDate_CTE.[LastDayOfMonth],
    [FirstDayOfQuarter] = DimDate_CTE.[FirstDayOfQuarter],
    [LastDayOfQuarter] = DimDate_CTE.[LastDayOfQuarter],
    [FirstDayOfYear] = DimDate_CTE.[FirstDayOfYear],
    [LastDayOfYear] = DimDate_CTE.[LastDayOfYear],
    [IsHoliday] = DimDate_CTE.[IsHoliday],
    [IsWeekday] = DimDate_CTE.[IsWeekday],
    [Holiday] = DimDate_CTE.[Holiday],
    [AuditID] = DimDate_CTE.[AuditID]
WHEN NOT MATCHED THEN INSERT
    (
        [DateKey], 
        [Date], 
        [FullDate], 
        [DayOfMonth], 
        [DaySuffix], 
        [DayName], 
        [DayOfWeek], 
        [DayOfWeekInMonthOccurrence], 
        [DayOfWeekInYearOccurrence], 
        [DayOfQuarterOccurrence], 
        [DayOfYear], 
        [WeekOfMonth], 
        [WeekOfQuarter], 
        [WeekOfYear], 
        [Month], 
        [MonthName], 
        [MonthOfQuarter], 
        [Quarter], 
        [QuarterName], 
        [Year], 
        [YearName], 
        [MonthYear], 
        [MMYYYY], 
        [FirstDayOfMonth], 
        [LastDayOfMonth], 
        [FirstDayOfQuarter], 
        [LastDayOfQuarter], 
        [FirstDayOfYear], 
        [LastDayOfYear], 
        [IsHoliday], 
        [IsWeekday], 
        [Holiday], 
        [AuditID],
	   CreatedDate,
	   CreatedByPackageID
    )
    VALUES (
        DimDate_CTE.[DateKey], 
        DimDate_CTE.[Date], 
        DimDate_CTE.[FullDate], 
        DimDate_CTE.[DayOfMonth], 
        DimDate_CTE.[DaySuffix], 
        DimDate_CTE.[DayName], 
        DimDate_CTE.[DayOfWeek], 
        DimDate_CTE.[DayOfWeekInMonthOccurrence], 
        DimDate_CTE.[DayOfWeekInYearOccurrence], 
        DimDate_CTE.[DayOfQuarterOccurrence], 
        DimDate_CTE.[DayOfYear], 
        DimDate_CTE.[WeekOfMonth], 
        DimDate_CTE.[WeekOfQuarter], 
        DimDate_CTE.[WeekOfYear], 
        DimDate_CTE.[Month], 
        DimDate_CTE.[MonthName], 
        DimDate_CTE.[MonthOfQuarter], 
        DimDate_CTE.[Quarter], 
        DimDate_CTE.[QuarterName], 
        DimDate_CTE.[Year], 
        DimDate_CTE.[YearName], 
        DimDate_CTE.[MonthYear], 
        DimDate_CTE.[MMYYYY], 
        DimDate_CTE.[FirstDayOfMonth], 
        DimDate_CTE.[LastDayOfMonth], 
        DimDate_CTE.[FirstDayOfQuarter], 
        DimDate_CTE.[LastDayOfQuarter], 
        DimDate_CTE.[FirstDayOfYear], 
        DimDate_CTE.[LastDayOfYear], 
        DimDate_CTE.[IsHoliday], 
        DimDate_CTE.[IsWeekday], 
        DimDate_CTE.[Holiday], 
        DimDate_CTE.[AuditID],
	   GETUTCDATE(),
	   @CreatedByPackageID
    );


END --Proc
