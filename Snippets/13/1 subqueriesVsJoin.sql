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
	JOIN AP..Vendors
	ON Invoices.VendorID = Vendors.VendorID
WHERE VendorState = 'CA'
ORDER BY InvoiceDate;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal
FROM
	AP..Invoices
WHERE VendorID IN (SELECT
	VendorID
FROM
	AP..Vendors
WHERE VendorState = 'CA')
ORDER BY InvoiceDate;

SELECT
	VendorID
FROM
	AP..Vendors
WHERE VendorState = 'CA';

-- -- -- -- -- -- -- -- -- --

SELECT
	VendorID,
	VendorName,
	VendorState
FROM
	AP..Vendors
WHERE VendorID NOT IN (SELECT
	DISTINCT
	VendorID
FROM
	AP..Invoices);

SELECT
	Vendors.VendorID,
	VendorName,
	VendorState
FROM
	AP..Vendors
	LEFT JOIN AP..Invoices
	ON Vendors.VendorID = Invoices.VendorID
WHERE Invoices.VendorID IS NULL;

SELECT
	DISTINCT
	VendorID
FROM
	AP..Invoices;
