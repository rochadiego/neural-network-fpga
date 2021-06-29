library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package perceptron_pkg is

  -- bits de barramento
  constant bus_bits : integer := 16;

  -- número de entradas
  constant inputs_num : integer := 4;

  type inputs_buffer is array (0 to inputs_num - 1) of std_logic_vector(bus_bits - 1 downto 0);
end package;