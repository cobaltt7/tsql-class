SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorName,
	InvoiceNumber,
	InvoiceDate,
	InvoiceLineItemAmount AS LineItemAmount,
	AccountDescription
FROM
	Vendors
	JOIN Invoices ON Vendors.VendorId = Invoices.VendorID
	JOIN InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
	JOIN GLAccounts ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY VendorName, LineItemAmount DESC;
