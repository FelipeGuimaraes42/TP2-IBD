<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Número de Focos de Incêndio Por Ano</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div>
        <table>
            <h2 class="h2-tabela">Número de Focos de Incêndio Por Ano</h2></br>
            <tr>
                <th>Focos de Incêndio</th>
                <th>Ano</th>
            </tr>
            <?php
                require 'config.php';
                require 'connection.php';
                $link= DBConnect();
                $sql= "select ano, sum(numero) as numero_de_incendios from incendios group by ano order 
                        by numero_de_incendios;";
                $result= $link->query($sql);
                if($result->num_rows > 0){
                    while($row= $result-> fetch_assoc()){
                        echo "<tr><td>". $row["numero_de_incendios"]. "</td><td>". $row["ano"]. "</td></tr>";
                    }
                    echo "</table>";
                }else{
                    echo "Sem dados.";
                }
                DBClose($link);
            ?><br/>
    </div>
    <div class="h2-tabela">
        <a href="javascript:history.back()" class="btn btn-aliceblue-voltar">Voltar</a>
    </div>
</body>
</html>