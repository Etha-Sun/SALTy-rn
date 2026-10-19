# 修复模型后的完整验证结果

第三阶段9个复杂kernel的新proof尝试和工具修复见 [阶段记录](../../docs/shared-shim/STAGE3.zh-CN.md)。新增整核通过0；独立新工具完成旧f32-vadd571/571复验，不能计作新增。以下历史结果及RESULTS.json保留。

接手后的独立本地续作见 [RESULTS-LOCAL.json](handoff-local/RESULTS-LOCAL.json) 和 [分工计划](../../docs/shared-shim/PROOF-WORK-PLAN.zh-CN.md)。新环境完成f32-vadd571/571复验；qu8-f32-vcvt新完整报告838/845、剩7项，仍未整核通过；qs8的lane展开候选预算耗尽且无最终body报告。新增整核通过0，以下交接批次的原始记录和RESULTS.json保持为历史快照。

本轮请求的33项：**7项通过，26项未完成**。其中7个旧浮点隔离项全部完成；其余26项新增整核通过0。

记录时间：2026-10-19T05:32:55.755344+00:00。数字均为证明义务数，不是样例或固定数组长度的测试。

## 七个浮点隔离项

| Kernel | 完整证明 | 正式包复验 | 新目录 |
|---|---:|---|---|
| f32-vadd | 571/571 | 通过 | [文件目录](../../verified/f32-vadd-v2/) |
| f32-vsub | 556/556 | 通过 | [文件目录](../../verified/f32-vsub-v2/) |
| f32-vmul | 585/585 | 通过 | [文件目录](../../verified/f32-vmul-v2/) |
| f32-vdiv | 601/601 | 通过 | [文件目录](../../verified/f32-vdiv-v2/) |
| f32-vmulc | 583/583 | 通过 | [文件目录](../../verified/f32-vmulc-v2/) |
| f32-vmin | 536/536 | 通过 | [文件目录](../../verified/f32-vmin-v2/) |
| f32-vmax | 538/538 | 通过 | [文件目录](../../verified/f32-vmax-v2/) |

七项合计3970/3970。所有真实kernel函数体、可达callee、ghost helper、全局lemma都必须覆盖；并检查同上下文正反控制和输入哈希。每个新目录仍是neon.c、rvv.c、spec.h、harness.c与唯一proof.patch，未增加每kernel的proof helper文件。

## 其余26项

这些都实际补充了proof，并执行了完整检查。下面的“预算耗尽”指主WP达到1200秒而没有最终body JSON，不把仅生成的global lemma记录或0/0算作整核结果。未完成证明不代表已经发现两程序不等价。

