import sqlite3

bd_connection = sqlite3.connect("ENADE.db")

cursor = bd_connection.cursor()

sql_script = open("/Users/conta/Desktop/Data-Warehouse-2021-1-1/ENADE/3. Banco de Dados/SCRIPT_BD_ENADE.sql")

sql_str = sql_script.read()

cursor.executescript(sql_str)

bd_connection.commit()

bd_connection.close()