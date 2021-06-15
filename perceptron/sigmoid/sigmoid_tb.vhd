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

  input <= x"E000",
    x"C000" after 5 ns,  --C0f5
    x"BCCC" after 10 ns, 
    x"A385" after 15 ns,
    x"9828" after 20 ns,
    x"8D47" after 25 ns,
    x"8599" after 30 ns,
    x"0599" after 35 ns, -- aqui
    x"0D47" after 40 ns, 
    x"1828" after 45 ns,
    x"2385" after 50 ns,
    x"3CCC" after 55 ns,
    x"40F5" after 60 ns,
    x"6000" after 65 ns,
    x"0000" after 70 ns;
    
end;