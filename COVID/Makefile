run-seed-covid: 
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear
	python3 1.ColetaDeDados/BaixarArquivoscovid.py

run-create-covid:
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear
	python3 3.BancodeDados/CriandoBancoDados.py

run-migrate-covid:
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear

run-create-seed-migrate-covid:
	make run-seed-endade
	make run-create-endade
	make run-migrate-endade