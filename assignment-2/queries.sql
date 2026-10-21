-- Question 1: For a given order, who owes how much?
-- Returns one row per student in the order: name and amount owed.
-- The amount is quantity * unit_price summed over everything that student ordered.
-- Change the order id in the WHERE clause to see another order (here: order 1).
SELECT s.name,
       SUM(oi.quantity * oi.unit_price) AS amount
FROM order_items oi
JOIN students s ON s.id = oi.student_id
WHERE oi.order_id = 1
GROUP BY s.id, s.name
ORDER BY amount DESC, s.name;


-- Question 2: The total of every order, sorted by date.
-- Returns one row per order: id, date, place and the total sum of all its items,
-- oldest order first.
SELECT o.id AS order_id,
       o.order_date,
       o.place,
       SUM(oi.quantity * oi.unit_price) AS total
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
GROUP BY o.id, o.order_date, o.place
ORDER BY o.order_date;
