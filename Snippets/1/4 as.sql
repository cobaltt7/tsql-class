SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	InvoiceNumber AS [Invoice Number],
	InvoiceDate AS Date,
	InvoiceTotal AS Total
FROM
	Invoices;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal,
	InvoiceTotal - PaymentTotal - CreditTotal
FROM
	Invoices;

SELECT
	VendorCity,
	VendorState,
	VendorCity + VendorState
FROM
	Vendors;

SELECT
	VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM
	Vendors;

SELECT
	InvoiceTotal,
	PaymentTotal,
	CreditTotal,
	InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM
	Invoices;

SELECT
	InvoiceID,
	InvoiceID + 7 * 3 AS OrderOfPrecedence,
	(InvoiceID + 7) * 3 AS AddFirst
FROM
	Invoices
ORDER BY InvoiceID;

SELECT
	InvoiceID,
	InvoiceID / 10 AS Quotient,
	InvoiceID % 10 AS Remainder,
	InvoiceID / 10.0 AS Result
FROM
	Invoices
ORDER BY InvoiceID;

SELECT
	VendorContactFName,
	VendorContactLName,
	LEFT(VendorContactFName, 1) + LEFT(VendorContactLName, 1) AS Initials
FROM
	Vendors;

SELECT
	InvoiceDate,
	GETDATE() AS 'Today''s Date',
	DATEDIFF(day, InvoiceDate, GETDATE()) AS Age
FROM
	Invoices;
