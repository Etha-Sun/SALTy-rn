# 七核最终审计候选

没有新增完整kernel通过。全部7核均有实质proof改动、新guard及实际WP；冻结普通C/model/driver文件SHA全部匹配，public spec逐字相同。所有旧版、失败和工具错误保留。唯一机器索引为final-results.json；每核selection.json给出审核索引；pack/transpose现在有fresh normal controls的新solver-only候选，核心mapping仍未证。

|kernel|实际证据/剩余|
|---|---|
|f32-vsqrt|选v01；同候选full459/476（含globals6/6），17欠：10条Typed bit/memcpy codec、sqrt舍入算法1、caller6。|
|f32-vrndne|选v04；同候选full1500/1674 =main1486/1660+globals14/14，174欠（caller157/helper17）。新增3个private memory pre的15个caller子目标全过；两个原输出值关系还有7个子目标未过。store4四ensures和join_all两RTE已闭。|
|f32-vcmul|选v07；同候选full388/426（含globals7/7），38欠全在equivalent；所有helper/global真闭。v08 main array策略无收益。toy表明uintptr+1的小上下文仍未证，非不可能性定理。|
|f32-f16-vcvt|选v04；此新候选未full。旧v02 full942/994；v03六浮点helper诊断93/95（四加乘body闭）；v04两byte helper22/28（termination/index闭，memory/post/assigns6欠）。fabs2和codec待解；Typed cast warning不是绝对不可能性证明。|
|qs8-vmul-minmax-fp32|选v10；同候选full825/877，无source globals；52欠：caller34、byte stores8、reinterpret10。9个算术/shift helper中原11条失败在full闭合，新增power/quotient全部body/pre过。未纳入v08/v09失败global lemma。|
|x32-packw-gemm-goi|选新v07-z3cvc5：只移除故障Alt-Ergo，proof与v04同SHA；fresh controls正常，mapping focus0/2。新配置未full，旧全部WP正结果仍不合资格。有限差分筛查不作证明。|
|x32-transposec|选新v07-z3cvc5：只移除故障Alt-Ergo，proof与v04同SHA；fresh controls正常，mapping focus0/1。新配置未full，旧全部WP正结果仍不合资格。有限差分筛查不作证明。|

不能比较不同分母直接宣称净改善。closed-helper-goals.json仅对照特定旧失败及新函数body；function focus遗漏global时明确记录。全量source globals可已包含在combined raw，不能重复相加。所有新helper必须检查body及caller；public spec从未加强。

可选实验说明：qs8 v08/v09的uint64→int16投影lemma实证0/1，已从推荐v10排除；v08 function focus15/15未产生global，不能当lemma成功。vrndne qnan ensures依赖尚未证quiet-range cuts，未声称关闭；v05 bitwise/range也仍有未闭子目标。

已关闭的主要旧helper失败为qs8 11项、vcmul2项、f16四项；此外vrndne store4四项/join_all两RTE在新private memory pre的15个caller子目标实际证明后闭合。kernel最终输出等价性仍未完成。

根审计修正：pack/transpose的旧checker accepted没有通过严格控制资格审查。负控制中的Alt-Ergo Why3异常使旧版无正常控制可回退；所有旧版WP raw仅作未资格化诊断，不计可移植正结果。root授权新v07-z3cvc5仅删除故障prover，fresh controls真正正常；mapping仍全未证，新profile未full，没有新增完整kernel。见各核control-qualification-audit.json，原始log/summary均保留。
