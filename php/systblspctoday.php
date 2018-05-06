<?php
   include 'conn.php';
   $queryResult=$connect->query("SELECT * FROM `SYSTEM` WHERE Date(`datecreate`) = '2018-04-18'");
  
   $result=array();
   while($fetchData=$queryResult->fetch_assoc()) {
     $result[]=$fetchData;
   }
   
   echo json_encode($result);
  

?>

