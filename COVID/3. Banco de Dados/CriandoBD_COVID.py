import sqlite3

bd_connection = sqlite3.connect("COVID.db")

cursor = bd_connection.cursor()

sql_script = open("/Users/conta/Desktop/3. Banco de Dados/SCRIPT_COVID_MG.sql")

sql_str = sql_script.read()

cursor.executescript(sql_str)

bd_connection.commit()

bd_connection.close()