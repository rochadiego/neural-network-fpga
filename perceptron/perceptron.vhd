library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.perceptron_pkg.all;

entity perceptron is

  port (
    inputs : in inputs_buffer;
    output : out std_logic_vector(bus_bits - 1 downto 0));
end perceptron;

architecture v1 of perceptron is

  type weight is array (0 to inputs_num - 1) of signed(bus_bits - 1 downto 0);

  signal w : weight := (X"00000001",
  X"00000001",
  X"00000001",
  X"00000001");

begin

  process (inputs)
    variable temp : signed(bus_bits * 2 - 1 downto 0);
  begin

    temp := (others => '0');
    for i in 0 to (inputs_num - 1) loop
      temp := signed(inputs(i)) * w(i) + temp;
    end loop;
    output <= std_logic_vector(temp(bus_bits - 1 downto 0));

  end process;

end v1;