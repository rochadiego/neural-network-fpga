# neural-network-fpga

como usar

ghdl -a exemplo.vhd
ghdl -a exemplo_tb.vhd
ghdl -e exemplo_tb
ghdl -r exemplo_tb --vcd=exemplo.vcd

gtkwave exemplo.vcd
