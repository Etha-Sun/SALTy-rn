# f32-vcmul v01

普通C/public spec/shim实现/model/driver冻结，只有一个proof.patch；尚未整核完成。

- 0001 full: incomplete；无完整raw；guard=True；missing globals=['cx_same_float_refl', 'cx_same_float_value', 'cx_same_value_trans']。

具体改动见changes.json；原始raw/命令路径及SHA见evidence.json；未闭goal/file/function见blockers.json。不同分母不代表同义VC净关闭，focus不能替代full/global/caller检查。
