import sqlite3

print("--- Criando Banco de Dados COVID ---")
bd_connection = sqlite3.connect("COVID.db")

cursor = bd_connection.cursor()

sql_script = open(
    "/Users/lulianom/Documents/Codes/Data-Warehouse-2021-1/COVID/3.BancodeDados/SCRIPT_COVID_MG.sql"
)

sql_str = sql_script.read()

cursor.executescript(sql_str)

bd_connection.commit()

bd_connection.close()
