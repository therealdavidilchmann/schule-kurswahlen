<?php
    require 'db.php';
    require 'path.php';
    
    require 'stundenplan.php';

    // Connect to database
    $db = new DB();
    $db->connect("localhost", "id11715633_schulekurswahlen", "id11715633_schulekurswahluser", "123456789Ab!");

    // Path setup
    $path = new Path();
    $result = getResultFromDB($db, $path->getPath(), $path->getFunction(), $path->getParams());

    echo json_encode(
        $result != null
        ? $result
        : array("error" => TRUE)
    );


    function getResultFromDB($db, $filePath, $functionPath, $params) {
        try {
            $classStr = ucfirst($filePath);
            $class = new $classStr($db);
            return $class->$functionPath($params);
        } catch (\Throwable $th) {
            return null;
        }
    }
?>