# vhdl files
RTLFILES = rtl/
TBFILE = tb/
VHDLEX = .vhd
RTL = zbt_top

# RTL
TESTBENCHPATH = ${TBFILE}${TESTBENCHFILE}$(VHDLEX)
TESTBENCHFILE = tb_${RTL}
RTLPATH = ${RTLFILES}${RTL}${VHDLEX}
TBTOPMODULE = ${TESTBENCHFILE}_vhd

#GHDL CONFIG
GHDL_CMD = ghdl
GHDL_FLAGS  = -fsynopsys -fexplicit #--ieee=synopsys --warn-no-vital-generic

SIMDIR = simulation
STOP_TIME = 2000ns

# VCD
VCDFLAG = --vcd=wave.vcd

# Simulation break condition
#GHDL_SIM_OPT = --assert-level=error
GHDL_SIM_OPT = --stop-time=$(STOP_TIME)

WAVEFORM_VIEWER = gtkwave

.PHONY: clean

all: clean make run

run:
	@$(GHDL_CMD) -a $(GHDL_FLAGS) $(TESTBENCHPATH) $(RTLPATH)
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
