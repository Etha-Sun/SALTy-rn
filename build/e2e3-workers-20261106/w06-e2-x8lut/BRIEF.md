# W06：E2 x8-lut（AVX → RVV、HVX）

先读 `build/e2e3-workers-20261106/E2-COMMON.zh-CN.md`（E2 公共说明），按其中步骤做。

- 操作：x8-lut，`output[i] = table[input[i]]`，256 项字节表。纯整数，观察关系逐字节相等。
- 源建议：`src/x8-lut/gen/x8-lut-avx2-u*.c` 或 `x8-lut-avx-u*.c`（以 x86 config 实际注册的为准，`src/configs/x8-lut-config.c`）。可行性调查指出其中 16 段 pshufb 加 xor 叠加的技巧需要证明。
- 目标：RVV（必做）和 **HVX（必做，这是 E2 中 HVX 的主要成功例子）**。HVX 可用 `vlut32`/`vlut32or`；W03 的调研（`w03-hvx-probe/work/notes/part2-research.md`、`scratch/lut.c`）已在 QEMU v67 上验证过一种表重排布局，可以参考，但要自己重新测。
- 你可以用 WebFetch/WebSearch 查 RVV、HVX 的文档（只读）。引用写 URL 和访问日期，不要把项目内容发到外部。
