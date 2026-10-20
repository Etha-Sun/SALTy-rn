# f32-vcmul v06

普通C/public spec/shim实现/model/driver冻结，只有一个proof.patch；尚未整核完成。

- 0001 focus: incomplete；43/48；guard=True；missing globals=['cx_same_float_refl', 'cx_same_float_value', 'cx_same_value_trans', 'integration_cx_add_congruence', 'integration_cx_float_trans', 'integration_cx_mul_congruence', 'integration_cx_sub_congruence']。

具体改动见changes.json；原始raw/命令路径及SHA见evidence.json；未闭goal/file/function见blockers.json。不同分母不代表同义VC净关闭，focus不能替代full/global/caller检查。
