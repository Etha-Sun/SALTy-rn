# x32-transposec

新v07-z3cvc5仅排除故障Alt-Ergo，fresh control正成立/false未证且无Why3异常；proof与v04同SHA。mapping focus0/1，未full/未完成等价性；v01..v06全部旧WP正结果仍不合资格，不继承。

推荐审核的是新solver配置下的未完成proof候选，不是已验证kernel。原始C/spec/shim/model/driver/checker均冻结；proof SHA为 `355235c452370069f0e0aeb272fd3748befe2432f052ed2375fa2eca80c854bd`。

旧v02/v03/v04/v06的Alt-Ergo Why3 Not_found和v01/v05解析失败完整保留，旧WP正结果全部不计入。新控制不追认旧版本；新配置仍待full闭包验证。独立ASan/UBSan有限差分筛查仅筛反例，不是证明。selection.json、control-qualification-audit.json与新evidence.json给出全部路径/SHA。
