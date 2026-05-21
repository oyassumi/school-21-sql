WITH dates AS (
    SELECT generate_series(date '2022-01-01', date '2022-01-10', interval '1 day')::date AS missing_date
)
SELECT dates.missing_date
FROM dates
LEFT JOIN person_visits pv
    ON dates.missing_date = pv.visit_date
    AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.visit_date IS NULL
ORDER BY dates.missing_date;