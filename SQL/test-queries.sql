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

select regiao, sum(numero) as c from estados natural join regioes natural join biomas_estados 
            natural join biomas natural join incendios group by regiao order by c desc;
            
select ano, estado, sum(numero) from incendios natural join estados where ano = (select ano
from incendios group by ano having sum(numero) = (select sum(numero) as soma from incendios
group by ano order by soma desc limit 1)) group by estado;

select mes, sum(numero) as numero_de_incendios from incendios where numero>0 group by
mes;

select estado, mes, ano, numero from incendios natural join estados where numero= (select
max(numero) from incendios);

select bioma, format(avg(total_anual), 2) as media_anual, format(std(total_anual), 2) as dev_pad_anual from ( select
            bioma, sum(numero) as total_anual from ( select id_bioma, bioma from biomas ) as biomas natural
            join biomas_estados natural join incendios group by bioma, ano ) as agp_anual group by bioma
            order by media_anual desc;
            
select estado, round(avg(numero), 2) as media from estados natural join incendios group by
estado order by media desc limit 5;

select bioma, ano, round(variance(numero), 2) as variancia from biomas
natural join biomas_estados natural join estados natural join incendios where id_bioma = 3 group
by ano;

SELECT regiao, ano, sum(numero) AS total_anual FROM regioes NATURAL JOIN estados
NATURAL JOIN incendios WHERE id_regiao = 3 GROUP BY ano having total_anual > ( SELECT
AVG(total) FROM ( SELECT sum(numero) as total from regioes NATURAL JOIN estados
NATURAL JOIN incendios WHERE id_regiao = 3 GROUP BY ano ) AS total_por_ano GROUP
BY regiao ) ORDER BY ano;

select avg(numero) from incendios natural join estados natural join regioes where regiao like 'Norte';

SELECT estado, ano, SUM(numero) AS numero_de_incendios FROM estados
NATURAL JOIN incendios WHERE (ano >= 2000 AND ano <= 2009) AND estado =
'Amazonas' GROUP BY ano ORDER BY numero_de_incendios;