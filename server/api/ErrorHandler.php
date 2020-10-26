<?php

    class ErrorHandler {

        // Class variables
        private $error_code;

        public function __construct($error_type)
        {
            $this->error_code = $error_type;
        }

        public function get_error_message()
        {
            return ErrorHandlerTypes::get_error_message_from_code($this->error_code);
        }
    }


    class ErrorHandlerTypes {

        public const DB_CONNECTION_ERROR = 1000;
        public const DB_NO_EXISTING_CONNECTION = 1001;

        public const DB_QUERY_ERROR = 1100;
        public const DB_QUERY_STATEMENT_ERROR = 1101;

        public const WRONG_DAY = 1200;
        public const WRONG_BLOCK = 1201;

        private const ALL_ERROR_CODES = array(
            self::DB_CONNECTION_ERROR,
            self::DB_NO_EXISTING_CONNECTION,
            self::DB_QUERY_ERROR,
            self::DB_QUERY_STATEMENT_ERROR,
            self::WRONG_DAY,
            self::WRONG_BLOCK
        );

        public const ALL_ERROR_MESSAGES = array(
            array(self::DB_CONNECTION_ERROR, "Error connecting to the database"),
            array(self::DB_NO_EXISTING_CONNECTION, "There is no existing connection"),
            array(self::DB_QUERY_ERROR, "Error querying to the database"),
            array(self::DB_QUERY_STATEMENT_ERROR, "Error creating a statement"),
            array(self::WRONG_DAY, "The passed day does not exist"),
            array(self::WRONG_BLOCK, "The passed block does not exist")
        );

        public static function get_error_message_from_code($code) {
            foreach (self::ALL_ERROR_MESSAGES as $msg_arr) {
                if ($msg_arr[0] == $code) { return $msg_arr[1]; }
            }
        }


        public static function check_if_error_type_is_valid($error_type) {
            $is_valid = false;
            foreach (self::ALL_ERROR_CODES as $error_code) {
                echo $error_type;
                if ($error_code == $error_type) {
                    $is_valid = true;
                }
            }
            return $is_valid;
        }

    }

?>