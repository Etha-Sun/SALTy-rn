s8-vclamp：共享 shim 与生成规格的无界输出等价性案例
==================================================

neon.c、rvv.c 分别为 kernels/source/s8-vclamp.c 与
kernels/target/s8-vclamp.c 的逐字副本。原始实现保持不变，与旧
verified/qs8-rsum/ 独立；旧案例及其历史证据不改动。

interface.json 只有 family、padding、observation 三个字段（5 行）。
spec.h 与 harness.c 由共享生成器产生，没有为本案例另写公共数学
clamp 规格。公共结论仅为两个实际 C 程序的输出相等。

冻结的合法调用域：任意正 size_t 长度 n，n<=SIZE_MAX-7；输入有 n+7
个可读字节，两个输出各有 n 个可写字节，与输入及彼此分离；
-128<=lower<=upper<=127。输入 padding 的 7 个字节可任意，输出不需
padding。min<=max 是 family 接口约束，并非从原始 C 的 assert 自动
推导：NEON bulk 先 max 后 min，8-lane 与 tail 先 min 后 max，因此
该顺序条件确实影响两边等价性。

固定环境为 VLEN=128，e8m8 的 VLMAX=128，实际
vl=min(batch,128)。任意总输入长度不等于任意 VLEN 或任意可选 VL。
共享 C 实现位于 ../shared/clamp.h、clamp.c，共 19 个 intrinsic；
vld1q_s8、vsetvl 等 6 个共用函数由 base 模块提供。
uint16x4_t、uint32x2_t 在本模型中使用 8 字节表示，当前用于
reinterpret 与 lane store；逐字节 store 保留 little-endian 位模式，
不把这种表示宣称为已支持所有 unsigned vector 算术。

proof.patch 是唯一 kernel 专用证明文件；共享 intrinsic 合同、循环
证明、两个有定义的逻辑函数及一个 ghost helper 位于
../shared/clamp-proof.patch。没有额外 case proof helper 文件。
所有 intrinsic 与 helper 的函数体均检查，没有新增 axiom 或 assume。

证明以已处理输出前缀的不变量连接两边程序。private proof 中的
s8_clamped 是条件表达式定义，并非未经验证的 kernel 数学合同。
store 前的 ghost label 与 store 后的逐点 ghost 循环显式证明范围外
字节保持不变，再合并新输出块。s8_tail_bits 的 switch 只枚举 NEON
尾部余数 1..7，其合同由函数体证明，不限制总长度 n。

2026-10-19 UTC 最终新鲜完整验证：logs/final02-summary.json。
688 / 688 原始 WP 目标通过，耗时 320.514 秒；27 个实际函数体的
ensures 均有检查记录，包括 19 个 clamp intrinsic、6 个 base 函数、
1 个 ghost helper 和 equivalent。Frama-C 摘要另计终止与不可达
简化项为 740 / 740，其中各有 26 项，不混同原始报告目标数。
final02 complete=true、unchanged=true，无缺失函数体或 global lemma。

附注前后全部 3374 个 Clang 展开 C token 相同，冻结实现与公共 spec
在验证期间不变。最终 checker 为 fe69a05 的稳定版本，SHA
8cd2b5c8951d08bc7887dde838884e7ce9361ed618256373e76f6fbbf5d52f03。
final01 同样 688/688 通过，但 checker 在运行中加固，unchanged=false；
因此最终证据使用相同 proof 在稳定 checker 下重新运行的 final02。

模型边界：ISA intrinsic 到普通 C shim 的语义对应仍属于 TCB。
工具报告尚不生成指针对齐与间接函数调用有效性的 RTE 守卫；本案例
没有间接调用。已生成的索引、算术、终止等目标均纳入完整检查，
不能由此宣称所有 C 或 ISA 性质已证明。

手写/agent 编写工作量见 effort.json：共享 C/h 为 106 非空行，
共享证明新增 234 非空注解行，本案例证明新增 252 非空注解行。
spec.h 53 行、harness.c 11 行全部生成。原始实现副本、补丁上下文、
diff 元数据及原 rvv.c 末尾换行导致的 closing brace 重列不计入
新增手写证明。共享证明是库支持的一次性投入，不需每个 kernel 重写。
原始 C + 共享 shim 的 ASan/UBSan 回归另有 1578 个案例及标量 oracle
通过，见 tests/verification/shared_shim/native-results.json；这是
补充测试证据，不能替代无界证明。
