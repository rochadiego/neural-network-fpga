library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;
package network_pkg is

  --barramento 
  constant n_bits : integer := 16;
  subtype slv is std_logic_vector(n_bits - 1 downto 0);
  type array_integer is array (integer range <>) of integer;
  type array_slv is array (integer range <>) of slv;

  -- #### AJUSTES DA REDE NEURAL ####
  -- tamanho da entrada de dados
  constant n_inputs_network : integer := 2;

  -- camadas profundas
  constant n_neurons_by_layer : array_integer(0 to 2) := (6, 7, 1);
  -- #### FIM DOS AJUSTES DA REDE NEURAL ####

  constant n_inputs_by_layer : array_integer(0 to 2) :=
  (n_inputs_network,
  n_neurons_by_layer(0),
  n_neurons_by_layer(1));

  constant n_weights_by_layer : array_integer(0 to 2) :=
  (n_neurons_by_layer(0) * n_inputs_by_layer(0),
  n_neurons_by_layer(1) * n_inputs_by_layer(1),
  n_neurons_by_layer(2) * n_inputs_by_layer(2));

  constant n_all_weights : integer :=
  n_weights_by_layer(0) +
  n_weights_by_layer(1) +
  n_weights_by_layer(2);

  constant n_all_biases : integer :=
  n_neurons_by_layer(0) +
  n_neurons_by_layer(1) +
  n_neurons_by_layer(2);

  constant n_all_inputs : integer :=
  n_inputs_by_layer(0) +
  n_inputs_by_layer(1) +
  n_inputs_by_layer(2);

  constant index_helper_n_inputs_by_layer : array_integer(0 to 3) :=
  (0, n_inputs_by_layer(0),
  n_inputs_by_layer(0) + n_inputs_by_layer(1),
  n_inputs_by_layer(0) + n_inputs_by_layer(1) + n_inputs_by_layer(2));

  constant index_helper_n_weights_by_layer : array_integer(0 to 3) :=
  (0, n_weights_by_layer(0),
  n_weights_by_layer(0) + n_weights_by_layer(1),
  n_weights_by_layer(0) + n_weights_by_layer(1) + n_weights_by_layer(2));

  constant index_helper_n_biases_by_layer : array_integer(0 to 3) :=
  (0, n_neurons_by_layer(0),
  n_neurons_by_layer(0) + n_neurons_by_layer(1),
  n_neurons_by_layer(0) + n_neurons_by_layer(1) + n_neurons_by_layer(2));

  constant n_layers : integer := n_neurons_by_layer'right;

  --Declaração da função
  impure function init_weights return array_slv;
  impure function init_biases return array_slv;
end network_pkg;

package body network_pkg is

  impure function init_weights return array_slv is
    file text_file     : text open read_mode is "weights.txt";
    variable text_line : line;

    variable ram_content : array_slv(0 to n_all_weights - 1);
  begin
    for i in 0 to n_all_weights - 1 loop
      readline(text_file, text_line);
      hread(text_line, ram_content(i));
    end loop;

    return ram_content;
  end function;

  impure function init_biases return array_slv is
    file text_file     : text open read_mode is "biases.txt";
    variable text_line : line;

    variable ram_content : array_slv(0 to n_all_biases - 1);
  begin
    for i in 0 to n_all_biases - 1 loop
      readline(text_file, text_line);
      hread(text_line, ram_content(i));
    end loop;

    return ram_content;
  end function;

end network_pkg;