transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/WB.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/Register_File.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/MIPS.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/MemAdd.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/MEM_Reg.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/MEM.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/IF_Reg.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/IF.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/ID_Reg.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/ID.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/EXE_Reg.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/EXE.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/Controller.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/Condition_Check.v}
vlog -vlog01compat -work work +incdir+F:/Projects/CAL/MIPS/Sec_4 {F:/Projects/CAL/MIPS/Sec_4/ALU.v}

