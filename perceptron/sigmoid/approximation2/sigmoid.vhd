library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;
entity sigmoid is
  port (
    input  : in std_logic_vector(15 downto 0);
    output : out std_logic_vector(15 downto 0)
  );
end entity sigmoid;

architecture rtl of sigmoid is

  signal x : sfixed(3 downto -12) := (others => '0');
  signal y : sfixed(3 downto -12) := (others => '0');

begin

  x <= sfixed(input);
  y <= resize(((x / (1.0 + abs(x))) + 1.0)/2.0, x);

  output <= to_slv(y);

end architecture;