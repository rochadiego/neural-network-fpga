#!/bin/bash

ghdl -a --std=08 --time-resolution=ns perceptron_pkg.vhd
ghdl -a --std=08 --time-resolution=ns perceptron.vhd
ghdl -a --std=08 --time-resolution=ns perceptron_tb.vhd
ghdl -e --std=08 --time-resolution=ns perceptron_tb
ghdl -r --std=08 --time-resolution=ns perceptron_tb --stop-time=50ns --vcd=perceptron.vcd

gtkwave perceptron.vcd

clear