# f32-vsqrt 候选：标量 sqrt 语义桥未完成

`impl/` 两个文件逐字节复制原始 NEON/RVV kernel。`spec.c` 是 unary 公开入口：
一个 `n+3` 可读输入、两个各 `n` 可写输出；后置条件明确要求输出逐项数值相等或同为 NaN。
负数、NaN、Inf、±0 均合法，不增加非负或有限值前提。

`proof/SqrtLogic.v` 使用 Flocq `Bsqrt`、binary32、RNE 定义完整域的数学模型，
已单独 coqc。`shim/sqrt_ops.c` 是真实 native sqrtf/NEON4/RVV32 运算体，
RVV 非活动通道显式 +0；复用 shared runtime 的 load/store/vsetvl。
156 个 native 案例通过，包括负数/NaN、输入保持和输出边界检查。
这些 native 案例没有证明 libc sqrtf 符合 Flocq 模型。

实际 QCP 探针显示：`sqrtf` 和 `__builtin_sqrtf` 都不是本版本自动识别的原语，
不声明时报告 undeclared identifier。`proof/probes/vector_sqrt.c` 给 sqrtf 添加
显式外部合同后，可以为真实 4/32 个 named-field 通道操作体生成 VC；
这只表明调用者的证明形状可生成。sqrtf 的实现未证明，不能据此闭合 callee 依赖。
该 named-field 表示也没有建立到 native array-lane 表示的完整 adapter 桥。

当前 C VC 检查数为 0，原始 kernel loop 检查数为 0。没有复制旧 VADD 成功状态，
没有发布到 verified。继续需先实现并证明 scalar sqrt，或增加经过审查的 QCP sqrt 原语语义支持；
随后再接 unary list/loop 不变量与现有 load/store/frame 证明。

复现：

```sh
python3 verification/qcp/candidates/f32-vsqrt/proof/native.py
python3 verification/qcp/candidates/f32-vsqrt/proof/probe.py
```

探针前两项退出 1 是已记录的工具边界；第三项生成 VC 并不表示通过 Coq 检查。
模型编译命令与外部 QCP/Coq 配置依赖保存在 `proof/model-status.json`。
