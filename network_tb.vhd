library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.network_pkg.all;

entity network_tb is
end;

architecture bench of network_tb is

  component network is
    port (
      inputs_network : in array_slv(0 to n_inputs_by_layer(0) - 1);
      output_network : out slv);
  end component;

  signal input_a_tb, input_b_tb : slv;
  signal output_tb              : slv;

begin

  dut : network port map(
    inputs_network => (input_a_tb, input_b_tb),
    output_network => output_tb);

  input_a_tb <= x"5000",
    x"0000" after 30 ns,
    x"0000" after 60 ns,
    x"1000" after 90 ns,
    x"0000" after 120 ns;

  input_b_tb <= x"0000",
    x"0800" after 30 ns,
    x"1000" after 60 ns,
    x"0000" after 90 ns,
    x"0000" after 120 ns;
end;