SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal,
	InvoiceLineItemAmount
FROM
	AP..Invoices JOIN AP..InvoiceLineItems AS LineItems
	ON (Invoices.InvoiceID = LineItems.InvoiceID) AND (Invoices.InvoiceTotal > LineItems.InvoiceLineItemAmount)
ORDER BY InvoiceNumber;

SELECT
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal,
	InvoiceLineItemAmount
FROM
	AP..Invoices JOIN AP..InvoiceLineItems AS LineItems
	ON Invoices.InvoiceID = LineItems.InvoiceID
WHERE Invoices.InvoiceTotal > LineItems.InvoiceLineItemAmount
ORDER BY InvoiceNumber;
