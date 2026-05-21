SELECT name
FROM person
INNER JOIN person_order ON person_order.person_id = person.id
INNER JOIN menu ON menu.id = person_order.menu_id
WHERE address IN ('Moscow', 'Samara')
    AND gender = 'male'
	AND pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC;