-- drop schema tp2;
create schema tp2
default character set utf8
default collate utf8_general_ci;
use tp2;

-- Necessário para rejeitar o erro ONLY FULL GROUP BY
set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

-- drop table estados;
create table estados(
	sigla char(2),
    estado varchar(25),
    regiao varchar(15),
    foreign key (regiao) references regioes (id),
    primary key(sigla)
)default charset= utf8;

load data local infile "C:\\wamp64\\www\\TP2-IBD\\CSVs\\estados.csv" into table estados
fields terminated by ';' lines terminated by '\n' ignore 1 lines (sigla, estado);

select estado from estados;
select * from estados;

-- drop table regiao
create table regioes(
	id integer auto_increment,
    regiao varchar(15) not null,
    primary key (id)
)default charset= utf8;

load data local infile "C:\\wamp64\\www\\TP2-IBD\\CSVs\\regioes.csv" into table regioes
fields terminated by ';' lines terminated by '\n' ignore 1 lines (regiao);

select regiao from regioes;
select * from regioes;

-- drop table biomas;
create table biomas(
	id integer auto_increment,
    bioma varchar(15),
    primary key(id)
)default charset= utf8;

load data local infile "C:\\wamp64\\www\\TP2-IBD\\CSVs\\biomas.csv" into table biomas
fields terminated by ';' lines terminated by '\n' ignore 1 lines (bioma);

select bioma from biomas;
select * from biomas;

-- drop table incendios_brasil;

create table incendios_ano(
	id integer auto_increment not null,
	ano integer,
    mes varchar(8),
    numero int,
    periodo date,
    primary key(id)
) default charset= utf8;
show tables;

-- CAMINHO PARA INCENDIOS_BRASIL.CSV é o diretório no qual está o arquivo incendios_brasil.csv as barras invertidas precisam ser duplas
load data local infile "C:\\wamp64\\www\\TP2-IBD\\CSVs\\incendios_ano.csv" into table incendios_ano 
fields terminated by ';' lines terminated by '\n' ignore 1 lines
(ano, mes, numero, @datevar) set periodo= str_to_date(@datevar, '%d/%m/%Y');

select * from incendios_ano;
select * from incendios_ano where numero> 100000 order by periodo;
select * from incendios_ano where ano= 2017;
select ano, sum(numero) as soma from incendios_ano group by ano order by soma desc;


-- drop table incendios_estado;
create table incendios_estado(
	id integer auto_increment not null,
    ano integer,
    estado varchar(20),
    mes varchar(8),
    numero integer,
    periodo date,
    primary key (id)
) default charset= utf8;
show tables;

load data local infile "C:\\wamp64\\www\\TP2-IBD\\CSVs\\incendios_estado.csv" into table incendios_estado 
fields terminated by '\t' lines terminated by '\n' ignore 1 lines
(ano, estado, mes, numero, @datevar) set periodo= str_to_date(@datevar, '%d/%m/%Y');

select * from incendios_estado where estado like '%Sul%';
select * from incendios_estado where estado like 'Minas%';
select estado, sum(numero) as soma from incendios_estado group by estado order by soma desc;
