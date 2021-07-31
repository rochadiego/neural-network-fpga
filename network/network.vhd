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
      layer_index  : integer
      -- activation_type : string
    );
    port (
      layer_IN   : in coluna(0 to n_inputs_by_layer(layer_index) - 1)(n_bits - 1 downto 0);
      layer_W_IN : in coluna(0 to n_inputs_by_layer(layer_index) * n_neurons_by_layer(layer_index) - 1)(n_bits - 1 downto 0);
      layer_OUT  : out coluna(0 to n_neurons_by_layer(layer_index) - 1)(n_bits - 1 downto 0)
    );
  end component;

  constant layer_index  : integer := 0;
  -- constant activation_type : string  := "relu";

  signal mem : coluna(0 to n_entradas * n_neuros - 1)(n_bits - 1 downto 0) := init_ram_hex;--Magic!!!

begin

  unica : layer
  generic map(
    layer_index  => 0
      )
  port map(
    layer_IN   => INPUTS,
    layer_W_IN => mem,
    layer_OUT  => OUTPUTs);

end architecture;