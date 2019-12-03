<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Focos Amazonas (2000-2009)</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2 class="h2-tabela">Incêndios Florestais Amazonas (2000-2009)</h2></br>
    <table>
        <tr>
            <th>Estado</th>
            <th>Ano</th>
            <th>Focos de Incêndio</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            $sql= "SELECT estado, ano, SUM(numero) AS numero_de_incendios FROM estados
            NATURAL JOIN incendios WHERE (ano >= 2000 AND ano <= 2009) AND estado like
            'Amazonas' GROUP BY ano ORDER BY ano;";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    echo "<tr><td>". $row["estado"]. "</td><td>". $row["ano"]. "</td><td>".
                     $row["numero_de_incendios"]. "</td></tr>";
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