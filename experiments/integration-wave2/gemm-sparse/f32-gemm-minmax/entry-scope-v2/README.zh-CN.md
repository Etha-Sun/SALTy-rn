# GEMM：修正内联入口状态绑定

保留上一候选全部实现、公开 spec、模型、driver、helper/ghost body 和 global lemma，只调整两个 ROOT10 入口 cut 的状态绑定。`../proof-analysis/inlined.c` 显示内联后的 `\at(w,Pre)` 变成 `\at(w_19,Pre)`，其中 `w_19` 是 wrapper 内部才初始化的局部变量。这里用明确的 ghost `Wave2KernelEntry` label 绑定真实 kernel 入口，不更改公开函数的 `Pre`。

新增 `wave2_entry_snapshot` 检查 W0/NC/KC 与真实入口值的关系，保留 `root86_weight_origin` 和相同完整 packed-weight 范围的 `root86_weight_entry_valid`，同时检查实际 `next_w_frame_0`。入口内存有效性必须从原 wrapper 公开前置条件与实际调用赋值得到，没有新增输入条件或假设。source guard、同上下文 true/false、全部20个 global lemma 也照常运行。

本轮是4个实际目标的定点诊断，并非整核验收。旧错误绑定和旧失败记录均保留在父目录的 attempt0003；本次证据在 `attempts/0001/`。完整 helper、循环、RTE、调用前件、输出 caller 仍须另行闭合。
