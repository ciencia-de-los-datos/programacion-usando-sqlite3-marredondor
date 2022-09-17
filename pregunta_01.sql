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
import pandas as pd
import sqlite3
tbl1 = pd.read_csv('tbl1.csv', 
                      sep=",", 
                      header = None, 
                      decimal=".",
                      names = ['K0','K1','c12','c13','c14','c15','c16'])

conn = sqlite3.connect(":memory:")  ## aca se indica el nombre de la db.
cur = conn.cursor()

tbl1.to_sql(
    name="tbl1",
    con=conn,
    if_exists="replace")

respuesta = cur.execute("SELECT sum (c12) FROM tbl1").fetchall()
respuesta = { "0": respuesta[0][0]}
respuesta
