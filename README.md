# Universe Database

Este projeto foi desenvolvido como parte do curso do freeCodeCamp para certificação de Bancos de Dados Relacionais. Ele consiste em um banco de dados PostgreSQL que simula um universo com galáxias, estrelas, planetas e luas, além de aglomerados de galáxias.

## Sobre o projeto

O banco de dados foi modelado para representar uma estrutura hierárquica do universo, com as seguintes entidades:

- galaxy_cluster
- galaxy
- star
- planet
- moon

## Esquema do banco de dados

### galaxy_cluster

- galaxy_cluster_id: integer (PRIMARY KEY)
- name: character varying(50) (UNIQUE, NOT NULL)
- type: text
- number_of_galaxies: integer
- distance_from_earth: numeric

### galaxy

- galaxy_id: integer (PRIMARY KEY)
- name: character varying(50) (UNIQUE, NOT NULL)
- type: text
- mass: numeric
- number_of_stars: integer

### star

- star_id: integer (PRIMARY KEY)
- name: character varying(50) (UNIQUE, NOT NULL)
- type: text
- mass: numeric(10,2)
- diameter: numeric(10,2)
- galaxy_id: integer (FOREIGN KEY → galaxy.galaxy_id)

### planet

- planet_id: integer (PRIMARY KEY)
- name: character varying(50) (UNIQUE, NOT NULL)
- type: text
- mass: numeric(10,2)
- diameter: numeric(10,2)
- is_dead: boolean
- star_id: integer (FOREIGN KEY → star.star_id)

### moon

- moon_id: integer (PRIMARY KEY)
- name: character varying(50) (UNIQUE, NOT NULL)
- type: text
- mass: numeric(10,2)
- diameter: numeric(10,2)
- is_dead: boolean
- planet_id: integer (FOREIGN KEY → planet.planet_id)

## Representações

### galaxy_cluster
Representa aglomerados de galáxias.

### galaxy
Representa galáxias individuais.

### star
Representa estrelas dentro de galáxias.

### planet
Representa planetas que orbitam estrelas.

### moon
Representa luas que orbitam planetas.

## Relacionamentos

- Um galaxy_cluster pode conter várias galaxies
- Uma galaxy pode conter várias stars
- Uma star pode conter vários planets
- Um planet pode conter várias moons

## Backup do banco de dados

Para salvar o estado do banco de dados na máquina virtual, foi utilizado o comando:

```
pg_dump -cC --inserts -U postgres universe > universe.sql
```

Esse comando gera um arquivo universe.sql contendo todos os comandos necessários para recriar o banco de dados.

Restaurar o banco de dados

Para recriar o banco de dados a partir do arquivo de backup, utilize:

```
psql -U postgres < universe.sql
```

Objetivo

Praticar modelagem de banco de dados relacional, criação de tabelas, uso de chaves estrangeiras e manipulação de dados com PostgreSQL.
