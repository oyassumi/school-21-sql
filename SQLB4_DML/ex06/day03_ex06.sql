SELECT m1.pizza_name, p1.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, m1.price
FROM menu m1
INNER JOIN menu m2 ON m2.pizza_name = m1.pizza_name
    AND m2.price = m1.price
	AND m2.pizzeria_id < m1.pizzeria_id
INNER JOIN pizzeria p1 ON p1.id = m1.pizzeria_id
INNER JOIN pizzeria p2 ON p2.id = m2.pizzeria_id
ORDER BY m1.pizza_name;