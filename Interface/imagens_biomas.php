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
    <TITLE>List BLOB Images</TITLE>
    <link href="style.css" rel="stylesheet" type="text/css" />
</HEAD>
<BODY>
    <h1>Imagens Salvas no Banco</H1>
    <?php
        while($row = mysqli_fetch_array($result)) {
    ?>
        <figure>
            <img src="imageView.php?id_bioma=<?php echo $row["id_bioma"]; ?>" width=300pt height=300pt/>
            <figcaption>Mapa do bioma <?php echo $row["bioma"];?></figcaption>
        </figure>
        
    <?php		
        }
        DBClose($link);
    ?><br/>
    <div>
        <a href="interface.php" class="btn btn-aliceblue">Voltar</a>
    </div>
</BODY>
</HTML>