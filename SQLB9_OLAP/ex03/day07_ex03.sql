SELECT t1.name, coalesce(t1.count, 0) + coalesce(t2.count, 0) AS total_count
FROM
(SELECT name, COUNT(*) AS "count"
FROM person_visits
INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY name) AS t1

FULL JOIN

(SELECT name, COUNT(*) AS "count"
FROM person_order
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY name) AS t2 ON t1.name = t2.name

ORDER BY total_count DESC, name;