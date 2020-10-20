<?php

    class Stundenplan {
        private $db;
        function __construct($db) {
            $this->db = $db;
        }

        function getStundenplan($params) {
            if (isset($params->uid)) {
                $allClassesFromStudent = $this->db->getAllClasses($params->uid);
                $stundenplaeneIds = $this->db->getStundenplaeneIDs($params->uid);
                print_r($stundenplaeneIds);
                $stundenplaene = $this->db->getStundenplaene($stundenplaeneIds);

                if (isset($params->week)) {
                    $stundenplan = (object) array();
                    foreach ($stundenplaene as $stundenplanIterate) {
                        if ($params->week == $stundenplanIterate->woche) $stundenplan = $stundenplanIterate;
                    }
                    return $this->getFilledStundenplanFrom($stundenplan, $allClassesFromStudent);
                }
                return $this->getFilledStundenplanFrom($stundenplaene, $allClassesFromStudent);
            }
            return null;
        }

        function getFilledStundenplanFrom($stundenplaene, $allClassesFromStudent) {
            $filledStundenplan = (object) array();
            
            if (count($stundenplaene) == 1) {
                $allBloeckeJSON = $this->db->getAllBloeckeFromStundenplan($stundenplaene);
                // [[{montag/1}, {montag/2}], [{dienstag/1}, {dienstag/2}]]
                foreach ($allBloeckeJSON as $dayStundenplan) {
                    $dayIndex = 0;
                    foreach ($dayStundenplan as $classStundenplan) {
                        $classIndex = 0;
                        foreach ($allClassesFromStudent as $currentClassStudent) {
                            if ($classStundenplan->class_id == $currentClassStudent->class_id) { // Q12MLkb03 == Q12MLkb03
                                $filledStundenplan->$dayIndex->$classIndex = $currentClassStudent;
                            }
                        }
                        $classIndex++;
                    }
                    $dayIndex++;
                }
            } else {
                foreach ($stundenplaene as $stundenplan) {
                    $allBloeckeJSON = $this->db->getAllBloeckeFromStundenplan($stundenplan);
                    // [[{montag/1}, {montag/2}], [{dienstag/1}, {dienstag/2}]]
                    foreach ($allBloeckeJSON as $dayStundenplan) {
                        $dayIndex = 0;
                        foreach ($dayStundenplan as $classStundenplan) {
                            $classIndex = 0;
                            foreach ($allClassesFromStudent as $currentClassStudent) {
                                if ($classStundenplan->class_id == $currentClassStudent->class_id) { // Q12MLkb03 == Q12MLkb03
                                    $filledStundenplan->$dayIndex->$classIndex = $currentClassStudent;
                                }
                            }
                            $classIndex++;
                        }
                        $dayIndex++;
                    }
                }
            }
            return $filledStundenplan;
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
