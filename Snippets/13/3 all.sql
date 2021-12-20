SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

-- ALL means "and"

SELECT
	VendorName,
	InvoiceNumber,
	InvoiceTotal
FROM
	AP..Invoices
	JOIN AP..Vendors
	ON Invoices.VendorID = Vendors.VendorID
WHERE InvoiceTotal > ALL (SELECT
	InvoiceTotal
FROM
	AP..Invoices
WHERE VendorID = 34)
ORDER BY VendorName;

SELECT
	InvoiceTotal
FROM
	AP..Invoices
WHERE VendorID = 34;

SELECT
	VendorName,
	InvoiceNumber,
	InvoiceTotal
FROM
	AP..Invoices
	JOIN AP..Vendors
	ON Invoices.VendorID = Vendors.VendorID
WHERE InvoiceTotal = ALL (SELECT
	InvoiceTotal
FROM
	AP..Invoices
WHERE VendorID = 34)
ORDER BY VendorName;

