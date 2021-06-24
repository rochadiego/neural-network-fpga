#!/bin/bash

ghdl -a --std=08 --time-resolution=ns sigmoid.vhd
ghdl -a --std=08 --time-resolution=ns sigmoid_tb.vhd
ghdl -e --std=08 --time-resolution=ns sigmoid_tb
ghdl -r --std=08 --time-resolution=ns sigmoid_tb --stop-time=80ns --vcd=sigmoid.vcd

$? || gtkwave sigmoid.vcd && clear