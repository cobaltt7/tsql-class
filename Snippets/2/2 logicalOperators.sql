SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;

USE Examples;

SELECT
	VendorState
FROM
	Vendors
WHERE VendorState = 'ia';

SELECT
	VendorName
FROM
	Vendors
WHERE VendorName < 'm';

SELECT
	VendorName
FROM
	Vendors
WHERE VendorName != 'IBM';

SELECT
	VendorName
FROM
	Vendors
WHERE VendorName != 'IBM' AND VendorName != 'Ingram';

SELECT
	VendorName
FROM
	Vendors
WHERE VendorName = 'IBM' OR VendorName = 'Ingram';

SELECT
	VendorName
FROM
	Vendors
WHERE NOT(VendorName = 'IBM' AND VendorName = 'Ingram');
USE AP;

SELECT
	*
FROM
	Invoices
WHERE InvoiceDate > '01/01/2016' OR InvoiceTotal > 500 AND InvoiceTotal - PaymentTotal - CreditTotal > 0;

SELECT
	*
FROM
	Invoices
WHERE (InvoiceDate > '01/01/2016' OR InvoiceTotal > 500) AND InvoiceTotal - PaymentTotal - CreditTotal > 0;
