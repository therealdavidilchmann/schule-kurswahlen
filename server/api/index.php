<?php
    require 'path.php';
    require 'ErrorHandler.php';
    require 'queries.php';
    
    // Require all controllers
    require './controllers/timetable.controller.php';

    // Create a Query controller to handle Queries controlled
    $qc = new QueryController();
    $db_connected_status = $qc->create_connection("id11715633_schulekurswahlen", "localhost", "id11715633_schulekurswahluser", "123456789Ab!");
    if ($db_connected_status instanceof ErrorHandler) {
        echo $db_connected_status->get_error_message();
    }

    // Path setup
    $path = new Path();
    $result = $path->runCodeFromPath($qc, $path);

    // Echo the results of the DB call
    if ($result instanceof ErrorHandler) {
        echo json_encode(
            array("error"=>$result->get_error_message())
        );
    } else if ($result != null) {
        echo json_encode($result);
    }

?>