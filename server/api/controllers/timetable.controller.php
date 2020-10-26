<?php

    require_once '../defaults/timetable.default.php';
    require_once '../defaults/day.default.php';

    class TimetableController {
        private $qc, $timetable;

        public function __construct($qc) {
            $this->qc = $qc;
            $this->timetable = new TimetableDefault();
        }

        public function set_all_days($params) {
            if (isset($params["all_days"])) {
                $this->timetable->set_all_days(json_decode($params));
            }
            $this->qc->timetable_set_timetable($this->timetable);
        }

        public function get_timetable() {
            // id, woche, montag, dienstag, mittwoch, donnerstag, freitag
            $week = $this->qc->timetable_get_week();
            $days = array();

            for ($i=2; $i < count($week); $i++) {
                $day = $this->qc->timetable_get_day($week[$i]);
                array_push($days, $day);
            }
        }
    }