library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity sigmoid is
  generic (
    bus_bits : integer := 16
  );
  port (
    input  : in std_logic_vector(bus_bits - 1 downto 0);
    output : out std_logic_vector(bus_bits - 1 downto 0)
  );
end entity sigmoid;

architecture rtl of sigmoid is

  signal x : signed(bus_bits - 1 downto 0) := (others => '0');
  signal y  : signed(bus_bits * 2 - 1 downto 0) := (others => '0');
  signal y2 : signed(bus_bits - 1 downto 0)     := (others => '0');

  signal a : signed(bus_bits - 1 downto 0) := (others => '0');
  signal b : signed(bus_bits - 1 downto 0) := (others => '0');

begin

  x  <= signed(input); --Q4.12
  y  <= a * x; -- Q8.24
  y2 <= y(27 downto 12) + b;

  output <= std_logic_vector(y2);

  a <=
    x"0000" when (x <= x"B000") else
    x"007A" when (x > x"B000") and (x <= x"DA00") else
    x"0224" when (x > x"DA00") and (x <= x"F000") else
    x"03B2" when (x > x"F000") and (x < x"0000") else

    x"0400" when (x >= x"0000") and (x < x"1000") else
    x"0200" when (x >= x"1000") and (x < x"2600") else
    x"0080" when (x >= x"2600") and (x < x"5000") else
    x"0000" when (x >= x"5000");

  b <=
    x"0000" when (x <= x"B000") else
    x"027E" when (x > x"B000") and (x <= x"DA00") else
    x"0672" when (x > x"DA00") and (x <= x"F000") else
    x"0800" when (x > x"F000") and (x < x"0000") else

    x"0800" when (x >= x"0000") and (x < x"1000") else
    x"0A00" when (x >= x"1000") and (x < x"2600") else
    x"0D80" when (x >= x"2600") and (x < x"5000") else
    x"1000" when (x >= x"5000");

end architecture;