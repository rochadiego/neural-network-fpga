library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.network_pkg.all;

entity network is
  port (
    inputs_network : in array_slv(0 to n_inputs_by_layer(0) - 1);
    output_network : out slv);
end network;

architecture rtl of network is

  component layer is
    generic (
      layer_index : integer
    );
    port (
      inputs_layer  : in array_slv(0 to n_inputs_by_layer(layer_index) - 1);
      weights_layer : in array_slv(0 to n_weights_by_layer(layer_index) - 1);
      output_layer  : out array_slv(0 to n_neurons_by_layer(layer_index) - 1)
    );
  end component;

  component neuron is
    generic (
      n_inputs_neuron : integer;
      activation      : integer
    );
    port (
      inputs_neuron  : in array_slv(0 to n_inputs_by_layer(n_layers) - 1);
      weights_neuron : in array_slv(0 to n_inputs_by_layer(n_layers) - 1);
      output_neuron  : out slv);
  end component;

  signal all_weights : array_slv(0 to n_all_weights - 1) := init_ram_hex;
  signal all_inputs  : array_slv(0 to n_all_inputs - 1)  := (others => (others => '0'));

begin

  all_inputs(0 to n_inputs_by_layer(0) - 1) <= inputs_network;

  add_layers_to_network : for i in 0 to n_layers - 1 generate
    add_layer : layer
    generic map(
      layer_index => i
    )
    port map(
      inputs_layer  => all_inputs(index_helper_n_inputs_by_layer(i) to index_helper_n_inputs_by_layer(i + 1) - 1),
      weights_layer => all_weights(index_helper_n_weights_by_layer(i) to index_helper_n_weights_by_layer(i + 1) - 1),
      output_layer  => all_inputs(index_helper_n_inputs_by_layer(i + 1) to index_helper_n_inputs_by_layer(i + 2) - 1)
    );
  end generate;

  --
  sigmoid_layer : neuron
  generic map(
    n_inputs_neuron => n_inputs_by_layer(2),
    activation      => 1
  )
  port map(
    inputs_neuron  => all_inputs(index_helper_n_inputs_by_layer(2) to index_helper_n_inputs_by_layer(3) - 1),
    weights_neuron => all_weights(index_helper_n_weights_by_layer(2) to index_helper_n_weights_by_layer(3) - 1),
    output_neuron  => output_network);

end architecture;