| Kernel | 本轮完整尝试结果 | 具体未完成处 |
|---|---|---|
| f32-argmaxpool | 预算耗尽；无最终body报告 | Typed下float/uint32位选择和memcpy缺少精确桥（vbslq_f32等）；24行uintptr换算。原全量还出现vaddq_u32等普通integer helper的循环证明缺口，已独立补12个candidate且11个全闭合，但未改历史全量proof；获胜value/index及tie的主循环关系仍未完成。 |
| f32-conv-hwc2chw | 预算耗尽；无最终body报告 | canonical_nan的uint32→float memcpy分类与Typed char-pointer有效性未证明；有69行uintptr换算；卷积多层行/列/通道、输入halo和边界output布局的主循环关系仍未完成。 |
| f32-dwconv-minmax | 预算耗尽；无最终body报告 | 已补按实际FMA/非融合顺序的参考表达式和pixel/channel prefix/frame；canonical_nan/Typed memcpy桥、10行uintptr换算和这些候选的实际body义务仍未闭合。 |
| f32-dwconv2d-chw | 预算耗尽；无最终body报告 | canonical_nan及mask的整数/float bit representation、Typed memcpy有效性未闭合；22行uintptr换算；滚动5行缓冲、halo/尾块、三输出行关系和frame尚未完成。 |
| f32-f16-vcvt | 预算耗尽；无最终body报告 | Typed memory仍不能闭合float↔uint32 memcpy位表示桥；还有tail memory/frame及kernel循环证明未完成。fabsf已允许使用pinned标准库保守合同，不再误报不支持调用；未加入位表示公理。完整运行触及预算，最终raw缺失，不能给总通过率。 |
| f32-gemm-minmax | 预算耗尽；无最终body报告 | canonical_nan/Typed memcpy桥及28行uintptr换算未闭合。已补NC/KC游标、packed权重位置与variant，但尚未完成4行、NR8分块、K累加器和active mr*nc输出关系；FMA已用真实RNE模型，未当作普通乘加。 |
| f32-igemm-minmax | 预算耗尽；无最终body报告 | canonical_nan/Typed memcpy桥及6行uintptr换算未闭合；indirection表、positions/K双层累加和NR8输出前缀关系尚未完成。冻结wrapper本来就是mr=1、offset=0、zero=NULL的既定scope，未偷偷扩大或缩小。 |
| f32-maxpool | 预算耗尽；无最终body报告 | canonical_nan位构造与Typed memcpy有效性未证明；40行uintptr换算；9输入分组、多pass把新输入归并到output、最终clamp和prefix关系尚未完整证明。 |
| f32-raddstoreexpminusmax | 预算耗尽；无最终body报告 | 这是13项中唯一没有uintptr转换的一项，仍被float↔integer bit reinterpret/memcpy挡住；vbicq_u32等integer helper原缺注释（新candidate仅vbic还有1个prefix未过），指数构造、多项式和sum reduction关系尚未完整证明。 |
| f32-spmm-minmax | 预算耗尽；无最终body报告 | canonical_nan/Typed memcpy桥及11行uintptr换算未闭合。还缺prefix_nnz/prefix_diff与实际稀疏cursor、行strip、权重/bias/FMA累加的多层归纳关系。 |
| f32-vcmul | 377/418，剩41项 | 最新策略版18个实际helper 192/192、全局lemma3/3，全部覆盖；只剩equivalent主程序182/223，41项为最终关系、6处uintptr后load/store有效性、循环及frame。不能算整核通过。 |
| f32-vlrelu | 491/520，剩29项 | float 符号位提取/重构的 memcpy bridge 及向量前缀；原始浮点 Byte codec 不可用。 |
| f32-vrndne | 662/679，剩17项 | 取位、magic-number 舍入和符号重构所需 float↔bits bridge；另有前缀/frame。 |
| f32-vsqrt | 383/402，剩19项 | float/uint32 memcpy 位表示桥；标量 bit-search sqrt 还需与 IEEE 正确舍入建立关系；另有前缀/frame。 |
| qd8-f32-qc4w-gemm-minmax | 预算耗尽；无最终body报告 | canonical_nan/Typed memcpy桥与5行uintptr换算未闭合；还需packed 4-bit符号扩展、整数重解释、block尺度/补偿和FMA累加的关系及完整多层循环不变量，不能把这些都只归为float模型。 |
| qs8-f32-vcvt | 794/805，剩11项 | 全部intrinsic本体及其float conversion/multiply前缀已闭合；剩11个kernel/wrapper VC，涉及中心化输入与scale快照重绑定后的lane prefix、tail rebase与最终输出比较量词实例化。没有发现kernel反例。 |
| qs8-rdsum | 420/702，剩282项 | 冻结public requires含memory-capturing sum/lambda；WP/Why3明确报Lambda-functions not yet implemented及unbound variable in of_term。此为前端/模型缺口，不能删前提过关；另有NEON多row不变量与uintptr行指针桥待证。 |
| qs8-vadd-minmax | 预算耗尽；无最终body报告 | 实际Byte模型下的有符号乘法/rounding/shift合同、tail packing/store及整kernel累加和饱和归纳仍未闭合。 |
| qs8-vcvt | 698/719，剩21项 | 新整数Byte模型的任意指针pack16/32独立控制通过，但实际struct按值传参/局部对象memcpy再reinterpret的功能post仍超时；另有ASR/RNU全域合同、tail store逐字节前缀及kernel归纳未闭合。独立控制不代表该kernel已证明。 |
| qs8-vlrelu | 846/866，剩20项 | 实际reinterpret/字节tail store、ASR/RNU及vbsl选择的功能前缀未闭合；kernel量化/饱和循环归纳尚有真实pending。 |
| qs8-vmul-minmax-fp32 | 预算耗尽；无最终body报告 | float↔int位表示memcpy桥未闭合，另有实际transitive ASR/RNU及内存/循环归纳待证。完整运行触及预算，最终raw缺失，不能给总通过率。 |
| qu8-f32-vcvt | 835/843，剩8项 | 全部intrinsic本体及其float conversion/multiply前缀已闭合；剩8个kernel/wrapper VC，涉及NEON高4lane prefix、两处tail rebase、RVV中心化/转换后桥与prefix、最终输出比较量词实例化。使用旧版v2修复target，非修改本轮冻结C。 |
| qu8-rdsum | 预算耗尽；无最终body报告 | 内部sum已改成按行数递减的递归逻辑定义，前端可处理；但NEON多row归纳、uintptr行指针算术与floor/float→int范围及termination仍待证。floor已允许pinned保守stdlib合同，非未知external阻止运行。完整运行触及预算，最终raw缺失。 |
| qu8-vadd-minmax | 预算耗尽；无最终body报告 | 实际Byte模型下的有符号乘法/rounding/shift合同、tail packing/store及整kernel累加和饱和归纳仍未闭合。 |
| x32-packw-gemm-goi | 预算耗尽；无最终body报告 | 原 Typed 下 tuple 初始化及 char-strided store 不闭合；Bytes v1/v2虽能证明独立tuple，整核仍有 vmov/store/segment-store/strided-store 的word内容与frame目标，且4处uintptr地址换算没有可用桥。group/channel/K前缀与padding候选已补，尚未闭合。 |
| x32-transposec | 预算耗尽；无最终body报告 | Typed将 uint32*→char*→uint32* 地址隐藏，Bytes版保留地址后仍有store内容/stride有效性/frame证明；round_down_po2另剩bitand/mod2算术目标；12处uintptr地址换算、tile/prefix/frame候选尚未闭合。 |

