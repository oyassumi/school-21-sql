SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_order ON person_order.menu_id = menu.id
INNER JOIN person ON person.id = person_order.person_id
WHERE person.name = 'Denis' OR person.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;