这是本地工具模型一致性缺陷的最小重现，不涉及任何kernel。

Cfloat把 sign 定义成 Positive/Negative 二选一，又对任意float（包括NaN）无条件使用两个双向等价：
isPositive(f) iff sign(f)=Positive；isNegative(f) iff sign(f)=Negative。
Why3 native SMT driver把两个predicate原样映射为 fp.isPositive / fp.isNegative。
NaN的两个native predicate均false，因此sign(NaN)既不是Positive也不是Negative，与枚举完备性冲突。

重跑：/home/ycsun/verus-x86-linux/z3 -T:10 sign-nan.smt2
结果：unsat。sign-nan-instance.smt2仅使用两个NaN实例，同样unsat。
native-nan-control.smt2为sat并输出两predicate=false；one-sign-instance-control.smt2为sat。
one-sign-axiom-control.smt2的全称单公理控制10秒timeout，原始记录保留；不将其当作sat。
results.json记录所有输入/工具SHA、完整命令与stdout；bundle-provenance.json记录重新从归档抽取比对的证据。

integer.driver仅将fp_mul32/fp_add32/fp_sub32映射到cfloat已有函数，不自行添加公理。
本组proof中的same_float/same_value、fp_mul_congruence及centered_mod16都是定义或待实际检查的lemma，
没有作为新增可信axiom；然而在上述不一致上下文里检查通过也不再提供可信证据。
本组same_float使用\sign，直接涉及这个错误路径；其他Typed+float case也先整体隔离。
全整数Typed case的尝试没有闭合，本审计不证明其上下文一致，也不据此宣称它们存在相同错误。

转换桥接公理是另一个待调查疑点，尚未建立独立的最小矛盾链，不能报告为已证实缺陷。
