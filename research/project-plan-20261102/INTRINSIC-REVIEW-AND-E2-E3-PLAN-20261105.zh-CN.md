# intrinsic 审阅（f32-vadd）与 E2/E3 选样、shim 计划

2026-11-05，监督者。下文中"推断"指未经运行确认的判断。

## 1. 已完成配对 f32-vadd 的 intrinsic 审阅

审阅对象：`build/e1-workers-20261104/w3-e1-vadd-pair/repo/verification/qcp/candidates/e1-f32-vadd-pair/proof/intrinsic-ledger.json`。共 7 个 NEON 操作和 5 个 RVV 操作，逐条对照合同原文和所绑定的 Coq 定义。

| 操作 | 结论 | 说明 |
|---|---|---|
| RVV `__riscv_vsetvl_e32m4` | 正确 | `rvv_vl` 的三段式与 RVV 1.0 §6.3 一致（AVL≤VLMAX 时取 AVL；AVL<2·VLMAX 时取 ⌈AVL/2⌉..VLMAX；否则取 VLMAX），`(avl+1)/2` 即 ⌈AVL/2⌉。规范还要求同一 AVL 下结果确定，模型不要求这一点，只是放宽了，对部分正确性是可靠的 |
| RVV `vle32` / `vse32` | 正确 | 只访问活动前缀，地址为 `base+k..k+vl`；尾部用存在量化；store 写回 `decode`，经 `store_float` 往返后比特不变（lane 值在 0..2^32-1） |
| RVV `vfadd_vv` | 有条件成立，见 A、B | lane = `encode(fp32_add(decode a, decode b))`，`fp32_add` = Flocq `Bplus` RNE |
| RVV `qcp_p_copy` | 目前只有合同 | 按 QCP-002 的决定，改成逐 lane 循环并证明函数体；完成前它属于信任边界 |
| NEON `vld1q`/`vst1q`/`vst1`/`vst1_lane`/`vget_low`/`vget_high` | 正确 | 逐 lane 访问，函数体已证明 |
| NEON `vaddq_f32` | 有条件成立，见 A、B | 逐 lane `fp32_add`，函数体已证明 |

**A. 浮点环境假设没有写进清单，需要补上。**
- RVV 的 `vfadd` 使用动态舍入模式 `frm`。模型假设 `frm = RNE`，Linux/XNNPACK 默认就是这个值。
- NEON 一侧假设 AArch64、`FPCR.RMode = RN`、`FZ = 0`。AArch32 NEON 总是把 subnormal 清零，与模型不符。
- 异常标志（fflags/FPSR）没有建模。

f32-vadd 的结论依赖这些条件，应作为显式环境前提写进 ledger 和 README。

**B. NaN 的比特模式与两种硬件都不一致。**
- QCP 的 `fp32_binary_nan` 总是返回同一个 NaN：`B754_nan false 1`，比特是 `0x7f800001`。这个编码的 quiet 位没有置位，形式上属于 signaling NaN。
- RVV 规定运算结果为 NaN 时返回 canonical NaN `0x7fc00000`。
- AArch64 在 `FPCR.DN = 0`（默认）时返回把输入 NaN quiet 化后的值，保留 payload。

f32-vadd 的观察关系是"两边都是 NaN 即视为相等"，所以这个差异不影响 f32-vadd 的结论。但以下情况**不能**直接用 QCP 默认的 `fp32_*`：
- 观察关系要求逐比特相等，例如 argmaxpool；
- 浮点结果被 reinterpret 成整数后再使用；
- `vcopysign`；
- NaN 转整数，例如 f32-qs8-vcvt；
- E3 中专门比较 NaN 行为的配对。

这些场景需要给每个 ISA 单独写一份 NaN 定义（RVV 用 canonical NaN；AArch64 区分 DN=0/1；x86 保留第一个 NaN 操作数；HVX 待查）。后续 kernel 的 ledger 中，NaN 一栏必须明确写出用的是哪一种。

**C. 通用问题。** 所有 intrinsic 的"人工审核"状态仍是 pending，这些都是 worker 写的草稿。审核时可以按 intrinsic 族成批看：同一族的合同模板相同，只有 lane 运算不同。

## 2. E3 选样建议

候选来自 `feasibility-e2-e3-e4-20261104/e3-pairs.csv`，共 38 对。这里按论文价值、对已有基础设施的复用程度和可行性，挑出 10 对左右，分三类：

