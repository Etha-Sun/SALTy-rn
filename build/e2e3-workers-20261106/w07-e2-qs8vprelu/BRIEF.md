# W07：E2 qs8-vprelu（AVX2 → RVV、HVX）

先读 `build/e2e3-workers-20261106/E2-COMMON.zh-CN.md`（E2 公共说明），按其中步骤做。

- 操作：qs8-vprelu。这是唯一满足严格选样条件（NEON、RVV、HVX 三端都没有）的操作，论文中要单独标注。
- 源：`src/qs8-vprelu/gen/qs8-vprelu-avx2-u16.c`（确认 `src/configs/binary-elementwise-config.c:1430-1457` 的注册）。可行性调查：28 种 intrinsic、108 处调用；tail 用 16 字节 `_mm_loadu_si128` 且标 `XNN_OOB_READS`；magic-bias 舍入，clamp 后饱和 pack；params 初始化在 `src/microparams-init.c:937-960`；scalar 参考 `qs8-vprelu-scalar-u*.c`，测试 `test/qs8-vprelu.cc`。
- 目标：RVV（必做），HVX（尝试，整数路径优先；如果源算法中有浮点步骤，先判断能否用整数等价实现，不能就按 HVX 浮点的规定处理）。
- 观察关系：逐字节相等。`XNN_OOB_READS` 的越界读要在合同里如实建模（读权限范围），不能假设不存在。
- 你可以用 WebFetch/WebSearch 查 RVV、HVX 的文档（只读）。
