<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Total Focos Por Estado</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <table>
        <tr>
            <th>Estado</th>
            <th>Total de Focos de Incêndio</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            //$sql= "select sigla_estado, sum(numero) as soma from incendios_estado group by sigla_estado order by soma desc";
            $sql= "select estado, sum(numero) as soma from incendios natural join estados group by sigla_estado 
                    order by soma";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    //echo "<tr><td>". $row["sigla_estado"]. "</td><td>". $row["soma"]. "</td></tr>";
                    echo "<tr><td>". $row["estado"]. "</td><td>". $row["soma"]. "</td></tr>";
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