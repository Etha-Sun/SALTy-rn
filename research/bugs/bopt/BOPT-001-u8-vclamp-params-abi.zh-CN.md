# BOPT-001：u8-vclamp 自定义的 params 布局与 XNNPACK 不一致

- **版本：** `keaganchern/optimized-rvv-kernels@80feb4564`，文件 `u8-vclamp.c` 第 7-12 行。
- **现象：** Bopt 自定义 `struct xnn_u8_minmax_params { struct { uint8_t min; uint8_t max; } scalar; }`；XNNPACK `867d5a34` 的 `src/xnnpack/microparams.h:142-147` 定义为 `uint32_t min; uint32_t max;`，原始 NEON A 也按这个布局访问。
- **后果（从布局推断，尚未运行实测）：** 若参数按 XNNPACK 布局初始化，Bopt 读到的 `scalar.max` 是 uint32 `min` 的第 1 个字节（小端，min < 256 时为 0），读到的 `scalar.min` 是 uint32 `min` 的最低字节。于是 clamp 的上界变成 0，输出全部为 0。
- **为什么之前没测出来：** rvv_ptr_lower 的差分测试为了能用 SALTy harness 编译，删掉了 Bopt 自带的 struct 定义，改用 XNNPACK 的定义，这个不一致因此被掩盖（见 `research/project-plan-20261102/rvv-ptr-lower-20261104/RESULTS.zh-CN.md`）。上游 SALTy harness 无法直接编译这个 Bopt 文件。
- **对 E1 的影响：** `equivalent` 中两侧共用同一个 params 对象，ABI 必须统一以 XNNPACK 为准，因此原样的 Bopt u8-vclamp 大概率与 A 不等价。需要单独判定，并用实际运行确认。
- **状态：** 待判定，尚未运行实测。

## 修复计划（尚未执行）

1. **先实测确认。** 保留 Bopt 自带的 `uint8_t` 布局，用 XNNPACK 的 `xnn_init_qu8_clamp_scalar_params` 初始化参数，在 QEMU 上运行原版 Bopt，与 A 比较。不能沿用删掉 Bopt 自定义 struct 的差分测试配置。
2. **如果确认不一致：** 按 L1 流程，XNNPACK 会正常产生这组参数，所以反例有效，偏离方是 Bopt。E1 结论记为"原始 A ≠ Bopt"。
3. **最小修复 Bopt_fixed：** 把 Bopt 的 params 定义改成 XNNPACK 的 `uint32_t min/max`，读取后显式截断为 uint8，这也是 A 的做法。只改参数读取，不改向量主体。
4. **验证：** 证明 A ≡ Bopt_fixed。注意 A 本身还有 XNN-001 的尾部顺序问题，因此实际要验证的是 A_fixed ≡ Bopt_fixed，并分别列出两处修复各自的作用。
5. **性能：** 只改了循环外的标量参数读取，预计没有影响，但仍要在 Saturn RTL 上实测，并记录结果。
6. **上游：** Bopt 来自 SALTy 作者（Keagan），是否告知由用户决定。
