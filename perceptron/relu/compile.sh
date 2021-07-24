#!/bin/bash

ghdl -a --std=08 --time-resolution=ns relu.vhd
ghdl -a --std=08 --time-resolution=ns relu_tb.vhd
ghdl -e --std=08 --time-resolution=ns relu_tb
ghdl -r --std=08 --time-resolution=ns relu_tb --stop-time=80ns --vcd=relu.vcd

$? || gtkwave relu.vcd && clear