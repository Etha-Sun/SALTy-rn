# XNN-003：s8/u8 rminmax 的 RVV kernel 用尾部不可知的 vmax/vmin 合并累加器

## 1. 发现途径
E3-33（s8-rmax，XNNPACK NEON `s8-rmax-neon-u32-acc2` ⇔ XNNPACK RVV `s8-rmax-rvv-u8v`）整核等价性验证中，W04（2026-11-07）的 RVV 侧证明失败，得到反例。这是**在验证过程中发现的**，不是辅助普查。

## 2. 固定版本、触发条件、最小反例
- XNNPACK `867d5a344790802ee067be62f572c2e2722bf6fb`，`src/s8-rminmax/gen/s8-rmax-rvv-u8v.c`（模板 `src/s8-rminmax/rvv.c.in`）。
- 代码：首块 `vlmax = vsetvl(batch)` 个 lane 装入累加器；之后每块 `vmax = __riscv_vmax(vmax, vinput, vl)`（**tail-agnostic**）；最后 `vredmax(vmax, …, vlmax)` 归约 `vlmax` 个 lane。
- 当后续某块 `vl < vlmax` 时，RVV 1.0 允许结果的尾部 lane `[vl, vlmax)` 被写成全 1（int8 的 -1），这些值随后进入 `vredmax`。
- 最小反例：VLEN=128（e8m8，VLMAX=128），`batch=129`，输入全为 -128，`output[0]` 初值 -128。参考结果是 -128，RVV kernel 在 QEMU `rvv_ta_all_1s=true` 下得 -1。

## 3. 证据
- W04 复现：`build/e2e3-workers-20261106/w04-e3-s8rmax/work/cex/`，日志 `logs/cex-original-rvv-ta-all1s.log`（三个 VLEN 共 9 处不一致），`logs/cex-original-rvv.log`（QEMU 默认的尾部不变策略下 0 处不一致）。
- 监督者独立复现（2026-11-07，直接编译 `benchmark/XNNPACK` 中的原文件）：`build/e2e3-workers-20261106/rechecks/w04/ta1s.log`（9 处不一致）、`default.log`（0 处）。
- 对照：同一仓库中 f32 版的模板 `src/f32-rminmax/rvv.c.in` 明确使用 `__riscv_vfmax_vv_f32m*_tu`（尾部不变），s8/u8 模板没有使用。

## 4. 能否在原始应用中出现
- 该 kernel 在 `src/configs/reduce-config.c:144` 注册为 RISC-V 上的 s8 rmax 生产 kernel。同一模板生成的 `s8_rmin`（256）、`s8_rminmax`（199）、`u8_rmax`（323）、`u8_rminmax`（375）、`u8_rmin`（427）也都已注册。（推断：这 5 个使用相同的合并写法，尚未逐个证明或复现。）
- `batch` 是任意正的字节数，XNNPACK 没有限制它不得为 VLMAX + r 的形式，所以触发条件是合法输入。
- 是否在真实硬件上触发，取决于实现如何处理 tail-agnostic 的尾部：RVV 1.0 允许保持不变，也允许写全 1。QEMU 默认保持不变，所以 XNNPACK 在 QEMU 上的测试不会暴露这个问题。**在哪些真实芯片上出错，目前未知。**

## 5. 偏离方
参考语义是"int8 最大值，初值取自 `output[0]`"。NEON A 符合参考语义；RVV B 在 RVV 1.0 允许的实现上不符合。偏离方是 B（XNNPACK 自己的 RVV kernel）。

## 6. 修复计划
- 最小补丁（`s8-rmax-rvv-u8v.fix.patch`）：把合并改为尾部不变的 `__riscv_vmax_vv_i8m8_tu(vmax, vmax, vinput, vl)`，与 f32 模板的做法一致。原件保留。
- 修复后要验证 A ≡ B_fixed（程序变体 V-006）。W04 已证完 B_fixed 的 RVV 侧（VLEN 128/256/512）；NEON 侧要等规则 R23（`*p++` 规范化）。
- 性能：`_tu` 与 tail-agnostic 在多数实现上开销相近（推断），**未实测**。
- 同模板的其余 5 个 kernel 待逐个确认。
- 对外报告（XNNPACK issue/PR）**需要用户同意**，目前不报告。

## 7. 对实验结论的影响
原始结论"A ≠ B（s8-rmax NEON ⇔ RVV）"保留，作为 E3 中"验证过程发现的 bug"。修复后的 A ≡ B_fixed 单独报告。

## 8. 状态
已确认（W04 与监督者各自独立复现）。V-006 的 RVV 侧已证明，NEON 侧受阻于 R23。
