# Bug 记录

验证过程中发现、能追溯到具体来源的 bug，按来源分文件夹存放：

| 文件夹 | 收录范围 |
|---|---|
| [xnnpack/](xnnpack/) | XNNPACK 自身的问题：kernel 与 XNNPACK 自己的参考语义不一致，或 API、参数初始化漏检等。E1 原始 NEON A 的问题也放在这里，因为 A 来自 XNNPACK |
| [bopt/](bopt/) | 最终优化 RVV kernel（Bopt，`keaganchern/optimized-rvv-kernels@80feb4564`）自身的问题 |
| [qcp/](qcp/) | QCP 验证工具（前端、符号执行）的缺陷 |
| [divergences/](divergences/) | 已确认 A ≠ B，但按 XNNPACK 契约不算 bug：维护者声明不保证（如 NaN 的 min/max），或差异落在 XNNPACK 允许的容差内。照样附反例和 L1 分析，供观察关系和 spec 决策使用 |

## 每条记录必须写明

1. **发现途径：** 在哪个实验（E1/E2/E3/E4）中，验证哪一对程序时发现；是证明失败得到的反例，还是辅助手段（普查、SMT 有界证伪、差分测试）先给出线索、再经验证确认。
2. **固定版本**、触发条件和最小反例。
3. **证据：** 源码位置、运行结果（真实 intrinsic + QEMU 或硬件）。
4. **能否在原始应用中出现**：按 `research/project-plan-20261102/LESSONS.zh-CN.md` L1 的流程，逐步查 XNNPACK 的调用路径。
5. **偏离方：** 对照 XNNPACK 参考语义，说明哪一侧不一致。
6. **修复计划**（必填）：
   - 最小补丁和存放位置；原件保留；
   - 修复后要验证的结论，例如 A_fixed ≡ Bopt 或 A ≡ Bopt_fixed；
   - 性能影响：修改 Bopt 时必须实测，不能只写"预计不影响"；
   - 是否需要向上游报告，以及对外报告需要用户同意这一点。
7. **对实验结论的影响：** 原始结论（例如"原始 A ≠ Bopt"）始终保留，修复后的结论单独报告。
8. **状态。**

推断与已验证的结论分开写。

## 索引

