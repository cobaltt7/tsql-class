SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorState,
	VendorCity,
	COUNT(*) AS InvoiceQty,
	AVG(InvoiceTotal) AS InvoiceAvg
FROM
	AP..Invoices JOIN AP..Vendors
	ON Invoices.VendorID = Vendors.VendorID
GROUP BY VendorState, VendorCity
ORDER BY VendorState, VendorCity;

SELECT
	DISTINCT
	VendorState,
	VendorCity
FROM
	AP..Invoices JOIN AP..Vendors
	ON Invoices.VendorID = Vendors.VendorID
ORDER BY VendorState, VendorCity;
