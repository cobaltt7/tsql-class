SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceCopy.InvoiceTotal - InvoiceCopy.PaymentTotal - InvoiceCopy.CreditTotal = 0;

DROP TABLE InvoiceArchive1;

SELECT
	*
INTO InvoiceArchive1
FROM
	AP..InvoiceCopy
WHERE 1 = 0;

INSERT INTO InvoiceArchive1
SELECT
	*
FROM
	AP..InvoiceCopy
WHERE InvoiceCopy.InvoiceTotal - InvoiceCopy.PaymentTotal - InvoiceCopy.CreditTotal = 0;


SELECT
	*
FROM
	AP..InvoiceArchive1;
