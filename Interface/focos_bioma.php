<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Total Focos Por Bioma</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <table>
        <tr>
            <th>Bioma</th>
            <th>Focos de Incêndio</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            $sql= "select bioma, sum(numero) focos from biomas natural join biomas_estados natural join estados natural join incendios group by bioma order by focos desc";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    echo "<tr><td>". $row["bioma"]. "</td><td>". $row["focos"]. "</td></tr>";
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