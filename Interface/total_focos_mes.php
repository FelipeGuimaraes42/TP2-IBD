<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Número de Focos de Incêndio Por Mês</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2 class="h2-tabela">Número de Focos de Incêndio Por Mês</h2></br>
    <table>
        <tr>
            <th>Mês</th>
            <th>Focos de Incêndio</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            $sql= "select mes, sum(numero) as soma from incendios where numero>0 group by
                    mes order by soma;";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    echo "<tr><td>". $row["mes"]. "</td><td>". $row["soma"]. "</td></tr>";
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