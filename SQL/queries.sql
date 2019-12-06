use tp2;

-- Consultas envolvendo seleção e projeção - 2

-- Soma do número de incêndios em cada mês entre os anos de 1998 e 2017:
select mes, sum(numero) as numero_de_incendios from incendios group by mes order by numero_de_incendios desc;
select mes, sum(numero) as numero_de_incendios from incendios where numero > 0 group by mes order by numero_de_incendios desc;

-- Soma do número de incêndios por cada ano no período de 1998 até 2017:
select ano, sum(numero) as numero_de_incendios from incendios group by ano order by numero_de_incendios desc;
select ano, sum(numero) as numero_de_incendios from incendios where numero <> 0 group by ano order by numero_de_incendios desc;

-- Consultas envolvendo a junção de duas relações - 3

-- Quantidade de estados que contem o Bioma X:
select bioma, count(id_bioma) as estados_presentes from biomas_estados natural join biomas group by id_bioma order by estados_presentes desc;
select biomas.bioma, count(biomas.id_bioma) as estados_presentes
	from biomas_estados, biomas
    where biomas.id_bioma = biomas_estados.id_bioma
    group by biomas.id_bioma
    order by estados_presentes desc;
    
-- Estado, mês e ano do número máximo de queimadas em apenas um mês:
select estado, mes, ano, numero from incendios natural join estados where numero= (select max(numero) from incendios);
select estado, mes, ano, numero
	from incendios as inc1 natural join estados
	where not exists (
		select numero
		from incendios as inc2
        where inc2.numero > inc1.numero
	);

-- 5 estados com maior média de queimadas por mes
select estado, round(avg(numero), 2) as media from estados natural join incendios group by estado order by media desc limit 5;
-- Mesma consulta, mas com produto cartesiano e somente as colunas utilizadas
select estado, round(avg(numero), 2) as media
	from (
		select sigla_estado, estado
			from estados
	) as estados
    natural join (
		select sigla_estado, numero
			from incendios
    ) as inc
    where estados.sigla_estado = inc.sigla_estado
    group by estado
    order by media desc limit 5;

-- Consultas envolvendo a junção de três ou mais relações - 3

-- Total de focos de incêndio de cada região
select regiao, sum(numero) as c from estados natural join regioes natural join incendios group by regiao order by c desc;
-- Mesma consulta, com indexes e só somando números diferentes de zero
create index idx_sig_est on estados(sigla_estado); 
create index idx_est_id_reg on estados(id_regiao); 
create index idx_id_reg on regioes(id_regiao); 
create index idx_inc_sig_est on incendios(sigla_estado); 
select regiao, sum(numero) as c  
	from ( 
		select sigla_estado, id_regiao 
			from estados 
			use index (idx_sig_est, idx_est_id_reg) 
	) as estados natural join ( 
		select id_regiao, regiao 
			from regioes  
            use index(idx_id_reg) 
	) as regioes natural join ( 
		select sigla_estado, numero 
			from incendios  
            use index (idx_inc_sig_est) 
            where numero <> 0 
	) as incendios 
    group by regiao 
    order by c desc; 
drop index idx_sig_est on estados; 
drop index idx_est_id_reg on estados; 
drop index idx_id_reg on regioes; 
drop index idx_inc_sig_est on incendios; 

-- Dado um Bioma, determinar o número de focos de incendios ocorridos naquele Bioma, no período de 1998 à 2017;
SELECT bioma, SUM(numero) AS total_incendios FROM biomas NATURAL JOIN biomas_estados NATURAL JOIN estados NATURAL JOIN incendios 
	GROUP BY bioma ORDER BY total_incendios;
-- Mesma consulta, mas com somente as colunas necessárias, e contando somente os meses com um número de incêncios maior que zero
select bioma, sum(numero) as total_incendios
	from (
		select id_bioma, bioma
			from biomas
	) as biomas
    natural join biomas_estados
    natural join (
		select sigla_estado
			from estados
	) as estados
	natural join (
		select sigla_estado, numero
			from incendios
			where numero <> 0
	) as incendios
    group by bioma
    order by total_incendios;

-- Variância do número de queimadas por ano no bioma Cerrado
select bioma, ano, round(variance(numero), 2) as variancia from
	biomas natural join biomas_estados natural join estados natural join incendios
	where id_bioma = 3
    group by ano;
