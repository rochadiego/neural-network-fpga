library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.network_pkg.all;

entity layer is
  generic (
    constant layer_index : integer
  );
  port (
    inputs_layer  : in array_slv(0 to n_inputs_by_layer(layer_index) - 1);
    weights_layer : in array_slv(0 to n_weights_by_layer(layer_index) - 1);
    output_layer  : out array_slv(0 to n_neurons_by_layer(layer_index) - 1)
  );
end layer;

architecture rtl of layer is

  component neuron is
    generic (
      n_inputs_neuron : integer
    );
    port (
      inputs_neuron  : in array_slv(0 to n_inputs_by_layer(layer_index) - 1);
      weights_neuron : in array_slv(0 to n_inputs_by_layer(layer_index) - 1);
      output_neuron  : out slv);
  end component;

begin

  add_neurons_to_layer : for i in 0 to n_neurons_by_layer(layer_index) - 1 generate
    add_neuron : neuron generic map(
      n_inputs_neuron => n_inputs_by_layer(layer_index)
    )
    port map(
      inputs_neuron  => inputs_layer,
      weights_neuron => weights_layer(i * n_inputs_by_layer(layer_index) to i * n_inputs_by_layer(layer_index) + n_inputs_by_layer(layer_index) - 1),
      output_neuron  => output_layer(i));
  end generate;

end architecture;