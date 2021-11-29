SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	*
FROM
	Vendors JOIN Invoices ON Vendors.VendorID = Invoices.VendorID;

SELECT
	Vendors.VendorName,
	Invoices.InvoiceNumber,
	Invoices.InvoiceDate,
	Invoices.InvoiceTotal - Invoices.PaymentTotal - Invoices.CreditTotal AS Balance
FROM
	Vendors JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
WHERE Invoices.InvoiceTotal - Invoices.PaymentTotal - Invoices.CreditTotal <> 0
ORDER BY Vendors.VendorName;
