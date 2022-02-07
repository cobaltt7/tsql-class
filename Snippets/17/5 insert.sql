SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
USE AP;

INSERT INTO AP..InvoiceCopy
VALUES
	(97, '456789', '2016-04-01', 8344.50, 0, 0, 1, '2016-04-30', NULL);

INSERT INTO AP..InvoiceCopy
	(VendorID,InvoiceNumber,InvoiceTotal,PaymentTotal,CreditTotal,TermsID,InvoiceDate,InvoiceDueDate)
VALUES
	(95, '11', 8344.50, 0, 0, 1, '2016-04-01', '2016-04-30');

INSERT INTO AP..InvoiceCopy
VALUES
	(95, '111-10098', '2020-03-01', 219.50, 0, 0, 1, '2020-03-31', NULL),
	(102, '109596', '2020-03-01', 22.97, 0, 0, 1, '2020-03-31', NULL),
	(72, '40319', '2020-03-01', 173.38, 0, 0, 1, '2020-03-31', NULL);

USE Examples;

SELECT
	*
FROM
	Examples..ColorSample;

INSERT INTO Examples..ColorSample
	(ColorNumber)
VALUES
	(606);

INSERT INTO Examples..ColorSample
	(ColorName)
VALUES
	('Yellow');

INSERT INTO Examples..ColorSample
VALUES
	(DEFAULT, 'Orange');

INSERT INTO Examples..ColorSample
VALUES
	(808, NULL);

INSERT INTO Examples..ColorSample
VALUES
	(DEFAULT, NULL);

INSERT INTO Examples..ColorSample
DEFAULT VALUES;

SELECT
	*
FROM
	Examples..ColorSample;
