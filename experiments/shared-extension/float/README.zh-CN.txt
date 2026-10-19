浮点扩展实现阶段（尚无 proof 成功声明）
====================================

本目录独立保留旧 verified/，共准备 9 个 case：vsub、vmul、vdiv、vsqrt、vmulc、vmin、vmax、vlrelu、vrndne。

每个 case 的 neon.c 与 kernels/source 原文件逐字相同。除 vmin/vmax 外，rvv.c 也与 kernels/target 原文件逐字相同。
vmin/vmax 的原 target 在 original/rvv.c，当前 rvv.c 在 min/max 后增加两个 isnan mask 与 RVV merge：任一输入 NaN 时选浮点加法产生的 NaN。
原版均在 n=1、seed=2 出现反例：input_a[0]=1.0，input_b[0]=NaN，NEON 输出 NaN 而 RVV 输出 1.0。
修复保持原 API、固定规格和完整浮点输入域；额外运算可能改变 FP 异常标志，当前观察不比较标志。

interface.json 仍仅 family、padding、observation 三字段。generate.py 56 行，用 binary-f32、scalar-f32、unary-f32、lrelu-f32 四个小模板生成 spec.h 与 harness.c。
所有输入可为 NaN/Inf，无有限性或非零除数前置条件。任意正符号长度、输入 3 个 float padding；scalar-f32 的 input_b 仅要求 1 个 float。
wrapper 只调用两个实际 C 函数，逐元素比较数值相等或双方 NaN；spec 唯一功能性结论是 wrapper 返回 1。

共享 C 在 shared/，固定 LP64、小端、binary32、binary64、VLEN=128、VL=min(AVL,32)、默认 nearest-even 浮点环境。
复用的 base.c/float_ops.c 未改变函数实现；其旧 base-proof.patch/float_ops-proof.patch 可单独复用。
sub/mul/div 均用普通 C 对应算术，mulc 用逐 lane 复制标量。
min/max 用普通 C 比较与零特殊处理，避免 libc fminf/fmaxf 外部合同。
float_bits/bits_float 使用 memcpy，避免通过不兼容指针强制转换的 C 未定义行为。位表示与 WP Typed+float 之间仍需要证明桥接。
sqrt 避免使用可能写 errno 的 libc sqrtf。纯 C 实现以浮点位序二分确定相邻 binary32 根，double 精确比较候选平方和中点平方，再作 nearest-even 选择。
该 sqrt 解释与真实 ISA sqrt 的对应尚未形式证明；不能把 native 回归当成模型正确性证明。
extensions.driver 仅映射到既有 WP Cfloat add_f32/mul_f32/div_f32/sqrt_f32。没有 sub_f32，sub 可由 add+neg 表达。driver 不添加公理。

阶段证据：
- native-results.json：9 个 case 各 3450 组不同长度/边界/原始浮点位图输入，ASan/UBSan 与独立 scalar oracle 通过；vmin/vmax original_target 记录原版失败。
- sqrt-stress-results.json：另 1000000 个原始 binary32 位图输入与 host sqrtf 对比通过。
- parse-results.json 及各 case parse.log：Frama-C 33 的 9 个完整 unit.c 均解析通过。
这些均不是无界等价证明，尚不进入 verified。

handoff.json 是 root 冻结清单候选：按 basename 列出每 case 所有 C/h/spec/interface/driver/generator，给出 unit 模块顺序、模型和复用 proof patch。
root 应在冻结 manifest SHA 后交给另一个 agent，只允许在 proof.patch 加 ACSL/ghost；实现者未给这些新 case 写 proof。
