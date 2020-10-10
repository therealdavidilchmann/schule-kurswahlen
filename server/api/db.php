<?php

    class DB {
        private $connection;

        function connect($servername, $dbname, $user="root", $password="") {
            $this->connection = mysqli_connect($servername, $user, $password, $dbname);
        }

        public function getConnection() {
            return $this->connection;
        }

        public function getAllClasses($uid) {
            $sql = "SELECT * FROM classes WHERE student_id=?";
            $stmt = mysqli_stmt_init($this->connection);

            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_bind_param($stmt, "s", $uid);
                mysqli_stmt_execute($stmt);
                $res = mysqli_stmt_get_result($stmt);
                $return_arr = array();
                while ($row = mysqli_fetch_assoc($res)) {
                    array_push($return_arr, $row);
                }
                return $return_arr;
            }
        }

        public function getWeekClasses($uid, $week) {
            $sql = "SELECT * FROM classes WHERE student_id=? AND week=?";
            $stmt = mysqli_stmt_init($this->connection);

            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_bind_param($stmt, "ss", $uid, $week);
                mysqli_stmt_execute($stmt);
                $res = mysqli_stmt_get_result($stmt);
                $return_arr = array();
                while ($row = mysqli_fetch_assoc($res)) {
                    array_push($return_arr, $row);
                }
                return $return_arr;
            }
        }

        public function getAllTeachers($uid) {
            $sql = "SELECT * FROM teachers_students WHERE student_id=?";
            $stmt = mysqli_stmt_init($this->connection);

            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_bind_param($stmt, "s", $uid);
                mysqli_stmt_execute($stmt);
                $res = mysqli_stmt_get_result($stmt);
                $return_arr = array();
                while ($row = mysqli_fetch_assoc($res)) {
                    array_push($return_arr, $row);
                }
                return $return_arr;
            }
        }

        function query_check_if_user_is_logged_in($token) {
            $sql = "SELECT * FROM tokens WHERE token=?";
            $stmt = mysqli_stmt_init($this->connection);

            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_bind_param($stmt, "s", $token);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_store_result($stmt);
                $num_rows = mysqli_stmt_num_rows($stmt);
                if ($num_rows > 0) { return TRUE; } else { return FALSE; }
            }
        }

        function query_no_user_input($sql) {
            $stmt = mysqli_stmt_init($this->connection);

            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_execute($stmt);
                $res = mysqli_stmt_get_result($stmt);
                $return_arr = array();
                while ($row = mysqli_fetch_assoc($res)) {
                    array_push($return_arr, $row);
                }
                return $return_arr;
            }
        }
        /*

        function query_no_res($sql, $params) {
            $stmt = mysqli_stmt_init($this->connection);
            $bind_param_array = $this->get_bind_param_array($stmt, $params);
            
            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_bind_param($bind_param_array);
                mysqli_stmt_execute($stmt);
            }
        }

        function query_bool($sql, $params) {
            $stmt = mysqli_stmt_init($this->connection);

            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_execute($stmt);
                mysqli_stmt_store_result($stmt);
                $num_rows = mysqli_stmt_num_rows($stmt);
                if ($num_rows > 0) { return TRUE; } else { return FALSE; }
            }
        }

        function query_result($sql, $params) {
            $stmt = mysqli_stmt_init($this->connection);
            $bind_param_array = $this->get_bind_param_array($stmt, $params);

            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_bind_param($bind_param_array);
                mysqli_stmt_execute($stmt);
                $res = mysqli_stmt_get_result($stmt);
                $return_arr = array();
                while ($row = mysqli_fetch_assoc($res)) {
                    array_push($return_arr, $row);
                }
                return $return_arr;
            }
        }

        function get_bind_param_array($stmt, $params) {
            $bind_param_array = [$stmt];
            $placeholder_string = "";

            for ($i=0; $i < count($params); $i++) { 
                $placeholder_string.="s";
            }
            array_push($bind_param_array, $placeholder_string);

            foreach ($params as $param) {
                array_push($bind_param_array, $param);
            }

            return $bind_param_array;
        }*/
    }