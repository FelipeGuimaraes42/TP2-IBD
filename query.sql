drop schema tp2;
create schema tp2
default character set utf8
default collate utf8_general_ci;
use tp2;

drop table incendios_brasil;

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
load data local infile "CAMINHO PARA INCENDIOS_BRASIL.CSV" into table incendios_brasil 
fields terminated by ';' lines terminated by '\n' ignore 1 lines
(ano, mes, numero, @datevar) set periodo= str_to_date(@datevar, '%d/%m/%Y');

select * from incendios_brasil;
select * from incendios_brasil where numero> 100000 order by periodo;
select * from incendios_brasil where ano= 2017;


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

load data local infile "CAMINHO PARA INCENDIOS_ESTADO.CSV" into table incendios_estado 
fields terminated by '\t' lines terminated by '\n' ignore 1 lines
(ano, estado, mes, numero, @datevar) set periodo= str_to_date(@datevar, '%d/%m/%Y');

select * from incendios_estado where estado like '%Sul%';
select * from incendios_estado where estado like 'Minas%';
