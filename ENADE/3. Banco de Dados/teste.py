import sqlite3

bd_connection = sqlite3.connect('DW_ENADE.db')

cursor = bd_connection.cursor()

sql_script = open("DB_ENADE.sql", "r")

sql_str = sql_script.read()

cursor.executescript(sql_str)

bd_connection.commit()

bd_connection.close()