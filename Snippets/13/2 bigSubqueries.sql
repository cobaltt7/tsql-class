SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal,
	InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM
	AP..Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
	AND InvoiceTotal - PaymentTotal - CreditTotal < (SELECT
		AVG(InvoiceTotal - PaymentTotal - CreditTotal)
	FROM
		AP..Invoices
	WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0)
ORDER BY InvoiceTotal DESC;

SELECT
		AVG(InvoiceTotal - PaymentTotal - CreditTotal)
	FROM
		AP..Invoices
	WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;
