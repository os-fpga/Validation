-- safe_path for DirectRFTest_and_DPD_SV given rtl dir is ./rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE DirectRFTest_and_DPD_SV_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END DirectRFTest_and_DPD_SV_safe_path;

PACKAGE body DirectRFTest_and_DPD_SV_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./rtl/") & path;
	END FUNCTION safe_path;
END DirectRFTest_and_DPD_SV_safe_path;
