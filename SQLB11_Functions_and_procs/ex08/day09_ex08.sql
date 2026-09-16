CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)

RETURNS TABLE (fib_num integer)
AS
$$
DECLARE
    a integer := 0;
    b integer := 1;
    temp integer;
BEGIN
    WHILE a < pstop LOOP
        fib_num := a;
        RETURN NEXT;

        temp := a + b;
        a := b;
        b := temp;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();