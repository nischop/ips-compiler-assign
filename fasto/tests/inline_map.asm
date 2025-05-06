	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function plus5
f.plus5:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_1_,x10
	mv	x11, x10
# was:	mv	_plus_L_3_, _param_x_1_
	li	x10, 5
# was:	li	_plus_R_4_, 5
	add	x10, x11, x10
# was:	add	_plus5res_2_, _plus_L_3_, _plus_R_4_
# 	mv	x10,_plus5res_2_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function mul2
f.mul2:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_5_,x10
	mv	x11, x10
# was:	mv	_plus_L_7_, _param_x_5_
# 	mv	_plus_R_8_,_param_x_5_
	add	x10, x11, x10
# was:	add	_mul2res_6_, _plus_L_7_, _plus_R_8_
# 	mv	x10,_mul2res_6_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function testcomp
f.testcomp:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_9_,x10
# 	mv	_arg_12_,_param_x_9_
# 	mv	x10,_arg_12_
	jal	f.write_int_arr
# was:	jal	f.write_int_arr, x10
# 	mv	_arg_11_,x10
# 	mv	x10,_arg_11_
	jal	f.write_int_arr
# was:	jal	f.write_int_arr, x10
# 	mv	_testcompres_10_,x10
# 	mv	x10,_testcompres_10_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function write_int
f.write_int:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_13_,x10
	mv	x18, x10
# was:	mv	_tmp_15_, _param_x_13_
# 	mv	_write_intres_14_,_tmp_15_
	mv	x10, x18
# was:	mv	x10, _write_intres_14_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _write_intres_14_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function write_int_arr
f.write_int_arr:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
# 	mv	_param_x_16_,x10
# 	mv	_arr_19_,_param_x_16_
	lw	x18, 0(x10)
# was:	lw	_size_18_, 0(_arr_19_)
	mv	x19, x3
# was:	mv	_write_int_arrres_17_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_26_, _size_18_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_26_, _tmp_26_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_26_
	sw	x18, 0(x19)
# was:	sw	_size_18_, 0(_write_int_arrres_17_)
	addi	x20, x19, 4
# was:	addi	_addrg_22_, _write_int_arrres_17_, 4
	mv	x21, x0
# was:	mv	_i_23_, x0
	addi	x22, x10, 4
# was:	addi	_elem_20_, _arr_19_, 4
l.loop_beg_24_:
	bge	x21, x18, l.loop_end_25_
# was:	bge	_i_23_, _size_18_, l.loop_end_25_
	lw	x10, 0(x22)
# was:	lw	_res_21_, 0(_elem_20_)
	addi	x22, x22, 4
# was:	addi	_elem_20_, _elem_20_, 4
# 	mv	x10,_res_21_
	jal	f.write_int
# was:	jal	f.write_int, x10
# 	mv	_res_21_,x10
	sw	x10, 0(x20)
# was:	sw	_res_21_, 0(_addrg_22_)
	addi	x20, x20, 4
# was:	addi	_addrg_22_, _addrg_22_, 4
	addi	x21, x21, 1
# was:	addi	_i_23_, _i_23_, 1
	j	l.loop_beg_24_
l.loop_end_25_:
	mv	x10, x19
# was:	mv	x10, _write_int_arrres_17_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function boo
f.boo:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
# 	mv	_param_a_27_,x10
	li	x12, 5
# was:	li	_plus_L_31_, 5
	li	x11, 3
# was:	li	_plus_R_32_, 3
	add	x0, x12, x11
# was:	add	_let_y_30_, _plus_L_31_, _plus_R_32_
# 	mv	_arr_34_,_param_a_27_
	lw	x19, 0(x10)
# was:	lw	_size_33_, 0(_arr_34_)
	mv	x18, x3
# was:	mv	_let_x_29_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_41_, _size_33_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_41_, _tmp_41_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_41_
	sw	x19, 0(x18)
# was:	sw	_size_33_, 0(_let_x_29_)
	addi	x20, x18, 4
# was:	addi	_addrg_37_, _let_x_29_, 4
	mv	x21, x0
# was:	mv	_i_38_, x0
	addi	x22, x10, 4
# was:	addi	_elem_35_, _arr_34_, 4
l.loop_beg_39_:
	bge	x21, x19, l.loop_end_40_
# was:	bge	_i_38_, _size_33_, l.loop_end_40_
	lw	x10, 0(x22)
# was:	lw	_res_36_, 0(_elem_35_)
	addi	x22, x22, 4
# was:	addi	_elem_35_, _elem_35_, 4
# 	mv	x10,_res_36_
	jal	f.plus5
# was:	jal	f.plus5, x10
# 	mv	_res_36_,x10
	sw	x10, 0(x20)
# was:	sw	_res_36_, 0(_addrg_37_)
	addi	x20, x20, 4
# was:	addi	_addrg_37_, _addrg_37_, 4
	addi	x21, x21, 1
# was:	addi	_i_38_, _i_38_, 1
	j	l.loop_beg_39_
l.loop_end_40_:
	mv	x10, x18
# was:	mv	_boores_28_, _let_x_29_
# 	mv	x10,_boores_28_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
	jal	p.getint
# was:	jal	p.getint, 
	mv	x11, x10
# was:	mv	_let_N_43_, x10
# 	mv	_size_45_,_let_N_43_
	bge	x11, x0, l.safe_46_
# was:	bge	_size_45_, x0, l.safe_46_
	li	x10, 15
