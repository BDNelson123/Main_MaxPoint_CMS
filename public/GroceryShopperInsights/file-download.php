<?php
header('Content-disposition: attachment; filename='.$_GET['filename']);
header('Content-type: application/pdf');
readfile($_GET['filename']);
?>

