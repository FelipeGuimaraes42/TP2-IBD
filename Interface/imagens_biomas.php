<?php
    require 'config.php';
    require 'connection.php';
    $link= DBConnect();
    $sql = "SELECT id_bioma, bioma FROM biomas"; 
    //$result= $link->query($sql);
    $result = mysqli_query($link, $sql);
?>
<HTML>
<HEAD>
    <TITLE>Mapas dos Biomas</TITLE>
    <link href="style.css" rel="stylesheet" type="text/css" />
</HEAD>
<BODY>
    <h2 class="h2-tabela">Imagens dos Biomas</h2>
    <?php
        while($row = mysqli_fetch_array($result)) {
    ?>
        <figure>
            <img src="imageViewBiomas.php?id_bioma=<?php echo $row["id_bioma"]; ?>" width=300pt height=300pt/>
            <figcaption>Mapa do bioma <?php echo $row["bioma"];?></figcaption>
        </figure>
        
    <?php		
        }
        DBClose($link);
    ?><br/>
    <div class="h2-tabela">
        <a href="javascript:history.back()" class="btn btn-aliceblue-voltar">Voltar</a>
    </div>
</BODY>
</HTML>