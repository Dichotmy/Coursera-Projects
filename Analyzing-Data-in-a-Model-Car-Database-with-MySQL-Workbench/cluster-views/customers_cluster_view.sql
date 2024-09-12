-- Creates a view combining relevant data from a cluster of tables including: Customers, Employees, Orders, and Payments
-- This approach joins data to represent all customers across multiple dimensions to assess customer purchase behavior, sales rep performance, and time series and geographic analysis
CREATE OR REPLACE VIEW customers_cluster_view AS
WITH order_totals AS (
    SELECT o.orderNumber, o.customerNumber, SUM(od.quantityOrdered * od.priceEach) AS totalOrderAmount
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    GROUP BY o.orderNumber, o.customerNumber
),
aggregated_payments AS (
    SELECT p.customerNumber, SUM(p.amount) AS totalPayments, MAX(p.paymentDate) AS latestPaymentDate
    FROM payments p
    GROUP BY p.customerNumber
)
SELECT c.customerNumber, c.customerName, c.city, c.country, 
       c.creditLimit, c.salesRepEmployeeNumber, e.lastName, e.firstName, 
       ot.orderNumber, o.orderDate, o.shippedDate, o.status, 
       ap.latestPaymentDate, COALESCE(ap.totalPayments, 0) AS totalPayments,
       ot.totalOrderAmount
FROM customers c
LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
LEFT JOIN order_totals ot ON o.orderNumber = ot.orderNumber
LEFT JOIN aggregated_payments ap ON c.customerNumber = ap.customerNumber
GROUP BY c.customerNumber, c.customerName, c.city, c.country, 
         c.salesRepEmployeeNumber, c.creditLimit, e.lastName, e.firstName, 
         ot.orderNumber, o.orderDate, o.shippedDate, o.status, 
         ap.latestPaymentDate, ot.totalOrderAmount;