<?php

require("db.php");

$query = "SELECT * FROM students";
$query_run = mysqli_query($con, $query);
$records = [];
while($rows = mysqli_fetch_assoc($query_run)){
    $records[] = $rows;
}

echo json_encode($records);
