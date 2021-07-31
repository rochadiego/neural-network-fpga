library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;
package network_pkg is
  --Abstração de uma vetor coluna de std_logic_vector
  type coluna is array (integer range <>) of std_logic_vector;
  type array_integer is array (integer range <>) of integer;
  --Constantes da rede

  constant n_inputs_by_layer  : array_integer(0 to 1) := (2, 2);
  constant n_neurons_by_layer : array_integer(0 to 1) := (2, 2);

  constant n_entradas : integer := 2;
  constant n_bits     : integer := 8;
  constant n_neuros   : integer := 2;
  --Declaração da função
  impure function init_ram_hex return coluna;
end network_pkg;

package body network_pkg is
  impure function init_ram_hex return coluna is
    file text_file       : text open read_mode is "pesos.txt";
    variable text_line   : line;
    variable ram_content : coluna(0 to n_entradas * n_neuros - 1)(n_bits - 1 downto 0);
  begin
    for i in 0 to n_entradas * n_neuros - 1 loop
      readline(text_file, text_line);
      hread(text_line, ram_content(i));
      report to_hstring(ram_content(i));
    end loop;

    return ram_content;
  end function;
end network_pkg;