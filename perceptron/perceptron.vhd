library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.fixed_pkg.all;
library work;
use work.perceptron_pkg.all;

entity perceptron is
  port (
    inputs : in inputs_buffer;
    output : out std_logic_vector(bus_bits - 1 downto 0));
end perceptron;

architecture rtl of perceptron is

  type weight is array (0 to inputs_num - 1) of signed(15 downto 0);
  signal input_sigmoid : std_logic_vector(bus_bits - 1 downto 0) := (others => '0');

  signal x : sfixed(3 downto -12) := (others => '0');
  signal y : sfixed(3 downto -12) := (others => '0');

  signal w : weight := (X"1000",
  X"1000",
  X"1000",
  X"1000");

  -- component sigmoid
  --   port (
  --     input  : in std_logic_vector(15 downto 0);
  --     output : out std_logic_vector(15 downto 0)
  --   );
  -- end component;

begin

  process (inputs)
    variable sum : sfixed(3 downto -12);
  begin
    sum := (others => '0');
    for i in 0 to (inputs_num - 1) loop
      sum := resize(sfixed(inputs(i)) * sfixed(w(i)) + sum, sum);
    end loop;
    report to_hstring(sum);
    input_sigmoid <= to_slv(sum);
  end process;

  output <= input_sigmoid;

  -- sigmoid_inst : sigmoid
  -- port map(
  --   input  => input_sigmoid,
  --   output => output
  -- );

end architecture;