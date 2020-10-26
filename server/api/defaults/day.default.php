<?php

    class Day {
        private $first_block, $second_block, $third_block, $fourth_block, $fifth_block, $sixth_block;

        public function get_block($block) {
            $all_blocks = $this->get_all_blocks();

            if ($block > 0 && $block < 8) {
                return $all_blocks[$block-1];
            }
            return new ErrorHandler(ErrorHandlerTypes::WRONG_BLOCK);
        }

        public function get_all_blocks() {
            return array(
                $this->first_block,
                $this->second_block,
                $this->third_block,
                $this->fourth_block,
                $this->fifth_block,
                $this->sixth_block
            );
        }

        public function set_block($block, $class) {
            if ($block > 0 && $block < 8) {
                $this->get_all_blocks()[$block-1] = $class;
            } else {
                return new ErrorHandler(ErrorHandlerTypes::WRONG_BLOCK);
            }
        }

        public function set_all_blocks($day) {
            $this->first_block = $day[0];
            $this->second_block = $day[1];
            $this->third_block = $day[2];
            $this->fourth_block = $day[3];
            $this->fifth_block = $day[4];
            $this->sixth_block = $day[5];
        }
    }