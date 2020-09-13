# GNUCobol Docker

Imagem GNUCobol utilizada durante as aulas de Mainframe na Fatec Zona Leste.

## Versões:  
- Debian: 9
- gnucobol: 3.1

## Como utilizar


criar o arquivo docker-compose.:
> vim docker-compose.yml  
```docker
version: '3'

services:
  cobol:
    build: .
    entrypoint:  tail -f /dev/null
    container_name: cobol
    volumes:
      - ./src/:/oscobol/src/
```

Criar o diretório para mapear o volume
```
mkdir src
```

Importar o arquivo de exemplo HELLO.COB
```
wget -O src/HELLO.COB https://raw.githubusercontent.com/augusto-nascimento/gnucobol/master/HELLO.COB
```

executar o docker-compose e acessar o container
```
docker-compose up --build -d
docker exec -it cobol /bin/bas
```

Dentro do container, compilar e executar programa

```
cobc HELLO.COB
cobcrun HELLO
```