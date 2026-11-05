# 偏离原始严格目标的总表（人工审核入口）

E1 的原始目标是：在旧公开合同的完整输入域上，原始 NEON A 与最终优化 RVV Bopt 的输出满足严格的观察关系。凡是在这个目标上做了让步，就在这里登记一条，并在对应包的 `spec.c` 中用统一标记写明。

**spec.c 中的标记格式**（普通 C 注释，不能用 `/*@`，因为 `/*@` 是 QCP 注释语法）：

```c
/* [VEKTO-C-001] 条件：输入不含 NaN
 *   依据：google/XNNPACK#441（维护者不保证 min/max 的 NaN 行为）
 *   精确边界：同一位置两个输入要么都是 NaN、要么都不是
 *   反例：research/bugs/divergences/DIV-001 */
```

标记紧贴它所修饰的 Require、Ensure 或观察关系定义。审核时执行 `grep -rn "VEKTO-" <包>/spec.c`，就能列出该包的全部让步。

## 编号规则

- **C-xxx 输入条件：** 在 `equivalent` 的 Require 中缩小输入域。
- **R-xxx 观察关系：** 放宽"相等"的含义，例如允许 ±1 误差、不比较 NaN payload。
- **V-xxx 程序变体：** 证明的对象不是原始程序，而是修复版（A_fixed、Bopt_fixed）。
- **G-xxx 全局前提：** 对所有 kernel 都成立的环境和建模前提。

每一条都要保留原始结论（反例），并单独计数。

## 全局前提

| 编号 | 内容 | 依据 |
|---|---|---|
| G-001 | 浮点环境：RVV `frm = RNE`；NEON 为 AArch64，`FPCR.RMode = RN`，`FZ = 0` | Linux/XNNPACK 默认设置 |
| G-002 | intrinsic 语义由人工审核的合同给出，没有对 ISA 做形式化对应证明；人工审核状态见各包的 ledger | INTRINSIC-SPEC-POLICY |
| G-003 | RVV 侧证明的是规则工具 `tools/rvv_ptr_lower` 改写后的程序；改写的正确性依据是规则表和差分测试 | 工具 README |
| G-004 | 部分正确性：不证明终止性；不证明编译器到机器码的对应 | — |
| R-000 | 浮点观察关系：两边都是 NaN 即视为相等，不比较 payload；±0 按数值相等处理。适用于所有采用旧包"数值相等"关系的 f32 kernel | XNNPACK 一元 tester 只断言 isnan（`test/vunary-microkernel-tester.h:122`）；C 语言不保证 NaN payload。二元 tester 对 NaN 没有断言 |

## 逐 kernel 登记

| 编号 | kernel | 类型 | 内容 | 依据 | 原始结论 | 状态 |
|---|---|---|---|---|---|---|
| V-001 | s8-vclamp | 程序变体 | A_fixed：NEON 尾部两处 min/max 顺序对调，与参考语义一致 | XNN-001；XNNPACK 参考语义 `min(max(x,lo),hi)` | 原始 A ≠ Bopt（XNN-001） | A_fixed ≡ Bopt 已证（W4），**监督者复检通过** |
| C-001 | f32-vmax | 输入条件 | 输入不含 NaN | google/XNNPACK#441 | A ≠ Bopt（DIV-001） | **条件配对通过**（W19），**监督者复检通过** |
| C-002 | f32-vmin | 输入条件 | 输入不含 NaN | google/XNNPACK#441 | A ≠ Bopt（DIV-002） | **条件配对通过**（W19，11:5x UTC），**监督者复检通过** |
| V-002 | f32-f16-vcvt | 程序变体 | Bopt_fixed：恢复 NaN 路径 | BOPT-002 | A ≠ Bopt | 修复与证明中（W17）；RTL 性能待测 |
| V-003 | qu8-vadd-minmax | 程序变体 | Bopt_fixed：改为饱和截窄 | BOPT-003 | A ≠ Bopt | 修复与证明中（W18）；RTL 性能待测 |
| R-001 | qs8-vmul-minmax-fp32 | 观察关系 | 输出允许 ±1 误差 | XNNPACK tester 容差 | A ≠ Bopt（DIV-003） | 证明中（W24） |
| C-003 | qu8-vadd-minmax | 输入条件 | params 限定为 XNNPACK `xnn_init_qu8_add_minmax_scalar_params` 在合法量化参数下实际能产生的取值（如 shift 13..30、乘数与 bias 的对应范围；W18 按 init 代码推出精确条件并引用代码行） | L1 第 1 步：XNNPACK 不会产生这个范围以外的参数；旧合同允许任意 int32 shift，在这些取值上 A 和 Bopt 都可能有 C 未定义行为 | 原始 A ≠ Bopt（BOPT-003） | 监督者按 L1 自主决定；与 V-003 一起由 W18 证明 |
| C-004 | qs8-rsum | 输入条件 | 与求和顺序无关的不溢出条件：`n ≤ 2^24`，`Init − 128·n ≥ INT32_MIN`，`Init + 127·n ≤ INT32_MAX`。11:15 第二次修订：kernel 先从 0 开始累加、最后才加 Init，所以从 0 开始的部分和也要在范围内；这正是 XNNPACK 标量参考本身无 UB 的输入域 | 溢出是 C 未定义行为，此类输入在 C 层面没有语义；XNNPACK 自己的标量参考实现在同样输入上也会溢出 | A 和 Bopt 在 Init=INT32_MAX 时都有 UB（W20 用 UBSan 实测） | **条件配对通过**（W20 R5，13:26 UTC，VLEN 512/128/256），复检中 |
| C-005 | qs8-rdsum | 输入条件 | 同 C-004（逐通道累加不溢出）；rows 转 int 的问题另按 L1 判断（可能是 XNN-002） | 同 C-004 | A 的标量尾部在 Init=INT32_MAX 时有 UB | 暂停：生成 NEON 侧 VC 时 QCP 崩溃（QCP-004），见"搁置" |
| V-004 | u8-vclamp | 程序变体 | A_fixed（XNN-001 的 u8 版）与 Bopt_fixed（params 改用 XNNPACK 的 uint32 布局） | XNN-001、BOPT-001 | 原始 A ≠ Bopt：顺序正常的上下界下 Bopt 也输出 0（W14 实测） | **A_fixed ⇔ Bopt_fixed 完整配对通过**（W14，11:03 UTC），**监督者复检通过**；Bopt_fixed 的 RTL 性能待测 |
| C-006 | x32transpose | 输入条件 | block 的宽、高都 ≥ 1 | L1 第 1 步：XNNPACK 对零维张量直接跳过 | A ≠ Bopt：宽 0、高 1 时 A 会写第 0 列（W21） | 续上 W21 |
| C-007 | qs8-f32-vcvt、qu8-f32-vcvt | 输入条件 | zero point 限定为 init 参数类型的范围（int8 / uint8） | L1 第 1 步：init 接收 int8_t/uint8_t 类型的 zero point | A ≠ Bopt：zero point = 128 时（W22） | 续上 W22 |
| V-005 | qu8-rdsum | 程序变体 | A_fixed：rows 计数改为 size_t（XNN-002） | XNN-002 | 原始 A ≠ Bopt：rows = 2^31 时 A 跳过计算 | QEMU 回归通过；QCP 证明被 QCP-004 阻塞 |

