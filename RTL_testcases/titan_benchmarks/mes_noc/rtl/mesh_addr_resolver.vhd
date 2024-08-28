-------------------------------------------------------------------------------
-- Title      : Address resolver for mesh network
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mesh_addr_resolver.vhd
-- Author     : Jussi Nieminen  <niemin95@galapagosinkeiju.cs.tut.fi>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: In goes number, out goes mesh address
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/06/05  1.0      niemin95        Created
-------------------------------------------------------------------------------
-- Copyright (c) 2009 by Tampere University of Technology


-- This file is part of Traffic generator.

-- Traffic generator is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as
-- published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.

-- Traffic generator is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public
-- License along with Traffic generator.
-- If not, see <http://www.gnu.org/licenses/>.



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mesh_addr_resolver is

  generic (
    number_width_g    : integer := 4;
    mesh_addr_width_g : integer := 32;
    mesh_columns_g    : integer := 4;
    mesh_rows_g       : integer := 4
    );

  port (
    number_in     : in  std_logic_vector( number_width_g-1 downto 0 );
    mesh_addr_out : out std_logic_vector( mesh_addr_width_g-1 downto 0 )
    );

end mesh_addr_resolver;


architecture rtl of mesh_addr_resolver is

  -- This has to be initialized or ModelSim dies
  signal number_int  : integer range 0 to (2**number_width_g-1) := 0;
  signal mesh_column : integer range 0 to mesh_columns_g-1;
  signal mesh_row    : integer range 0 to mesh_rows_g-1;

begin  -- rtl

  assert mesh_addr_width_g mod 2 = 0 report "Mesh address width must be even!" severity failure;
  assert mesh_columns_g > 0 and mesh_rows_g > 0 report "Number of columns/rows must be over zero" severity failure;

  number_int <= to_integer( unsigned( number_in ));
  mesh_row <= number_int / mesh_columns_g;
  mesh_column <= number_int mod mesh_columns_g;

  mesh_addr_out <= std_logic_vector( to_unsigned( mesh_row*(2**(mesh_addr_width_g/2)) + mesh_column, mesh_addr_width_g ));
  
end rtl;