# was:	li	x10, 15
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_46_:
	mv	x10, x3
# was:	mv	_let_z_44_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_51_, _size_45_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_51_, _tmp_51_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_51_
	sw	x11, 0(x10)
# was:	sw	_size_45_, 0(_let_z_44_)
	addi	x12, x10, 4
# was:	addi	_addr_47_, _let_z_44_, 4
	mv	x13, x0
# was:	mv	_i_48_, x0
l.loop_beg_49_:
	bge	x13, x11, l.loop_end_50_
# was:	bge	_i_48_, _size_45_, l.loop_end_50_
	sw	x13, 0(x12)
# was:	sw	_i_48_, 0(_addr_47_)
	addi	x12, x12, 4
# was:	addi	_addr_47_, _addr_47_, 4
	addi	x13, x13, 1
# was:	addi	_i_48_, _i_48_, 1
	j	l.loop_beg_49_
l.loop_end_50_:
# 	mv	_plus_L_54_,_let_N_43_
	mv	x12, x11
# was:	mv	_plus_R_55_, _let_N_43_
	add	x0, x11, x12
# was:	add	_let_z_53_, _plus_L_54_, _plus_R_55_
	mv	x12, x11
# was:	mv	_plus_L_58_, _let_N_43_
# 	mv	_plus_R_59_,_let_N_43_
	add	x12, x12, x11
# was:	add	_plus_L_56_, _plus_L_58_, _plus_R_59_
# 	mv	_plus_R_57_,_let_N_43_
	add	x0, x12, x11
# was:	add	_let_q_52_, _plus_L_56_, _plus_R_57_
# 	mv	_arg_61_,_let_z_44_
# 	mv	x10,_arg_61_
	jal	f.boo
# was:	jal	f.boo, x10
# 	mv	_let_y_60_,x10
# 	mv	_arr_64_,_let_y_60_
	lw	x19, 0(x10)
# was:	lw	_size_63_, 0(_arr_64_)
	mv	x18, x3
# was:	mv	_let_w_62_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_71_, _size_63_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_71_, _tmp_71_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_71_
	sw	x19, 0(x18)
# was:	sw	_size_63_, 0(_let_w_62_)
	addi	x20, x18, 4
# was:	addi	_addrg_67_, _let_w_62_, 4
	mv	x21, x0
# was:	mv	_i_68_, x0
	addi	x22, x10, 4
# was:	addi	_elem_65_, _arr_64_, 4
l.loop_beg_69_:
	bge	x21, x19, l.loop_end_70_
# was:	bge	_i_68_, _size_63_, l.loop_end_70_
	lw	x10, 0(x22)
# was:	lw	_res_66_, 0(_elem_65_)
	addi	x22, x22, 4
# was:	addi	_elem_65_, _elem_65_, 4
# 	mv	x10,_res_66_
	jal	f.mul2
# was:	jal	f.mul2, x10
# 	mv	_res_66_,x10
	sw	x10, 0(x20)
# was:	sw	_res_66_, 0(_addrg_67_)
	addi	x20, x20, 4
# was:	addi	_addrg_67_, _addrg_67_, 4
	addi	x21, x21, 1
# was:	addi	_i_68_, _i_68_, 1
	j	l.loop_beg_69_
l.loop_end_70_:
	mv	x10, x18
# was:	mv	_arg_72_, _let_w_62_
# 	mv	x10,_arg_72_
	jal	f.write_int_arr
# was:	jal	f.write_int_arr, x10
# 	mv	_mainres_42_,x10
# 	mv	x10,_mainres_42_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Library functions in Fasto namespace
f.ord:
	mv	x10, x10
	jr	x1
f.chr:
	andi	x10, x10, 255
	jr	x1
# Internal procedures (for syscalls, etc.)
p.putint:
	li	x17, 1
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getint:
	li	x17, 5
	ecall
	jr	x1
p.putchar:
	li	x17, 11
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getchar:
	li	x17, 12
	ecall
	jr	x1
p.putstring:
	lw	x7, 0(x10)
	addi	x6, x10, 4
	add	x7, x6, x7
	li	x17, 11
l.ps_begin:
	bge	x6, x7, l.ps_done
	lbu	x10, 0(x6)
	ecall
	addi	x6, x6, 1
	j	l.ps_begin
l.ps_done:
	jr	x1
p.stop:
	li	x17, 93
	li	x10, 0
	ecall
p.RuntimeError:
	mv	x6, x10
	li	x17, 4
	la	x10, m.RunErr
	ecall
	li	x17, 1
	mv	x10, x6
	ecall
	li	x17, 4
	la	x10, m.colon_space
	ecall
	mv	x10, x11
	ecall
	la	x10, m.nl
	ecall
	jal	p.stop
	.data	
# Fixed strings for runtime I/O
m.RunErr:
	.asciz	"Runtime error at line "
m.colon_space:
	.asciz	": "
m.nl:
	.asciz	"\n"
m.space:
	.asciz	" "
# Message strings for specific errors
m.BadSize:
	.asciz	"negative array size"
m.BadIndex:
	.asciz	"array index out of bounds"
m.DivZero:
	.asciz	"division by zero"
# String literals (including lengths) from program
	.align	2
s.true:
	.word	5
	.ascii	"true "
	.align	2
s.false:
	.word	6
	.ascii	"false "
	.align	2
# Space for Fasto heap
d.heap:
	.space	100000