-- Mesma consulta, utilizando indexes e consultas aninhadas
create index idx_sig_est on estados(sigla_estado);
create index idx_be_sig_est on biomas_estados(sigla_estado); 
create index idx_be_id_bio on biomas_estados(id_bioma); 
create index idx_id_bio on biomas(id_bioma); 
create index idx_inc_sig_est on incendios(sigla_estado); 
select bioma, ano, round(variance(numero), 2) as variancia
	from (
		select id_bioma, bioma
			from biomas
            use index(idx_id_bio)
            where id_bioma = 3
    ) as biomas
	natural join biomas_estados
		use index (idx_be_sig_est, idx_be_id_bio)
    natural join (
		select sigla_estado
			from estados
            use index(idx_sig_est)
	) as estados
    natural join (
		select sigla_estado, ano, numero
			from incendios
            use index(idx_inc_sig_est)
	) as incendios
    group by ano;
drop index idx_sig_est on estados;
drop index idx_be_sig_est on biomas_estados; 
drop index idx_be_id_bio on biomas_estados; 
drop index idx_id_bio on biomas; 
drop index idx_inc_sig_est on incendios; 

-- Consultas envolvendo funções de agregação sobre o resultado da junção de duas ou mais relações - 2

-- Retorna a soma dos incêndios do ano em que ocorreu o maior número de incêndios, por estado
select ano, estado, sum(numero) as total_de_incendios
	from incendios
    natural join estados 
    where ano = (
		select ano 
			from incendios 
            group by ano 
			having sum(numero) = ( 
				select sum(numero) as soma 
					from incendios 
					group by ano 
                    order by soma desc limit 1
			)
	) 
    group by estado;
-- Mesma consulta, mas utilizando not exists
select ano, estado, sum(numero) as total_de_incendios
	from incendios
    natural join estados 
    where ano = (
		select ano 
			from incendios as inc1
            group by ano 
			having not exists ( 
				select sum(numero) as soma 
					from incendios as inc2
					group by ano 
                    having soma > sum(inc1.numero)
			)
	) 
    group by estado;

-- Anos no qual a região norte teve um número de queimadas maior do que sua média total de queimadas entre 1998 e 2017:
SELECT regiao, ano, sum(numero) AS total_anual FROM regioes NATURAL JOIN estados NATURAL JOIN incendios WHERE id_regiao = 3 
	GROUP BY ano having total_anual > (
		SELECT AVG(total) FROM (
			SELECT sum(numero) as total from regioes NATURAL JOIN estados NATURAL JOIN incendios WHERE id_regiao = 3 GROUP BY ano
		) AS total_por_ano GROUP BY regiao
	) ORDER BY ano;

select regiao, ano, sum(numero) as total_anual
	from (
		select id_regiao, regiao 
			from regioes 
            where id_regiao = 3
	) as regioes
    natural join (
		select sigla_estado, id_regiao
        from estados 
        where id_regiao = 3
	) as estados
    natural join (
		select sigla_estado, ano, numero
			from incendios
            where numero <> 0
	) as incendios
	group by ano 
    having total_anual > (
		select avg(total)
			from (
				select sum(numero) as total 
					from (
						select id_regiao, regiao 
							from regioes 
							where id_regiao = 3
					) as regioes
					natural join (
						select sigla_estado
							from estados 
							where id_regiao = 3
					) as estados
					natural join (
						select sigla_estado, ano, numero 
							from incendios 
							where numero <> 0
					) as incendios
					group by ano 
			) as total_por_ano 
            group by regiao 
	) order by ano; 

-- Consultas relatório - 3

/*Consulta Relatório - Número de incêndios ocorridos no estado do Amazonas em um período de 10 anos (2000-2009), 
agrupados por ano, ordenados por número de incêndios:*/
SELECT estado, ano, SUM(numero) AS numero_de_incendios FROM estados NATURAL JOIN incendios 
WHERE (ano >= "2000" AND ano <= "2009") AND estado = "Amazonas" GROUP BY ano ORDER BY numero_de_incendios DESC;

-- Consulta Relatório - Biomas associados com suas respectivas média de incêndio anual e desvio padrão de incêndios anual
select bioma, avg(total_anual) as media_anual, std(total_anual) as dev_pad_anual
	from (
		select bioma, sum(numero) as total_anual
        from (
			select id_bioma, bioma from biomas
		) as biomas
		natural join biomas_estados natural join incendios group by bioma, ano
	) as agp_anual
    group by bioma order by media_anual desc;

-- Retorna os anos nos quais o numero de incêndios ocorridos na região Sudeste no mês de setembro, superou a marca de 5000 incêndios somente neste mês:
SELECT regiao, ano, mes, sum(numero) FROM regioes NATURAL JOIN estados NATURAL JOIN incendios WHERE mes LIKE "Setembro" AND regiao LIKE "Sudeste"
 GROUP BY ano HAVING sum(numero) > 5000 ORDER BY ano;