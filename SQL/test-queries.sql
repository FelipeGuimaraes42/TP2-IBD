use tp2;

-- Consultas teste regioes
select regiao from regioes;
select * from regioes;

-- Consultas teste estados
select estado from estados;
select * from estados;
select estado, regiao from regioes natural join estados order by regiao, estado;

-- Consultas teste biomas
select bioma from biomas;
select * from biomas;

-- Consultas teste tabela relacional biomas_estados
select * from biomas_estados;
select * from biomas natural join biomas_estados natural join estados;
select estado, bioma from biomas natural join biomas_estados natural join estados;

-- Consultas testes para a tabela incendios
select * from incendios;
select * from incendios where sigla_estado like '_S%';
select * from incendios where sigla_estado= 'MG';
select sigla_estado, sum(numero) as soma from incendios group by sigla_estado order by soma desc;
select sum(numero) from incendios;
select estado, sum(numero) as soma from incendios natural join estados group by sigla_estado order by soma desc;
select estado, bioma, numero from biomas natural join biomas_estados natural join estados natural join incendios where numero>100;
select bioma, sum(numero) focos from biomas natural join biomas_estados natural join estados natural join incendios 
	group by bioma order by focos desc;
