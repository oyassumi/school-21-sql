WITH RECURSIVE routes AS (

    SELECT
        point1,
        point2,
        ARRAY[point1, point2] AS path,
        cost
    FROM city
    WHERE point1 = 'a'

    UNION ALL

    SELECT
        r.point1,
        c.point2,
        r.path || c.point2,
        r.cost + c.cost
    FROM routes r
    JOIN city c
        ON r.point2 = c.point1
    WHERE NOT c.point2 = ANY(r.path)
),

all_tours AS (

    SELECT
        cost + (
            SELECT cost
            FROM city
            WHERE point1 = routes.point2
              AND point2 = 'a'
        ) AS total_cost,

        path || ARRAY['a'] AS tour

    FROM routes
    WHERE array_length(path,1)=4
),
    ranked AS (
    SELECT *,
           MIN(total_cost) OVER () AS min_cost,
           MAX(total_cost) OVER () AS max_cost
    FROM all_tours
)

SELECT *
FROM all_tours
WHERE total_cost = (
    SELECT MIN(total_cost)
    FROM all_tours
)

or total_cost = (
        SELECT MAX(total_cost)
        FROM all_tours
)

ORDER BY total_cost,tour;