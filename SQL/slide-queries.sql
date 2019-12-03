use tp2;
SELECT mes, SUM(numero) AS numero_de_incendios FROM incendios GROUP BY mes ORDER BY numero_de_incendios DESC;
select ano, sum(numero) as numero_de_incendios from incendios where numero <> 0 group by ano order by numero_de_incendios desc;
SELECT DISTINCT bioma, COUNT(id_bioma) AS estados_presentes FROM biomas_estados NATURAL JOIN biomas GROUP BY id_bioma ORDER BY estados_presentes DESC;
select estado, mes, ano, numero from incendios natural join estados where numero = (select max(numero) from incendios);
select estado, round(avg(numero), 2) as media from estados natural join incendios group by estado order by media desc limit 5;
select regiao, sum(numero) as c from estados natural join regioes natural join incendios group by regiao order by c desc;
select bioma, ano, round(variance(numero), 2) as variancia from biomas natural join biomas_estados natural join 
	estados natural join incendios where id_bioma = 3 group by ano;
select ano, estado, sum(numero) from incendios natural join estados where ano = (select ano from incendios group by ano
	having sum(numero) = (select sum(numero) as soma from incendios group by ano order by soma desc limit 1)) group by estado;
SELECT regiao, ano, sum(numero) AS total_anual FROM regioes NATURAL JOIN estados NATURAL JOIN incendios WHERE id_regiao = 3 
GROUP BY ano having total_anual > (
	SELECT AVG(total) FROM (
		SELECT sum(numero) as total from regioes NATURAL JOIN estados NATURAL JOIN incendios WHERE id_regiao = 3 GROUP BY ano
	) AS total_por_ano GROUP BY regiao
) ORDER BY ano;
SELECT estado, ano, SUM(numero) AS numero_de_incendios FROM estados NATURAL JOIN incendios WHERE (ano >= "2000" AND ano <= "2009") 
	AND estado = "Amazonas" GROUP BY ano ORDER BY numero_de_incendios DESC;
select bioma, round(avg(total_anual), 2) as media_anual, round(std(total_anual), 2) as dev_pad_anual from ( select
            bioma, sum(numero) as total_anual from ( select id_bioma, bioma from biomas ) as biomas natural
            join biomas_estados natural join incendios group by bioma, ano ) as agp_anual group by bioma
            order by media_anual desc;
SELECT regiao, ano, mes, sum(numero) FROM regioes NATURAL JOIN estados NATURAL JOIN incendios WHERE mes LIKE "Setembro" AND regiao LIKE "Sudeste"
 GROUP BY ano HAVING sum(numero) > 5000 ORDER BY ano;







