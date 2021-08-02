library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.fixed_pkg.all;

library work;
use work.network_pkg.all;

entity neuron is
  generic (
    n_inputs_neuron : integer
  );
  port (
    inputs_neuron  : in array_slv(0 to n_inputs_neuron - 1);
    weights_neuron : in array_slv(0 to n_inputs_neuron - 1);
    output_neuron  : out slv);
end neuron;

architecture rtl of neuron is

  component relu is
    port (
      input_relu  : in slv;
      output_relu : out slv
    );
  end component;

  signal to_activation : slv := (others => '0');

begin

  sum_all_inputs : process (inputs_neuron, weights_neuron)
    variable sum : sfixed(3 downto -12);
  begin
    sum := (others => '0');
    for i in 0 to n_inputs_neuron - 1 loop
      sum := resize(sfixed(inputs_neuron(i)) * sfixed(weights_neuron(i)) + sum, sum);
    end loop;
    to_activation <= to_slv(sum);
  end process;

  activation : relu port map(
    input_relu  => to_activation,
    output_relu => output_neuron
  );
end architecture;