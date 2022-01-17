SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorID,
	InvoiceNumber,
	InvoiceTotal
FROM
	AP..Invoices AS Inv_Main
WHERE InvoiceTotal > (SELECT
	AVG(InvoiceTotal)
FROM
	AP..Invoices AS Inv_Sub
WHERE Inv_Sub.VendorID = 95
-- Inv_Main.VendorID
)
ORDER BY VendorID, InvoiceTotal;

SELECT
	VendorID,
	InvoiceNumber,
	InvoiceTotal
FROM
	AP..Invoices AS Inv_Main
WHERE InvoiceTotal > (SELECT
		AVG(InvoiceTotal)
	FROM
		AP..Invoices AS Inv_Sub
	WHERE Inv_Sub.VendorID = Inv_Main.VendorID)
	AND VendorID = '95'
ORDER BY VendorID, InvoiceTotal;

SELECT
	VendorID,
	InvoiceNumber,
	InvoiceTotal
FROM
	AP..Invoices AS Inv_Main
WHERE InvoiceTotal > (SELECT
		AVG(InvoiceTotal)
	FROM
		AP..Invoices AS Inv_Sub
	WHERE VendorID IN('95','83','110'))
ORDER BY VendorID, InvoiceTotal;

SELECT
	AVG(InvoiceTotal)
FROM
	AP..Invoices AS Inv_Sub
WHERE Inv_Sub.VendorID = 95;
