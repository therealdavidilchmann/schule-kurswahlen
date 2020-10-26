<?php
    class Path {
        private $isPathValid = FALSE;
        private $isFunctionValid = FALSE;
        private $isParamsValid = FALSE;

        public function __construct() {
            if (isset($_GET["p"]) && $_GET["p"] != "") {
                $this->isPathValid = TRUE;
            }
            if (isset($_GET["f"]) != null && $_GET["f"] != "") {
                $this->isFunctionValid = TRUE;
            }
            if (isset($_GET["pm"]) != null && $_GET["pm"] != "") {
                $this->isParamsValid = TRUE;
            }
        }

        public function get_path() {
            if ($this->isPathValid) {
                return $_GET["p"];
            }
            return "";
        }

        public function get_function() {
            if ($this->isFunctionValid) {
                return $_GET["f"];
            }
            return "";
        }

        public function get_params() {
            if ($this->isParamsValid) {
                $params = $_GET["pm"];
                $paramsArr = explode(",", $params);
                $paramsDict = (object) array();
                foreach ($paramsArr as $param) {
                    $key = explode("-", $param)[0];
                    $value = explode("-", $param)[1];
                    $paramsDict->$key = $value;
                }
                return $paramsDict;
            }
            return "";
        }

        public function runCodeFromPath($qc, $path) {
            try {
                $classStr = ucfirst($path->get_path())."Controller";
                $class = new $classStr($qc);
                $function = $path->get_function($path->get_params());
                return $class->$function();
            } catch (\Throwable $th) {
                return null;
            }
        }
    }
?>