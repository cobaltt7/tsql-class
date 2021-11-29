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
	Invoices
ORDER BY InvoiceTotal;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal
FROM
	Invoices
ORDER BY InvoiceTotal ASC;
