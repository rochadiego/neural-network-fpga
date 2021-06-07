#!/bin/bash

ghdl -a perceptron_pkg.vhd
ghdl -a perceptron.vhd
ghdl -a perceptron_tb.vhd
ghdl -e perceptron_tb
ghdl -r perceptron_tb --stop-time=50fs --vcd=perceptron.vcd

gtkwave perceptron.vcd

clear