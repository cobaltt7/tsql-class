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
HAVING COUNT(*) >= 2
ORDER BY VendorState, VendorCity;
