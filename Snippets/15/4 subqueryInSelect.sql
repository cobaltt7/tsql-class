SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	DISTINCT
	VendorName,
	(SELECT
		MAX(InvoiceDate)
	FROM
		AP..Invoices
	WHERE Invoices.VendorID = Vendors.VendorID) AS LatestInv
FROM
	AP..Vendors
ORDER BY LatestInv DESC;

-- SELECT
-- 	MAX(InvoiceDate)
-- FROM
-- 	Invoices
-- WHERE Invoices.VendorID = Vendors.VendorID

SELECT
	VendorName,
	MAX(InvoiceDate) AS LatestInv
FROM
	AP..Vendors LEFT JOIN AP..Invoices ON Vendors.VendorID = Invoices.VendorID
GROUP BY VendorName
ORDER BY LatestInv DESC;
