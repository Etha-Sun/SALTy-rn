# E2 公共说明（监督者，2026-11-07；所有 E2 worker 必读）

## E2 是什么
XNNPACK（`benchmark/XNNPACK`，`867d5a34`）中某个操作在 x86 上有成熟的 SIMD 实现（源，AVX/AVX2/SSE），而 RVV 和 HVX 上没有原生 kernel（config 回退到 scalar）。E2 = **由你（agent）生成 RVV / HVX 目标实现，并证明源 ⇔ 目标等价**。依据：`research/project-plan-20261102/EXPERIMENT-DESIGN.zh-CN.md` 的 E2 节、`feasibility-e2-e3-e4-20261104/REPORT.zh-CN.md` 第 2 节、`INTRINSIC-REVIEW-AND-E2-E3-PLAN-20261105.zh-CN.md` 第 3 节。

## 步骤
1. **确定源。** 在 x86 config 中找到 XNNPACK 实际注册的那个 kernel（注意 consistent-arithmetic 路径），记录 config 文件和行号；brief 里给的是建议，以 config 为准，偏离要说明。源原样放进 `impl/`，记录 sha256。同时确认 RVV、HVX 的 config 确实回退到 scalar（记录行号）。
2. **生成目标。** 目标是新写的 C 代码（这是 E2 的成果，不受"源码只能由规则工具改写"的限制；但目标一旦冻结就不能再手改，后续适配 QCP 同样只能走规则工具）。要求：
   - 签名、params 结构、`XNN_OOB_READS` 等约定与源和 scalar 版一致，风格像 XNNPACK 的 `gen/` 文件，可以直接放进 XNNPACK 编译。
   - **逐操作沿用源的算法**：同样的常数、同样的运算顺序、同样的 FMA/非 FMA 选择，使源和目标在 IEEE 语义下逐位相同（NaN 按观察关系处理）。不要换成"更好"的算法；如果目标 ISA 没有对应指令，用等价的指令序列，并在报告里说明。
   - RVV：向量长度无关（`vsetvl`），说明 LMUL 选择；必须在 VLEN 128/256/512 下都正确。HVX：128 字节向量，整数优先；浮点 HVX 只按 best effort 做（见下）。
3. **测试后冻结。** 差分测试：目标（QEMU）对 scalar 参考和对 x86 源（本机直接运行）逐位比较，覆盖 batch 的边界（0 除外的小值、非整倍数尾部、多个 VLEN 倍数）、特殊值（±0、±Inf、NaN、denormal、饱和边界）和随机输入。通过后**冻结**：记录 sha256，写进 `ledger.json` 的 `target_generation`，包括生成尝试次数、每次失败原因（编译失败/差分不一致/语义问题）。冻结后若发现问题需要改目标，算一次新尝试，重新差分并更新 sha256。
4. **证明等价。** v2 布局（样板 `build/e2e3-workers-20261106/w01-v2-template/work/f32-vadd-v2/`），`impl/` 放源原版和冻结后的目标。两侧都用统一规则工具 `tools/rvv_ptr_lower`（v1.6；x86 用 `--isa x86`）改写；工具拒绝而又必须处理的构造，在报告里提出新规则，不要自己写草稿工具进最终包。观察关系默认逐位相等（float 用"数值相等或两边 NaN"），不得放宽。RVV 三个 VLEN 都要检查。
5. **白名单**用 `build/e2e3-workers-20261106/assumptions-allowlist.STANDARD.txt`（用户已批准）；新 QCP `Parameter` 列出即可，新 `Axiom` 必须单独报告。

## intrinsic 合同
按 COMMON-RULES 第 4 条：intrinsic 只要函数式合同，不需要 C 函数体；平凡转发的 `xnn_*` wrapper 可进合同库（脚本检查）。多个 worker 同时在写合同，所以你把合同写在自己 `work/` 下按 ISA 分文件（`contracts/avx.h`、`contracts/rvv.h`、`contracts/hvx.h` 和对应 Coq 模型），每个具名 Coq 函数配差分测试；监督者之后统一合并成共享库。尽量复用已有的：W01（RVV f32）、W02（AVX，`w02-avx-probe/work/`）、W03（HVX，`w03-hvx-probe/work/s8-rmax-hvx-v2/`）、W04（RVV/NEON s8，`w04-e3-s8rmax/work/`）。

## HVX 浮点
QEMU（7.2 和 11.1.3，后者在 `research/sol-pipeline-comparison-20261030/tools/qemu-11.1.3-dl/x/usr/bin/qemu-hexagon`，`-cpu v68..v73`）都没有实现 HVX qf32 和 IEEE sf 指令；zig 编译 qf32 需 `-mcpu=hexagonv73+hvxv73+hvx_length128b+hvx_qfloat`。所以浮点 HVX 目标没有可执行的差分对象：如果做，qf32 语义必须作为"未经执行验证的建模前提"写进 ledger，并在报告里单列。先保证 RVV，再做 HVX。

## 性能
本轮不测性能。在 ledger 里记下性能基线应当是 config 回退的哪个 scalar kernel，留待以后。

## 报告
按 COMMON-RULES 的格式。另外写明：源 kernel 及其注册位置、目标生成的尝试记录、新增 intrinsic 合同清单、新增 Coq 引理和前端改动（E2 要统计增量成本）、遇到的 QCP 问题。
