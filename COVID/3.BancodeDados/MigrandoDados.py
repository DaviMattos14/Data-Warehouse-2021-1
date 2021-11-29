from os import sep
import sqlite3
from sqlite3.dbapi2 import Row
import pandas as pd

conn = sqlite3.connect("teste_COVID.db")
cursor = conn.cursor()

caminho = "C:/Users/conta/Desktop/Data-Warehouse-2021-1/COVID/1. Coleta de Dados/DADOS_COVID-19_MG/teste.txt"

arquivo = pd.read_csv(caminho, sep=";", dtype=str)
insert_inicio = """
INSERT INTO Casos (municipio, NUM_CASOS, DATA_CASOS, codIBGE, urs, MICRO, regiao)
VALUES
"""
values = ",".join(
    [
        "('{}', '{}', '{}', '{}', '{}', '{}', '{}')".format(
            row[0], row[1], row[2], row[3], row[4], row[5], row[6]
        )
        for id, row in arquivo.iterrows()
    ]
)

query = insert_inicio + values

conn.execute(query)
conn.commit()
conn.close()
