本轮新增关闭 **6 条真实 store helper 义务**，4 个实际函数的48/48目标全部通过，原10条global全部通过；这是局部完整检查，不能称为整核验证完成。

所有版本均保留 v10 的普通C、public spec、shim、driver、native-v6 Bytes模型和检查器。`source-identity-audit.json`逐项比对冻结files，真正token guard也通过。实际control/global/main命令均为par16、每目标30秒、1024MiB。

|候选|四helper主体|全局|结果|
|---|---:|---:|---|
|v01|20/48|6/11|新增labelled-validity lemma触发Why3 `unbound variable in of_term`；负控制也导出异常，拒收，不能按旧gate的accepted计算|
|v02|39/48|10/10|动态prefix解决部分原缺口，但function assigns VC丢失i上界产生回归|
|v03|42/48|10/10|有界prefix消除新增回归，剩原6项|
|v04|**48/48**|**10/10**|真正闭合原6项；负控制false ensures超时、true ensures真证，无导出错误|

v04唯一语义注释变化是三个loop assigns从整个目标区缩为有界累计prefix `p[0..min(i,N)-1]`（用C ternary表达）。现有不变量已约束0≤i≤N，含义是只havoc已写prefix；各loop assigns包含实际当前写入的义务和函数assigns均真正证明。原invariant、postcondition、公开requires原样保留。

其余修改全是官方WP证明策略，不增加事实：展开`shift_float32`；按当前lane索引是否等于被读lane分情况；对`included`使用`Wp.valid`；在RVV退出处由i≤vl且vl≤i证明i=vl并重写。保存的TIP脚本和raw对应所有新增通过目标。lane frame最终只需展开`shift_float32(p,0)`，即可调用原模型中的真实读写保持理论。

逐项新关闭：

- vst1q_f32 / vst1_f32 / RVV vse32：三个prefix不变量preserved。
- RVV vse32：输出postcondition与loop assigns part3。
- vst1_lane_f32：外部不相交指针的frame postcondition。

v04详细原始证据、hash、control和各TIP脚本在`v04/checked-result.json`。`sequent01/02/03`保存原、动态prefix、有界prefix的真实WP公式，不是solver结果。

v06是全新冻结合并：v12最新mask/codec证明 + v04已检查store证明，只替换float_ops.c的证明注释，其他v12内容逐字保留；已完成整核full，主体491/541，加10/10全局共501/551，仍不能称为整核通过。v05只准备signed reinterpret地址展开，因该方向交给另一worker已取消，没有证明结果；真实公式在`sequent-reinterpret01`可供接手。

与最新v12整核raw严格对齐时，这四helper原为40/46，v04为48/48：保留全部旧46目标，关闭其中6项缺口，另增加且证明2项动态loop assigns目标。因此合并整核应检查541个主体目标（旧539+2），不以分母下降获得通过。

整核v06 raw与v12逐goal核对：0遗漏、0回归；7个旧未证目标本轮通过（原6个store缺口，加equivalent_call_vst1_lane_f32_requires_2），另2个新增loop assigns目标通过。剩50=equivalent46+两个signed reinterpret各2。control false ensures依然timeout、true ensures通过，所有日志无Why3/export/type异常。实际full主命令无-wp-fct/-wp-prop缩小范围，closure检查器仍保留全部实际调用。具体pending和hash见`v06/checked-result.json`。Timeout/failed不构成kernel反例。

v07只新增官方`VmemIncluded:"@requires"`提示：22个原有caller callpre完整覆盖，21/22，关闭两条NEONload前提，RVVload仍超时；@requires元数据被旧Gateway按字面判missing，实际22目标无遗漏。v08将此提示与root的`VmemIncluded:equivalent`联合后完整full真实完成：**522/541 +10/10=532/551**，剩19=caller15（4memory+10value+1RVVload）+signed4；相对v06关闭31旧目标，零遗漏/回归，全部541目标相同。控制正常，无导出/类型错误。v09扩大显式validity策略的82目标focus达600秒取消，无main raw，不计新增通过。v10与v11正在缩小scope，其中v11仅给4旧assert+1旧private requires加元数据标签，公式逐字不变，映射见v11/goal-label-map.json。


v09/v12 均在600秒墙钟限时取消，没有主证明 raw，不计新通过。v10 的21/22仍使用旧通用策略；v11新增稳定标签后精确五项0/5。新 v13 已撤除递归 context 展开，转为显式承载公开规格导出的输入有效性/分离循环不变量，所有新增建立/保持义务同原五项一起验证。见各版本 diagnostic-result.json；不能将 focus 记录称为整核通过。


v13 实际诊断完成：19/19 主义务 + 10/10 globals。原五个 memory/load 目标全闭；新增七条不变量的十四个建立/保持目标也全闭，没有将欠债转移到新前件。公开 C/spec/shim/native-v6 模型冻结、负控制正常；该记录为局部 scope，整核需独立合并全量复查。证据见 v13/checked-result.json 与 source-identity-audit.json。


harness v01 实际7/9+17globals；v02实际11/13+18globals，剩独立scalar slope frame和最终forall两项unknown。v02同proof的全部RTE实际10/10+18globals，无导出错误、source/model/checker保持冻结；非整核通过。v03继续将scalar frame显式carry到NEON循环，并对ghost counter出口做checked归一化cuts，所有新增义务仍须真实检查。


harness v03 实际31/33+18globals，原point/all已闭但scalarframe/params1建立两债未闭。v04通过3个独立checked store前空间cut实例化已证readonly合同，最终36/36+18globals=54/54，无新局部前件债、10RTE全闭。root独审通过，LLVM IR相同。合并包和全量必查清单在 harness-values-v04/integration-delta/；这仍是局部结果，最后整核必须与signed及NEON/RVV值proof统一full重查。
