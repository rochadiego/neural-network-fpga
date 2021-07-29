library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.network_pkg.all;

entity layer is
  generic (
    n_layer         : integer;
    activation_type : string
  );
  port (
    layer_IN   : in coluna(0 to n_entradas - 1)(n_bits - 1 downto 0);
    layer_W_IN : in coluna(0 to n_entradas * n_neuros - 1)(n_bits - 1 downto 0);
    layer_OUT  : out coluna(0 to n_neuros - 1)(n_bits - 1 downto 0)
  );
end layer;

architecture rtl of layer is

  component neuron is
    generic (
      activation_type : string
    );
    port (
      INPUTS : in coluna(0 to n_entradas - 1)(n_bits - 1 downto 0);
      W      : in coluna(0 to n_entradas - 1)(n_bits - 1 downto 0);
      OUTPUT : out std_logic_vector(n_bits - 1 downto 0));
  end component;

begin

  add_neurons_to_layer : for i in 0 to n_neuros - 1 generate
    x : neuron generic map(
      activation_type => activation_type
    )
    port map(
      INPUTS => layer_IN,
      W      => layer_W_IN(i * n_entradas to i * n_entradas + n_entradas - 1),
      OUTPUT => layer_OUT(i));
  end generate;

end architecture;