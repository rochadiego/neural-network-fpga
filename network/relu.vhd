library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.network_pkg.all;

entity relu is
  port (
    input_relu  : in slv;
    output_relu : out slv
  );
end relu;

architecture rtl of relu is

  signal x : signed(n_bits - 1 downto 0) := (others => '0');
  signal y : signed(n_bits - 1 downto 0) := (others => '0');

begin

  x <= signed(input_relu);

  y <= x"0000" when (x <= x"0000") else x;

  output_relu <= std_logic_vector(y);

end architecture;