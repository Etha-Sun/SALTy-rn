浮点验证上下文一致性失败（实际重放证据）

float-sign-minimal.c 仅11行：两个浮点谓词、一个定义展开即为真的 global lemma，
以及无前置 ensures false 的空函数。无kernel、intrinsic、driver、外部ghost、用户axiom。

命令：使用本项目 Frama-C 33、Typed+float、Z3 4.12.5/CVC5/Alt-Ergo，10秒/goal、
1024MiB、cache none；详见保存的日志与raw JSON。
float-sign-minimal.json：lemma由CVC5证明；inconsistent_control_ensures由Z3在6.76秒证明。
float-sign-smt.json 为Z3单solver复核，生成的 false-control-original.smt2 中目标明确是 false。

导出的关键前提：
  sign 是仅有 Positive/Negative 两个构造子的datatype；
  forall f:Float32. fp.isPositive(f) <=> sign_f32(f)=Positive；
  forall f:Float32. fp.isNegative(f) <=> sign_f32(f)=Negative；
  Float64存在同样两条。
对于NaN，SMT fp.isPositive和fp.isNegative都为false，sign却必须取两构造子之一，
于是这些前提不一致。这是WP/Why3浮点模型/SMT翻译链的系统问题，不是kernel反例。
不能通过忽略NaN、换solver或只删除proof里的sign语法解决全局理论不一致。

上下文隔离结果：
- 旧verified/f32-vadd整个annotated上下文 + false control：Z3 Valid。
- 新lrelu整个annotated上下文 + false control：Z3 Valid；未映射sub也被Valid。
- 只删fp_add_congruence：false control仍Valid。
- 只保留same_float_value：false control仍Valid。
- 删全部global lemma或只保留same_value_refl：10秒内未证明false；这不是一致性证明。
- reciprocal候选：把same_float中的sign改为绑定IEEE div的倒数相等，仍能证明false；
  导入Cfloat完整理论仍存在上述坏前提，不能采用此候选作为已修复版本。
- reciprocal核心库检查157/157 raw目标（包括false control）全通过，正说明全绿不等于健全。

旧f32-vadd及本轮6个新float raw全过记录原样保存；全部暂停接纳为可信等价性结果。
3个bits/sqrt未过案例的pending列表也保留，但不能用其余passed数声称可信局部证明。
本目录不修改任何冻结C/spec/driver或实际proof。外部模型hash见 external-model-hashes.json。

可能修复需要单独冻结经过审计的模型变体，例如对sign模型前提排除NaN后再连接SMT
符号，并保留false-control负测试；这仍需实际验证，不在本目录声称已经修复。

补充：float-nan-sign-ground.smt2 仅把上述两个导出全称前提实例化到NaN，不含其他前提；Z3在2秒预算内直接返回unsat（见同名log），排除复杂kernel/lemma上下文因素。
