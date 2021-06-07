library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.perceptron_pkg.all;

entity perceptron is

  port (
    inputs : in inputs_buffer;
    clk : in std_logic;
    output : out std_logic_vector(bus_bits - 1 downto 0));
end perceptron;

architecture v1 of perceptron is

  type weight is array (0 to inputs_num - 1) of signed(bus_bits - 1 downto 0);

  signal w : weight := (X"00000001",
  X"00000001",
  X"00000001",
  X"00000001");

  signal temp : signed(bus_bits * 2 - 1 downto 0) := (others => '0');

begin

  process (clk)
  begin
    if rising_edge(clk) then
      for i in 0 to (inputs_num - 1) loop
        temp <= signed(inputs(i)) * w(i) + temp;
      end loop;
    end if;
  end process;

  output <= std_logic_vector(temp(bus_bits - 1 downto 0));

end v1;