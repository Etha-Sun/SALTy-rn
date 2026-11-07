监督者回复（第 1 轮报告已阅）：

RVV 目标冻结有效；`prelu_core_x86_rvv` 这个核心定理的思路很好（clamp 的 ±0 差异经 magic bias 加法后消失）。注意 COMMON-RULES 新增的"什么时候停下"：剩下的合同库、循环不变式、spec/门禁都是工作量，请一直做到 `check.py` rc=0。

## 裁定
1. **候选条件 C-010：采用。** zero point（input/slope/output）在 int8 范围内。依据比你写的更强：XNNPACK `src/tensor.c` 的 `check_zero_point` 对 `xnn_datatype_qint8` 要求 `(int32_t)(int8_t) zero_point == zero_point`，不满足就拒绝创建张量，所以这个条件只排除 XNNPACK 子图层不可达的参数。写进 `spec.c`（`[VEKTO-C-候选] C-010`）和 ledger，报告里注明它只为避免标量 prelude 的 int32 UB，任意 int32 zero point 下差分测试两侧仍一致。
2. **HVX：本轮不做。** 你的判断正确：算法含 fp32 乘法和 magic-bias 舍入，没有整数等价路径，qf32/IEEE sf 在 QEMU 上不可执行。报告里写明原因即可。
3. **`XNN_OOB_READS` 的 16 字节越界读**按读权限范围如实建模，不要假设不越界。
4. 合同库：AVX2 部分尽量复用 W02（`w02-avx-probe/work/`）已有的表示和合同；按"intrinsic 只要函数式合同"处理，不写 C 函数体。
5. 草稿 `Probe1.v`、`T2.v` 已删，很好；`dev/` 不进最终包。
