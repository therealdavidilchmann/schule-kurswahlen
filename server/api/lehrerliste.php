<?php

    class Lehrerliste {
        private $db;
        function __construct($db) {
            $this->db = $db;
        }

        function getAllTeachers($params) {
            if (isset($params->uid)) {
                return $this->db->getAllTeachers($params->uid);
            }
            return null;
        }
    }