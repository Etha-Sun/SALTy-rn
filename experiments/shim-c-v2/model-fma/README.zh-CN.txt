FMA 标准库模型扩展（独立 TCB，非 kernel proof）
===============================================
保留旧版所有工件。本目录不修改任何 kernel、shim、公开 spec 或 wrapper。

libc/math.h 复制 Frama-C 原版，仅增加 logic shim_fma32 声明和 fmaf 返回值合同；
保留 errno/result assigns。math-token-guard.json 检查普通 C tokens 与原版相同。
wp-share/why3/frama_c_wp/fma.mlw 只定义 fma_f32=Float32.fma RNE，不新增 axiom。
fma.driver 将上述逻辑符号绑定到真实 Why3/SMT IEEE fused multiply-add。
其余 Cfloat 定义来自本轮已修复的 model overlay，独立副本哈希需和 root 冻结锁核对。

明确的可信边界：这个 fmaf 合同是标准 libc + 固定 RNE 环境的模型承诺，
不是已经验证本机 libc 机器码实现。它没有被塞进 proof.patch，不是自由 ghost 函数。
NaN payload 与 FP flags 不被观察；非 NaN 值保留 signed zero，errno 仍可被修改。
尚未支持改变浮点舍入环境；不能把该合同用于动态舍入模式的程序。

controls03.json 是真实原始 WP 记录：64/68；10 个正例 ensures 全通过，
4 个反向 ensures（false、错误 finite fused、错误 NaN、错误 signed zero）均未通过。
不是要求 false control 全绿：controls-summary.json 按预期分类。
positive finite_fused 检查 (1+2^-23)*(1-2^-23)-1 恰为 -2^-46；
同输入逐步乘后加会得到 +0。native-controls.c 在真实 libc 上也检查该差别和
NaN、Inf、负零、正零、普通有限数，7 组回归 0 失败。

controls01 的 ACSL 类型问题、controls02 的 ACSL hex 实数字面量精度问题均保留，
最终期望值写成精确有理数 -1/70368744177664，未更改任何被验证 kernel 输入域。

加载参数（ABS 为此 worktree 绝对路径）：
-cpp-command 'gcc -E -C -IABS/experiments/shim-c-v2/model-fma/libc -I.'
-cpp-frama-c-compliant
-wp-share ABS/experiments/shim-c-v2/model-fma/wp-share
-wp-driver ABS/experiments/shim-c-v2/model-fma/fma.driver
-wp-why3-config ABS/experiments/shim-c-v2/model/why3.conf
-wp-no-why3-detect -wp-prover z3,cvc5

必须由 root 审核并冻结模型与加载参数后，才作为整核验收配置。
