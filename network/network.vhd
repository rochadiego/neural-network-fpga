library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.network_pkg.all;

entity network is
  port (
    inputs_network : in array_slv(0 to n_inputs_by_layer(0) - 1);
    output_network : out array_slv(0 to n_neurons_by_layer(1) - 1));
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

  component sigmoid is
    port (
      input_sigmoid  : in slv;
      output_sigmoid : out slv
    );
  end component;

  constant n_layers : integer := n_neurons_by_layer'right;

  signal all_weights : array_slv(0 to n_all_weights - 1) := init_ram_hex;

  -- first deep layer
  signal inputs_first_deep_layer  : array_slv(0 to n_inputs_by_layer(0) - 1);
  signal weights_first_deep_layer : array_slv(0 to n_weights_by_layer(0) - 1);

  -- second deep layer
  signal inputs_second_deep_layer  : array_slv(0 to n_inputs_by_layer(1) - 1);
  signal weights_second_deep_layer : array_slv(0 to n_weights_by_layer(1) - 1);

  -- output neural network
  signal outputs_second_deep_layer : array_slv(0 to n_neurons_by_layer(1) - 1);

begin

  -- first deep layer 
  inputs_first_deep_layer <= inputs_network;

  -- parse weights
  weights_first_deep_layer  <= all_weights(0 to n_weights_by_layer(0) - 1);
  weights_second_deep_layer <= all_weights(n_weights_by_layer(0) to n_weights_by_layer(0) + n_weights_by_layer(1) - 1);

  inst_first_deep_layer : layer generic map(
    layer_index => 0
  )
  port map(
    inputs_layer  => inputs_first_deep_layer,
    weights_layer => weights_first_deep_layer,
    output_layer  => inputs_second_deep_layer);

  inst_second_deep_layer : layer generic map(
    layer_index => 1
  )
  port map(
    inputs_layer  => inputs_second_deep_layer,
    weights_layer => weights_second_deep_layer,
    output_layer  => outputs_second_deep_layer);

  output_network <= outputs_second_deep_layer;

  -- add neuronio aqui e função sigmoid

end architecture;