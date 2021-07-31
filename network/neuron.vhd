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
    INPUTS : in coluna(0 to n_inputs_neuron - 1)(n_bits - 1 downto 0);
    W      : in coluna(0 to n_inputs_neuron - 1)(n_bits - 1 downto 0);
    OUTPUT : out std_logic_vector(n_bits - 1 downto 0));
end neuron;

architecture rtl of neuron is

  signal to_activation : std_logic_vector(n_bits - 1 downto 0);

begin

  x : process (INPUTS, W)
    variable temp : signed(2 * n_bits - 1 downto 0);
  begin
    temp := (others => '0');
    for i in 0 to n_inputs_neuron - 1 loop
      temp := temp + signed(INPUTS(i)) * signed(W(i));
    end loop;
    to_activation <= std_logic_vector(temp(n_bits - 1 downto 0));
  end process;

  OUTPUT <= x"FF"; -- add relu

  -- activation : if activation_type = "relu" generate
  --   OUTPUT <= to_activation; -- add relu
  -- elsif activation_type = "sigmoid" generate
  --     OUTPUT <= to_activation; -- add sigmoid
  --   end generate;
end architecture;