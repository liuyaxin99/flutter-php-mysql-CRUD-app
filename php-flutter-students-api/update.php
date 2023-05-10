<?php

require("db.php");

$id = $_POST['id'];
$name = $_POST['name'];
$email = $_POST["email"];
$phone = $_POST["phone"];



$query = "UPDATE students SET name='$name',email='$email',phone='$phone' WHERE id='$id'";
//result
$query_run = mysqli_query($con, $query);
if ($query_run) {
    echo json_encode("Success");
} else {
    echo json_encode("Fail");
}
