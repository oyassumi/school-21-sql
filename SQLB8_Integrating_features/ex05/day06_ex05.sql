COMMENT ON TABLE person_discounts IS
'Table stores personal discounts for customers in specific pizzerias';

COMMENT ON COLUMN person_discounts.id IS
'Primary key of the personal discount record';

COMMENT ON COLUMN person_discounts.person_id IS
'Identifier of the customer';

COMMENT ON COLUMN person_discounts.pizzeria_id IS
'Identifier of the pizzeria';

COMMENT ON COLUMN person_discounts.discount IS
'Personal discount percentage for a customer in a specific pizzeria';