<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Média e Desvio Padrão de Queimadas por Bioma</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2 class="h2-tabela">Média e Desvio Padrão de Queimadas por Bioma</h2></br>
    <table>
        <tr>
            <th>Bioma</th>
            <th>Média</th>
            <th>Desvio Padrão</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            $sql= "select bioma, format(avg(total_anual), 2, 'de_DE') as media_anual, 
            format(std(total_anual), 2, 'de_DE') as dev_pad_anual from ( select
            bioma, sum(numero) as total_anual from ( select id_bioma, bioma from biomas ) as biomas natural
            join biomas_estados natural join incendios group by bioma, ano ) as agp_anual group by bioma
            order by bioma;";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    echo "<tr><td>". $row["bioma"]. "</td><td>". $row["media_anual"]. "</td><td>".
                     $row["dev_pad_anual"]. "</td></tr>";
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