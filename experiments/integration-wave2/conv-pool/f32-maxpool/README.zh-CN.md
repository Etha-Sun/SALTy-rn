# f32-maxpool 整合与复验

公开 spec、普通 C、shim、driver 和模型保持冻结。Argmax 使用独立保留且预先审计的安全 tail 修复 target；旧版未覆盖。

本轮 proof 种子：

- ROOT10 full annotation seed with local approved model.
- DeepSeek pure congruence lemma additions: core_pool_assoc,core_pool_commute,core_pool_congruence,core_pool_max_congruence,core_pool_min_congruence,core_pool_clamp_congruence

详细报告：[review.json](review.json)。原 v3 profile 保留；closure-v4 仅加强全局引理与调用闭包检查，普通输入不变。所有 early guard/parse 失败保留，不能解释成 kernel 功能反例。

|Profile / attempt|状态|主报告|
|---|---|---|
|attempts/0001|incomplete|尚无主报告|
|attempts/0002|incomplete|尚无主报告|
|attempts/0003|cancelled|尚无主报告|
|globals02/attempts/0001|incomplete|11/11|

当前新增完整收录：0。非空 raw、全部 body/global/caller/control/冻结检查和 root 独立复验均完成后才可收录。
