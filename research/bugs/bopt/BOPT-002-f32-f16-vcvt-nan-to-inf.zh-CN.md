> 监督者审核后收录（2026-11-05）。原草稿：`build/e1-workers-20261104/w12-triage-a/DRAFT-BOPT-f32-f16-vcvt.zh-CN.md`。证据目录在 W12 worker 目录 evidence/ 下。

# 草稿：Bopt f32-f16-vcvt 将 NaN 转成 Inf

状态：真实 intrinsic + QEMU 已确认；待监督者审核和正式编号。仅分诊，没有修改程序、spec 或对外报告。

## 发现途径与固定身份

E1 原始 NEON A ⇔ 最终优化 RVV Bopt 的准备阶段，上游 SALTy harness 差分测试先给出线索；本 worker 用单元素输入和原始 A、Bopt、规则改写版重新确认。不是由 QCP 证明失败产生的反例，也不是新发现的未知根因：复用清单已指出 Bopt 缺少旧版 NaN 路径。

- A：SALTy-rn `be16280c7` 的 `kernels/source/f32-f16-vcvt.c`。
- Bopt：optimized-rvv-kernels `80feb4564cb470de301062109b6f89db672bdf9d` 的同名文件。
- XNNPACK：`867d5a344790802ee067be62f572c2e2722bf6fb`。
- 源文件 SHA256、未改动快照、可执行文件与日志哈希分别见 [commands](evidence/run1/commands.json)、[快照](evidence/final-audit1/inputs/f32-f16-vcvt/)、[manifest](evidence/final-audit1/manifest.json)。

## 最小反例和运行证据

`batch=4` 字节、一个有效 float、位模式 `0x7fc00000`，输出一个 uint16；为 A 的尾读准备至少 4 个可读 float。params 未使用，传 NULL。

| 实现 | 输出 |
|---|---|
| 原始 A，AArch64 QEMU，FPCR=0 | `0x7e00`（NaN） |
| XNNPACK scalar-bitcast-u1 | `0x7e00`（NaN） |
| Bopt，RVV QEMU，frm=0 | `0x7c00`（Inf） |
| 规则改写版 + 真实 intrinsic 包装头 | `0x7c00`（Inf） |

VLEN 128/256/512 全部重现，Bopt 与改写版六份日志逐字节相同。负 qNaN 和正/负 sNaN 也重现；不是仅 payload 或 NaN 符号的差异。65536 个确定性随机位模式中，287 个差异全部来自 NaN；其余实测输入相同，不将其扩称为有限输入全域证明。

日志：[A](evidence/run1/f32-f16-vcvt/A/vlenNone.log)、[Bopt](evidence/run1/f32-f16-vcvt/Bopt/vlen128.log)、[改写版](evidence/run1/f32-f16-vcvt/lowered/vlen128.log)。重跑：`python3 evidence/run.py evidence/replay-NEW`，输出目录必须是新的。

## L1：能否在原应用出现

以下源码位置均相对于固定 XNNPACK 根目录 `/zp_vegeta/scratch_sb/ycsun/verus/benchmark/XNNPACK/`：

1. API `include/xnnpack.h:2627` 提供 `xnn_create_unary_elementwise_nc`，创建时不检查将来输入数组的数值。
2. `src/operators/unary-elementwise-nc.c:95` 对 fp32→fp16 的 convert 选择 f32-to-f16 config；`:253` 的 init_op 取得 config，`:274` 只有存在 init 时才调用初始化函数。
3. `src/f32-f16-vcvt/f32-f16-vcvt.inc:9` 注册原软件 NEON 核，init 为 NULL；该操作没有 params 布局可供 harness 填错。实际 config 的 ARM 路径在 `src/configs/unary-elementwise-config.c:2373`，AArch64 默认用 neonfp16 硬件变体，不冒充为本实验的原软件 A。
4. `src/operators/unary-elementwise-nc.c:440` 将配置和 params 放入 context；`src/operator-run.c:1357` 直接把输入内存、字节数和 params 传给 ukernel，没有 NaN 过滤。

因此 NaN 是可到达的输入，不能新增“无 NaN”前提。

## 偏离方与根因

`src/f32-f16-vcvt/gen/f32-f16-vcvt-scalar-bitcast-u1.c:38` 定义 `vnanh=0x7e00`，尾部以 `vnonsignw > vexpw_max` 判断 NaN 并选择它。`test/unary-ops.h:133` 的 Convert 参考返回输入值，`test/vunary-microkernel-tester.h:122` 对 NaN 参考结果要求输出仍是 NaN。即便放弃 payload 比较，Inf 也不满足此要求。

A 保留了该分类/选择路径，Bopt 的软件流水和 final drain 都没有。RVV 浮点计算把 NaN 规范化后，随后提取位段的算法产出 `0x7c00`。本轮判定 Bopt 偏离，未发现 A 在该反例上偏离。

A 并非与 XNN 原文件逐字相同：SALTy 删除 4 条 XNN_FORCE_REALIZATION、显式输出指针 cast，并去掉尾部的 branch hint。准确差异见 [body diff](evidence/final-audit1/f16-A-vs-XNN-body.diff.txt)；本反例涉及的 NaN 路径相同。

## 修复计划（未实施）

- 最小方向：在 Bopt 主循环和 final drain 各恢复基于输入 abs bits 的 `>0x7f800000` mask，并在拼接 sign 前将对应 half 结果选择为 `0x7e00`；不能只修尾部。
- 本轮禁止修改程序，因此**没有生成或应用补丁**。监督者批准后，补丁应单独放在新的候选目录 `proof/repair-bopt.patch`，原版使用此处保存的快照；改写版必须由规则工具重新生成。
- 后续目标为 `A ≡ Bopt_fixed`，保留 `A ≠ Bopt`。必须做三个 VLEN、跨多轮流水、正负 qNaN/sNaN 和有限边界回归，再进行 QCP 证明。
- 性能未测；修复 Bopt 后必须实测同平台原版/修复版，不声称没有代价。
- 若对外报告，目标是 Bopt 仓库维护者，需用户同意；当前未联系任何人。

对实验结论的影响：原始 E1 目标有合法反例；本轮不计整核证明通过，修复后的结论尚不存在。
