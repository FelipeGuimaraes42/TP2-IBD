<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Número de Queimadas no Sudeste Acima de 5000</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2 class="h2-tabela">Número de Queimadas no Sudeste em Setembro Acima de 5000 </h2></br>
    <table>
        <tr>
            <th>Ano</th>
            <th>Mês</th>
            <th>Focos Incêncio</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            $sql= "SELECT regiao, ano, mes, sum(numero) as soma FROM regioes NATURAL JOIN estados NATURAL JOIN incendios 
            WHERE mes LIKE 'Setembro' AND regiao LIKE 'Sudeste'
            GROUP BY ano HAVING sum(numero) > 5000 ORDER BY ano;";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    echo "<tr><td>". $row["ano"]. "</td><td>".
                     $row["mes"]. "</td><td>". $row["soma"]."</td></tr>";
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