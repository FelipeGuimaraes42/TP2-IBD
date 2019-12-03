-- Cria o Esquema referente ao TP2
create schema if not exists tp2
default character set utf8
default collate utf8_general_ci;
use tp2;

-- Cria a tabela para armazenar as regiões brasileiras
create table if not exists regioes(
	id_regiao integer auto_increment,
    regiao varchar(13) not null,
    img_regiao blob,
    primary key (id_regiao)
)default charset= utf8;

-- Cria a tabela que armazena os estados brasileiros
create table if not exists estados(
	sigla_estado char(2),
    estado varchar(19) not null,
    id_regiao integer not null,
    foreign key (id_regiao) references regioes (id_regiao),
    primary key (sigla_estado)
)default charset= utf8;

-- Cria a tabela que armazena os biomas brasileiros
create table if not exists biomas(
	id_bioma integer auto_increment,
    bioma varchar(15) not null,
    img_bioma blob,
    primary key (id_bioma)
)default charset= utf8;

-- Cria a tabela que armazena as relações entre os biomas e estados, necessária pois é uma relação n-m
create table if not exists biomas_estados(
	sigla_estado char(2),
    id_bioma integer,
    primary key (sigla_estado, id_bioma),
    foreign key (sigla_estado) references estados(sigla_estado),
    foreign key (id_bioma) references biomas(id_bioma)
)default charset= utf8;

-- Cria a tabela que armazena os incêndios em cada estado
create table if not exists incendios(
	id_inc_est integer auto_increment not null,
    ano integer not null,
    sigla_estado varchar(2) not null,
    mes varchar(9) not null,
    numero integer not null,
    foreign key (sigla_estado) references estados(sigla_estado),
    primary key (id_inc_est)
) default charset= utf8;