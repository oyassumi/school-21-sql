SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
INNER JOIN person ON person.id = person_visits.person_id
WHERE person.name = 'Andrey'

EXCEPT

SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_order ON person_order.menu_id = menu.id
INNER JOIN person ON person.id = person_order.person_id
WHERE person.name = 'Andrey'

ORDER BY pizzeria_name;