<?php
    require 'config.php';
    require 'connection.php';
    $link= DBConnect();
    $sql = "SELECT id_regiao, regiao FROM regioes"; 
    //$result= $link->query($sql);
    $result = mysqli_query($link, $sql);
?>
<HTML>
<HEAD>
    <TITLE>Mapas das Regiões</TITLE>
    <link href="style.css" rel="stylesheet" type="text/css" />
</HEAD>
<BODY>
    <h1>Imagens das Regiões</H1>
    <?php
        while($row = mysqli_fetch_array($result)) {
    ?>
        <figure>
            <img src="imageViewRegioes.php?id_regiao=<?php echo $row["id_regiao"]; ?>" width=300pt height=300pt/>
            <figcaption>Mapa da região <?php echo $row["regiao"];?></figcaption>
        </figure>
        
    <?php		
        }
        DBClose($link);
    ?><br/>
    <div>
        <a href="index.php" class="btn btn-aliceblue">Voltar</a>
    </div>
</BODY>
</HTML>