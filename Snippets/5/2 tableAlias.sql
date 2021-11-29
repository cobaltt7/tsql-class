SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	InvoiceNumber,
	VendorName
FROM
	Vendors Ven
	JOIN Invoices ON Ven.VendorID = Invoices.VendorID;

SELECT
	VendorName,
	ven.VendorID
FROM
	Vendors ven
	JOIN Invoices inv ON ven.VendorID = inv.VendorID;

SELECT
	InvoiceNumber,
	VendorName,
	InvoiceDueDate,
	InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM
	Vendors AS v
	JOIN Invoices AS i ON v.VendorID = i.VendorID
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY InvoiceDueDate DESC;

SELECT
	InvoiceNumber,
	InvoiceLineItemAmount,
	InvoiceLineItemDescription
FROM
	Invoices
	JOIN InvoiceLineItems AS LineItems ON Invoices.InvoiceID = LineItems.InvoiceID
WHERE AccountNo = 540
ORDER BY InvoiceDate;
