import os
import requests
import zipfile
from io import BytesIO

print("--- Baixando Dados COVID-MG ---")

os.makedirs("./DADOS_COVID-19_MG", exist_ok=True)

url = "http://sescloud.saude.mg.gov.br/index.php/s/ZEzzC8jFpobXGjM/download?path=%2FPAINEL_COVID&files=CSV_Painel.zip"

filebytes = BytesIO(requests.get(url).content)

myzip = zipfile.ZipFile(filebytes)
myzip.extractall("./DADOS_COVID-19_MG")
