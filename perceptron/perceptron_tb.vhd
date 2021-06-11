library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library  work;

use work.perceptron_pkg.all;


entity perceptron_tb is
end;

architecture bench of perceptron_tb is

  component perceptron
    port (
      inputs : in inputs_buffer;
      output : out std_logic_vector(bus_bits - 1 downto 0)
    );
  end component;

  -- Ports
  signal inputs : inputs_buffer;
  signal output : std_logic_vector(bus_bits - 1 downto 0);
  signal inputA : std_logic_vector(bus_bits - 1 downto 0);
  signal inputB : std_logic_vector(bus_bits - 1 downto 0);
  signal inputC : std_logic_vector(bus_bits - 1 downto 0);
  signal inputD : std_logic_vector(bus_bits - 1 downto 0);

begin

  perceptron_inst : perceptron
  port map(
    inputs => (inputA, inputB, inputC, inputD),
    output => output
  );

  inputA <= x"00000003",
    x"00000010" after 10 ns,
    x"00000002" after 20 ns,
    x"00000000" after 30 ns;

  inputB <= x"00000001",
    x"00000000" after 10 ns,
    x"00000003" after 20 ns,
    x"00000000" after 30 ns;

  inputC <= x"00000003",
    x"00000010" after 10 ns,
    x"00000002" after 20 ns,
    x"00000000" after 30 ns;

  inputD <= x"00000003",
    x"00000010" after 10 ns,
    x"00000002" after 20 ns,
    x"00000000" after 30 ns;

end;