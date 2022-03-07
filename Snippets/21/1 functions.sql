SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	LEN('SQL Server'),

	-- why does this say 11
	LEN(' SQL Server '),

	-- 12
	LEN('  SQL Server '),

	-- 12
	LEN('  SQL Server  ');

SELECT
	LEFT('SQL Server', 3),

	LTRIM(' SQL Server '),

	RTRIM(' SQL Server '),

	LTRIM(RTRIM(' SQL Server ')),

	LOWER('SQL Server'),

	UPPER('ca');
SELECT
	-- what
	PATINDEX('%v_r%', 'SQL Server'),

	CHARINDEX('SQL', '  SQL Server'),

	CHARINDEX('-', '(559) 555-1212'),

	SUBSTRING('(599) 555-1212', 7, 8),

	REPLACE(RIGHT('(559) 555-1212', 13), ') ', '-');

SELECT
	CONCAT('Run time: ', 1.52, ' seconds');
