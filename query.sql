-- drop schema tp2;
create schema tp2
default character set utf8
default collate utf8_general_ci;
use tp2;

-- Necessário para rejeitar o erro ONLY FULL GROUP BY
set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

-- drop table incendios_brasil;

create table incendios_brasil(
	id integer auto_increment not null,
	ano integer,
    mes varchar(8),
    numero int,
    periodo date,
    primary key(id)
) default charset= utf8;
show tables;

-- CAMINHO PARA INCENDIOS_BRASIL.CSV é o diretório no qual está o arquivo incendios_brasil.csv as barras invertidas precisam ser duplas
load data local infile "C:\\wamp64\\www\\TP2-IBD\\CSVs\\incendios_brasil.csv" into table incendios_brasil 
fields terminated by ';' lines terminated by '\n' ignore 1 lines
(ano, mes, numero, @datevar) set periodo= str_to_date(@datevar, '%d/%m/%Y');

select * from incendios_brasil;
select * from incendios_brasil where numero> 100000 order by periodo;
select * from incendios_brasil where ano= 2017;
select ano, sum(numero) as soma from incendios_brasil group by ano order by soma desc;


-- drop table incendios_estado
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
