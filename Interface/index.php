<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>TP2 IBD - Queimadas Brasileiras</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>Queimadas no Brasil</h1>
        <div>
            <h2>Introdução</h2>
            <p>
            O território brasileiro está mudando, para <b>pior</b>. 
	        Taxas de incêndio elevadas são apenas um dos fatores preocupantes.
            Este site apresenta uma maneira simples de verificar dados de informações florestais disponibilizados pelo 
                <a href="http://dados.gov.br/dataset/sistema-nacional-de-informacoes-florestais-snif" 
                    target="_blank">governo</a> - datados de 1998 a 2017 -
	            relacioná-los com outras informações - como as regiões e biomas brasileiros -
	            e os contrapor às suas ideias, para uma melhor compreensão da realidade.
            </p>
        </div>
        <div>
            <h2>Gráficos</h2>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="Graficos/incendios_ano.png" alt="Incêndios por Ano" width=400px heigth=400px />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <img src="Graficos/incendios_bioma.png" alt="Incêndios por Bioma" width=400px heigth=400px />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <img src="Graficos/incendios_regiao.png" alt="Incêndios por Região" width=400px heigth=400px />
        </div>
        <h2>Consultas</h2>
        <div class="consultas">
            <div class="esquerda">
                <div>
                    <a href="total_focos_ano.php" class="btn btn-aliceblue">Total de focos por ano</a>
                </div><br/>
                <div>
                    <a href="total_focos_bioma.php" class="btn btn-aliceblue">Total de focos por bioma</a>
                </div><br/>
                <div>
                    <a href="total_focos_estado.php" class="btn btn-aliceblue">Total de focos por estado</a>
                </div><br/>
                <div>
                    <a href="total_focos_mes.php" class="btn btn-aliceblue">Total de focos por mês</a>
                </div><br/>
                <div>
                    <a href="total_focos_regiao.php" class="btn btn-aliceblue">Total de focos por região</a>
                </div><br/>
                <div>
                    <a href="maior_foco_mes.php" class="btn btn-aliceblue">Maior foco em um mês</a>
                </div><br/>
                <div>
                    <a href="sudeste_acima_setembro.php" class="btn btn-aliceblue">Meses com o números de focos maiores 
                        que 5000 em setembro na região sudeste</a>
                </div><br/>
            </div>
            <div class="direita">
                <div>
                    <a href="focos_estado_ano_mais_queimadas.php" class="btn btn-aliceblue">Ano com mais focos</a>
                </div><br/>
                <div>
                    <a href="imagens_biomas.php" class="btn btn-aliceblue">Imagens dos biomas</a>
                </div><br/>
                <div>
                    <a href="imagens_regioes.php" class="btn btn-aliceblue">Imagens das regiões</a>
                </div><br/>
                <div>
                    <a href="media_desvio_bioma.php" class="btn btn-aliceblue">Médias e desvios dos biomas</a>
                </div><br/>
                <div>
                    <a href="cinco_maiores_medias.php" class="btn btn-aliceblue">Cinco maiores médias</a>
                </div><br/>
                <div>
                    <a href="amazonas_dez_anos.php" class="btn btn-aliceblue">Focos Amazonas (2000-2009)</a>
                </div><br/>
                <div>
                    <a href="focos_acima_media_norte.php" class="btn btn-aliceblue">Anos com focos maiores que a média 
                        na região norte</a>
                </div><br/>
            </div>
        </div>
    </body>
</html>