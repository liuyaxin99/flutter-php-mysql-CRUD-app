<?php

$con = mysqli_connect("127.0.0.1:3307", "root", "", "php-flutter-students"); //DB_SERVER , DB_USER, DB_PASSWORD, DB_DATABASE

if (!$con) {
    die('Connection Failed' . mysqli_connect_error());
}
