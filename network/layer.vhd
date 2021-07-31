library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.network_pkg.all;

entity layer is
  generic (
    constant layer_index : integer
  );
  port (
    layer_IN   : in coluna(0 to n_inputs_by_layer(layer_index) - 1)(n_bits - 1 downto 0);
    layer_W_IN : in coluna(0 to n_inputs_by_layer(layer_index) * n_neurons_by_layer(layer_index) - 1)(n_bits - 1 downto 0);
    layer_OUT  : out coluna(0 to n_neurons_by_layer(layer_index) - 1)(n_bits - 1 downto 0)
  );
end layer;

architecture rtl of layer is

  component neuron is
    generic (
      n_inputs_neuron : integer
    );
    port (
      INPUTS : in coluna(0 to n_neurons_by_layer(layer_index) - 1)(n_bits - 1 downto 0);
      W      : in coluna(0 to n_neurons_by_layer(layer_index) - 1)(n_bits - 1 downto 0);
      OUTPUT : out std_logic_vector(n_bits - 1 downto 0));
  end component;

  --ajeitar isso, não está dinâmico
  -- constant all_weigths : coluna(0 to 3)(n_bits - 1 downto 0) := layer_W_IN;

begin

  -- add_neurons_to_layer : for i in 0 to n_neurons_by_layer(layer_index) - 1 generate
  --   x : neuron generic map(
  --     n_inputs_neuron => n_neurons_by_layer(layer_index)
  --   )
  --   port map(
  --     INPUTS => layer_IN,
  --     W      => layer_W_IN(i * n_neurons_by_layer(layer_index) to i * n_neurons_by_layer(layer_index) + n_neurons_by_layer(layer_index) - 1),
  --     OUTPUT => layer_OUT(i));
  -- end generate;

  layer_OUT <= layer_W_IN(0 to 1);
  process (all)
  begin
    report to_string(layer_OUT(layer_index));
  end process;

end architecture;