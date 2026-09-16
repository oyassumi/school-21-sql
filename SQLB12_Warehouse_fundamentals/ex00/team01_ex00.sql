WITH last_currency_rates AS (
    SELECT id,
           name,
           rate_to_usd,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated DESC) as rn
    FROM currency),
     filtered_currency AS (
         SELECT id,
                name,
                rate_to_usd
         FROM last_currency_rates
         WHERE rn = 1),
     aggregated_balance AS (
         SELECT user_id,
                type,
                currency_id,
                SUM(money) as volume
         FROM balance
         GROUP BY user_id,
                  type,
                  currency_id)
SELECT COALESCE(u.name, 'not defined')         as name,
       COALESCE(u.lastname, 'not defined')     as lastname,
       b.type                                  as type,
       b.volume                                as volume,
       COALESCE(c.name, 'not defined')         as currency_name,
       COALESCE(c.rate_to_usd, 1)              as last_rate_to_usd,
       (b.volume * COALESCE(c.rate_to_usd, 1)) as total_volume_in_usd
FROM aggregated_balance b
         LEFT JOIN
     "user" u ON b.user_id = u.id
         LEFT JOIN
     filtered_currency c ON b.currency_id = c.id
ORDER BY name DESC,
         lastname,
         type;