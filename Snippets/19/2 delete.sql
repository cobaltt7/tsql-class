SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceID = 115;

DELETE AP..InvoiceCopy
WHERE InvoiceID = 115;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceID = 115;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE VendorID = 37;

DELETE AP..InvoiceCopy
WHERE VendorID = 37;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE VendorID = 37;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceTotal - PaymentTotal - CreditTotal = 0;

DELETE AP..InvoiceCopy
WHERE InvoiceTotal - PaymentTotal - CreditTotal = 0;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceTotal - PaymentTotal - CreditTotal = 0;

SELECT
	*
FROM
	AP..InvoiceCopy;

DELETE AP..InvoiceCopy;

SELECT
	*
FROM
	AP..InvoiceCopy
