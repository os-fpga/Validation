-- safe_path for Chol_Fw given rtl dir is ./rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE Chol_Fw_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END Chol_Fw_safe_path;

PACKAGE body Chol_Fw_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./rtl/") & path;
	END FUNCTION safe_path;
END Chol_Fw_safe_path;
