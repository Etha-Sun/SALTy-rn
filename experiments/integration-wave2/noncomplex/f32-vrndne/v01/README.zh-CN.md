# f32-vrndne v01

普通C/public spec/shim实现/model/driver冻结，只有一个proof.patch；尚未整核完成。

- 0001 focus: failed；无完整raw；guard=True；missing globals=['fp_add_congruence', 'fp_add_congruence_same', 'fp_sub_congruence', 'fp_sub_congruence_same', 'gt_float_cong', 'lt_float_cong', 'lt_gt_float', 'same_float_refl', 'same_float_sym', 'same_float_trans', 'same_float_value', 'same_value_refl', 'same_value_sym', 'same_value_trans']。

具体改动见changes.json；原始raw/命令路径及SHA见evidence.json；未闭goal/file/function见blockers.json。不同分母不代表同义VC净关闭，focus不能替代full/global/caller检查。
