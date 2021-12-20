SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

-- ANY means "or"

SELECT
	VendorName,
	InvoiceNumber,
	InvoiceTotal
FROM
	AP..Vendors
	JOIN AP..Invoices
	ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceTotal < ANY (SELECT
	InvoiceTotal
FROM
	AP..Invoices
WHERE VendorID = 115);

SELECT
	InvoiceTotal
FROM
	AP..Invoices
WHERE VendorID = 115;
