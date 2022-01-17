SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	Invoices.VendorID,
	MAX(InvoiceDate) AS LatestInv,
	AVG(InvoiceTotal) AS AvgInvoice
FROM
	AP..Invoices JOIN (SELECT
		TOP 5
		VendorID,
		Avg(InvoiceTotal) AS AvgInvoice
	FROM
		AP..Invoices
	GROUP BY VendorID
	ORDER BY AvgInvoice DESC) AS TopVendor ON Invoices.VendorID = TopVendor.VendorID
GROUP BY Invoices.VendorID
ORDER BY LatestInv DESC;

SELECT
	TOP 5
	VendorID,
	Avg(InvoiceTotal) AS AvgInvoice
FROM
	AP..Invoices
GROUP BY VendorID
ORDER BY AvgInvoice DESC;
