SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal
FROM
	AP..Invoices
WHERE InvoiceTotal > (SELECT
	AVG(Invoices.InvoiceTotal)
FROM
	AP..Invoices)
ORDER BY Invoices.InvoiceTotal;

SELECT
	AVG(Invoices.InvoiceTotal)
FROM
	AP..Invoices;

SELECT
	Invoices.InvoiceTotal
FROM
	AP..Invoices;
