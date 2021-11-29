SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal,
	SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateTotal,
	COUNT(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateCount,
	AVG(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateAvg
FROM
	AP..Invoices;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal,
	SUM(InvoiceTotal) OVER (ORDER BY InvoiceDate) AS CumTotal,
	COUNT(InvoiceTotal) OVER (ORDER BY InvoiceDate) AS Count,
	AVG(InvoiceTotal) OVER (ORDER BY InvoiceDate) AS MovingAvg
FROM
	AP..Invoices;

SELECT
	InvoiceNumber,
	TermsID,
	InvoiceDate,
	InvoiceTotal,
	SUM(InvoiceTotal) OVER (PARTITION BY TermsID ORDER BY InvoiceDate) AS CumTotal,
	COUNT(InvoiceTotal) OVER (PARTITION BY TermsID ORDER BY InvoiceDate) AS Count,
	AVG(InvoiceTotal) OVER (PARTITION BY TermsID ORDER BY InvoiceDate) AS MovingAvg
FROM
	AP..Invoices;
