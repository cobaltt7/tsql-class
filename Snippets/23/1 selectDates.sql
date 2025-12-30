SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	*
FROM
	Examples..DateSample;

SELECT
	*
FROM
	Examples..DateSample
WHERE StartDate = '2019-10-28';

SELECT
	*
FROM
	Examples..DateSample
WHERE CONVERT(DATE, StartDate) = '2011-10-28';

SELECT
	*
FROM
	Examples..DateSample
WHERE StartDate >= '2011-10-28' AND StartDate <= '2011-10-29';

SELECT
	*
FROM
	Examples..DateSample
WHERE MONTH(StartDate) = 10 AND
	DAY(StartDate) = 28 AND
	YEAR(StartDate) = 2011;

SELECT
	*
FROM
	Examples..DateSample
WHERE CAST(CAST(StartDate AS CHAR(11)) AS DATETIME) = '2011-10-28';

SELECT
	*
FROM
	Examples..DateSample
WHERE CONVERT(DATETIME, CONVERT(CHAR(10), StartDate, 110)) = '2011-10-28';

SELECT
	*
FROM
	Examples..DateSample
WHERE StartDate = CAST('10:00:00' AS DATETIME);

SELECT
	*
FROM
	Examples..DateSample
WHERE StartDate >= '09:00:00' AND StartDate <= '12:59:59:999';

SELECT
	*
FROM
	Examples..DateSample
WHERE CONVERT(TIME, StartDate) >= '09:00:00' AND CONVERT(TIME, StartDate) <= '12:59:59:999';
