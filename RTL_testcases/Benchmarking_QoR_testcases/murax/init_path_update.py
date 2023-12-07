import os
import sys

design=sys.argv[1]

path=os.getcwd()+"/rtl"

if design=="vexriscv_uart":
    f = open("./rtl/vexriscv_uart.v",'r')
    file=f.read()
    file=file.replace("INIT_PATH",path)
    f.close()
    u = open("./rtl/vexriscv_uart.v",'w+')
    u.write(file)
    u.close()

if design=="murax":
    f = open("./rtl/Murax.v",'r')
    file=f.read()
    file=file.replace("BIN_PATH",path)
    f.close()
    u = open("./rtl/Murax.v",'w+')
    u.write(file)
    u.close()