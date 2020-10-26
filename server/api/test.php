<?php

    class Test {
        private $db;

        public function __construct($db)
        {
            $this->db = $db;
        }

        public function test_function()
        {
            // Query to db ($db->query_ + what you want to get --> bool, get_result, num_rows)
            return array("Hello"=>"World!");
        }
    }