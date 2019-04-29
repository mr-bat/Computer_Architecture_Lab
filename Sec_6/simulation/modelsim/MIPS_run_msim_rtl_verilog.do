transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/WB.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/Register_File.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/MIPS.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/MemAdd.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/MEM_Reg.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/MEM.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/IF_Reg.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/IF.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/ID_Reg.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/ID.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/Hazard.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/ForwardUnit.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/EXE_Reg.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/EXE.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/Controller.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/Condition_Check.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_6 {F:/Projects/CAL/MIPS/Sec_6/ALU.v}

