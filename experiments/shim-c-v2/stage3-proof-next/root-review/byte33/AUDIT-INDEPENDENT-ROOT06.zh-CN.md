# Byte33 独立审查

choice-body18 实际 6/6，完整源与导出保留。其组合证明沿用 IEEE Float32，encode/decode 仅在模块化组合检查中为未解释函数；依赖的 store-read、load-frame 及其 codec 前置 body 已在 native 驱动下检查，不能用本次组合证明取代 native codec 资格。运行模型仍使用 native BV/IEEE 驱动。

两个 adapter 源码均只删除完整非目标 assert，保留声明、定义和最后的 negated goal；只允许一次普通 check-sat，不接受 push/pop/reset。删假设使任务更强，因此加强任务 UNSAT 可支持原任务；SAT 不能反推原任务或 kernel 有反例。Z3 的第二阶段只是另一组保留名单，未增加假设。返回结果仍依赖固定 solver；本次静态审查不是重新证明 solver。

本独立版本的 MemBytes.ml 已删除旧 CODEC_FLOAT 的三条 admitted codec 定律，拒绝 Real 模式，并在每次 store_float 生成新的 nan_seed。不能将旧不健全 Bytes+float 的绿色记录沿用；新版本必须独立核对源码、binary、driver 与锁，并完成正反控制及严格 known-case 复验。

当前 **codec 481/488，尚未达到资格门槛**。除 6 条预设 false 外，多出真实前提 `memcpy_requires_valid_dest_28`（函数 `abstract_negative_shared_seed`，源 controls.c:410，完整目标 `bytes_bytefloat_fma_abstract_negative_shared_seed_call_memcpy_3_requires_valid_dest`）未闭合。故意负 post 所在函数的真实 memcpy 前提不能豁免。根正在定点检查，严格复验暂缓。

建议比较 v31/v33 对应完整原 SMT：先确认目标和旧假设不变，再比较新增 choice/range auto_instance 数量。choice 合同只约束内存读写值，不修改有效域；若仅增加已证事实而目标未变，逻辑上不会将原真命题变假，但可能改变搜索性能。没有实际 SMT 对照前不能断言只是性能回退，也不能将 timeout 说成 kernel 错误。

actual store 46/46、5 个 named 主程序目标 5/5，以及 with/without observer 的 memory 31/34，仅分别支持这些局部结果；均不代表已完成 kernel 或模型资格。最终仍要求全量正反控制准确匹配、严格 known-case 所有 raw VC 通过、guard/unchanged/model/control 均真且 pending/missing-body/global 为空。
