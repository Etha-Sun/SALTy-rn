# W02：x86 AVX shim 的最小 probe，以及 E3-22 正对照

## 背景
E2 的源实现是 AVX，E3 有 NEON↔AVX 配对。现在还没有 x86 的 QCP shim。旧服务器上的草稿已经丢失，要从头建。

## 第一步（probe）
- 设计 AVX 向量（`__m256`，8×f32）的 C shim 表示。选项有逐字段表示和数组字段加比特 lane（参考 RVV probe `research/project-plan-20261102/rvv-array-vector-probe-20261104/`，以及 bug 记录 `research/bugs/qcp/` 里的 QCP-001/002）。确认按值传递 `__m256` 是否会触发 QCP 已知的按值 struct 问题。如果会，就写出"需要扩展规则工具到 x86 类型"的规则草案，这次 probe 允许先用工具已有能力做的等价形式验证表示可行，但必须在报告里说明。
- 用 XNNPACK `src/f32-vabs/gen/f32-vabs-avx.c`（已注册，见 `src/configs/unary-elementwise-config.c:834`）走通"生成 VC 并全部证完"一遍。

## 第二步（正对照 E3-22）
`src/f32-vlrelu/gen/f32-vlrelu-neon-u8.c`（A）↔ `src/f32-vlrelu/gen/f32-vlrelu-avx-u16.c`（B），按 v2 布局做整核等价（参考 `build/e2e3-workers-20261106/w01-v2-template/work/f32-vadd-v2/`；如果 W01 还没完成，就先按 v1 布局做，最后再迁）。NEON 侧可以复用 `build/qcp-kernel-framework/verification/qcp/` 里 f32-vlrelu 的 NEON 解法，但必须针对 XNNPACK 原版重新验证。注意 AVX 的 `blendv` 按符号位选择、尾部的 maskload，以及 ±0 的处理。

## 完成标准
- probe：vabs-avx 的全部 VC 证完，并写清 shim 设计（表示、合同模板、intrinsic 清单）。
- E3-22：从空目录运行 `proof/check.py`，rc=0；或者给出确切反例，并按 L1 分析。
- `REPORT.md` 说明 x86 环境前提（MXCSR）、`__m256` 按值传递的结论、新增 intrinsic 合同清单（交监督者审核）。
