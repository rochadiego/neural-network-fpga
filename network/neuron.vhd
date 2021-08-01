library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.network_pkg.all;

entity neuron is
  generic (
    n_inputs_neuron : integer
  );
  port (
    INPUTS : in array_slv(0 to n_inputs_neuron - 1);
    W      : in array_slv(0 to n_inputs_neuron - 1);
    OUTPUT : out slv);
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

  sum_all_inputs : process (INPUTS, W)
    variable temp : signed(2 * n_bits - 1 downto 0);
  begin
    temp := (others => '0');
    for i in 0 to n_inputs_neuron - 1 loop
      temp := temp + signed(INPUTS(i)) * signed(W(i));
    end loop;
    -- bugado, alguns estouros de memória ficam negativos
    to_activation <= std_logic_vector(temp(27 downto 12)); -- Q4.12
    report to_hstring(to_activation);
  end process;

  activation : relu port map(
    input_relu  => to_activation,
    output_relu => OUTPUT
  );
end architecture;