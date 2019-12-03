<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Quantidade de Focos Acima da Média da Região no Norte</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2 class="h2-tabela">Quantidade de Focos Acima da Média da Região no Norte</h2></br>
    <table>
        <tr>
            <th>Ano</th>
            <th>Focos de Incêndio</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            $sql= "SELECT regiao, ano, sum(numero) AS total_anual FROM regioes NATURAL JOIN estados
            NATURAL JOIN incendios WHERE id_regiao = 3 GROUP BY ano having total_anual > ( SELECT
            AVG(total) FROM ( SELECT sum(numero) as total from regioes NATURAL JOIN estados
            NATURAL JOIN incendios WHERE id_regiao = 3 GROUP BY ano ) AS total_por_ano GROUP
            BY regiao ) ORDER BY ano;";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    echo "<tr><td>". $row["ano"]. "</td><td>". $row["total_anual"]. "</td></tr>";
                }
                echo "</table>";
            }else{
                echo "Sem dados.";
            }
            DBClose($link);
        ?><br/>
        <div class="h2-tabela">
            <a href="javascript:history.back()" class="btn btn-aliceblue-voltar">Voltar</a>
        </div>
</body>
</html>