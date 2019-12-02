<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Focos no Sudeste Acima de 5000</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <table>
        <tr>
            <th>Focos Incêncio</th>
            <th>Mês</th>
            <th>Ano</th>
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
                    echo "<tr><td>". $row["soma"]. "</td><td>".
                     $row["mes"]. "</td><td>". $row["ano"]."</td></tr>";
                }
                echo "</table>";
            }else{
                echo "Sem dados.";
            }
            DBClose($link);
        ?><br/>
        <div>
            <a href="index.php" class="btn btn-aliceblue-voltar">Voltar</a>
        </div>
</body>
</html>