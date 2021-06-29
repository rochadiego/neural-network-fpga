library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sigmoid_tb is
end;

architecture bench of sigmoid_tb is

  component sigmoid
    port (
      input  : in std_logic_vector(15 downto 0);
      output : out std_logic_vector(15 downto 0)
    );
  end component;
  
  -- Ports
  signal input  : std_logic_vector(15 downto 0);
  signal output : std_logic_vector(15 downto 0);

begin

  sigmoid_inst : sigmoid
  port map(
    input  => input,
    output => output
  );

  input <= x"A000", -- -6.00
    x"BF0B" after 5 ns, -- -4.06
    x"C334" after 10 ns, -- -3.80
    x"DC7B" after 15 ns, -- -2.22
    x"E7D8" after 20 ns, -- -1.51
    x"F2B9" after 25 ns, -- -0.83
    x"FA67" after 30 ns, -- -0.35
    x"0599" after 35 ns, --  0.35
    x"0D47" after 40 ns, --  0.83
    x"1828" after 45 ns, --  1.51
    x"2385" after 50 ns, --  2.22
    x"3CCC" after 55 ns, --  3.80
    x"40F5" after 60 ns, --  4.06
    x"6000" after 65 ns, --  6.00
    x"0000" after 70 ns;
end;