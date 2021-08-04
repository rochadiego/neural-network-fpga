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
      output_network : out array_slv(0 to n_neurons_by_layer(1) - 1));
  end component;

  signal input_A, input_B   : slv;
  signal output_A, output_B : slv;
  signal output_bench       : array_slv(0 to n_neurons_by_layer(1) - 1);

begin

  dut : network port map(
    inputs_network => (input_A, input_B),
    output_network => output_bench);

  output_A <= output_bench(0);
  output_B <= output_bench(1);
  -- output_C <= output_bench(2);

  input_A <= x"0800",
    x"2000" after 30 ns,
    x"3000" after 60 ns;
  -- x"4000" after 90 ns,
  -- x"0000" after 120 ns;

  input_B <= x"0800",
    x"2000" after 30 ns,
    x"3000" after 60 ns;
  -- x"4000" after 90 ns,
  -- x"0000" after 120 ns;

end;