# f32-dwconv2d-chw 整合与复验

公开 spec、普通 C、shim、driver 和模型保持冻结。Argmax 使用独立保留且预先审计的安全 tail 修复 target；旧版未覆盖。

本轮 proof 种子：

- ROOT10 full annotation seed with local approved model.
- DeepSeek pure congruence lemma additions: 

新增改动（是否通过以实际 raw 为准）：["vld2q_dup_f32 exact pair-lane load post and two-float valid_read", "vld2_dup_f32 exact pair-lane load post and two-float valid_read"]

范围纠正：Supplementary shared helper proof diagnostic. v4 call closure lists both pairload helpers as unreachable from this kernel, so remaining ensures are not actual kernel blockers.

详细报告：[review.json](review.json)。原 v3 profile 保留；closure-v4 仅加强全局引理与调用闭包检查，普通输入不变。所有 early guard/parse 失败保留，不能解释成 kernel 功能反例。

|Profile / attempt|状态|主报告|
|---|---|---|
|attempts/0001|guard_rejected|尚无主报告|
|attempts/0002|incomplete|尚无主报告|
|closure-v4/attempts/0001|incomplete|尚无主报告|
|globals02/attempts/0001|incomplete|6/6|
|pairload-helper02/attempts/0001|cancelled|尚无主报告|
|pairload-helper02/attempts/0002|failed|尚无主报告|
|pairload-helper02/attempts/0003|incomplete|18/20|
|pairload-helper02/attempts/0004|incomplete|18/20|

当前新增完整收录：0。非空 raw、全部 body/global/caller/control/冻结检查和 root 独立复验均完成后才可收录。
