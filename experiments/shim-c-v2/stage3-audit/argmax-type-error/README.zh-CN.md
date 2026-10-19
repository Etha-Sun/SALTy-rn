# argmaxpool 的 Why3 类型错误调查

相同已冻结候选、相同annotated输入、同一native IEEE模型/solver，仅对 `stage3_group_count` 的建立/保持两个目标做独立诊断：

| 配置 | raw结果 | 结论 |
|---|---|---|
| Typed+raw+float | 0/2，均failed | 两个solver均报 `Type mismatch between frama_c_wp.memaddr.MemAddr.addr and int`，没有正常进入求解 |
| Typed+float | 1/2，另一个timeout | 本次目标未再出现类型错误；不等于整核通过或通用工具修复 |

命令、WP展开目标、raw、退出码、全部annotated SHA分别在 `raw/`、`typed/`。模型锁未改，未使用Bytes或Real。这是第一轮配置相关错误的复现。后续 `debug01/` 与 `minimal3.c` 将错误定位到 `CodeSemantics.exp_unop`：值上下文的逻辑非按结果int类型而非指针/浮点操作数类型翻译。独立修复、正反控制和旧案例完整复验见 [stage3-unary-front](../../stage3-unary-front/README.zh-CN.md)；旧工具、锁和本页失败记录未改。

`minimal.c`（有body合同的4lane uint32广播和struct复制）与 `minimal2.c`（广播无合同、调用方仍要求返回正确值）分别测试raw/typed。两份缩减案例都没有复现地址/整数类型错误，因此不能断言所有struct复制或无合同调用都会触发该错误。两配置下 `direct` 正控制通过、`wrong` 故意错误后置条件未证。第二份缺合同导致调用方未证是预期的诊断现象，并非将缺合同版本用于证明验收。

这里所有试验均为定点定位，不影响原候选完整结果。即使后续采用Typed+float，也必须在独立候选中固定配置、重跑同上下文正反控制与全部body义务，不能拿本页1/2替代整核验收。
