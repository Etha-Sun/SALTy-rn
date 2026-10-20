# x32-transposec v05

普通C/public spec/shim实现/model/driver冻结，只有一个proof.patch；尚未整核完成。

- 0001 focus: failed；无完整raw；guard=True；missing globals=[]。

具体改动见changes.json；原始raw/命令路径及SHA见evidence.json；未闭goal/file/function见blockers.json。不同分母不代表同义VC净关闭，focus不能替代full/global/caller检查。

根审计修正：本版本控制不合格。v02/v03/v04/v06负控制含Alt-Ergo Why3 anomaly: Not_found；v01/v05含解析错误。上述历史raw数及旧checker状态仅保留为未资格化诊断，不能计为证明通过或可移植正结果。原始log/summary未修改。
