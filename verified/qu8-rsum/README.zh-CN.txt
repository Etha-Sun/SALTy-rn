qu8-rsum：共享 shim 与生成规格的无界输出等价性案例
===================================================

neon.c、rvv.c 为 kernels/source/qu8-rsum.c 与 kernels/target/qu8-rsum.c
的逐字副本。它们与旧 verified/qs8-rsum/ 独立，旧案例和历史证据不改动。

spec.h 与 harness.c 由共享生成器产生。公共规格仅要求合法调用域与输出
相等，不把数学求和结论作为 kernel 合同假设。输入总长 n 为任意合法
正 size_t 值，初始 uint32_t 输出可任意，所有累加按无符号 C 规则模
2^32 回绕。NEON 尾部读取统一要求额外 15 个可读字节。

proof.patch 保存本案例的 ACSL / ghost 注解。共享 intrinsic 的实现位于
../shared/rsum.h、rsum.c；共享函数合同、循环证明、求和逻辑与 ghost
helper 函数体位于 ../shared/rsum-proof.patch。所有 helper 的合同均需
检查函数体，没有未经验证的外部求和合同、axiom 或 assume。

固定实验环境为 VLEN=128；e8m2、e32m8 容量 32，e32m1 容量 4。
实际 vl=min(batch,32)。任意总输入长度不等于任意 VLEN 或任意可选 VL。
ISA intrinsic 与普通 C shim 的语义对应仍属于 TCB。

证明思路：NEON 先在 8 个 uint16 lane 中累计最多 2048 个输入字节，
每个 lane 上界 128*510=65280，尚未超过 uint16 上限，再宽化并模
2^32 累加。RVV 保持所有 32 个 lane 的和等于已处理输入和模 2^32，
显式证明 tail-undisturbed 保留未激活 lane。两边最终输出都等于
(initial + sum(input[0..n-1])) mod 2^32，但该数学关系仅存在于 proof，
公开 spec 的结论只是两个实际程序输出相等。

2026-10-19 UTC 最终新鲜完整验证：logs/final02-summary.json。
567 / 567 原始 WP 目标通过，耗时 249.602 秒，33 个实际函数体的 ensures
均有检查记录，含 14 个 unsigned intrinsic、6 个共用 base 函数、12 个
有完整函数体的 ghost helper 及 equivalent。Frama-C 摘要另计终止和
不可达简化项为 623 / 623，不把该摘要数混同原始报告目标数。

冻结与代码守卫通过：附注前后全部 3003 个 Clang 展开 C token 相同；
C 实现、公共 spec、共享 driver、生成器及证明输入在验证期间未变化。
run02 为库合同条款顺序错误；run03 仅一处递归空向量和不变量建立超时；
run04 通过两条显式展开 words32(v,0)=0 的断言解决，没有改变规格。

模型边界：WP Typed 额外要求输入与 NEON 内部 static onemask_table 分离；
运行日志完整保留该模型前提。工具亦报告当前不生成指针对齐与间接
函数调用有效性的 RTE 守卫；本案例没有间接调用。终止性、索引和
其他已生成 RTE 目标均在完整检查中，不能把它说成所有 C / ISA 性质。

手写/agent 编写工作量见 effort.json：本接口描述仅 3 个字段（5 行），
spec.h 43 行、harness.c 9 行全部生成；共享 rsum 接口与实现 83 非空行，
共享证明新增 217 非空注解行；本案例证明新增 169 非空注解行。
原始 kernel 副本、补丁上下文与 diff 元数据不算新增手写实现或证明。

最终 checker 为 fe69a05 的稳定加固版本，SHA
8cd2b5c8951d08bc7887dde838884e7ce9361ed618256373e76f6fbbf5d52f03。
final02 complete=true，unchanged=true，无缺失 helper/body/global lemma 目标。
final01 虽 567/567 通过，但 root 在运行中加固 checker，输入变化标记为
false，因此未当作最终 complete。最终使用相同 proof 在稳定版本重跑。
原始 C + 共享 shim 的 ASan/UBSan 回归另有 1578 个案例及标量 oracle 通过，
见 tests/verification/shared_shim/native-results.json；这是补充测试证据。
