# x32-packw-gemm-goi

新v07-z3cvc5仅排除故障Alt-Ergo，fresh control正成立/false未证且无Why3异常；proof与v04同SHA。mapping focus0/2，未full/未完成等价性；v01..v06全部旧WP正结果仍不合资格，不继承。

推荐审核的是新solver配置下的未完成proof候选，不是已验证kernel。原始C/spec/shim/model/driver/checker均冻结；proof SHA为 `f7111f2cbba4db16293deadc49fda325fe3ecda6a1ae7214ca75eec1aaf895f7`。

旧v02/v03/v04/v06的Alt-Ergo Why3 Not_found和v01/v05解析失败完整保留，旧WP正结果全部不计入。新控制不追认旧版本；新配置仍待full闭包验证。独立ASan/UBSan有限差分筛查仅筛反例，不是证明。selection.json、control-qualification-audit.json与新evidence.json给出全部路径/SHA。
