SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;

USE Examples;

SELECT
	VendorName,
	InvoiceNumber,
	InvoiceTotal
FROM
	Vendors LEFT JOIN Invoices ON Vendors.VendorID = Invoices.InvoiceID
ORDER BY VendorName;

SELECT
	DeptName,
	Departments.DeptNo,
	LastName
FROM
	Departments LEFT JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo;

SELECT
	DeptName,
	Departments.DeptNo,
	LastName
FROM
	Departments RIGHT JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo;

SELECT
	DeptName,
	Departments.DeptNo,
	Employees.DeptNo,
	LastName
FROM
	Departments FULL JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo;
