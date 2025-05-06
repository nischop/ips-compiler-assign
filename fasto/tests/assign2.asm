	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function mul
f.mul:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
# 	mv	_param_y_2_,x11
# 	mv	_eq_L_8_,_param_x_1_
	li	x13, 0
# was:	li	_eq_R_9_, 0
	li	x12, 0
# was:	li	_cond_7_, 0
	bne	x10, x13, l.false_10_
# was:	bne	_eq_L_8_, _eq_R_9_, l.false_10_
	li	x12, 1
# was:	li	_cond_7_, 1
l.false_10_:
	bne	x12, x0, l.then_4_
# was:	bne	_cond_7_, x0, l.then_4_
	j	l.else_5_
l.then_4_:
	li	x10, 0
# was:	li	_mulres_3_, 0
	j	l.endif_6_
l.else_5_:
# 	mv	_lt_L_15_,_param_x_1_
	li	x12, 0
# was:	li	_lt_R_16_, 0
	slt	x12, x10, x12
# was:	slt	_cond_14_, _lt_L_15_, _lt_R_16_
	bne	x12, x0, l.then_11_
# was:	bne	_cond_14_, x0, l.then_11_
	j	l.else_12_
l.then_11_:
	li	x18, 0
# was:	li	_minus_L_17_, 0
	li	x12, 0
# was:	li	_minus_L_20_, 0
# 	mv	_minus_R_21_,_param_x_1_
	sub	x10, x12, x10
# was:	sub	_arg_19_, _minus_L_20_, _minus_R_21_
# 	mv	_arg_22_,_param_y_2_
# 	mv	x10,_arg_19_
# 	mv	x11,_arg_22_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_minus_R_18_,x10
	sub	x10, x18, x10
# was:	sub	_mulres_3_, _minus_L_17_, _minus_R_18_
	j	l.endif_13_
l.else_12_:
	mv	x18, x11
# was:	mv	_plus_L_23_, _param_y_2_
# 	mv	_minus_L_26_,_param_x_1_
	li	x12, 1
# was:	li	_minus_R_27_, 1
	sub	x10, x10, x12
# was:	sub	_arg_25_, _minus_L_26_, _minus_R_27_
# 	mv	_arg_28_,_param_y_2_
# 	mv	x10,_arg_25_
# 	mv	x11,_arg_28_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_24_,x10
	add	x10, x18, x10
# was:	add	_mulres_3_, _plus_L_23_, _plus_R_24_
l.endif_13_:
l.endif_6_:
# 	mv	x10,_mulres_3_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function readInt
f.readInt:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_d_29_,x10
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_readIntres_30_,x10
# 	mv	x10,_readIntres_30_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function write_int
f.write_int:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_31_,x10
	mv	x18, x10
# was:	mv	_tmp_33_, _param_x_31_
# 	mv	_write_intres_32_,_tmp_33_
	mv	x10, x18
# was:	mv	x10, _write_intres_32_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _write_intres_32_
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
# 	mv	_param_x_34_,x10
# 	mv	_arr_37_,_param_x_34_
	lw	x18, 0(x10)
# was:	lw	_size_36_, 0(_arr_37_)
	mv	x19, x3
# was:	mv	_write_int_arrres_35_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_44_, _size_36_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_44_, _tmp_44_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_44_
	sw	x18, 0(x19)
# was:	sw	_size_36_, 0(_write_int_arrres_35_)
	addi	x20, x19, 4
# was:	addi	_addrg_40_, _write_int_arrres_35_, 4
	mv	x21, x0
# was:	mv	_i_41_, x0
	addi	x22, x10, 4
# was:	addi	_elem_38_, _arr_37_, 4
l.loop_beg_42_:
	bge	x21, x18, l.loop_end_43_
# was:	bge	_i_41_, _size_36_, l.loop_end_43_
	lw	x10, 0(x22)
# was:	lw	_res_39_, 0(_elem_38_)
	addi	x22, x22, 4
# was:	addi	_elem_38_, _elem_38_, 4
# 	mv	x10,_res_39_
	jal	f.write_int
# was:	jal	f.write_int, x10
# 	mv	_res_39_,x10
	sw	x10, 0(x20)
# was:	sw	_res_39_, 0(_addrg_40_)
	addi	x20, x20, 4
# was:	addi	_addrg_40_, _addrg_40_, 4
	addi	x21, x21, 1
# was:	addi	_i_41_, _i_41_, 1
	j	l.loop_beg_42_
l.loop_end_43_:
	mv	x10, x19
# was:	mv	x10, _write_int_arrres_35_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function square
f.square:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_45_,x10
# 	mv	_arg_47_,_param_x_45_
	mv	x11, x10
