<?php

    class Stundenplan {
        private $db;
        function __construct($db) {
            $this->db = $db;
        }

        function getStundenplan($params) {
            if (isset($params->uid)) {
                $allClasses = $this->db->getAllClasses($params->uid);
                $stundenplan = $this->db->getStundenplan();
                $stundenplanFilled = (object) array();

                //i = day of the week, j = class of the day
                for ($i=0; $i < count($stundenplan); $i++) {
                    $day = (object) array();
                    for ($j=0; $j < count($stundenplan[$i]); $j++) {
                        foreach ($stundenplan[$i][$j] as $timeSpot) {
                            for ($k=0; $k < count($allClasses); $k++) {
                                if ($allClasses[$i]->name == $timeSpot->name) {
                                    $day->$j = $allClasses[$k];
                                }
                            }
                        }
                    }
                    $stundenplanFilled->$i = $day;
                }
                return $stundenplanFilled;
            }
            return null;
        }

        function getAllClasses($params) {
            if (isset($params->uid)) {
                return $this->db->getAllClasses($params->uid);
            }
            return null;
        }

        function getWeekClasses($params) {
            if (isset($params->uid) && isset($params->week)) {
                if (is_int($params->week) && ($params->week == 1 || $params->week == 0)) {
                    return $this->db->getWeekClasses($params->uid, $params->week);
                }
            }
            return null;
        }
    }
