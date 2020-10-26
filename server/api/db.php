<?php


    class DB {
        private $connection;

        public function connect($servername, $dbname, $user="root", $password="") {
            $this->connection = mysqli_connect($servername, $user, $password, $dbname);
            if (!$this->connection) {
                return new ErrorHandler(ErrorHandlerTypes::DB_CONNECTION_ERROR);
            }
            return true;
        }

        public function getConnection() {
            return ($this->connection != null ? $this->connection : new ErrorHandler(ErrorHandlerTypes::DB_NO_EXISTING_CONNECTION));
        }

        public function query($sql, $params) {
            $stmt = mysqli_stmt_init($this->connection);
            
            $amountOfParamsAsS = "";
            for ($i=0; $i < count($params); $i++) { $amountOfParamsAsS.="s"; }

            if (mysqli_stmt_prepare($stmt, $sql)) {
                if (count($params) != 0) { mysqli_stmt_bind_param($stmt, $amountOfParamsAsS, $params); }
                mysqli_stmt_execute($stmt);
                return mysqli_stmt_get_result($stmt);
            } else {
                return new ErrorHandler(ErrorHandlerTypes::DB_QUERY_STATEMENT_ERROR);
            }
        }

        public function query_bool($sql, ...$params) {
            $res = $this->query($sql, $params);
            if (!$res instanceof ErrorHandler) {
                return mysqli_fetch_assoc($res) != null;
            }
            return $res;
        }

        public function query_num_rows($sql, ...$params) {
            $res = $this->query($sql, $params);
            $c = 0;
            if (!$res instanceof ErrorHandler) {
                while (mysqli_fetch_assoc($res)) {
                    $c++;
                }
                return $c;
            }
            return $res;
        }

        public function query_get_result($sql, ...$params) {
            $res = $this->query($sql, $params);
            if (!$res instanceof ErrorHandler) {
                $return_arr = array();
                while ($row = mysqli_fetch_assoc($res)) {
                    array_push($return_arr, $row);
                }
                return $return_arr;
            }
            return $res;
        }
    }

?>