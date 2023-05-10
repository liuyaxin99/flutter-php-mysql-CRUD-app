<?php

require("db.php");

$name = $_POST['name'];
$email = $_POST["email"];
$phone = $_POST["phone"];


$query = "INSERT INTO students (name,email,phone) VALUES 
        ('$name','$email','$phone')"; //single ''

//result
$query_run = mysqli_query($con, $query);
if ($query_run) {
    echo json_encode("Success");
} else {
    echo json_encode("Fail");
}
