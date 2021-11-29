SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorID,
	COUNT(*) AS InvoiceCount,
	SUM(InvoiceTotal) AS InvoiceTotal
FROM
	AP..Invoices
GROUP BY VendorID;

SELECT
	VendorID,
	COUNT(*) AS InvoiceCount,
	SUM(InvoiceTotal) AS InvoiceTotal
FROM
	AP..Invoices
GROUP BY VendorID WITH ROLLUP;

SELECT
	VendorID,
	COUNT(*) AS InvoiceCount,
	SUM(InvoiceTotal) AS InvoiceTotal
FROM
	AP..Invoices
GROUP BY ROLLUP(VendorID);

SELECT
	COUNT(*) AS InvoiceCount,
	SUM(InvoiceTotal) AS InvoiceTotal
FROM
	AP..Invoices;


SELECT
	VendorState,
	VendorCity,
	COUNT(*) AS QtyVendors
FROM
	AP..Vendors
WHERE VendorState IN ('IA','NJ')
GROUP BY VendorState, VendorCity
ORDER BY VendorState DESC, VendorCity DESC;

SELECT
	VendorState,
	VendorCity,
	COUNT(*) AS QtyVendors
FROM
	AP..Vendors
WHERE VendorState IN ('IA','NJ')
GROUP BY VendorState, VendorCity WITH ROLLUP
ORDER BY VendorState DESC, VendorCity DESC;

SELECT
	VendorState,
	VendorCity,
	COUNT(*) AS QtyVendors
FROM
	AP..Vendors
WHERE VendorState IN ('IA','NJ')
GROUP BY ROLLUP(VendorState, VendorCity)
ORDER BY VendorState DESC, VendorCity DESC;

SELECT
	COUNT(*) AS QtyVendors
FROM
	AP..Vendors
WHERE VendorState IN ('IA','NJ');