其中qs8-f32-vcvt与qu8-f32-vcvt的全部intrinsic函数体已闭合，剩11/8项在kernel/wrapper；f32-vcmul的18个helper共192/192、全局lemma3/3通过，剩41项全部在主程序。局部成功不能替代整核。

完整逐项原始证据、pending属性和源码行号见[RESULTS.json](RESULTS.json)。整数10项的精细原因见[STATUS](integer/STATUS.zh-CN.txt)，复杂13项见[FINAL-STATUS](complex-v3-next/FINAL-STATUS.zh-CN.md)；这两份报告进一步区分普通指针pack与struct-by-value、地址变换与主循环证明等缺口。

## 冻结与保留

- 本轮没有修改原kernel、shim、公共spec或wrapper，没有新kernel修复，也没有新功能反例。旧verified目录与660e60a一致；新证明放在独立-v2目录。
- 模块化proof只增加需由原真实函数体证明的中间ensures；禁止新增kernel requires/assigns/terminates或wrapper合同。公共spec.h逐字节不变。
- 冻结文件哈希见[source-freeze-audit.json](source-freeze-audit.json)，旧版保留审计见[old-version-preservation.json](old-version-preservation.json)。14个早期checker开发回归manifest固定的是开发中旧checker，其历史差异单独保存在archived-checker-development-hash-audit.json；最终ready回归和kernel冻结检查不受影响。
- 独立agent只读复核源、proof、模型哈希及覆盖，见[final-independent-audit.json](final-independent-audit.json)。这不是独立证明内核的certificate检查。

## 修复内容与仍有边界

已移除与IEEE特殊值冲突的20条无条件浮点公理，使用原生IEEE操作；独立重编译前端修复负零字面量、浮点常量折叠与跨精度转换，保留真正的RNE FMA。新增Cint辅助定理54项及整数byte/word28项均实际检查；整数memory-view12项已独立重放。正反回归中的故意false均不被采纳。

原Bytes+float浮点codec存在已复现的模型矛盾，继续隔离，并在新的整数Byte前端硬拒绝float codec。当前没有宣称浮点位重解释已通用解决；剩余kernel的主要框架工作包括精确uintptr/地址关系、float与word位表示桥。另有真实循环归纳尚未完成，qs8-rdsum还有冻结sum/lambda的WP后端错误。

通过的准确含义是在当前声明的C/shim模型、合法输入与固定硬件配置下证明输出关系。长度为前提范围内符号值；VLEN固定128、VL按min(remaining,capacity)调度，不是任意硬件或任意VL。浮点观察是数值相等或双方NaN，不比较正负零位、NaN payload和FP flags。

ISA/intrinsic到手写C shim对应、ABI/对齐、Frama-C/ACSL/WP及其前端和内存/标准库模型、Why3翻译、求解器仍属于TCB。没有在Lean/Coq中重新检查SMT证书。完整说明见[MODEL-AND-TCB](MODEL-AND-TCB.zh-CN.txt)。
