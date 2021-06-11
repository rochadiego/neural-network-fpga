library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sigmoid_tb is
end;

architecture bench of sigmoid_tb is

  component sigmoid
    generic (
      bus_bits : integer
    );
    port (
      input  : in std_logic_vector(bus_bits - 1 downto 0);
      output : out std_logic_vector(bus_bits - 1 downto 0)
    );
  end component;

  -- Generics
  constant bus_bits : integer := 16;

  -- Ports
  signal input  : std_logic_vector(bus_bits - 1 downto 0);
  signal output : std_logic_vector(bus_bits - 1 downto 0);

begin

  sigmoid_inst : sigmoid
  generic map(
    bus_bits => bus_bits
  )
  port map(
    input  => input,
    output => output
  );

  input <= x"0000",
    x"1000" after 10 ns,
    x"2600" after 20 ns,
    x"5000" after 30 ns,
    x"5020" after 40 ns;

end;