| 类型 | 配对 | 理由 |
|---|---|---|
| 正对照（预期相等） | E3-01 vtanh NEON↔FMA3 | 同一模板、同为 FMA，推断逐位相等（NaN payload 除外） |
| | E3-33 s8-rmax / u8-rminmax（NEON/RVV/HVX/SSE41） | 整数精确，代价低；能一次接通四个 ISA 的 shim |
| | E3-35 x32-transposec（NEON/HVX/SSE/AVX） | 纯数据搬运，只检验访存合同 |
| 合法差异 / 契约澄清 | E3-18 vsqrt：AVX 默认路径用 rsqrt 近似，consistent 路径是精确 sqrt | 同一 ISA 上一个近似、一个精确，对比清楚 |
| | E3-27 qs8-vmul：rndnu vs fp32 | 两边不是同一个契约，作为"等价性问题本身不成立"的例子 |
| | E3-20/21 RVV vrndne、vlrelu 的 ±0 | 用"数值相等"观察时等价，用"比特相等"观察时不等价，说明观察关系的选择会改变结论 |
| 潜在 bug | E3-19 HVX vrndne：恰好一半时向远离零的方向舍入，而参考语义是 ties-to-even | 可能是真实 bug，需在 Hexagon 模拟器上复现 |
| | E3-23/24 f32-qs8-vcvt 的 NaN 映射：NEON→zero_point，RVV→-128，AVX2/HVX→127 | 四个 ISA 各不相同；先查 XNNPACK 参考语义和维护者是否声明过不作保证 |
| | E3-09 f32-rmax NEON↔RVV 的 NaN | E4（Softmax）依赖它 |
| 已有发现 | XNN-001（s8/u8-vclamp：NEON/SSE/AVX512 的尾部 ↔ scalar/RVV） | 这本身就是 E3 类型的发现；E3-34 中 NEON↔AVX2 s8 预计相等，因为两者的尾部写法相同（推断） |

已知且维护者声明过不作保证的问题（例如 min/max 的 NaN 处理）不计为新发现，只作为契约澄清。

## 3. E2：需要新的 code shim，但只有一部分应该现在做

E2 的源实现是 **AVX**，目标是 **RVV 和 HVX**。目标实现现在还不存在，需要另外生成，再做验证。所以 E2 的 shim 分两层，分别处理：

**现在就做（小探测，验证表示方式可行，避免以后返工）：**
1. **AVX/AVX2/AVX512：** 向量宽度固定（8 或 16 个 f32 lane）。旧的四 ISA vabs 工作中已有 `avx_types.h`、`avx_intrinsics.h`（`build/four-isa-vabs/.../candidates/f32-vabs-four-isa/shim/`）。要确认两点：逐字段表示加上宏借用地址的做法是否够用；按值传 `__m256` 是否会触发 QCP 已知的按值 struct 问题。如果会，就把规则改写工具扩展到 x86 向量类型。
2. **HVX：** 向量宽 1024 位，即 32 个 f32 或 128 个字节，逐字段表示规模过大，需要数组字段。f32 受 QCP-001 影响，要用比特 lane。另外两个语义问题必须先有可证明的建模方案，否则 f32-vsigmoid/velu 的 HVX 目标根本无法验证：
   - qf32 中间格式；
   - `xnn_div_f32` 实际是 `a * fast_inverse(b)`，属于近似除法。

   已有 `hvx32_types.h`、`hvx32_intrinsics.h` 和 polyfill 草稿可以参考。
3. **RVV：** 沿用 E1 的数组字段加比特 lane 指针 shim，不需要新的表示方式。

做法：每个新 ISA 选一个最小 kernel（例如 vabs 或 s8-rmax），走通"生成 VC 并证完"一遍，与 RVV 的 probe p1 类似。这些 probe 同时为 E3 接通 x86 和 HVX。

**等到验证时再做（由代码驱动）：** 逐个 intrinsic 的合同。E2 的目标代码还没生成，会用到哪些 intrinsic 现在不知道。E1 的做法是先由改写工具从实际代码中列出接口清单（`ptr_ops`），再按清单写合同。E2、E3 也照此办理，提前写容易白做。可以复用的 Coq 语义定义（FMA 模型、考虑 NaN 的 min/max、整数回绕、VXRM 舍入）见 `E1-PROOF-REUSE-MAP.zh-CN.md`。

**E2 选样：** 维持短名单（qs8-vprelu、f32-vsigmoid、f32-velu、f32-ibilinear、x8-lut，备选 f32-raddextexp），暂不冻结。冻结前先确认：
- HVX 的 qf32 和近似除法能否建模：这决定 vsigmoid/velu 的 HVX 目标是否可行；
- 由谁、用什么流程生成 RVV/HVX 目标实现，以及如何测性能基线（基线用 config 中回退的 scalar kernel）。
