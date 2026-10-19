# 独立工具修复：逻辑非的操作数类型

第三阶段argmaxpool在Typed+raw+float下出现Why3地址/整数类型错误。`stage3-audit/argmax-type-error/debug01/run.log`把失败定位到原C中 `assert(!ab)` / `assert(!ib)` 对应的“地址 = 整数0”；`minimal3.c`进一步在两种Typed配置均复现指针和浮点逻辑非的类型错误。这是工具翻译问题，没有据此修改kernel、shim或公开规格。

`CodeSemantics.exp_unop` 原来按 `UnOp` 的结果类型选择语义；C的逻辑非结果总是int，因此指针/浮点操作数落入整数分支。独立补丁 `logical-not.patch`：

- 仅在 `LNot` 时按操作数类型选择分支；指针调用已有 `M.is_null`。
- 浮点逻辑非用已有native IEEE `Cfloat.feq`与对应浮点类型的零比较，再转成C整数0/1；正负零均为假值，NaN不是零。
- `Neg` / `BNot`仍按结果类型，保留原整数提升。没有新增axiom、改Why3语义或使用Real。

范围是**值上下文的逻辑非翻译**。不宣称修复整个浮点前端、uintptr加偏移桥、float/memcpy表示桥或全部WP问题。

旧源码、安装和锁未改。独立source/install位于本目录 `.build/`，复用已有opam依赖；比较10894个源文件，只有CodeSemantics.ml变化。`prepare.py`、`build.sh`、`freeze-model.py`是这台机器基于已恢复环境的配方，不是一键跨机器bootstrap。运行时继续引用已冻结handoff-plus的IEEE/Cint share与driver，独立锁固定新工具安装和全部依赖；旧锁保留。

新控制结果在 `control-acceptance.json`：raw和普通Typed各17个正确义务通过，2个故意错误后置条件未证；原IEEE回归23/26、FMA回归16/18，未证目标恰为各自3/2个预期负控制。控制首两版误用了double的ACSL等号/零字面量，解析失败原样保留；修正控制在 `controls-v3.c`，不是修改工具迎合测试。

完整已通过case复验与实际argmaxpool重试分别存于 `replay/f32-vadd/`、`replay/f32-argmaxpool/`。最终环境资格看独立验收记录，锁中的pending文本表示冻结时状态，不能回写锁伪造旧SHA。即使工具通过回归，也不能把复杂kernel的未证目标当作通过。

独立验收记录为 `ACCEPTANCE.json`：已收录f32-vadd在新工具下完整571/571、complete=true、全部守卫通过。这是旧案例复验，不增加收录数。真实argmaxpool的原raw配置6个定点目标从类型错误变为1个valid、5个timeout；随后原v4完整300秒尝试仍预算耗尽、无最终body报告，global 5/5不代表整核通过。
