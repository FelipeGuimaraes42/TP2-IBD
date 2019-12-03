<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Total de Focos Por Estado do Ano Com Mais Queimadas</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2 class="h2-tabela">Incêndios Florestais por Estado no Ano de 2004</h2></br>
    <table>
        <tr>
            <th>Ano</th>
            <th>Estado</th>
            <th>Focos de Incêndio</th>
        </tr>
        <?php
            require 'config.php';
            require 'connection.php';
            $link= DBConnect();
            $sql= "select ano, estado, sum(numero) as focos from incendios natural join estados where ano = (select ano
            from incendios group by ano having sum(numero) = (select sum(numero) as soma from incendios
            group by ano order by soma desc limit 1)) group by estado;";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    echo "<tr><td>". $row["ano"]. "</td><td>". $row["estado"]. "</td><td>". $row["focos"]. "</td></tr>";
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