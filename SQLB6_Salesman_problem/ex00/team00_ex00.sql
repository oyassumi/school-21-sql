Create table city (point1 varchar,point2 varchar,cost INTEGER);


INSERT INTO city values
('a','b',10),
('b','a',10),
('b','d',25),
('d','b',25),
('a','d',20),
('d','a',20),
('a','c',15),
('c','a',15),
('b','c',35),
('c','b',35),
('c','d',30),
('d','c',30);


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
)

SELECT *
FROM all_tours
WHERE total_cost = (
    SELECT MIN(total_cost)
    FROM all_tours
)
ORDER BY total_cost,tour;

