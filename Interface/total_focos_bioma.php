<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Número de Focos de Incêndio Por Bioma</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2 class="h2-tabela">Número de Focos de Incêndio Por Bioma</h2></br>
    <table>
        <tr>
            <th>Bioma</th>
            <th>Focos de Incêndio</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            $sql= "select bioma, sum(numero) focos from biomas natural join biomas_estados natural join estados 
            natural join incendios group by bioma order by focos desc";
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
        <div class="h2-tabela">
            <a href="javascript:history.back()" class="btn btn-aliceblue-voltar">Voltar</a>
        </div>
</body>
</html>