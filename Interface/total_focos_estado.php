<!DOCTYPE hmtl>
<html>
<head>
    <title>Total Focos por Estado</title>
    <style>
            body{
                background-image: url('Images/background.jpg');
                background-attachment: fixed;
                background-size: 100% 100%;
            }
            table, th, tr{
                border-collapse: collapse;
                width: 50%;
                font-size: 20pt;
                color: aliceblue;
                text-align: left;
            }
            button{
                border: none;
                background-color: green;
                color: white;
                padding: 15px 32px;
                font-size: 12pt;
                border-radius: 8px;
            }
            
        </style>
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
            $sql= "select estado, sum(numero) as soma from incendios_estado group by estado";
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
        <a href="interface.php"><button>Voltar</button></a>
</body>
</html>