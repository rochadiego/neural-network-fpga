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

  signal w : weight := (X"0001",
  X"0001",
  X"0001",
  X"0001");

  component sigmoid
    port (
      input  : in std_logic_vector(15 downto 0);
      output : out std_logic_vector(15 downto 0)
    );
  end component;

begin

  process (inputs)
    variable sum : signed(bus_bits * 2 - 1 downto 0);
  begin

    sum := (others => '0');
    for i in 0 to (inputs_num - 1) loop
      sum := signed(inputs(i)) * w(i) + sum;
    end loop;
    input_sigmoid <= std_logic_vector(sum(bus_bits - 1 downto 0));
  end process;

  sigmoid_inst : sigmoid
  port map(
    input  => input_sigmoid,
    output => output
  );

end architecture;