-- Creates a view combining relevant data from a cluster of tables including: Employees, Offices, and Customers
-- This approach allows for the aggregation of data across multiple dimensions for assessing geographic analysis, managerial structure, and customer management
-- This view captures data for all employees of the Mint Classics company and as such should contain null values for top-level executives or employees not currently managing customers
CREATE OR REPLACE VIEW employees_cluster_view AS
SELECT 
    e.employeeNumber,
    e.lastName,
    e.firstName,
    e.jobTitle,
    e.reportsTo,
    m.lastName AS managerLastName,
    m.firstName AS managerFirstName,
    o.officeCode,
    o.city AS officeCity,
    o.country AS officeCountry,
    c.customerNumber,
    c.customerName,
    c.city AS customerCity,
    c.country AS customerCountry
FROM 
    employees e
LEFT JOIN 
    employees m ON e.reportsTo = m.employeeNumber
INNER JOIN 
    offices o ON e.officeCode = o.officeCode
LEFT JOIN 
    customers c ON e.employeeNumber = c.salesRepEmployeeNumber;