-- 
--  La tabla `tbl1` tiene la siguiente estructura:
-- 
--    K0  CHAR(1)
--    K1  INT
--    c12 FLOAT
--    c13 INT
--    c14 DATE
--    c15 FLOAT
--    c16 CHAR(4)
--
--  Escriba una consulta en SQL que devuelva la suma del campo c12.
-- 
--  Rta/
--     SUM(c12)
--  0  15137.63
--
--  >>> Escriba su codigo a partir de este punto <<<
--
CREATE TABLE tbl1 (
    K0  CHAR(1),
    K1  INT,
    c12 FLOAT,
    c13 INT,
    c14 DATE,
    c15 FLOAT,
    c16 CHAR(4)
    );
    
INSERT INTO tbl1 VALUES (?,?,?,?,?,?,?)", tbl1
SELECT sum (c12) FROM tbl1
