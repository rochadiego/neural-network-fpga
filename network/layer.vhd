library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.network_pkg.all;

entity layer is
  generic (
    constant layer_index : integer
  );
  port (
    layer_IN   : in array_slv(0 to n_inputs_by_layer(layer_index) - 1);
    layer_W_IN : in array_slv(0 to n_weights_by_layer(layer_index) - 1);
    layer_OUT  : out array_slv(0 to n_neurons_by_layer(layer_index) - 1)
  );
end layer;

architecture rtl of layer is

  component neuron is
    generic (
      n_inputs_neuron : integer
    );
    port (
      INPUTS : in array_slv(0 to n_neurons_by_layer(layer_index) - 1);
      W      : in array_slv(0 to n_neurons_by_layer(layer_index) - 1);
      OUTPUT : out slv);
  end component;

begin

  add_neurons_to_layer : for i in 0 to n_neurons_by_layer(layer_index) - 1 generate
    x : neuron generic map(
      n_inputs_neuron => n_neurons_by_layer(layer_index)
    )
    port map(
      INPUTS => layer_IN,
      W      => layer_W_IN(i * n_neurons_by_layer(layer_index) to i * n_neurons_by_layer(layer_index) + n_neurons_by_layer(layer_index) - 1),
      OUTPUT => layer_OUT(i));
  end generate;

end architecture;