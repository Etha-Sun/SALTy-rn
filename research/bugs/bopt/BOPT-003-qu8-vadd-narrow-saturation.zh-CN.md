> 监督者审核后收录（2026-11-05）。原草稿：`build/e1-workers-20261104/w12-triage-a/DRAFT-BOPT-qu8-vadd-minmax.zh-CN.md`。证据目录在 W12 worker 目录 evidence/ 下。

# 草稿：Bopt qu8-vadd 的有符号截窄与无符号饱和不匹配

状态：真实 intrinsic + QEMU 已确认；待监督者审核和正式编号。仅分诊，没有修改任何程序或 spec。

## 发现途径与固定版本

E1 原始 A ⇔ 最终 Bopt 准备阶段，上游 SALTy harness 的 255 对 0 差分先给线索；本轮通过固定 XNNPACK init 重建参数后，在两条乘数分支确认。不是证明失败得到的反例。旧复用清单已有负值 reinterpret 的线索，本轮补足真实调用可行性和运行证据。

A 来源 SALTy-rn `be16280c7`；Bopt 来源 optimized-rvv-kernels `80feb4564cb470de301062109b6f89db672bdf9d`；XNNPACK 为 `867d5a344790802ee067be62f572c2e2722bf6fb`。文件哈希、未修改快照在 [commands](evidence/run1/commands.json)、[inputs](evidence/final-audit1/inputs/qu8-vadd-minmax/)、[manifest](evidence/final-audit1/manifest.json)。

## 最小反例

一个 uint8 元素，`batch=1, a[0]=0, b[0]=0`，A 的输入各分配至少 8 个可读字节；输出独立且有 canary。量化参数为：

```text
a_quantization = { zero_point=1, scale=1.0 }
b_quantization = { zero_point=0, scale=1.0 }
y_quantization = { zero_point=0, scale=1.0 }
```

直接调用原始 `xnn_init_qu8_add_minmax_scalar_params` 得：`am=bm=1048576, shift=20, bias=-524288, ozp=0, min=0, max=255`。

| 实现 | 输出 |
|---|---|
| 原始 A，AArch64 QEMU | 0 |
| XNN scalar-u1 / 测试参考 xnn_qu8_quantize_add | 0 / 0 |
| Bopt，RVV QEMU VLEN 128/256/512 | 255 |
| 规则改写版，三个 VLEN | 255 |

原版和改写版所有日志逐字节相同。`b_scale=0.5` 得 `bm=524288`，在不同乘数的 fallback 分支也得到同一反例。

单元素算子会走 broadcast kernel，故另用形状相同的两个 2 元素 tensor，所有元素重复上述值，确认非广播 op_ukernel 的可达调用：A/参考为 `[0,0]`，Bopt/改写版为 `[255,255]`。[operator witness](evidence/operator-witness.c)、[补充命令](evidence/operator-run1/commands.json)、[Bopt 日志](evidence/operator-run1/qu8-vadd-minmax/Bopt/vlen128.log)。

## 根因和第二类已测差异

Bopt `qu8-vadd-minmax.c:58` / `:87` 使用不饱和的 `vnsra`，随后 `vreinterpret_i16_u16` 和 `vnclipu`。最小反例中：`vacc=-524288`，右移 20 得 -1，reinterpret 后变为 65535，unsigned clip 得 255。A 的 signed→unsigned 饱和 `vqmovun_s16` 应得到 0。

只补“负值置零”仍不够。合法 scales=255、zero points 全为 0 时，init 得 `am=bm=2088960, shift=13`；`a=3,b=255` 应饱和为 255，Bopt 却为 254：右移结果 65790 被 `vnsra` 截成低 16 位 254。该输入已在 `exhaust-large` 中真实运行（第 1023 lane）；该参数组遍历全部 65536 个输入对，有 253 个差异。

## L1：真实调用与参考语义

以下位置相对于 `/zp_vegeta/scratch_sb/ycsun/verus/benchmark/XNNPACK/`：

1. `include/xnnpack.h:2588` 定义 binary create API，可传入上述合法 uint8 zero points 和正的 normal scale；`src/operators/binary-elementwise-nd.c:134` 的初始化逻辑仅要求提供量化参数并检查 scale 有限、正、normal（`:162` 起），反例全部满足。
2. 创建函数 `src/operators/binary-elementwise-nd.c:225` 调用 init；`:197` 为第二输入施加 sign_b，add 的 sign_b=1；`:199` 实际调用 config init。
3. `src/configs/binary-elementwise-config.c:1459` 起选择 qu8 vadd kernel，NEON、RVV 等使用同一 `xnn_init_qu8_add_minmax_scalar_params`；布局在 `src/xnnpack/microparams.h:333`。init 实现 `src/microparams-init.c:830` 生成 shift 12..30、合法乘数、bias 和输出范围。本轮链接并执行原函数，没有手填 shift 或乘数。
4. `src/operators/binary-elementwise-nd.c:382` 复制 params；`:402` 对同形、非广播输入选择 op_ukernel；`src/operator-run.c:1225` 按字节数和原输入直接调用。没有将低输入过滤掉。
5. `src/xnnpack/requantization.h:184` 的测试参考先算 bias/乘法/右移，再加 ozp、夹到 `[min,max]`；`test/vbinary-microkernel-tester.cc:173` 计算此参考、`:183` 要求精确相同。标量核也相同。A 函数体 token 与 `src/qu8-vadd/gen/qu8-vadd-minmax-neon-ld64-u8.c` 一致（忽略注释/空白，函数签名名不参与）。

因此反例可行，偏离方是 Bopt，不加强输入域，不修 A。上游 harness 虽手填 `shift=2,am=2,bm=3`，而真实 init 不会生成这种精度的乘数，但换成真实 init 后问题仍存在。

