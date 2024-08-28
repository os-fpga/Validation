-- safe_path for qrd192x204 given rtl dir is ./rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE qrd192x204_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END qrd192x204_safe_path;

PACKAGE body qrd192x204_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./rtl/") & path;
	END FUNCTION safe_path;
END qrd192x204_safe_path;
