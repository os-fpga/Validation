# vhdl files
RTLFILES = rtl/
TBFILE = tb/
VHDLEX = .vhd
TESTBENCH = dac

# testbench
TESTBENCHPATH = ${TBFILE}${TESTBENCHFILE}$(VHDLEX)
TESTBENCHFILE = ${TESTBENCH}_tb
RTLPATH = ${RTLFILES}${TESTBENCH}_dsm2_top${VHDLEX} ${RTLFILES}${TESTBENCH}_dsm2${VHDLEX}

#GHDL CONFIG
GHDL_CMD = ghdl
GHDL_FLAGS  = -fsynopsys #--ieee=synopsys --warn-no-vital-generic

SIMDIR = simulation
STOP_TIME = 1000ns

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
	@$(GHDL_CMD) -e $(GHDL_FLAGS) $(TESTBENCHFILE) 
	@$(GHDL_CMD) -r $(GHDL_FLAGS) $(TESTBENCHFILE) $(VCDFLAG) $(GHDL_SIM_OPT)

make:
ifeq ($(strip $(TESTBENCH)),)
	@echo "TESTBENCH not set. Use TESTBENCH=<value> to set it."
	@exit 1
endif

clean:
	@rm wave.vcd
	@rm work-obj93.cf
