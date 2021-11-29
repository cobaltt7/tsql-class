SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	InvoiceID,
	InvoiceTotal,
	CreditTotal + PaymentTotal AS TotalCredits
FROM
	Invoices
WHERE InvoiceID = 17;

SELECT
	InvoiceID,
	InvoiceTotal,
	CreditTotal + PaymentTotal
FROM
	Invoices
WHERE InvoiceID = 17;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal
FROM
	Invoices
WHERE InvoiceDate BETWEEN '2016-01-01' AND '2016-05-31'
ORDER BY InvoiceDate;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal
FROM
	Invoices
WHERE InvoiceDate BETWEEN '2016-01-01' AND '2016-05-31'
ORDER BY InvoiceDate DESC;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal
FROM
	Invoices
WHERE InvoiceTotal > 50000;
