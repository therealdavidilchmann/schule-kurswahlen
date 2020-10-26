<?php

    class TimetableDefault {
        private $monday, $tuesday, $wednesday, $thursday, $friday;

        public function get_day($day) {
            if (strpos("mondaytuesdaywednesdaythursdayfriday", $day)) {
                return $this->$day;
            } else {
                return new ErrorHandler(ErrorHandlerTypes::WRONG_DAY);
            }
        }

        public function get_all_days() {
            return array(
                $this->monday,
                $this->tuesday,
                $this->wednesday,
                $this->thursday,
                $this->friday
            );
        }

        public function set_day($day, $classes) {
            if (strpos("mondaytuesdaywednesdaythursdayfriday", $day)) {
                $this->$day = $classes;
            } else {
                return new ErrorHandler(ErrorHandlerTypes::WRONG_DAY);
            }
        }

        public function set_all_days($week) {
            $this->monday = $week[0];
            $this->tuesday = $week[1];
            $this->wednesday = $week[2];
            $this->thursday = $week[3];
            $this->friday = $week[4];
        }
    }