// Verilated -*- SystemC -*-
// DESCRIPTION: Verilator output: Primary model header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef VERILATED_VCO_SIM_UNSIGNED_ACCUM_OUTPUT_SHIFTED_ROUNDED_SATURATED_OVERFLOW_INST_DSP19X2_H_
#define VERILATED_VCO_SIM_UNSIGNED_ACCUM_OUTPUT_SHIFTED_ROUNDED_SATURATED_OVERFLOW_INST_DSP19X2_H_  // guard

#include "systemc.h"
#include "verilated_sc.h"
#include "verilated.h"

class Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms;
class Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root;
class VerilatedVcdSc;

// This class is the main interface to the Verilated model
class Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2 VL_NOT_FINAL : public ::sc_core::sc_module, public VerilatedModel {
  private:
    // Symbol table holding complete model state (owned by this class)
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms* const vlSymsp;

  public:

    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    sc_event trigger_eval;

    // CELLS
    // Public to allow access to /* verilator public */ items.
    // Otherwise the application code can consider these internals.

    // Root instance pointer to allow access to model internals,
    // including inlined /* verilator public_flat_* */ items.
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* const rootp;

    // CONSTRUCTORS
    SC_CTOR(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2);
    virtual ~Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2();
  private:
    VL_UNCOPYABLE(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2);  ///< Copying not allowed

  public:
    // API METHODS
  private:
    void eval();
    void eval_sens();
    void eval_step();
  public:
    void final();
    /// Are there scheduled events to handle?
    bool eventsPending();
    /// Returns time at next time slot. Aborts if !eventsPending()
    uint64_t nextTimeSlot();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    /// SC tracing; avoid overloaded virtual function lint warning
    void trace(sc_trace_file* tfp) const override { ::sc_core::sc_module::trace(tfp); }

    // Abstract methods from VerilatedModel
    const char* hierName() const override final;
    const char* modelName() const override final;
    unsigned threads() const override final;
    std::unique_ptr<VerilatedTraceConfig> traceConfig() const override final;
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
