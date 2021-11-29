SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	COUNT(*) AS NumberOfInvoices,
	SUM(InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
FROM
	AP..Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;

SELECT
	'After 9/1/2015' AS SelectionDate,
	COUNT(*) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AverageInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount
FROM
	AP..Invoices
WHERE InvoiceDate > '2015-09-01';

SELECT
	'After 9/1/2015' AS SelectionDate,
	COUNT(*) AS NumberOfInvoices,
	MAX(InvoiceTotal) AS HighestInvoiceTotal,
	MIN(InvoiceTotal) AS LowestInvoiceTotal
FROM
	AP..Invoices
WHERE InvoiceDate > '2015-09-01';
