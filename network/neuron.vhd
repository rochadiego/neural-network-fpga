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

  signal to_activation : slv := (others => '0');

begin

  sum_all_inputs : process (INPUTS, W)
    variable temp : signed(2 * n_bits - 1 downto 0);
  begin
    temp := (others => '0');
    for i in 0 to n_inputs_neuron - 1 loop
      temp := temp + signed(INPUTS(i)) * signed(W(i));
    end loop;
    to_activation <= std_logic_vector(temp(27 downto 12)); -- Q4.12
  end process;

    OUTPUT        <= to_activation; -- add relu

  -- activation : if activation_type = "relu" generate
  --   OUTPUT <= to_activation; -- add relu
  -- elsif activation_type = "sigmoid" generate
  --     OUTPUT <= to_activation; -- add sigmoid
  --   end generate;
end architecture;