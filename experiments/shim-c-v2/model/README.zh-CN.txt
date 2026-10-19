Native Cfloat v2：独立修复、保留官方旧版

本目录只修改工具模型，不改任何 kernel、shim C、public spec 或 wrapper。
官方 Frama-C 33 bundle 原封不动。original/cfloat.mlw 是官方旧文件的本地副本，
SHA c885fef3fda7754a95f44d5ef8480cf278dc8fe35c6797866713c820697654de。
cfloat.patch 给出完整差异，axiom-audit.json 逐项列出官方 20 条 axiom/lemma 的处理。

实际修复

1. 原 sign 有 Positive/Negative 两个值，却无条件以双向等价关联 fp.isPositive /
   fp.isNegative。NaN 的两个 SMT predicate 都 false，旧公理因此矛盾。
   新 sign 是定义：if is_negative then Negative else Positive。
   非 NaN 完全保留 IEEE 正负号，包括 ±0 和 ±Inf；对 NaN 取 Positive 是显式总化。
   ACSL 手册只规定非 NaN 的 sign（见官方1.22手册）；没有假定 NaN 输入不存在。

2. 不再用抽象 to_f32/to_f64 加公理约束 real→FP。新 from_real32 / from_real64
   由两个特制 Why3 driver 精确映射为 SMT `((_ to_fp e s) rounding real)`。
   to_f32/to_f64 是固定 RNE 的定义；round_float/round_double 直接使用参数舍入模式。
   没有从无限结果取 real 再做第二次舍入。底层 IEEE add/sub/mul/div/sqrt、比较、
   分类、neg 等定义保持原版，仍使用 Why3 已有 native IEEE backend。

3. 官方 real_0_is_zero 缺少 finite 守卫，官方跨精度 real 往返桥对 NaN 和 −0
   不成立，官方 overflow axioms 又把“超过最大有限实数”误作 RNE 溢出阈值。
   本版本不保留这些错误前提。它们不是被任意删掉换取通过：real→FP 已换成
   native 精确解释；不能由 real 表示的跨 FP 转换则明确留下前端缺口。

修复后的 Cfloat 没有任何 axiom 或外部 lemma 假设；其新内容是类型、定义，
或经 driver 原生解释的 FP primitive。它不是给 Alt-Ergo 用的抽象公理模型。
本版本只接纳锁定的 Z3 / CVC5 native driver，禁止回落到未映射的 backend。

证据与一致性边界

- evidence/native/results.json：8 类 SMT 检查 × Z3、CVC5，16/16 符合预期。
  新定义的具体 SAT 模型同时含 NaN、±0、Inf、subnormal、RNE/Up/Down；
  对应正确语义的否定 UNSAT；故意错的 NaN／负零／tie 结论有 SAT 反例。
  它还独立确认旧 sign ground 前提 UNSAT、旧跨 FP bridge ground 前提 UNSAT，
  以及 real_zero 无 finite 守卫有 SAT 反例。
- evidence/overlay-semantic06.json：真正经 Frama-C→Why3→custom driver 的测试。
  正确 NaN/Inf/负零参数运算、subnormal、RNE/Up/Down、有限 cast 均 Valid；
  无前置 ensures false、故意错的 NaN/负零/tie 均未 Valid。
- evidence/smt/ 保存这个运行真正送给 solver 的 SMT；emitted-smt-audit.json
  确认旧 20 个公理/lemma 均未偷偷进入导出模型，sign 是 define-fun。
- “false 控制超时”本身不是一致性证明。相对 native IEEE solver 理论的可满足性
  根据是模型本体没有约束式 axiom，只增加总函数定义和明确的 native primitives。
  全 WP 上下文还含 Why3 整数/实数/内存理论和实际检查过的程序 lemma；没有在这里
  声称已在 Rocq/Lean 中证明整个 Frama-C/Why3/SMT 工具链健全。

仍然存在的前端缺口，不能误报为已修复

- C `return -0.0f` 在 WP 中产生 to_f32(0.0)，丢掉字面量负号。
  known_gap_literal_minuszero 的正确“结果负号”未过，故意错误“结果正号”反而 Valid。
  evidence/minus-zero-print.log 明确保存实际 WP。输入中已有 −0 的算术保留符号，已正反测试。
- C float→double / double→float 被 WP 生成成先 of_f32/of_f64 再 to_f64/to_f32。
  这不能保留 NaN/−0。新模型故意不伪造一个桥使这些测试通过：
  known_gap_cast_nan / known_gap_cast_minuszero 均未过。native IEEE 真转换本身
  正确保留这些性质，已经另有 native SMT 正向测试；缺口在 WP C 表达式生成。
- 因此本 overlay 可验收的范围是同精度 FP arithmetic/classification + real/int→FP
  舍入。使用跨精度 FP cast、负零字面量或未建模位表示的 C 路径必须单独拒绝验收。
  不能以“同一错误模型下左右相等”声称实际 C 等价。
- 浮点观测仍按照原冻结规格：数值相等或双方 NaN；不比较 NaN payload/flags。
  RNE 是当前 C 运算环境；没有新加输入 finite/非 NaN 前置条件。

复现和冻结

`python3 experiments/shim-c-v2/model/build_overlay.py` 生成独立 wp-share 和 lock。
不要在 live proof 运行时重建。wp-share 是可生成的忽略目录，不提交官方整棵树。
float_model_lock.json hash 固定所有实际 share 文件、整个上游 WP/Why3 stdlib/driver、
新 cfloat/driver/config、构建脚本和实际 Frama/Z3/CVC5 executable，共 294 项。
运行参数：-wp-share experiments/shim-c-v2/model/wp-share
          -wp-why3-config experiments/shim-c-v2/model/why3.conf
          -wp-no-why3-detect -wp-prover z3,cvc5 -wp-model Typed+float。
不能用 -wp-library 同名覆盖：Why3 会明确报 Ambiguous path。旧版和新版运行要分开。

audit_native.py 可重放 16 个确切 SAT/UNSAT 检查；semantic-tests.c 是正反 WP 测试。
capture_solver.py / why3-capture.conf 只用于保存输入的审计运行，正式 proof 使用
无 wrapper 的锁定 why3.conf。早期 semantic05 记录保留，用于展示发现前端缺口过程。

官方 ACSL sign 语义来源：https://www.frama-c.com/download/acsl-1.22.pdf
