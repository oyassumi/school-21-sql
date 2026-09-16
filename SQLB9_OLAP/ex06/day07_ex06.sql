SELECT p.name, 
    COUNT(*) AS count_of_orders, round(avg(m.price), 2) AS average_price, 
	max(m.price) AS max_price, 
	min(m.price) AS min_price
FROM person_order
INNER JOIN menu m ON m.id = person_order.menu_id
INNER JOIN pizzeria p ON p.id = m.pizzeria_id
GROUP BY p.name
ORDER BY p.name;