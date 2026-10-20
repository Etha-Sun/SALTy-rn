# f32-argmaxpool 整合与复验

公开 spec、普通 C、shim、driver 和模型保持冻结。Argmax 使用独立保留且预先审计的安全 tail 修复 target；旧版未覆盖。

本轮 proof 种子：

- ROOT10 repaired-tail proof, independently rebound to local approved native Bytes-v6 FMA model; preserve exact repaired C/spec.

新增改动（是否通过以实际 raw 为准）：["__riscv_vle32_v_u32m8", "__riscv_vmv_v_x_u32m8", "__riscv_vse32_v_u32m8", "__riscv_vmerge_vxm_u32m8"]

详细报告：[review.json](review.json)。原 v3 profile 保留；closure-v4 仅加强全局引理与调用闭包检查，普通输入不变。所有 early guard/parse 失败保留，不能解释成 kernel 功能反例。

|Profile / attempt|状态|主报告|
|---|---|---|
|attempts/0001|cancelled|尚无主报告|
|attempts/0002|cancelled|尚无主报告|
|u32-helper02/attempts/0001|cancelled|尚无主报告|
|u32-helper02/attempts/0002|incomplete|48/53|
|u32-helper02/attempts/0003|incomplete|55/60|

当前新增完整收录：0。非空 raw、全部 body/global/caller/control/冻结检查和 root 独立复验均完成后才可收录。
