# W10：E2 f32-vsigmoid（AVX2 → RVV）

先读 `build/e2e3-workers-20261106/E2-COMMON.zh-CN.md`（E2 公共说明），按其中步骤做。

- 操作：f32-vsigmoid。
- 源：x86 config 中 consistent-arithmetic 路径实际选用的 kernel（可行性调查提到 `avx_rr2_p5_div`，目录中有 `f32-vsigmoid-avx2-rr1-p5-div-u*.c`；`src/configs/unary-elementwise-config.c:1955-2003` 附近）。选带真除法的版本，不选 `nr1fma`/`nr2fma` 牛顿迭代版，除非 config 证明默认用的是后者——那样要先报告。
- 目标：**只做 RVV**（HVX 不在本轮范围：HVX 的除法是近似的 `fast_inverse`）。RVV 用 `vfdiv`（IEEE 正确舍入），与 `_mm256_div_ps` 一致。
- 观察关系：float 逐位相等（NaN 按默认规则）。
