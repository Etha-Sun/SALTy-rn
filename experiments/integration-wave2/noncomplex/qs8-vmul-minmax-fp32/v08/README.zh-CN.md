# qs8-vmul-minmax-fp32 v08

普通C/public spec/shim实现/model/driver冻结，只有一个proof.patch；尚未整核完成。

- 0001 focus: diagnostic_passed；15/15；guard=True；missing globals=['integration_wrap16_u64']。

具体改动见changes.json；原始raw/命令路径及SHA见evidence.json；未闭goal/file/function见blockers.json。不同分母不代表同义VC净关闭，focus不能替代full/global/caller检查。
