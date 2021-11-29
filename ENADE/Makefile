run-seed-enade: 
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear
	python3 1.ColetaDeDados/BaixarArquivosEnade.py

run-create-enade:
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear
	python3 3.BancodeDados/CriandoBancoDados.py

run-migrate-enade:
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear

run-create-seed-migrate-enade:
	make run-seed-endade
	make run-create-endade
	make run-migrate-endade

