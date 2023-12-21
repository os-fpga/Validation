# vhdl files
RTLFILES = rtl/
TBFILE = tb/
VHDLEX = .vhd
RTL = fpu_double

# RTL
TESTBENCHPATH = ${TBFILE}${TESTBENCHFILE}$(VHDLEX)
TESTBENCHFILE = ${RTL}_TB
RTLPATH = ${RTLFILES}${RTL}${VHDLEX}
TBTOPMODULE = ${RTL}_tb
PACKAGEMODULES = ${RTLFILES}fpupack$(VHDLEX) ${RTLFILES}comppack$(VHDLEX)
RTLSUBMODULES = ${RTLFILES}fpu_add$(VHDLEX) ${RTLFILES}fpu_div$(VHDLEX) ${RTLFILES}fpu_exceptions$(VHDLEX) ${RTLFILES}fpu_mul$(VHDLEX) ${RTLFILES}fpu_round$(VHDLEX) ${RTLFILES}fpu_sub$(VHDLEX)

#GHDL CONFIG
GHDL_CMD = ghdl
GHDL_FLAGS  = -fsynopsys -fexplicit #--ieee=synopsys --warn-no-vital-generic

SIMDIR = simulation
STOP_TIME = 7000ns

# VCD
VCDFLAG = --vcd=wave.vcd

# Simulation break condition
#GHDL_SIM_OPT = --assert-level=error
GHDL_SIM_OPT = --stop-time=$(STOP_TIME)

WAVEFORM_VIEWER = gtkwave

.PHONY: clean

all: clean make run

run:
	@$(GHDL_CMD) -a $(GHDL_FLAGS) $(PACKAGEMODULES) 
	@$(GHDL_CMD) -a $(GHDL_FLAGS) $(RTLSUBMODULES) $(RTLPATH) 
	@$(GHDL_CMD) -a $(GHDL_FLAGS) $(TESTBENCHPATH)
	@$(GHDL_CMD) -e $(GHDL_FLAGS) $(TBTOPMODULE) 
	@$(GHDL_CMD) -r $(GHDL_FLAGS) $(TBTOPMODULE) $(VCDFLAG) $(GHDL_SIM_OPT)

make:
ifeq ($(strip $(RTL)),)
	@echo "RTL not set. Use RTL=<value> to set it."
	@exit 1
endif

clean:
	@rm wave.vcd
	@rm work-obj93.cf
