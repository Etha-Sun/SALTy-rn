# f32-dwconv-minmax 整合与复验

公开 spec、普通 C、shim、driver 和模型保持冻结。Argmax 使用独立保留且预先审计的安全 tail 修复 target；旧版未覆盖。

本轮 proof 种子：

- ROOT10 full annotation seed with local approved model.
- DeepSeek pure congruence lemma additions: ext_fma_congruence3,ext_add_congruence1,ext_add_congruence2,ext_max_congruence1,ext_min_congruence1

新增改动（是否通过以实际 raw 为准）：["Correct do/while output_width invariant to permit zero on real exit", "Carry full original weight entry-memory validity through both enclosing RVV loops", "Prove current weight pre-validity before returned struct allocation; derive allocation-length separation without new assumption"]

详细报告：[review.json](review.json)。原 v3 profile 保留；closure-v4 仅加强全局引理与调用闭包检查，普通输入不变。所有 early guard/parse 失败保留，不能解释成 kernel 功能反例。

|Profile / attempt|状态|主报告|
|---|---|---|
|attempts/0001|guard_rejected|尚无主报告|
|attempts/0002|incomplete|尚无主报告|
|attempts/0003|cancelled|尚无主报告|
|closure-v4/attempts/0001|cancelled|尚无主报告|
|frame-entry03/attempts/0001|incomplete|7/12|
|frame-entry04/attempts/0001|incomplete|7/13|
|frame-prestate02/attempts/0001|incomplete|4/9|
|globals02/attempts/0001|incomplete|14/14|

当前新增完整收录：0。非空 raw、全部 body/global/caller/control/冻结检查和 root 独立复验均完成后才可收录。
