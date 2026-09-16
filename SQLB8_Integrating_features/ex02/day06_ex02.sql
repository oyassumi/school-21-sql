SELECT p.name, pizza_name, price, (m.price - (m.price * pd.discount/100)) AS discount_price, pizzeria.name AS pizzeria_name
FROM person_order
    INNER JOIN person p ON p.id = person_order.person_id
    INNER JOIN menu m ON m.id = person_order.menu_id
    INNER JOIN pizzeria ON pizzeria.id = m.pizzeria_id
    INNER JOIN person_discounts pd ON pd.person_id = p.id AND pd.pizzeria_id = pizzeria.id
ORDER BY p.name, pizza_name;