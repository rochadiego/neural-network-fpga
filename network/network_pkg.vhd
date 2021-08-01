library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;
package network_pkg is

  -- definição de tipos genéricos
  constant n_bits : integer := 16;
  subtype slv is std_logic_vector(n_bits - 1 downto 0);
  type array_integer is array (integer range <>) of integer;
  type array_slv is array (integer range <>) of slv;
  -- entrada da rede, depende do dataset
  constant n_inputs_network : integer := 2;

  -- camadas profundas
  constant n_neurons_by_layer : array_integer(0 to 1) := (2, 2);
  constant n_inputs_by_layer  : array_integer(0 to 2) := (n_inputs_network, n_neurons_by_layer(0), n_neurons_by_layer(1));
  constant n_weights_by_layer : array_integer(0 to 1) := (4, 4); --neurônio(0) * entrada(0)
  constant n_all_weights      : integer               := 8; -- soma pesos de cada camada 

  --Declaração da função
  impure function init_ram_hex return array_slv;
end network_pkg;

package body network_pkg is
  impure function init_ram_hex return array_slv is
    file text_file     : text open read_mode is "pesos.txt";
    variable text_line : line;

    variable ram_content : array_slv(0 to n_all_weights - 1);
  begin
    for i in 0 to n_all_weights - 1 loop
      readline(text_file, text_line);
      hread(text_line, ram_content(i));
      report to_hstring(ram_content(i));
    end loop;

    return ram_content;
  end function;
end network_pkg;