# was:	mv	_arg_48_, _param_x_45_
# 	mv	x10,_arg_47_
# 	mv	x11,_arg_48_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_squareres_46_,x10
# 	mv	x10,_squareres_46_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function plus
f.plus:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_49_,x10
# 	mv	_param_y_50_,x11
# 	mv	_plus_L_52_,_param_x_49_
# 	mv	_plus_R_53_,_param_y_50_
	add	x10, x10, x11
# was:	add	_plusres_51_, _plus_L_52_, _plus_R_53_
# 	mv	x10,_plusres_51_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x24, -32(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -32
	jal	p.getint
# was:	jal	p.getint, 
	mv	x19, x10
# was:	mv	_let_n_55_, x10
# 	mv	_eq_L_60_,_let_n_55_
	li	x11, 0
# was:	li	_eq_R_61_, 0
	li	x10, 0
# was:	li	_cond_59_, 0
	bne	x19, x11, l.false_62_
# was:	bne	_eq_L_60_, _eq_R_61_, l.false_62_
	li	x10, 1
# was:	li	_cond_59_, 1
l.false_62_:
	bne	x10, x0, l.then_56_
# was:	bne	_cond_59_, x0, l.then_56_
	j	l.else_57_
l.then_56_:
	la	x10, s.Incorre_65_
# was:	la	_tmp_64_, s.Incorre_65_
# s.Incorre_65_: string "Incorrect Input!"
# 	mv	_let_error_63_,_tmp_64_
# 	mv	x10,_tmp_64_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 0
# was:	li	_mainres_54_, 0
	j	l.endif_58_
l.else_57_:
# 	mv	_lt_L_70_,_let_n_55_
	li	x10, 0
# was:	li	_lt_R_71_, 0
	slt	x10, x19, x10
# was:	slt	_cond_69_, _lt_L_70_, _lt_R_71_
	bne	x10, x0, l.then_66_
# was:	bne	_cond_69_, x0, l.then_66_
	j	l.else_67_
l.then_66_:
	la	x10, s.Incorre_74_
# was:	la	_tmp_73_, s.Incorre_74_
# s.Incorre_74_: string "Incorrect Input!"
# 	mv	_let_error_72_,_tmp_73_
# 	mv	x10,_tmp_73_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 0
# was:	li	_mainres_54_, 0
	j	l.endif_68_
l.else_67_:
# 	mv	_size_76_,_let_n_55_
	bge	x19, x0, l.safe_77_
# was:	bge	_size_76_, x0, l.safe_77_
	li	x10, 29
# was:	li	x10, 29
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_77_:
	mv	x23, x3
# was:	mv	_let_arr_75_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_82_, _size_76_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_82_, _tmp_82_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_82_
	sw	x19, 0(x23)
# was:	sw	_size_76_, 0(_let_arr_75_)
	addi	x10, x23, 4
# was:	addi	_addr_78_, _let_arr_75_, 4
	mv	x11, x0
# was:	mv	_i_79_, x0
l.loop_beg_80_:
	bge	x11, x19, l.loop_end_81_
# was:	bge	_i_79_, _size_76_, l.loop_end_81_
	sw	x11, 0(x10)
# was:	sw	_i_79_, 0(_addr_78_)
	addi	x10, x10, 4
# was:	addi	_addr_78_, _addr_78_, 4
	addi	x11, x11, 1
# was:	addi	_i_79_, _i_79_, 1
	j	l.loop_beg_80_
l.loop_end_81_:
# 	mv	_arr_85_,_let_arr_75_
	lw	x20, 0(x23)
# was:	lw	_size_84_, 0(_arr_85_)
	mv	x18, x3
# was:	mv	_let_w_83_, x3
	slli	x10, x20, 2
# was:	slli	_tmp_92_, _size_84_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_92_, _tmp_92_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_92_
	sw	x20, 0(x18)
# was:	sw	_size_84_, 0(_let_w_83_)
	addi	x21, x18, 4
# was:	addi	_addrg_88_, _let_w_83_, 4
	mv	x22, x0
# was:	mv	_i_89_, x0
	addi	x24, x23, 4
# was:	addi	_elem_86_, _arr_85_, 4
l.loop_beg_90_:
	bge	x22, x20, l.loop_end_91_
# was:	bge	_i_89_, _size_84_, l.loop_end_91_
	lw	x10, 0(x24)
# was:	lw	_res_87_, 0(_elem_86_)
	addi	x24, x24, 4
# was:	addi	_elem_86_, _elem_86_, 4
# 	mv	x10,_res_87_
	jal	f.readInt
# was:	jal	f.readInt, x10
# 	mv	_res_87_,x10
	sw	x10, 0(x21)
# was:	sw	_res_87_, 0(_addrg_88_)
	addi	x21, x21, 4
# was:	addi	_addrg_88_, _addrg_88_, 4
	addi	x22, x22, 1
# was:	addi	_i_89_, _i_89_, 1
	j	l.loop_beg_90_
