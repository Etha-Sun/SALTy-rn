# W08：E2 f32-ibilinear（SSE → RVV、HVX）

先读 `build/e2e3-workers-20261106/E2-COMMON.zh-CN.md`（E2 公共说明），按其中步骤做。

- 操作：f32-ibilinear（间接指针结构的双线性插值）。
- 源建议：`src/f32-ibilinear/gen/f32-ibilinear-sse-u8.c` 或 `-sse-u4.c`（以 x86 config 实际注册的为准，`src/configs/ibilinear-config.c`）。注意源是 SSE（128 位），不是 AVX；E2 设计称"AVX 源"，偏离要在报告中说明。
- 目标：RVV（必做），HVX（best effort，浮点，见公共说明的 HVX 浮点一节）。
- 观察关系：float 逐位相等（NaN 按默认规则）。注意源是否用了 FMA，目标必须一致。
- 你可以用 WebFetch/WebSearch 查文档（只读）。
