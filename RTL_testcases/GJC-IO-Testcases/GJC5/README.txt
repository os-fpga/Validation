This tests that a clock from the fabric can be pushed into the global
clock network.

This testcase does not yet run through.  There are at least two
issues, the first one being the SDC clock creation doesn't yet support
clock creation on actual clock inputs.

The second one is getting a device model for the CLK_BUF to work with
a particular chip level pin.
