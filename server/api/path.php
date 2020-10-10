<?php
    class Path {
        private $isPathValid = FALSE;
        private $isFunctionValid = FALSE;
        private $isParamsValid = FALSE;

        function __construct() {
            if ($_GET["p"] != null && $_GET["p"] != "") {
                $this->isPathValid = TRUE;
            }
            if ($_GET["f"] != null && $_GET["f"] != "") {
                $this->isFunctionValid = TRUE;
            }
            if ($_GET["pm"] != null && $_GET["pm"] != "") {
                $this->isParamsValid = TRUE;
            }
        }

        function getPath() {
            if ($this->isPathValid) {
                return $_GET["p"];
            }
            return "";
        }

        function getFunction() {
            if ($this->isFunctionValid) {
                return $_GET["f"];
            }
            return "";
        }

        function getParams() {
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
    }
?>