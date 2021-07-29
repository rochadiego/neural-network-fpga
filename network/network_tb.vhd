library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.network_pkg.all;

entity network_tb is
end;

architecture bench of network_tb is

  component network is
    port (
      INPUTS  : in coluna(0 to n_entradas - 1)(n_bits - 1 downto 0);
      OUTPUTS : out coluna(0 to n_neuros - 1)(n_bits - 1 downto 0));
  end component;

  signal input_A, input_B   : std_logic_vector(n_bits - 1 downto 0);
  signal output_A, output_B : std_logic_vector(n_bits - 1 downto 0);
  signal saida              : coluna(0 to n_neuros - 1)(n_bits - 1 downto 0);

begin

  dut : network port map(
    INPUTS  => (input_A, input_B),
    OUTPUTS => saida);

  output_A <= saida(0);
  output_B <= saida(1);
  input_A  <= "00000010",
    "00000100" after 10 ns,
    "00000011" after 20 ns,
    "00000110" after 30 ns,
    "00000000" after 40 ns;

  input_B <= "00000011",
    "00000110" after 10 ns,
    "00000001" after 20 ns,
    "00000000" after 30 ns,
    "00000000" after 40 ns;

end;