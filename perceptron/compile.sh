#!/bin/bash

rm *.vcd
ghdl -a --std=08 --time-resolution=ns perceptron_pkg.vhd
# ghdl -a --std=08 --time-resolution=ns sigmoid/approximation1/sigmoid.vhd
ghdl -a --std=08 --time-resolution=ns perceptron.vhd
ghdl -a --std=08 --time-resolution=ns perceptron_tb.vhd

ghdl -e --std=08 --time-resolution=ns perceptron_tb 2> /dev/null
ghdl -r --std=08 --time-resolution=ns perceptron_tb --stop-time=80ns --vcd=perceptron.vcd

$? || gtkwave perceptron.vcd 2> /dev/null && clear