l.loop_end_91_:
# 	mv	_arr_95_,_let_arr_75_
	lw	x10, 0(x23)
# was:	lw	_size_94_, 0(_arr_95_)
	mv	x11, x3
# was:	mv	_let_test_93_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_138_, _size_94_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_138_, _tmp_138_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_138_
	sw	x10, 0(x11)
# was:	sw	_size_94_, 0(_let_test_93_)
	addi	x12, x11, 4
# was:	addi	_addrg_98_, _let_test_93_, 4
	mv	x13, x0
# was:	mv	_i_99_, x0
	addi	x14, x23, 4
# was:	addi	_elem_96_, _arr_95_, 4
l.loop_beg_100_:
	bge	x13, x10, l.loop_end_101_
# was:	bge	_i_99_, _size_94_, l.loop_end_101_
	lw	x16, 0(x14)
# was:	lw	_res_97_, 0(_elem_96_)
	addi	x14, x14, 4
# was:	addi	_elem_96_, _elem_96_, 4
# 	mv	_eq_L_107_,_res_97_
	li	x15, 0
# was:	li	_eq_R_108_, 0
	li	x17, 0
# was:	li	_cond_106_, 0
	bne	x16, x15, l.false_109_
# was:	bne	_eq_L_107_, _eq_R_108_, l.false_109_
	li	x17, 1
# was:	li	_cond_106_, 1
l.false_109_:
	bne	x17, x0, l.then_103_
# was:	bne	_cond_106_, x0, l.then_103_
	j	l.else_104_
l.then_103_:
	li	x17, 0
# was:	li	_arr_ind_112_, 0
	addi	x15, x18, 4
# was:	addi	_arr_data_113_, _let_w_83_, 4
	bge	x17, x0, l.nonneg_116_
# was:	bge	_arr_ind_112_, x0, l.nonneg_116_
l.error_115_:
	li	x10, 31
# was:	li	x10, 31
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_116_:
	lw	x16, 0(x18)
# was:	lw	_size_114_, 0(_let_w_83_)
	bge	x17, x16, l.error_115_
# was:	bge	_arr_ind_112_, _size_114_, l.error_115_
	slli	x17, x17, 2
# was:	slli	_arr_ind_112_, _arr_ind_112_, 2
	add	x15, x15, x17
# was:	add	_arr_data_113_, _arr_data_113_, _arr_ind_112_
	lw	x17, 0(x15)
# was:	lw	_minus_L_110_, 0(_arr_data_113_)
# 	mv	_minus_L_118_,_let_n_55_
	li	x15, 1
# was:	li	_minus_R_119_, 1
	sub	x16, x19, x15
# was:	sub	_arr_ind_117_, _minus_L_118_, _minus_R_119_
	addi	x20, x18, 4
# was:	addi	_arr_data_120_, _let_w_83_, 4
	bge	x16, x0, l.nonneg_123_
# was:	bge	_arr_ind_117_, x0, l.nonneg_123_
l.error_122_:
	li	x10, 31
# was:	li	x10, 31
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_123_:
	lw	x15, 0(x18)
# was:	lw	_size_121_, 0(_let_w_83_)
	bge	x16, x15, l.error_122_
# was:	bge	_arr_ind_117_, _size_121_, l.error_122_
	slli	x16, x16, 2
# was:	slli	_arr_ind_117_, _arr_ind_117_, 2
	add	x20, x20, x16
# was:	add	_arr_data_120_, _arr_data_120_, _arr_ind_117_
	lw	x15, 0(x20)
# was:	lw	_minus_R_111_, 0(_arr_data_120_)
	sub	x16, x17, x15
# was:	sub	_fun_arg_res_102_, _minus_L_110_, _minus_R_111_
	j	l.endif_105_
l.else_104_:
	mv	x15, x16
# was:	mv	_arr_ind_126_, _res_97_
	addi	x20, x18, 4
# was:	addi	_arr_data_127_, _let_w_83_, 4
	bge	x15, x0, l.nonneg_130_
# was:	bge	_arr_ind_126_, x0, l.nonneg_130_
l.error_129_:
	li	x10, 31
# was:	li	x10, 31
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_130_:
	lw	x17, 0(x18)
# was:	lw	_size_128_, 0(_let_w_83_)
	bge	x15, x17, l.error_129_
# was:	bge	_arr_ind_126_, _size_128_, l.error_129_
	slli	x15, x15, 2
# was:	slli	_arr_ind_126_, _arr_ind_126_, 2
	add	x20, x20, x15
# was:	add	_arr_data_127_, _arr_data_127_, _arr_ind_126_
	lw	x15, 0(x20)
# was:	lw	_minus_L_124_, 0(_arr_data_127_)
	mv	x17, x16
# was:	mv	_minus_L_132_, _res_97_
	li	x16, 1
