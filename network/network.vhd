library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.network_pkg.all;

entity network is
  port (
    INPUTS  : in coluna(0 to n_entradas - 1)(n_bits - 1 downto 0);
    OUTPUTs : out coluna(0 to n_neuros - 1)(n_bits - 1 downto 0));
end network;

architecture rtl of network is

  component layer is
    generic (
      n_layer : integer;
      activation_type : string
    );
    port (
      layer_IN   : in coluna(0 to n_entradas - 1)(n_bits - 1 downto 0);
      layer_W_IN : in coluna(0 to n_entradas * n_neuros - 1)(n_bits - 1 downto 0);
      layer_OUT  : out coluna(0 to n_neuros - 1)(n_bits - 1 downto 0)
    );
  end component;

  signal mem         : coluna(0 to n_entradas * n_neuros - 1)(n_bits - 1 downto 0) := init_ram_hex;--Magic!!!
  constant n_layer : integer := 1;
  constant activation_type : string := "relu";

begin

  unica : layer
  generic map (
    n_layer => n_layer,
    activation_type => activation_type
  )
  port map(
    layer_IN   => INPUTS,
    layer_W_IN => mem,
    layer_OUT  => OUTPUTs);

end architecture;