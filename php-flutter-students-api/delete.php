<?php

require("db.php");

$id = $_POST['id'];



$query = "DELETE FROM students WHERE id='$id'";

//result
$query_run = mysqli_query($con, $query);
if ($query_run) {
    echo json_encode("Success");
} else {
    echo json_encode("Fail");
}
