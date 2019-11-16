<!DOCTYPE hmtl>
<html>
<head>
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
            $sql= "select estado, sum(numero) as soma from incendios_estado group by estado order by soma desc";
            $result= $link->query($sql);
            if($result->num_rows > 0){
                while($row= $result-> fetch_assoc()){
                    echo "<tr><td>". $row["estado"]. "</td><td>". $row["soma"]. "</td></tr>";
                }
                echo "</table>";
            }else{
                echo "Sem dados.";
            }
            DBClose($link);
        ?><br/>
        <div>
            <button>
                <a href="interface.php">Voltar</a>
            </button>
        </div>
</body>
</html>