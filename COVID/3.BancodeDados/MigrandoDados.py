import sqlite3

conn = sqlite3.connect("COVID_MG.db")

cursor = conn.cursor()

sql_script = open("/Users/conta/Desktop/3. Banco de Dados/COVID/SCRIPT_SQL_COVID_MG.sql")

sql_str = sql_script.read()

cursor.executescript(sql_str)

conn.close()