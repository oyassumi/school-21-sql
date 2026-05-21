(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
INNER JOIN person ON person.id = person_visits.person_id
WHERE gender = 'female'

EXCEPT ALL

SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
INNER JOIN person ON person.id = person_visits.person_id
WHERE gender = 'male')

UNION ALL

(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
INNER JOIN person ON person.id = person_visits.person_id
WHERE gender = 'male'

EXCEPT ALL

SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
INNER JOIN person ON person.id = person_visits.person_id
WHERE gender = 'female')

ORDER BY pizzeria_name;