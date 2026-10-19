# 主 agent 审核记录

范围严格限于第三阶段原九项。本轮首批是 f32-gemm-minmax、f32-dwconv-minmax、f32-spmm-minmax；公共 helper 检查属于这些 kernel 的实际调用依赖，没有新增九项之外的 kernel 任务。spec、原 C/shim、模型和旧 checker 保持冻结；只有独立候选 proof 和诊断材料新增。未经用户允许不 push。

## 公共依赖复核

在原 GEMM r4 注释上下文中，以 tip/z3/cvc5、每目标10秒执行三个实际 helper body：51项中46通过。NEON vfmaq_f32为22/22，RVV __riscv_vfmacc_vf_f32m4为21/21；canonical_nan为3/8。全部输入SHA复核不变。这证明此前1秒快筛的FMA超时不足以断言缺proof；它不是新整核通过，也不免除新候选中的依赖覆盖。原上下文真假控制见上一轮固定记录。

尚未通过的5项均属于canonical_nan：NaN后置条件、assigns，以及memcpy源/目标有效性与分离前提。`nan-formula01/run.log`保留不调用solver导出的真实WP。日志明确报告Typed模型对float32*/uint32*到sint8*转换隐藏了定义；打印的memcpy关系只约束Mchar，而结论为 `is_NaN_f32(Mf32_0[global(L_value_6287)])`，未给出0x7fc00000位构造到该float值的关系。这是当前模型下位表示信息缺失的具体证据，不是原kernel的反例，也不是单靠延长超时可保证解决的目标。本轮不修改模型或引入假设填补它。

`fma-r1`是曾准备并通过源守卫、但未执行也不选择合入的策略草稿：随后原proof已在合理预算下全过，没有理由再增加策略。保留为未执行候选，不宣称改善。

## 验收方式

源码守卫及全外部模型锁检查不等于证明成立。对worker新增的assert/lemma，必须检查它们自己的VC；旧保持目标依赖新断言变绿不能单独计闭合。比较改善时使用相同候选选择与相同预算。完整清单和完整求解分开记录；只有完整raw全绿及所有严格门槛满足才能计整核通过。

## 两组独立复验

SPMM cuts-v4：主agent使用新annotated副本与独立日志，原6项游标建立/保持和全部新增切分点/helper结论共14/14；ghost helper完整body的ensures与assigns为2/2。同上下文true控制通过、false未过。helper只有按值uint32参数和空函数体，无requires，无普通内存写入；后置条件是条件化的整数转换恒等式，由实际body检查，不是外部无body合同。

Dwconv r4：主agent独立复验两侧全部行游标建立/保持以及两个新切分点14/14，全局lemma8/8，真假控制接受。权重游标、地址、累加与输出等其他义务仍未闭合。

两组实际命令、raw、事件和前后SHA核对见spmm-replay01、dwconv-replay01以及independent-replay-summary.json。源守卫audit02和独立contract-review02核对16个候选，原文件条目及模型配置完全一致，未新增requires，公开spec逐字节一致。唯一新增ensures是上述具有已检查body的ghost helper。其余两组主要是loop不变量/assert/logic lemma。这些局部VC仍处于原有合同与其他不变量上下文中，不能替代整核完整验证。
