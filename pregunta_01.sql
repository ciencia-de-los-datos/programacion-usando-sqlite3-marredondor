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

def open_file (name_file):
    with open(name_file, "r") as file:
        data = file.readlines()
    
    data = [row.replace("\n", "") for row in data]
    data = [row.replace("\t", ",") for row in data]
    data = [row.split(",") for row in data]
    data = [tuple(line) for line in data]
    return data

tbl1 = open_file('tbl1.csv') 

conn = sqlite3.connect(":memory:")  ## aca se indica el nombre de la db.
cur = conn.cursor()

conn.executescript(
"""
DROP TABLE IF EXISTS truck_events;

CREATE TABLE tbl1 (K0  CHAR(1),
                   K1  INT,
                   c12 FLOAT,
                   c13 INT,
                   c14 DATE,
                   c15 FLOAT,
                   c16 CHAR(4));
"""
)
conn.commit()
	
cur.executemany("INSERT INTO tbl1 VALUES (?,?,?,?,?,?,?)", tbl1)
cur.execute("SELECT sum (c12) FROM tbl1").fetchall()