## 修复计划（未实施）

- 保留 signed 32-bit 右移结果，先按最终 `[0,255]` 或 `[output_min,output_max]` 夹紧，再安全截窄；或恢复与 A 对应的逐级 signed 饱和、ozp 加法与 signed→unsigned 饱和。不能仅把 reinterpret 前的负数清零，因为还有正数截断问题。
- 还需审核 `:36` 的 `out_zp << shift` 和 fused_bias：真实 init 可给出 shift=30、ozp=128，这个 signed 左移不能作为一般 C 层有定义的运算。本轮主反例用 ozp=0、shift=20，没有该 UB，故负值饱和结论不依赖它。该附加 UB 项目前是源码判读，未做 UBSan 运行，不计为独立实测 bug。
- 本轮明确禁止程序改动，故**没有补丁文件**。批准后应在新的候选目录保存 `proof/repair-bopt.patch`，固定原件用此处快照，规则改写输出由工具重生。
- 后续分别证明 `A ≡ Bopt_fixed` 和 init 约束覆盖；回归须含两种乘数分支、负饱和、超过 65535 的正值和不同长度/VLEN。
- Bopt 修复后必须实测原版/修复版性能；本轮未测，不能承诺无代价。若对外向 Bopt 作者报告，必须先征得用户同意。

原始结论保持 `A ≠ Bopt`；修复和修复后证明都尚未完成。本记录不写入共享 research/bugs/。

## 更新（2026-11-05，W18）

> 来自 `build/e1-workers-20261104/w18-qu8vadd-fix/DRAFT-BOPT-003-UPDATE.zh-CN.md`，监督者审核后附加。

# BOPT-003 修复与附加 UB 证据（W18，待监督者审核）

发现途径：E1 原始 NEON A ⇔ Bopt；沿用 W12 的真实 intrinsic 反例，本轮实施已获授权的修复和独立回归。不是新的完整配对证明结果。

固定版本：A SALTy-rn be16280c7；Bopt optimized-rvv-kernels 80feb4564；XNNPACK 867d5a34。原件、补丁和 sha256 位于候选 proof/provenance、proof/repair-bopt.patch 和 evidence/sha256.json。未修改 A。

## 反例、真实调用与偏离方

1. 单元素 a=b=0，az=1,bz=oz=0，三项 scale=1；真实 init 给 ma=mb=1048576,shift=20。A/标量核/测试参考=0，原版及原改写版=255，修复版及其改写版=0。令 b_scale=0.5，差异也出现于不同乘数分支。
2. a=3,b=255，zp 全0，a_scale=b_scale=255,output_scale=1；ma=mb=2088960,shift=13。原版和原改写版=254，A/参考/修复版=255。
3. 附加 C UB：a=b=0，az=bz=0,oz=128,a_scale=b_scale=2^-10,output_scale=1。真实 init 给 ma=mb=1048576,shift=30。原版实际 kernel 的 `out_zp << shift` 在 QEMU+UBSan 中终止，诊断明确指出 `128 << 30` 无法用 int32 表示。原改写版同样触发；修复版及改写版通过。这不是仅据源码推测的 UB。

上述参数可用于真正的两个同形张量。调用链（路径相对于固定 XNNPACK）：include/xnnpack.h:2588 创建 API；src/tensor.c:50、:72、:332 校验 quint8 tensor zero point 为0..255；src/subgraph/binary.c:40-55 传递这些参数；src/operators/binary-elementwise-nd.c:162-199 检查 positive normal scales 并调用 config init；src/configs/binary-elementwise-config.c:1459 起选择 qu8 vadd/init；src/microparams-init.c:830-887 生成上述字段；binary-elementwise-nd.c:382、:402 和 src/operator-run.c:1225 传给 ukernel。参考为 src/xnnpack/requantization.h:184 及 test/vbinary-microkernel-tester.cc:173、:183；原始 A 的函数体 token 与 src/qu8-vadd/gen/qu8-vadd-minmax-neon-ld64-u8.c 相同。

因此这些真实参数上的偏离方为 Bopt；不需要修改 A，也不应排除这些反例。直接 operator API 在上述代码中没有相同的 zero-point 范围校验，tensor 路径的约束不能不加说明地推广给所有任意 int32 zero point 调用。

## 修复计划与本轮产物

补丁已实施：移除 pre-shift ozp 融合；保留原有 rounding_const；用 signed vnclip/RDN 饱和到16位，再 signed 饱和加 ozp，signed max0 后 reinterpret 并 unsigned 饱和到8位。保留四个循环、等乘数预加优化、load/store、VL 控制与尾部。负 shift 分支也同步移除提前 ozp 并修正饱和顺序；其中原有 signed 左移只属于 init 域外的未处理行为，不能声称该分支已安全。

目标仍是原始 A ⇔ Bopt_fixed，但完整 QCP 配对未完成：旧 spec 允许 shift=INT32_MIN，而原始 A 的取负有 UB；真实 init 不产生它。保留旧 equivalent，提交独立域审计，等待监督者处理。详见 REPORT.zh-CN.md 和 proof/bridge/DOMAIN-REVIEW.zh-CN.md。

正确性测试见 evidence/summary.json；每条实际编译/QEMU 命令和退出码均保留。性能按本轮 BRIEF 不测 RTL：每次运行的循环中新增 vsadd.vx、vmax.vx，用 vnclip 替代 vnsra；静态汇编统计见 evidence/asm2。不能从这些数量推断周期或宣称无退化。后续 RTL 测量交监督者安排。

原始结论 A ≠ Bopt 保留；修复后仅有差分与辅助数学证据，尚非新的完整等价性结果。是否对外报告由用户决定，本轮未发送任何外部消息。
