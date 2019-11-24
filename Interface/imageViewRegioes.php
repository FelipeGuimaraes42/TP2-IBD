<?php
    require 'config.php';
    require 'connection.php';
    $link= DBConnect();
    if(isset($_GET['id_regiao'])) {
        $sql = "SELECT regiao, img_regiao FROM regioes WHERE id_regiao=" . $_GET['id_regiao'];
        $result = mysqli_query($link, $sql) or 
            die("<b>Error:</b> Problem on Retrieving Image BLOB<br/>" . mysqli_error($link));
		$row = mysqli_fetch_array($result);
		header("Content-type: " . $row["regiao"]);
        echo $row["img_regiao"];
	}
	DBClose($link);
?>