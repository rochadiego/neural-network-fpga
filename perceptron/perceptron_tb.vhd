library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.perceptron_pkg.all;

entity perceptron_tb is
end;

architecture bench of perceptron_tb is

  component perceptron
    port (
      inputs : in inputs_buffer;
      clk : in std_logic;
      output : out std_logic_vector(bus_bits - 1 downto 0)
    );
  end component;

  -- Ports
  signal inputs : inputs_buffer;
  signal clk : std_logic;
  signal output : std_logic_vector(bus_bits - 1 downto 0);
  signal inputA : std_logic_vector(bus_bits - 1 downto 0);
  signal inputB : std_logic_vector(bus_bits - 1 downto 0);
  signal inputC : std_logic_vector(bus_bits - 1 downto 0);
  signal inputD : std_logic_vector(bus_bits - 1 downto 0);

  constant clk_period : time := 2 fs;

begin

  perceptron_inst : perceptron
  port map(
    inputs => inputs,
    output => output,
    clk => clk
  );
  -- CLK_PROCESS : process
  -- begin
  --   clk <= '0';
  --   wait for clk_period/2;
  --   clk <= '1';
  --   wait for clk_period/2; 
  -- end process;

  clk <= '0',
    '1' after 2 fs,
    '0' after 3 fs,
    '1' after 4 fs;

  inputA <= x"00000003",
    x"00000010" after 10 fs,
    x"00000002" after 20 fs,
    x"00000000" after 30 fs;

  inputB <= x"00000001",
    x"00000000" after 10 fs,
    x"00000003" after 20 fs,
    x"00000000" after 30 fs;

  inputC <= x"00000003",
    x"00000010" after 10 fs,
    x"00000002" after 20 fs,
    x"00000000" after 30 fs;

  inputD <= x"00000003",
    x"00000010" after 10 fs,
    x"00000002" after 20 fs,
    x"00000000" after 30 fs;

  inputs(0) <= inputA;
  inputs(1) <= inputB;
  inputs(2) <= inputC;
  inputs(3) <= inputD;

end;