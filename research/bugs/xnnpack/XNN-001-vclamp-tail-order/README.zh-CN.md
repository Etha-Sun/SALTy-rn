# XNN-001：s8/u8 vclamp 的 SIMD 实现中，尾部 min/max 顺序与参考语义相反

- **固定版本：** XNNPACK `867d5a344790802ee067be62f572c2e2722bf6fb`（2026-03-24）。2026-11-05 对照上游 master，问题仍在。
- **发现：** E1 worker W2 在验证 s8-vclamp 时发现，监督者追溯到 XNNPACK。

## 问题

XNNPACK 对 clamp 的参考语义是 `y = min(max(x, lo), hi)`。依据：
- 测试参考实现 `test/unary-ops.h:176-181`；
- 标量 kernel `src/s8-vclamp/s8-vclamp-scalar-u4.c`、`src/u8-vclamp/u8-vclamp-scalar-u4.c`；
- RVV kernel `src/*-vclamp/gen/*-rvv-u*v.c`；
- 已合并的 [google/XNNPACK#11745](https://github.com/google/XNNPACK/pull/11745) 也说明 microkernel 按此语义计算。

多个 SIMD 实现的主循环按这个顺序计算，但处理剩余元素的代码写成了 `y = max(min(x, hi), lo)`。

`lo ≤ hi` 时两种顺序结果相同；`lo > hi` 时，主循环输出 hi，尾部输出 lo。因此同一次调用中，输出会随元素位置不同而不同。

| 实现 | 主循环 | 尾部 |
|---|---|---|
| scalar、RVV（s8/u8） | max→min | max→min |
| NEON u64（s8/u8）——即 E1 的 A | max→min | **min→max**（8 元素循环和最后不足 8 个的部分都是） |
| SSE2 u64、SSE4.1 u64、WAsm SIMD u64（s8/u8） | max→min | **min→max** |
| AVX512SKX u256（s8/u8） | max→min | **min→max** |
| AVX2 u128 s8 | max→min | **min→max** |
| AVX2 u128 u8 | max→min | max→min（一致） |

以上由 grep 源码得到，见各文件中 `_max_`/`_min_` 的调用顺序。E1 只实际运行和验证了 NEON；其余 ISA 是从源码推断的，没有运行。

## 反例（NEON，E1 中复现）

`batch=1`，`x=0`，`min=1`，`max=0`：
- NEON 实现（A）输出 1；
- XNNPACK 参考语义输出 0；
- 最终优化 RVV（Bopt）输出 0。

证据：W2 的候选目录 `build/e1-workers-20261104/w2-rvv-s8-vclamp/repo/verification/qcp/candidates/e1-s8-vclamp-bopt-ptr/proof/reproduction/`（真实 intrinsic + QEMU，VLEN 128/256/512）。旧的 40 个 kernel 项目也曾得到同一个反例：`verification/qcp/verified/s8-vclamp/proof/repair.json`，见 `origin/c-shim-v2`。

## 原始应用能否出现这种输入

结论：在固定版本中能出现；维护者的意图是拒绝它，但这条路径漏检了。

- **独立 clamp 路径没有任何检查：** 依次经过 `xnn_define_clamp`/`xnn_define_unary`（`src/subgraph/unary.c:394-452`，只检查 params 不为空）、`xnn_create_unary_elementwise_nc`、`xnn_init_qs8_clamp_scalar_params` / `xnn_init_qu8_clamp_scalar_params`（`src/microparams-init.c:738-762`，只断言量化参数相等），最后进入 NEON kernel（只断言 batch 和指针）。
- **其他路径有检查：** 融合激活路径通过 `xnn_subgraph_check_output_min_max`（`src/subgraph/validation.c:159-181`）拒绝 `min > max`；maxpool 使用的 `xnn_init_s8_minmax_scalar_params` 中有 `assert(output_min < output_max)`（`src/microparams-init.c:791`）。
- **量化保持顺序：** `xnn_qs8_quantize`/`xnn_qu8_quantize`（`src/xnnpack/requantization.h:217-227`）对每个值做除以正 scale、加 zero_point、截断、取整，都是单调不减的。所以浮点上下界有序时，量化后仍然有序。但不同的浮点值可能量化成同一个整数，所以只能保证 `≤`，不能保证 `<`。
- **上游的态度：**
  - [google/XNNPACK#11745](https://github.com/google/XNNPACK/pull/11745)（已合并）：f32 average pooling 拒绝反转的范围；
  - [google/XNNPACK#11339](https://github.com/google/XNNPACK/pull/11339)（未合并）：准备给 `xnn_define_clamp` 加同样的检查。
- **有没有人报告过：** 在 GitHub 的 issue/PR 中搜索 vclamp 和 clamp min/max，没有找到报告尾部顺序不一致的记录（2026-11-05）。

## 对 E1 的影响

- s8-vclamp 和 u8-vclamp：**原始 A ≠ Bopt**，反例如上。偏离 XNNPACK 参考语义的是 A，Bopt 与参考语义一致。
- 不为这个反例加强共同 spec：固定版本接受这种输入。

## 修复（建议，修复后的验证尚未进行）

最小修复：把 NEON 尾部两处的 min/max 对调成 max→min，与主循环和参考语义一致。
- s8 补丁：[A-s8-vclamp.fix.patch](A-s8-vclamp.fix.patch)，修复后文件 [A-s8-vclamp.fixed.c](A-s8-vclamp.fixed.c)；
- u8 补丁：[A-u8-vclamp.fix.patch](A-u8-vclamp.fix.patch)，修复后文件 [A-u8-vclamp.fixed.c](A-u8-vclamp.fixed.c)；
- 原件：`A-*-vclamp.original.c`，即 SALTy-rn `be16280` 的 `kernels/source`，与 XNNPACK 的 NEON kernel 函数体逐字相同。

**修复后的验证计划：**
- 证明 A_fixed ≡ Bopt（共同 spec 改用参考语义 `min(max(x, lo), hi)`，不加 `min ≤ max` 前提），作为单独结果，不替代"原始 A ≠ Bopt"的结论；
- 性能：A 是 NEON 侧，修改不影响 RVV 的性能测量；对 NEON 的性能影响预计可忽略（指令数不变），但未测。

**上游：** 可以向 XNNPACK 提 issue 或 PR，修复各 SIMD 尾部的顺序，或在 clamp API 中拒绝 `min > max`。这属于对外发布，需要用户同意。
