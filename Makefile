# Makefile para comandos Artisan e Yarn

.PHONY: all format dev migrate clear build seed

all:
	yarn build
	php artisan optimize:clear
	php artisan migrate:fresh --seed
	- rmdir /s /q "./storage/app/public/certificados"
	- rmdir /s /q "./storage/app/public/perfil"
	php artisan serve

format:
	prettier --write "src/**/*.vue"

# Comando para migrar e popular o banco de dados
migrate:
	php artisan migrate:fresh --seed

# Comando para iniciar o servidor de desenvolvimento
dev:
	php artisan serve

# Comando para limpar o cache e otimizações
clear:
	php artisan optimize:clear

# Comando para compilar os assets
build:
	yarn build

# Comando para executar os seeds do banco de dados
seed:
	php artisan db:seed
