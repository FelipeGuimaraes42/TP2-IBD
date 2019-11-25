<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Total Focos Por Ano</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <table>
        <tr>
            <th>Ano</th>
            <th>Focos de Incêndio</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            $sql= "select ano, sum(numero) as numero_de_incendios from incendios_estado group by ano order by numero_de_incendios desc;";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    echo "<tr><td>". $row["ano"]. "</td><td>". $row["numero_de_incendios"]. "</td></tr>";
                }
                echo "</table>";
            }else{
                echo "Sem dados.";
            }
            DBClose($link);
        ?><br/>
        <div>
            <a href="interface.php" class="btn btn-aliceblue">Voltar</a>
        </div>
</body>
</html>