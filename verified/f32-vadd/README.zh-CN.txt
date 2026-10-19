f32-vadd：共享 float shim 与生成规格的无界输出等价性案例
========================================================

neon.c、rvv.c 分别是 kernels/source/f32-vadd.c 与 kernels/target/f32-vadd.c
的逐字副本；未改任何 kernel 的可执行代码。旧 verified/qs8-rsum/ 独立保留。
spec.h 与 harness.c 由公共生成器产生，interface.json 仅 3 个字段（5 行）。

公共规格是合法输入域与实际程序输出相等，没有浮点加法的数学 post。
wrapper 对同一对只读数组调用两边实现，输出分别写入 left 与 right。
输入总长 n 为任意合法正 size_t，满足 n <= SIZE_MAX/4-3；batch=4*n。
两个输入各有 n+3 个可读 float（额外 3 个用于 NEON 尾部读取），两个
输出各有 n 个可写 float。输出与两个输入、两个输出之间按 spec 分离；
两个只读输入之间允许 alias。没有限制 finite、非 NaN 或小的固定 n。

观察关系直接写在 C wrapper 中：
  left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])
因此有限数值相等、同号 Infinity 相等、两边都是 NaN 均被接受；+0 与 -0
按 C 比较相等。这不是 NaN payload / signaling 状态 / signed-zero 位等价。
浮点异常 flags 不在输出观察中。

共享普通 C 支持在 ../shared/float_ops.h、float_ops.c：7 个 NEON intrinsic、
3 个 RVV intrinsic，另有一个 scalar f32_add(a,b){return a+b;}。浮点类型
和 dummy params 的 4 条声明放在公共 shim.h。固定 LP64、binary32、
VLEN=128；e32m8 容量 32，实际 vl=min(remaining,32)。总长无界不表示
验证所有 VLEN 或硬件允许的其他 VL 选择。

验证使用 WP Typed+float 的 IEEE 模型，没有切换 real 模型。默认 round
为 RNE；不模拟 flush-to-zero、动态 rounding mode 或浮点环境状态。
-warn-special-float none 显式允许产生 NaN/Infinity，保留其他 -wp-rte 检查。
没有外部 fmaf 或其他未验证的浮点库函数合同。

../shared/float.driver 只有两行，将逻辑名 fp_add32 映射到 WP 原有的
Cfloat.add_f32，即 C 浮点 + 已使用的同一个 IEEE 操作。没有新增 axiom。
该映射是需要审阅的共享 TCB 接口；f32_add 的函数体与合同另外完整检查。
IEEE 比较使用现有 builtin \eq_float；没有用 ACSL 普通 == 代替 NaN/Inf
上的 C 比较，也没有把实数加法强转当作 IEEE 加法。

proof.patch 是唯一的本案例证明材料。所有 ACSL、ghost snapshot、循环
不变量以及有函数体的 tail bit helper 都在这里，未增加本案例 proof
helper 文件。共享函数合同、9 个循环的证明、5 个浮点关系引理和一个
有函数体的 join helper 在 ../shared/float_ops-proof.patch，供后续复用。

内部证明两边每个已写元素与同一个 fp_add32(input_a[i],input_b[i]) 同值；
这个中间结论只存在于 proof，未成为 kernel 的未验证公共合同。store
的范围外 frame 合同检查函数体，随后用 ghost label 与逐点 snapshot
证明老 prefix 保持，新增 lane 对应正确。NEON 尾部 batch=0/4/8/12 的
bitmask 关系由一个 switch 枚举的 ghost helper 检查，所有 helper 均有
ensures 的实际 body 目标，没有外部证明函数假设。

2026-10-19 UTC 新鲜完整验证：logs/final01-summary.json。
431 / 431 原始 WP 目标通过，耗时 201.823 秒，complete=true、unchanged=true。
20 个实际函数体的 ensures 全覆盖：10 intrinsic、scalar f32_add、6 个
公共 base 函数、2 个 ghost helper、wrapper。5 个 global lemma 也各有
通过的原始目标；无缺失 body / lemma。Frama-C 摘要 465 / 465 另含 34 个
终止/不可达简化项，不混同原始报告计数。

源码守卫：附注前后全部 2760 个 Clang 展开 C token 相同。实现、公共
spec、driver、生成器、checker 和 proof 在最终验证期间未改变。最终
checker SHA 为 8cd2b5c8951d08bc7887dde838884e7ce9361ed618256373e76f6fbbf5d52f03。
旧 run / snapshot / tail 诊断保留证明开发过程；超时目标不是 kernel
反例。eqsplit06 是主动停止的可选分支拆分诊断，没有完整 JSON，也不
计作验证成功。最终全部通过的是稳定输入下的 final01。

边界：ISA intrinsic 到普通 C shim 的对应仍属 TCB。WP Typed 及 C/IEEE
模型、预处理/VC 生成与外部 solver 仍需信任。工具不生成指针对齐和
间接调用有效性 RTE 守卫；本案例没有间接调用。这里证明指定合法数组
值和固定模型下的输出关系及终止性，没有证明调用者初始化、机器码、
NaN 位表示或浮点异常状态。

effort.json 将复制源码、生成输出与新增材料分开计数：共享 C 实现 42
非空行、原型 14、driver 2，另 4 条公共类型声明；共享证明新增 72 非空
注解行，本案例证明新增 194 非空注解行。spec.h 59 行、harness.c 11 行
全部生成。这里“手写”指 agent 补充的定制材料，不表示需要用户手工写。
