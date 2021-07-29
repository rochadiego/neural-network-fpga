#!/bin/bash

ghdl -a --std=08 --time-resolution=ns network_pkg.vhd
ghdl -a --std=08 --time-resolution=ns neuron.vhd
ghdl -a --std=08 --time-resolution=ns layer.vhd
ghdl -a --std=08 --time-resolution=ns network.vhd
ghdl -a --std=08 --time-resolution=ns network_tb.vhd

ghdl -e --std=08 --time-resolution=ns network_tb
ghdl -r --std=08 --time-resolution=ns network_tb --stop-time=80ns --vcd=network.vcd

$? || gtkwave network.vcd && clear