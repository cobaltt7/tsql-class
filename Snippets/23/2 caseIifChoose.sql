SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	InvoiceNumber,
	TermsID,
	CASE TermsID
		WHEN 1 THEN 'Net due 10 days'
		WHEN 2 THEN 'Net due 20 days'
		WHEN 3 THEN 'Net due 30 days'
		WHEN 4 THEN 'Net due 60 days'
		WHEN 5 THEN 'Net due 90 days'
	END AS Terms
FROM
	AP..Invoices;

SELECT
	InvoiceNumber,
	InvoiceTotal,
	InvoiceDate,
	InvoiceDueDate,
	CASE
		WHEN DATEDIFF(day, InvoiceDueDate, GETDATE()) > 30
			THEN 'Over 30 days past due'
		WHEN DATEDIFF(day, InvoiceDueDate, GETDATE()) > 0
			THEN '1 to 30 days past due'
		ELSE 'Current'
	END AS Status
FROM
	AP..Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;

SELECT
	VendorID,
	SUM(InvoiceTotal) AS SumInvoices,
	IIF(SUM(InvoiceTotal) < 1000, 'Low', 'High') AS InvoiceRange
FROM
	Invoices
GROUP BY VendorID;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal,
	CHOOSE(TermsID, '10 Days', '20 days', '30 days', '60 days')
	AS NetDue
FROM
	Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
