# SPMM nnz 单步游标证明修订

所有候选引用 frame-v3 相同的原 C、公共 spec/wrapper、shim、Typed+raw+float 模型锁及 checker。只改各版本唯一 proof.patch；不新增 requires、不改变普通 C token。最终候选 cuts-v4 的补丁含一个无前提、有实际空函数体的 ghost 纯整数引理 spmm_u32_decrement；其 ensures 需由函数体独立证明，未引入 axiom 或外部 ghost 合同。

本轮集中于 RVV 内层 nnz 循环：给递减前范围、weight/dmap 单步推进增加显式切分点，再以已证明的 uint32 无回绕关系重定位下一步指针。每个新增 assert 都单独保留验证义务。

历史与对照：
- cuts-v1 的多 assert 共用一个 ACSL 注释导致 parser error，保留失败命令和日志，未计证明结果。
- cuts-v2 修格式，30 秒/solver 定点 9/10，新 4 assert 全过，weight preserved 未证。
- cuts-v3 添加 uint32 无回绕与指针重定位，12/13；weight preserved 通过但新增 decrement_exact 未证，属于债务转移，不能称闭合。
- baseline-frame-v3 是原 proof 相同配置对照：5/6；nnz 保持在 30 秒预算下原本可通过，weight preserved 仍 timeout。
- cuts-v4 用有 body ghost helper 证明无回绕：定点 14/14，包含原 6 项、7 个新 assert 和 helper 自身 ensures。实际证明改善是 weight preserved 闭合；不能把 nnz 保持由更长预算获得的通过归功于 proof 修改。

selected01 仅定点诊断，仍依赖完整程序的其他未证义务，不是整核通过。helper01 单独检查新 helper 完整义务；inventory-body / inventory-lemmas 重新枚举新候选；logs/full01* 保存正式 checker 的完整尝试及只读 observer 事件。完整尝试的执行适配器只加入固定只读 observer 并把 solver 内存上限设为 2048MB；请求与实际命令均记录。

print.log 的首次无 solver 打印未设置 observer 环境变量，插件加载失败；print02 去除 observer 后完成。它们均非 solver 验收，失败记录保留。

本次无回绕 helper 是无状态的整数事实：参数本身为 uint32_t，结论只在 x>0 时要求 `(uint32_t)(x-1)==x-1`；空 body 的 ensures 由 Z3 实际证明，assigns 由 Qed 证明。调用处已有循环不变量 1<=nnz，因此没有给 kernel 增加域条件。把纯整数事实从带完整 Raw 内存上下文的主 VC 中隔离，解决了已观察到的 weight 归纳困难。

剩余工作仍包括整个循环的内存安全/frame、跨列 prefix_nnz 与地址桥、FMA 结果累计及两侧输出连接。此处“6 项游标组闭合”不代表内层循环全部 VC 闭合；尤其不能忽略 canonical_nan、vld2q_dup_f32 和浮点累计 helper 的未证义务。
