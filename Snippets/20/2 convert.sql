SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	CONVERT(VARCHAR,InvoiceDate) AS varcharDate,
	CONVERT(VARCHAR, InvoiceDate, 1) AS varcharDate_1,
	CONVERT(VARCHAR, InvoiceDate, 107) AS varcharDate_107,
	CONVERT(VARCHAR, InvoiceTotal) AS varcharTotal,
	CONVERT(VARCHAR, InvoiceTotal, 1) AS varcharTotal_1
FROM
	AP..Invoices;

SELECT
	TRY_CONVERT(VARCHAR,InvoiceDate) AS varcharDate,
	TRY_CONVERT(VARCHAR, InvoiceDate, 1) AS varcharDate_1,
	TRY_CONVERT(VARCHAR, InvoiceDate, 107) AS varcharDate_107,
	TRY_CONVERT(VARCHAR, InvoiceTotal) AS varcharTotal,
	TRY_CONVERT(VARCHAR, InvoiceTotal, 1) AS varcharTotal_1,
	-- CONVERT(date, 'Fed 29 2015') AS invalidDate2,
	TRY_CONVERT(DATE, 'Fed 29 2015') AS invalidDate
FROM
	AP..Invoices;
