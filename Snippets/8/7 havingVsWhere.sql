SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorName,
	COUNT(*) AS InvoiceQty,
	AVG(InvoiceTotal) AS InvoiceAvg
FROM
	AP..Vendors JOIN AP..Invoices
	ON Vendors.VendorID = Invoices.VendorID
GROUP BY VendorName
HAVING AVG(InvoiceTotal) > 500
ORDER BY InvoiceQty DESC;

SELECT
	VendorName,
	COUNT(*) AS InvoiceQty,
	AVG(InvoiceTotal) AS InvoiceAvg
FROM
	AP..Vendors JOIN AP..Invoices
	ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceTotal > 500
GROUP BY VendorName
ORDER BY InvoiceQty DESC;
