SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	*
-- INTO InvoiceCopy
FROM
	AP..Invoices;

SELECT
	*
INTO AP..InvoiceCopy
FROM
	AP..Invoices;

SELECT
	*
FROM
	AP..InvoiceCopy;

SELECT
	VendorID,
	Sum(InvoiceTotal) AS SumOfInvoices
-- INTO VendorBalances
FROM
	AP..Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal <> 0
GROUP BY VendorID;

SELECT
	VendorID,
	Sum(InvoiceTotal) AS SumOfInvoices
INTO VendorBalances
FROM
	AP..Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal <> 0
GROUP BY VendorID;
