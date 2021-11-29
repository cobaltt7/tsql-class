SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	VendorContactFName,
	VendorContactLName,
	VendorName
FROM
	Vendors
ORDER BY VendorContactLName, VendorContactFName;

SELECT
	InvoiceNumber AS [Number],
	InvoiceTotal AS Total,
	PaymentTotal + CreditTotal AS Credits,
	InvoiceTotal - PaymentTotal - CreditTotal AS Balance
FROM
	Invoices;

SELECT
	VendorContactLName + ', ' + VendorContactFName AS [Name]
FROM
	Vendors
ORDER BY VendorContactLName, VendorContactFName;

SELECT
	InvoiceTotal,
	0.10 * InvoiceTotal AS [10%],
	1.10 * InvoiceTotal AS [Plus 10%]
FROM
	Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 1000
ORDER BY InvoiceTotal;

SELECT
	InvoiceNumber AS [Number],
	InvoiceTotal AS Total,
	PaymentTotal + CreditTotal AS Credits,
	InvoiceTotal - PaymentTotal - CreditTotal AS Balance
FROM
	Invoices
WHERE InvoiceTotal <= 10000 AND InvoiceTotal >= 500;

-- #region complex statement
SELECT
	VendorContactLName + ', ' + VendorContactFName AS [Name]
FROM
	Vendors

-- A-E
WHERE (VendorContactLName < 'F'
	-- E-Z
	AND VendorContactLName >= 'E')
	-- A-E and E-Z only overlap with E. So so far, we only are retrieving names that start with E.

	-- This will get A-C as well.
	OR VendorContactLName < 'D'

ORDER BY VendorContactLName, VendorContactFName;
-- #endregion complex statement
