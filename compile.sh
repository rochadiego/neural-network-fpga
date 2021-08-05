#!/bin/bash

rm *.vcd
ghdl -a --std=08 --time-resolution=ns network_pkg.vhd
ghdl -a --std=08 --time-resolution=ns relu.vhd
ghdl -a --std=08 --time-resolution=ns sigmoid.vhd
ghdl -a --std=08 --time-resolution=ns neuron.vhd
ghdl -a --std=08 --time-resolution=ns layer.vhd
ghdl -a --std=08 --time-resolution=ns network.vhd
ghdl -a --std=08 --time-resolution=ns network_tb.vhd

ghdl -e --std=08 --time-resolution=ns network_tb 2> /dev/null
ghdl -r --std=08 --time-resolution=ns network_tb --stop-time=150ns --ieee-asserts=disable --vcd=network.vcd

$? || gtkwave network.vcd 2>> /dev/null && clear