-- safe_path for cholesky_solver_mc given rtl dir is ./rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE cholesky_solver_mc_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END cholesky_solver_mc_safe_path;

PACKAGE body cholesky_solver_mc_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./rtl/") & path;
	END FUNCTION safe_path;
END cholesky_solver_mc_safe_path;