# was:	li	_minus_R_133_, 1
	sub	x16, x17, x16
# was:	sub	_arr_ind_131_, _minus_L_132_, _minus_R_133_
	addi	x20, x18, 4
# was:	addi	_arr_data_134_, _let_w_83_, 4
	bge	x16, x0, l.nonneg_137_
# was:	bge	_arr_ind_131_, x0, l.nonneg_137_
l.error_136_:
	li	x10, 31
# was:	li	x10, 31
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_137_:
	lw	x17, 0(x18)
# was:	lw	_size_135_, 0(_let_w_83_)
	bge	x16, x17, l.error_136_
# was:	bge	_arr_ind_131_, _size_135_, l.error_136_
	slli	x16, x16, 2
# was:	slli	_arr_ind_131_, _arr_ind_131_, 2
	add	x20, x20, x16
# was:	add	_arr_data_134_, _arr_data_134_, _arr_ind_131_
	lw	x16, 0(x20)
# was:	lw	_minus_R_125_, 0(_arr_data_134_)
	sub	x16, x15, x16
# was:	sub	_fun_arg_res_102_, _minus_L_124_, _minus_R_125_
l.endif_105_:
# 	mv	_res_97_,_fun_arg_res_102_
	sw	x16, 0(x12)
# was:	sw	_res_97_, 0(_addrg_98_)
	addi	x12, x12, 4
# was:	addi	_addrg_98_, _addrg_98_, 4
	addi	x13, x13, 1
# was:	addi	_i_99_, _i_99_, 1
	j	l.loop_beg_100_
l.loop_end_101_:
# 	mv	_arr_141_,_let_test_93_
	lw	x18, 0(x11)
# was:	lw	_size_140_, 0(_arr_141_)
	mv	x19, x3
# was:	mv	_let_aight_139_, x3
	slli	x10, x18, 2
# was:	slli	_tmp_148_, _size_140_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_148_, _tmp_148_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_148_
	sw	x18, 0(x19)
# was:	sw	_size_140_, 0(_let_aight_139_)
	addi	x20, x19, 4
# was:	addi	_addrg_144_, _let_aight_139_, 4
	mv	x21, x0
# was:	mv	_i_145_, x0
	addi	x22, x11, 4
# was:	addi	_elem_142_, _arr_141_, 4
l.loop_beg_146_:
	bge	x21, x18, l.loop_end_147_
# was:	bge	_i_145_, _size_140_, l.loop_end_147_
	lw	x10, 0(x22)
# was:	lw	_res_143_, 0(_elem_142_)
	addi	x22, x22, 4
# was:	addi	_elem_142_, _elem_142_, 4
# 	mv	x10,_res_143_
	jal	f.square
# was:	jal	f.square, x10
# 	mv	_res_143_,x10
	sw	x10, 0(x20)
# was:	sw	_res_143_, 0(_addrg_144_)
	addi	x20, x20, 4
# was:	addi	_addrg_144_, _addrg_144_, 4
	addi	x21, x21, 1
# was:	addi	_i_145_, _i_145_, 1
	j	l.loop_beg_146_
l.loop_end_147_:
# 	mv	_arr_150_,_let_aight_139_
	lw	x18, 0(x19)
# was:	lw	_size_151_, 0(_arr_150_)
	li	x10, 0
# was:	li	_let_d_149_, 0
	addi	x19, x19, 4
# was:	addi	_arr_150_, _arr_150_, 4
	mv	x20, x0
# was:	mv	_ind_var_152_, x0
l.loop_beg_154_:
	bge	x20, x18, l.loop_end_155_
# was:	bge	_ind_var_152_, _size_151_, l.loop_end_155_
	lw	x11, 0(x19)
# was:	lw	_tmp_153_, 0(_arr_150_)
	addi	x19, x19, 4
# was:	addi	_arr_150_, _arr_150_, 4
# 	mv	x10,_let_d_149_
# 	mv	x11,_tmp_153_
	jal	f.plus
# was:	jal	f.plus, x10 x11
# 	mv	_let_d_149_,x10
	addi	x20, x20, 1
# was:	addi	_ind_var_152_, _ind_var_152_, 1
	j	l.loop_beg_154_
l.loop_end_155_:
# 	mv	_arg_157_,_let_d_149_
# 	mv	x10,_arg_157_
	jal	f.write_int
# was:	jal	f.write_int, x10
# 	mv	_let_hmm_156_,x10
	li	x10, 1
# was:	li	_mainres_54_, 1
l.endif_68_:
l.endif_58_:
# 	mv	x10,_mainres_54_
	addi	x2, x2, 32
	lw	x24, -32(x2)
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
s.Incorre_74_:
	.word	16
	.ascii	"Incorrect Input!"
	.align	2
s.Incorre_65_:
	.word	16
	.ascii	"Incorrect Input!"
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