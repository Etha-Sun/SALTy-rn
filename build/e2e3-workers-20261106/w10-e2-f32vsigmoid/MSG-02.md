监督者回复（第 1 轮报告已阅）：

源的选择正确（consistent 路径用 AVX `rr2_p5_div_u16`），目标冻结有效，逐 lane 定理 `avx_lane = rvv_lane` 是好的数学核心。但本轮结论是"未完成"：QCP 层（两个 C kernel 的函数级证明）是这个任务的主体。请读 COMMON-RULES 新增的"什么时候停下"和"进程清理"两节，一直做到 `check.py` rc=0。

## 裁定
1. **QCP 层的做法：** 两侧都必须用统一规则工具 `tools/rvv_ptr_lower`（v1.6；x86 用 `--isa x86`）的输出进入 QCP，不能手写 QCP 用的 C。逐 lane 定理保留，作为桥接引理在函数级证明里使用。check.py 的 rc=3 中间状态可以保留作开发用，但最终必须 rc=0。
2. **x86 源里的 `XNN_FORCE_REALIZATION`（12 处）：** 规则工具会以 MACRO 拒绝。已批准新规则 **R27**（删除模板为空、无输出、只有输入操作数、无 clobber 的 asm；XNNPACK 在非 GNUC 下本来就把这个宏定义为空），工具 worker 会在 v1.7 之后实现，合入仓库后我通知你。**在此之前先完成 RVV 侧**（目标）的全部 QCP 证明，三个 VLEN；x86 侧可以先在 probe 里用"宏为空"的预处理结果推进合同和证明结构，标明是探针，R27 合入后用工具输出重新生成并核对一致。
3. **intrinsic 合同：** 只要函数式合同，不写 C 函数体（COMMON-RULES 第 4 条）。AVX 部分尽量复用 W02（`w02-avx-probe/work/`）的表示，RVV f32 部分复用 W01 模板（`w01-v2-template/work/f32-vadd-v2/`）。
4. **config 的 RVV 条目：** 不改仓库。"在 `f32-vsigmoid.inc` 加 RVV 条目"作为上游建议写在报告里即可。scalar 回退是另一种算法（lut64_p2），只作为性能基线，不作为等价对象，你的处理正确。
5. `Witness.v` 的改写：如果新写法确实与原来等价或更强，可以，报告里写清楚理由（你已写）。
