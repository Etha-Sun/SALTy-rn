# W03：HVX shim 的最小 probe 与语义可建模性调查

## 背景
E2 需要把 AVX 操作迁移到 HVX，E3 也有涉及 HVX 的配对。用户希望至少有一个 HVX 成立的例子；实在建不了模的操作可以只做 RVV。

## 第一步（probe）
- HVX 向量是 1024 位（128B 模式），即 32×f32 或 128×i8。用数组字段表示，float 用比特 lane（见 QCP-001），合同用列表谓词表示，规模与 lane 数无关。参考 `research/project-plan-20261102/rvv-array-vector-probe-20261104/`。
- 用 XNNPACK `src/s8-rminmax/gen/s8-rmax-hvx-u256-acc2.c`（整数精确，最简单）走通"生成 VC 并全部证完"；如果该文件结构不合适，换用 `src/f32-vabs/gen/f32-vabs-hvx.c`，并说明理由。
- 用 zig 把 XNNPACK 的 HVX kernel 交叉编译到 hexagon-linux-musl，在 qemu-hexagon（`-cpu v67`）上运行。确认我们写的 C 语义与它在 v67 上的实际输出一致，做差分测试（测试证据，不是证明）。

## 第二步（调查，写进报告）
1. **qf32 中间格式**：哪些 XNNPACK HVX kernel 用到（`__HVX_ARCH__ >= 68/73` 的分支）？qf32 的语义有没有公开文档，能否用 Flocq 建模？在 QEMU 7.2（只到 v67）上跑不了的路径，应该怎样标注？
2. **近似除法**：`src/xnnpack/simd/f32-hvx.h` 中的 `xnn_div_f32` 实际是 `a*fast_inverse(b)`。精确语义是什么？能否建模？
3. 对 E2 短名单（qs8-vprelu、f32-vsigmoid、f32-velu、f32-ibilinear、x8-lut）逐个判断 HVX 目标是否可以建模、验证，给出最有希望成功的 HVX 例子。

## 完成标准
- probe 的 VC 全部证完；qemu-hexagon 差分测试通过，或者报告差异。
- `REPORT.md`：HVX shim 设计、环境前提（`__HVX_ARCH__`、向量长度）、可建模性的结论和依据（源码行号、文档链接），以及对 E2 选样的建议。
