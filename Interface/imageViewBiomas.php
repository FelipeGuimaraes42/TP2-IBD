<?php
    require 'config.php';
    require 'connection.php';
    $link= DBConnect();
    if(isset($_GET['id_bioma'])) {
        $sql = "SELECT bioma, img_bioma FROM biomas WHERE id_bioma=" . $_GET['id_bioma'];
        $result = mysqli_query($link, $sql) or 
            die("<b>Error:</b> Problem on Retrieving Image BLOB<br/>" . mysqli_error($link));
		$row = mysqli_fetch_array($result);
		header("Content-type: " . $row["bioma"]);
        echo $row["img_bioma"];
	}
	DBClose($link);
?>