| 编号 | 发现途径 | 标题 | 状态 |
|---|---|---|---|
| [XNN-001](xnnpack/XNN-001-vclamp-tail-order/README.zh-CN.md) | E1 s8-vclamp（A ⇔ Bopt），证明时得到反例 | s8/u8 vclamp 的 SIMD 实现中，尾部 min/max 顺序与参考语义相反，`min > max` 时结果不一致 | 已确认；W4 已证明 s8 的 A_fixed ≡ Bopt（VLEN 512/128/256），监督者复检中；u8 待 BOPT-001 |
| [XNN-003](xnnpack/XNN-003-s8u8-rminmax-rvv-tail-agnostic/README.zh-CN.md) | E3-33 s8-rmax（XNNPACK NEON ⇔ XNNPACK RVV），证明时得到反例 | s8/u8 rminmax 的 RVV kernel 用 tail-agnostic 的 vmax/vmin 合并累加器，最后按 vlmax 归约，尾部的全 1 混入结果 | 已确认（W04 与监督者各自复现）；B_fixed 的 RVV 侧已证明，NEON 侧等 R23；未对外报告 |
| [XNN-004](xnnpack/XNN-004-s8-hvx-reduce-float-ub/README.zh-CN.md) | E2/E3 HVX s8-rmax（W03），读源码 + UBSan 实测 | `xnn_reduce_max_s8`/`min_s8` 返回 float（来自无符号 lane），赋给 int8_t 时负值越界转换为 UB；当前编译结果碰巧正确 | 修复变体 V-007（返回 int8_t）；未对外报告 |
| [BOPT-001](bopt/BOPT-001-u8-vclamp-params-abi.zh-CN.md) | E1 准备阶段：改写工具的差分测试暴露了编译冲突，再审源码发现 | u8-vclamp 自定义的 params 布局（uint8）与 XNNPACK（uint32）不一致 | **已实测确认**（W14）：`x=1, min=0, max=1` 时 Bopt 输出 0，A 输出 1；Bopt_fixed 已在 QEMU 上通过，证明进行中 |
| [QCP-001](qcp/QCP-001-float-array-field.zh-CN.md) | E1 f32-vadd，RVV shim 生成 VC 时 | 局部 struct 中的 float/double 数组字段无法通过类型推断 | 已复现；E1 用比特 lane 表示绕开；未向作者报告 |
| [QCP-002](qcp/QCP-002-struct-array-assign.zh-CN.md) | E1 s8-vclamp，证明拷贝适配器时 | 数组字段 struct 之间的整体赋值无法符号执行 | 已复现；shim 拷贝改用逐 lane 循环 |
| [BOPT-002](bopt/BOPT-002-f32-f16-vcvt-nan-to-inf.zh-CN.md) | E1 f32-f16-vcvt：harness 差分给出线索，W12 用真实参数确认 | Bopt 去掉了 NaN 分支，qNaN 被转成 Inf（0x7c00；A 和参考为 0x7e00） | 已确认；修复计划见记录，未实施 |
| [BOPT-003](bopt/BOPT-003-qu8-vadd-narrow-saturation.zh-CN.md) | E1 qu8-vadd-minmax：harness 差分给出线索，W12 用 XNNPACK 真实 init 确认 | Bopt 先做不饱和的有符号截窄，再做无符号饱和，负值变成 255 | 已确认；修复计划见记录，未实施 |
| [DIV-001](divergences/DIV-001-f32-vmax-nan.zh-CN.md) | E1 f32-vmax：旧反例重放，W11 | 单侧 NaN：A 输出 NaN，Bopt 输出另一个数 | 不等价已确认；维护者声明不保证；语义目标待用户决定 |
| [DIV-002](divergences/DIV-002-f32-vmin-nan.zh-CN.md) | E1 f32-vmin：同上 | 同上 | 同上 |
| [DIV-003](divergences/DIV-003-qs8-vmul-rounding.zh-CN.md) | E1 qs8-vmul-minmax-fp32：W12 分诊 | 舍入策略不同，差 1，在 XNNPACK tester 的 ±1 容差内 | 不等价已确认；严格比较还是带容差比较，待用户决定 |
| [QCP-003](qcp/QCP-003-do-while-ull-decrement.zh-CN.md) | E1 qu8-rsum（W9），生成 VC 时 | do-while 中 `unsigned long long` 的 `--n;` 导致前端异常；条件表达式中的 `--`、内联 asm 也无法解析 | 已用工具 v1.2（R14–R16）绕开 |
| [BOPT-004](bopt/BOPT-004-qs8-vlrelu-multiplier-narrowing.zh-CN.md) | E1 qs8-vlrelu：W23 用真实 init 参数复现 | 乘数 +32768 被截窄成 -32768，正负分支的乘法方向都错 | 已确认；修复待排期（受 Codex 额度限制） |
| [BOPT-005](bopt/BOPT-005-qs8-vcvt-multiplier-and-saturation.zh-CN.md) | E1 qs8-vcvt：W23 | 乘数预移位后截断成 -32768；另外先截到 8 位再加输出零点，丢掉了本可被零点抵消的值 | 已确认；修复待排期 |
| [XNN-002](xnnpack/XNN-002-qu8-rdsum-rows/README.zh-CN.md) | E1 qu8-rdsum（W21）：QEMU 差分 + L1 调用路径追查 | XNNPACK 的 qu8-rdsum NEON kernel 把 rows 截断成 int；经 reduce 算子可传入 rows ≥ 2^31，此时跳过全部计算（A 与 XNNPACK 源码逐字节相同） | **新发现，已确认**；A_fixed（3 行改为 size_t）已在 QEMU 上通过；QCP 证明被 QCP-004 阻塞 |
| [QCP-004](qcp/QCP-004-neon-target-crash.zh-CN.md) | E1 x32transpose、qu8-rdsum（W21） | 生成 NEON 侧 VC 时 QCP 崩溃（SIGSEGV）；另有不可达分支中 record 初始化报错的最小例 | 根因未定位；搁置 |
