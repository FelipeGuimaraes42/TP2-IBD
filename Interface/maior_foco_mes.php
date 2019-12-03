<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Maior Quantidade de Focos Registrada em um Mês</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2 class="h2-tabela">Maior Número de Focos de Incêndios em um Mês</h2></br>
    <table>
        <tr>
            <th>Estado</th>
            <th>Mês</th>
            <th>Ano</th>
            <th>Focos de Incêndio</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            $sql= "select estado, mes, ano, numero from incendios natural join estados where numero= (select
            max(numero) from incendios);";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    echo "<tr><td>". $row["estado"]. "</td><td>". $row["mes"]. "</td><td>". $row["ano"].
                        "</td><td>". $row["numero"]. "</td></tr>";
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