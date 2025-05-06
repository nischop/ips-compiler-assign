	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function plus100
f.plus100:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_1_,x10
	mv	x11, x10
# was:	mv	_plus_L_3_, _param_x_1_
	li	x10, 100
# was:	li	_plus_R_4_, 100
	add	x10, x11, x10
# was:	add	_plus100res_2_, _plus_L_3_, _plus_R_4_
# 	mv	x10,_plus100res_2_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function plus
f.plus:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_5_,x10
# 	mv	_param_y_6_,x11
# 	mv	_plus_L_8_,_param_x_5_
# 	mv	_plus_R_9_,_param_y_6_
	add	x10, x10, x11
# was:	add	_plusres_7_, _plus_L_8_, _plus_R_9_
# 	mv	x10,_plusres_7_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -28
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_11_,x10
# 	mv	_size_13_,_let_n_11_
	bge	x10, x0, l.safe_14_
# was:	bge	_size_13_, x0, l.safe_14_
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_14_:
	mv	x23, x3
# was:	mv	_let_a_12_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_19_, _size_13_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_19_, _tmp_19_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_19_
	sw	x10, 0(x23)
# was:	sw	_size_13_, 0(_let_a_12_)
	addi	x12, x23, 4
# was:	addi	_addr_15_, _let_a_12_, 4
	mv	x11, x0
# was:	mv	_i_16_, x0
l.loop_beg_17_:
	bge	x11, x10, l.loop_end_18_
# was:	bge	_i_16_, _size_13_, l.loop_end_18_
	sw	x11, 0(x12)
# was:	sw	_i_16_, 0(_addr_15_)
	addi	x12, x12, 4
# was:	addi	_addr_15_, _addr_15_, 4
	addi	x11, x11, 1
# was:	addi	_i_16_, _i_16_, 1
	j	l.loop_beg_17_
l.loop_end_18_:
# 	mv	_arr_22_,_let_a_12_
	lw	x21, 0(x23)
# was:	lw	_size_21_, 0(_arr_22_)
	mv	x18, x3
# was:	mv	_let_b_20_, x3
	slli	x10, x21, 2
# was:	slli	_tmp_29_, _size_21_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_29_, _tmp_29_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_29_
	sw	x21, 0(x18)
# was:	sw	_size_21_, 0(_let_b_20_)
	addi	x20, x18, 4
# was:	addi	_addrg_25_, _let_b_20_, 4
	mv	x19, x0
# was:	mv	_i_26_, x0
	addi	x22, x23, 4
# was:	addi	_elem_23_, _arr_22_, 4
l.loop_beg_27_:
	bge	x19, x21, l.loop_end_28_
# was:	bge	_i_26_, _size_21_, l.loop_end_28_
	lw	x10, 0(x22)
# was:	lw	_res_24_, 0(_elem_23_)
	addi	x22, x22, 4
# was:	addi	_elem_23_, _elem_23_, 4
# 	mv	x10,_res_24_
	jal	f.plus100
# was:	jal	f.plus100, x10
# 	mv	_res_24_,x10
	sw	x10, 0(x20)
# was:	sw	_res_24_, 0(_addrg_25_)
	addi	x20, x20, 4
# was:	addi	_addrg_25_, _addrg_25_, 4
	addi	x19, x19, 1
# was:	addi	_i_26_, _i_26_, 1
	j	l.loop_beg_27_
l.loop_end_28_:
# 	mv	_arr_31_,_let_a_12_
	lw	x19, 0(x23)
# was:	lw	_size_32_, 0(_arr_31_)
	li	x10, 0
# was:	li	_let_d_30_, 0
	addi	x23, x23, 4
# was:	addi	_arr_31_, _arr_31_, 4
	mv	x20, x0
# was:	mv	_ind_var_33_, x0
l.loop_beg_35_:
	bge	x20, x19, l.loop_end_36_
# was:	bge	_ind_var_33_, _size_32_, l.loop_end_36_
	lw	x11, 0(x23)
# was:	lw	_tmp_34_, 0(_arr_31_)
	addi	x23, x23, 4
# was:	addi	_arr_31_, _arr_31_, 4
# 	mv	x10,_let_d_30_
# 	mv	x11,_tmp_34_
	jal	f.plus
# was:	jal	f.plus, x10 x11
# 	mv	_let_d_30_,x10
	addi	x20, x20, 1
# was:	addi	_ind_var_33_, _ind_var_33_, 1
	j	l.loop_beg_35_
l.loop_end_36_:
	mv	x10, x18
# was:	mv	_arr_39_, _let_b_20_
	lw	x19, 0(x10)
# was:	lw	_size_38_, 0(_arr_39_)
	mv	x18, x3
# was:	mv	_let_c_37_, x3
	addi	x11, x19, 3
# was:	addi	_tmp_46_, _size_38_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_46_, _tmp_46_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_46_, _tmp_46_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_46_
	sw	x19, 0(x18)
# was:	sw	_size_38_, 0(_let_c_37_)
	addi	x20, x18, 4
# was:	addi	_addrg_42_, _let_c_37_, 4
	mv	x21, x0
# was:	mv	_i_43_, x0
	addi	x22, x10, 4
# was:	addi	_elem_40_, _arr_39_, 4
l.loop_beg_44_:
	bge	x21, x19, l.loop_end_45_
# was:	bge	_i_43_, _size_38_, l.loop_end_45_
	lw	x10, 0(x22)
# was:	lw	_res_41_, 0(_elem_40_)
	addi	x22, x22, 4
# was:	addi	_elem_40_, _elem_40_, 4
# 	mv	x10,_res_41_
	jal	f.chr
# was:	jal	f.chr, x10
# 	mv	_res_41_,x10
	sb	x10, 0(x20)
# was:	sb	_res_41_, 0(_addrg_42_)
	addi	x20, x20, 1
# was:	addi	_addrg_42_, _addrg_42_, 1
	addi	x21, x21, 1
# was:	addi	_i_43_, _i_43_, 1
	j	l.loop_beg_44_
l.loop_end_45_:
	li	x10, 1
# was:	li	_arr_ind_50_, 1
	addi	x11, x18, 4
# was:	addi	_arr_data_51_, _let_c_37_, 4
	bge	x10, x0, l.nonneg_54_
# was:	bge	_arr_ind_50_, x0, l.nonneg_54_
l.error_53_:
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_54_:
	lw	x12, 0(x18)
# was:	lw	_size_52_, 0(_let_c_37_)
	bge	x10, x12, l.error_53_
# was:	bge	_arr_ind_50_, _size_52_, l.error_53_
	add	x11, x11, x10
# was:	add	_arr_data_51_, _arr_data_51_, _arr_ind_50_
	lbu	x10, 0(x11)
# was:	lbu	_arg_49_, 0(_arr_data_51_)
# 	mv	x10,_arg_49_
	jal	f.ord
# was:	jal	f.ord, x10
# 	mv	_tmp_48_,x10
# 	mv	_let_e_47_,_tmp_48_
# 	mv	x10,_let_e_47_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	_tmp_55_, _let_c_37_
	mv	x18, x10
# was:	mv	_mainres_10_, _tmp_55_
# 	mv	x10,_tmp_55_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _mainres_10_
	addi	x2, x2, 28
	lw	x23, -28(x2)
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