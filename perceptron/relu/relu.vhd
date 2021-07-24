library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity relu is
  generic (
    bus_bits : integer := 16
  );
  port (
    input  : in std_logic_vector(bus_bits - 1 downto 0);
    output : out std_logic_vector(bus_bits - 1 downto 0)
  );
end entity relu;

architecture rtl of relu is

  signal x : signed(bus_bits - 1 downto 0) := (others => '0');
  signal y : signed(bus_bits - 1 downto 0) := (others => '0');

begin

  x <= signed(input);

  output <= std_logic_vector(y);

  y <= x"0000" when (x <= x"0000") else x;

end architecture;