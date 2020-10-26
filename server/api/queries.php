<?php

    require_once 'db.php';

    class QueryController {
        private $db;

        public function create_connection($database, $servername="localhost", $user="root", $password="") {
            $this->db = new DB();
            return $this->db->connect($servername, $database, $user, $password);
        }
    }

?>