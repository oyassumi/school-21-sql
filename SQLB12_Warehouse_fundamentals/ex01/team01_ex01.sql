INSERT INTO currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT COALESCE(u.name, 'not defined')     AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       c_name.name                         AS currency_name,
       (b.money * COALESCE(
               (SELECT c1.rate_to_usd
                FROM currency c1
                WHERE c1.id = b.currency_id
                  AND c1.updated <= b.updated
                ORDER BY c1.updated DESC
                LIMIT 1),
           -- t2: если в прошлом нет, берем ближайший в будущем
               (SELECT c2.rate_to_usd
                FROM currency c2
                WHERE c2.id = b.currency_id
                  AND c2.updated > b.updated
                ORDER BY c2.updated
                LIMIT 1)
                  ))                       AS currency_in_usd
FROM balance b
         INNER JOIN (SELECT DISTINCT id, name
                     FROM currency) c_name ON b.currency_id = c_name.id
         LEFT JOIN
     "user" u ON b.user_id = u.id
ORDER BY name DESC,
         lastname,
         currency_name;