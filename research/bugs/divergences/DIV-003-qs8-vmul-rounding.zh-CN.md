> 监督者审核后收录（2026-11-05）。原草稿：`build/e1-workers-20261104/w12-triage-a/DRAFT-DIFFERENCE-qs8-vmul-minmax-fp32.zh-CN.md`。两侧舍入策略不同，差 1 落在 XNNPACK tester 允许的 ±1 范围内。

# 草稿：qs8-vmul 的精确舍入差异（未认定为 XNNPACK 数值契约 bug）

状态：原始 A ≠ Bopt 已经真实 QEMU 确认；XNNPACK 测试允许本轮差异。请监督者决定后续修复目标，本轮不放宽 spec、不修改程序。

## 发现途径、版本与最小输入

E1 准备阶段 SALTy harness 差分先给线索，本轮用真实 XNN init 和原始 A/Bopt/lowered 复现。Bopt 为 `80feb4564cb470de301062109b6f89db672bdf9d`，A 为 SALTy `be16280c7`，XNNPACK 为 `867d5a344790802ee067be62f572c2e2722bf6fb`；哈希见 [commands](evidence/run1/commands.json)，原件见 [快照](evidence/final-audit1/inputs/qs8-vmul-minmax-fp32/)。

```text
batch=1; a[0]=1; b[0]=1
a_quantization = {zero_point=0, scale=0.5}
b_quantization = {zero_point=0, scale=1}
y_quantization = {zero_point=1, scale=1}
init = xnn_init_qs8_mul_minmax_scalar_params
=> azp=bzp=0, scale=0.5, ozp=1, min=-128, max=127
A=1; XNN scalar=1; xnn_qs8_requantize_fp32=1; Bopt=2; lowered=2
```

输入缓冲区留有 A 所需的 8-byte 尾读空间，各输出有 canary。所有三个 VLEN 均复现，原版和改写版六份日志完全一致。形状 `[2]` 的同形 tensor 复制该元素，非广播算子路径得到 A/参考 `[1,1]`、Bopt `[2,2]`，见 [operator witness 日志](evidence/operator-run1/qs8-vmul-minmax-fp32/Bopt/vlen128.log)。

## 接口、可行性和语义判定

源码位置相对于固定 XNNPACK 根 `/zp_vegeta/scratch_sb/ycsun/verus/benchmark/XNNPACK/`：

- params 布局为 `src/xnnpack/microparams.h:350` 的 `.scalar`。A/Bopt/harness 均读取相同字段，**不是 union 布局错配**。不得把 rndnu_neon init 的输出传给这个 fp32 核。
- API `include/xnnpack.h:2588` → create `src/operators/binary-elementwise-nd.c:225` → init `:162`（检查 normal、正 scale）、`:199`（config init）→ `src/microparams-init.c:1052`。init 要求 product/output scale 属于 `[2^-16,2^8)`，最小反例 0.5 满足。zero points 都在 int8 域内。
- FP32 核和 scalar initializer 的显式配对在 `src/qs8-vmul/qs8-vmul-minmax-fp32.inc:9`；RVV operator config `src/configs/binary-elementwise-config.c:1416` 也用 scalar init。**AArch64 operator 默认选 rndnu NEON 核和另一 init**（`:1369` 起），本 E1 原始 A 是独立的 fp32 NEON 变体，不能将其表述成默认 AArch64 dispatch。当前 API 同样接受上述量化配置，且 RVV fp32 路径能得到它。
- 非广播选择与调用为 `src/operators/binary-elementwise-nd.c:382`、`:402` → `src/operator-run.c:1225`。两元素补充输入保证走 op_ukernel。
- A 先独立 `vmul`，再 magic-bias RNE 整数舍入，最后加 ozp；最小反例是 `RNE(0.5)+1=1`。Bopt 在 `qs8-vmul-minmax-fp32.c:89`（主循环 `:52` 和 `:68` 亦然）先 FMA 加 ozp，再转整数：`RNE(0.5+1)=2`。整数平移遇到 ties-to-even 时，奇数 ozp 会改变 tie 的奇偶选择。
- `src/xnnpack/requantization.h:30` 的 XNN fp32 参考先 `lrintf(scaled_input)` 再加 zero point，输出 1。A 的函数体与 `src/qs8-vmul/gen/qs8-vmul-minmax-fp32-neon-ld64-u8.c` token 一致。
- 但是 `test/vbinary-microkernel-tester.cc:380` 采用上述参考，`:390` **允许与离散参考相差 1**，且 `:392` 允许与夹紧浮点参考相差 1.0；本反例的 Bopt 输出 2 满足二者。因此不能仅由“偏离精确 scalar”认定违反 XNNPACK 自己的测试数值要求。它仍不满足 E1 的精确输出等价关系。

对 5 组真实 init 参数各穷举 65536 个 int8 输入对，Bopt 最大误差 1，本轮 XNN 测试容差违规计数全为 0；scale=0.5、ozp=1 时 1296 个精确差异，scale=0.02、azp=5、bzp=-3、ozp=7 时 1243 个。A 与两个参考在所有本轮用例精确相同。该有限测试**不证明** Bopt 在全域都满足容差。

## 后续方案 / 修复计划（未实施）

1. 若维持当前 E1 精确等价目标，应修 Bopt 为与 A 一样的独立乘法、magic-bias 舍入、加 zero point 和饱和顺序，主循环两块和尾部都要覆盖。`A ≡ Bopt_fixed` 是后续独立目标。
2. 若监督者希望采用容差契约，需提交独立的 spec/观察关系审查，不能由本 worker 自动把“不等价”改成通过。还需证明全域误差界，本轮抽样不能替代。
3. 本轮只分诊，因此没有生成补丁。若批准修复，在新的候选目录保存 `proof/repair-bopt.patch`，保留此处原件，并用规则工具重生 lowered。
4. 修 Bopt 后必须实测性能；本轮未测。当前不建议向 XNNPACK 报此为库 bug。若后续联系 Bopt 作者或上游，需用户同意。

对 E1 结果：原始精确等价目标保留合法反例；不能加强“输出 zero point 为偶数”等没有真实 API 保证的前提。旧修复中的 NaN scale、越界 output zero point 和超大 scale 反例不适用于本轮真实 init 域，也不作为本轮依据。
