IF OBJECT_ID('dbo.udfDateFirst') IS NOT NULL
    DROP FUNCTION dbo.udfDateFirst
GO
CREATE FUNCTION dbo.udfDateFirst
(
    @interval    VARCHAR(10),
    @rawDate    DATETIME
)
RETURNS DATETIME
AS
BEGIN
    -- Remove seconds for allintervals

    SET @rawDate = CAST(@rawDate AS SMALLDATETIME)

    IF @interval = 'MINUTE'
        RETURN @rawDate
    ELSE -- strip off minutes

        SET @rawDate = DATEADD(minute,-1 * DATEPART(minute,@rawDate),@rawDate)

    IF @interval = 'HOUR'
        RETURN @rawDate
    ELSE -- strip off hours

        SET @rawDate = DATEADD(hour, -1 * DATEPART(hour,@rawDate),@rawDate)

    IF @interval = 'DAY'
        RETURN @rawDate

    IF @interval = 'WEEK'

        RETURN DATEADD(day, -1 * DATEPART(weekday,@rawDate),@rawDate)

    -- move date to first of month
    SET @rawDate = DATEADD(day, -1 * DATEPART(day,@rawDate) + 1,@rawDate)

    IF @interval = 'MONTH'

        RETURN @rawDate

    -- move Date to first of year
    SET @rawDate = DATEADD(month, -1 * DATEPART(month,@rawDate)+1 , @rawDate)

    RETURN @rawDate

END
