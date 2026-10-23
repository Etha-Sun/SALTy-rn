# GEMM 六个 NEON intrinsic 与 scalar min/max 的真实 C body 证明

本次 [fresh 结果](proof/evidence/vector-fresh01/result.json)通过 **81 条 C VC＋2 条策略义务**，耗时 103.96 秒；[完整 gate](proof/evidence/vector-fresh01/Gate.v)、[全部假设报告](proof/evidence/vector-fresh01/Gate.log)和[执行命令](proof/evidence/vector-fresh01/commands.json)可审查。

本包补齐六个 GEMM NEON intrinsic 的真实 C body：`vminq_f32`、`vmaxq_f32`、`vdupq_n_f32`、`vdupq_lane_f32`、`vget_low_f32`、`vget_high_f32`。另实现并证明四种共享 **scalar** 操作：NEON 传播 NaN 的 min/max、RVV 选择 number 的 min/max。它们精确返回现有 `f32-gemm-minmax-model` 的 `GemmSpec.IntrinsicModel` 值，包含 NaN、Inf、subnormal 和 ±0。模型文件及其 SHA 保持不变；没有收窄输入、修改模型或引入新项目公理。

人工审查入口是 [src/neon.c](src/neon.c)、[src/minmax.c](src/minmax.c)、现有 [IntrinsicModel.v](../f32-gemm-minmax-model/proof/coq/GemmSpec/IntrinsicModel.v) 与 [proof/manifest.json](proof/manifest.json)。C 合同使用 `bit_same`（Coq 值相等），因此此处甚至保证模型选择的 NaN 位表示和零符号，并非仅“双方为 NaN”观察等价。

- `qcp_minmax_identity` 有真实 `return a` body 和证明，用于使 QCP 保留 NaN 自比较的两个操作数。NaN 判断使用普通 C 比较。
- 两个零的 max 用 `a+b`，min 用 `-((-a)+(-b))`；[ScalarFacts.v](proof/ScalarFacts.v) 对两种零符号逐一证明 RNE 下的精确结果。
- 现有 QCP 算术 NaN payload 为 1，与 GEMM canonical qNaN 不同，所以通过已经存在的真实 byte-copy helper `qcp_float_from_bits(2143289344U)` 构造指定表示。checker 从仓库的 [bits.c](../../verified/f32-vlrelu/shim/bits.c)、[Bits.v](../../verified/f32-vlrelu/proof/coq/Bits.v) 与 [BitsChecked.v](../../verified/f32-vlrelu/proof/coq/BitsChecked.v) 重新生成并重查全部 19 条 helper VC；没有仅凭头文件声明关闭调用。

六个 vector body 的合同逐字提取自 PR7 的 [shim-undef.h](../../experiments/gemm-qcp-do-reproducer/input/shim-undef.h)，checker 逐一验证相同函数签名、Require/Ensure，并核对 vector 的 scalar 调用声明与已证 scalar body 合同完全相同。`vdupq_lane_f32` 保留 lane=0 或 1 的原合法域；四字段资源由两个实际检查的 copy strategy 处理。

新 vector 单元共有 **23 条 C VC**、scalar 单元 **39 条 C VC**，byte-copy 支持单元有 **19 条复用 C VC**，合计 **81 条 C VC＋2 条策略义务**。独立 gate 实例化三个完整 `VC_Correct` 并对全部 **83 条**义务报告 `Print Assumptions`。14 个源模块和 gate 在新的目录普通 Coq 编译，不读取旧项目 `.vo`。框架、字段/sizeof、经典逻辑/实数/外延性假设保持可见，外部 QCP/Coq/Flocq 对象仍复用；本包不重建外部库、不宣称全局无公理或新增了 recursive coqchk。

本包已证明上述六个 NEON intrinsic 的 C body，**没有证明 GEMM 循环或最终比较 caller**。NEON 内存 load/store、RVV 向量操作、FMA 的 body、ISA/ABI 对应及独立终止性仍未由本包完成。FMA 的单次融合舍入缺口仍在；这里的普通 min/max C body 不能关闭该缺口。当前选择 LP64、小端、RNE/no-flush 的 QCP 环境。编译器应遵守普通 IEEE 浮点语义，不使用 fast-math。

## 重放

```sh
QCP_HOME=/path/to/QCP QCP_COQC=/path/to/coqc-8.20.1 QCP_LAYOUT=dune \
  python3 verification/qcp/candidates/f32-gemm-minmax-primitives/proof/check.py \
    --name fresh-new --native
```

`name` 必须是全新目录名。checker 固定所有源文件和共享环境工具的 SHA，重新生成三个 C 单元的 VC 及两个策略义务、核对精确字段集合、编译完整项目依赖并检查 gate，最后确认输入未变。结果及每条命令保存在 `.build/<name>`。每条命令的 wall 上限为 3600 秒，单进程运行。

[native.c](native.c) 用独立 bit 分类/符号零 oracle 检查全部 20×20 个特殊值组合及 262144 对确定性随机输入，每对检查四种 scalar 操作及六个 vector intrinsic 的混合 lane、lane0/1 选择与提取结果（共 28 个精确位比较）。测试同时启用 ASan/UBSan；错误零符号实现和错误 NaN payload 两个变异必须被拒绝。native 是回归测试，不计为形式证明。当前执行环境的 LeakSanitizer 不支持 ptrace，运行使用 `ASAN_OPTIONS=detect_leaks=0`；地址和未定义行为 sanitizer 保留，测试无动态堆分配。
