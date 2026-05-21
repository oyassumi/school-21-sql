SELECT
    COALESCE(person.name, '-') AS person_name,
    COALESCE(CAST(pv.visit_date AS varchar), 'null') AS visit_date,
    COALESCE(pz.name, '-') AS pizzeria_name
FROM person
FULL OUTER JOIN (
    SELECT *
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
) pv
    ON pv.person_id = person.id
FULL OUTER JOIN pizzeria pz
    ON pz.id = pv.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;