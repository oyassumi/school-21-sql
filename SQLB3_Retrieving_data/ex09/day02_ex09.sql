SELECT name
FROM person
INNER JOIN person_order ON person_order.person_id = person.id
INNER JOIN menu ON menu.id = person_order.menu_id
WHERE gender = 'female'
    AND pizza_name IN ('pepperoni pizza', 'cheese pizza')
GROUP BY person.name
HAVING COUNT(DISTINCT menu.pizza_name) = 2
ORDER BY name;