# SQL Server - Date Scrubbing UDF

Here is a handy little UDF that rounds a DATETIME column to either the MINUTE, HOUR, DAY, WEEK or MONTH.

```sql
DECLARE @now AS DATETIME
SET @now = getDate()

SELECT dbo.udfDateFirst('MINUTE',@now)
SELECT dbo.udfDateFirst('HOUR',@now)
SELECT dbo.udfDateFirst('DAY',@now)
SELECT dbo.udfDateFirst('WEEK',@now)
SELECT dbo.udfDateFirst('MONTH',@now)
SELECT dbo.udfDateFirst('YEAR',@now)
```

_created: 2002 or 2003_