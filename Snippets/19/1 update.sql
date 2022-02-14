-- SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- SET NOCOUNT ON;
-- SET ANSI_NULLS ON;
-- SET QUOTED_IDENTIFIER ON;
USE AP;


UPDATE AP..InvoiceCopy
SET CreditTotal = CreditTotal + 100
FROM
	(SELECT
		TOP 10
		InvoiceID
	FROM
		AP..InvoiceCopy
	WHERE InvoiceTotal - PaymentTotal - CreditTotal >= 100
	ORDER BY InvoiceTotal - PaymentTotal - CreditTotal DESC) AS TopInvoices
WHERE TopInvoices.InvoiceID = InvoiceCopy.InvoiceID;

SELECT
	TOP 10
	InvoiceID
FROM
	AP..InvoiceCopy
WHERE InvoiceTotal - PaymentTotal - CreditTotal >= 100
ORDER BY InvoiceTotal - PaymentTotal - CreditTotal DESC;

SELECT
	*
INTO VendorCopy
FROM
	AP..Vendors;

UPDATE AP..VendorCopy
SET VendorContactLName = LastName,
VendorContactFName = FirstName
FROM
	AP..VendorCopy
	JOIN AP..ContactUpdates
	ON VendorCopy.VendorID = ContactUpdates.VendorID;
