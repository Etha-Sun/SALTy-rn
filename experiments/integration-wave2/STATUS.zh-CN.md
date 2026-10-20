# 第二轮整合检查点

当前 `verified/manifest.json` 仍为 15 个程序，与 HEAD 相同。本轮新增整核通过为 **0**。
既有全局清单另有 22 个待证、3 个缺 target；本轮处理的是其中两批材料去重后的 17 个 kernel，
均已建立独立候选、整合证明并实际运行。其余 5 个待证项未由本轮结果自动变成通过。
下列数字对应特定 proof 快照；不把诊断计数、全局引理与整核重复相加。

| Kernel | 已完成的本轮证据 | 尚未关闭的原因 |
|---|---|---|
| f32-vlrelu | 最终合并 v02 完整 **770/770**（main749/749+global21/21），36个body coverage齐全；source/model posthash、control、LLVM和独立目标ID审计均通过。8片诊断另749/749，root独审 | 同proof独立完整重放及打包canonical仍在运行，manifest尚未准入；旧729/735、depth8 727/735及timeout记录均保留 |
| f32-vsqrt | 整核 459/476 | 10 条 Typed memcpy/codec、1 条纯 C sqrt 算法与 IEEE sqrt 关系、6 条 caller |
| f32-vrndne | 整核 1500/1674 | caller 157、helper 17；已关闭 store 和 ghost read 等具体义务，仍缺舍入/位表示与 caller 关系 |
| f32-vcmul | 整核 388/426；VMLA/VMLS 两项原 helper 缺口关闭，helper body 全部通过 | 38 条 caller；含地址整数转换后的布局/边界和读写 frame |
| f32-f16-vcvt | 较早同轮 v02 整核 942/994；推荐 v04 六函数诊断 93/95；6208 个有限 C 测试通过 | codec、caller；外部 fabsf 契约允许负零，而更强的中间 same_float 契约要求正零，属于抽象不足，尚非 kernel 反例 |
| qs8-vmul-minmax-fp32 | 整核 v10 为 825/877；9 个 helper 中 11 条原缺口关闭；新增 v12 byte-store 诊断 14/16、新调用前件 2/2，root 核对通过 | v10 的 caller 34、byte store 8、reinterpret 10 为旧完整快照；v12 精确关闭原4条索引义务及全部新增循环义务，两条 byte-store 内存 RTE 仍未证；未重跑整核，不改写旧通过率。v13 body18/20把两旧RTE转移到两新q-valid建立义务；净关闭0、caller超时，root不采纳；Typed signed/unsigned字符指针地址桥缺失已保存精确公式 |
| x32-packw-gemm-goi | 新 v07-z3cvc5 控制合格，核心映射诊断 0/2；7560 个有限 C 测试通过 | 通用索引/packed layout 映射证明；整核预算内未产生最终 main raw |
| x32-transposec | 新 v07-z3cvc5 控制合格，核心映射诊断 0/1；9520 个有限 C 测试通过 | 二维行列与 stride 映射证明；整核预算内未产生最终 main raw |
| f32-gemm-minmax | global 20/20；修正 entry label 作用域后，入口/布局诊断 9/12 | Typed codec、packed weight 与 frame；整核 1150 秒预算内无最终 main raw |
| f32-igemm-minmax | global 16/16 | 间接输入表、多行别名/布局、Typed codec 与 caller；整核 1150 秒预算内无最终 main raw |
| qd8-f32-qc4w-gemm-minmax | global 14/14 | 实际量化 helper body、assigns/RTE、packed weight 和 caller；整核 1150 秒预算内无最终 main raw |
| f32-spmm-minmax | global 13/13 | sparse 映射、uintptr 地址/stride、frame 与 caller；整核 1150 秒预算内无最终 main raw |
| f32-conv-hwc2chw | 旧诊断 global 18/18；新 v4 回放 17/18，其中 1 条超时，不能继承旧绿灯 | 修复 target 的边界、frame 和 codec；整核预算内无最终 main raw |
| f32-dwconv-minmax | global 14/14；frame/entry 诊断 7/13 | 6 条实际 frame/入口长度义务及完整 caller；整核预算内无最终 main raw |
| f32-dwconv2d-chw | global 6/6 | rolling window、row/height frame、实际 mask load/reinterpret/FMA；整核预算内无最终 main raw |
| f32-maxpool | global 11/11，含 6 条合并的数学 pool/clamp 引理 | uintptr/tree mapping、store frame 与 caller；整核预算内无最终 main raw |
| f32-argmaxpool | 保留原版及既有修复 target；u32 四函数诊断 55/60，其中 move 12/12、merge 15/15；global 5/5 | load/store 仍缺 5 条内存/前缀/assigns；body 出现 addr/int 导出类型错误；整核预算内无最终 main raw |

## 采用的思路

- 保留已有数学恒等式与 layout/entry proof，按实际调用闭包检查；不把未调用的辅助函数列为整核债务。
- 用官方 WP strategy 检查地址展开、有效子区间、有限索引分支、byte transport。每个 cut 的 Clause 和 Assume 都必须实际关闭。
- signed reinterpret 的四条缺口已用检查过的 byte transport、u32 范围与两条 native sign 引理解决，无新模型公理。
- 值关系优先补可复用、独立检查的纯引理和必要的点式 ghost helper，不增加公开前置条件。

## 本轮审计边界

普通 C、公开 spec、shim、driver、模型及 checker 未改变。新任务只改变 proof 和明确记录的搜索/调度配置。
现有 CONV、ARGMAXPOOL 修复 target 已在上一轮冻结；本轮不另改 target。
本轮未发现新的实际 C 功能反例。超时、导出错误和缺失证明均不能称为 kernel 错误。

`TypedMemAddr` 的 uintptr 算术与对象偏移之间存在具体模型表达缺口，证据见
`vcmul-memory/address-audit/README.zh-CN.md`。这不是只增加 timeout 就能保证解决的问题；
后续若要改 ABI/内存模型，必须另建版本、明确有效对象与 provenance 条件、独立检查，不能直接增加可能矛盾的通用地址公理。

packw/transpose 的旧 Alt-Ergo profile 存在导出失败，因此其旧 negative control 不合格；
新 v07 只换到已安装的 z3,cvc5，重新检查控制。没有改写旧结果。

全体 17 个候选的普通 C/注释 C host LLVM IR 字节一致。旧 llvm-diff-14 checker 对部分相同文件的自身比较也返回 1；
原 checker 字段保留，字节一致证据单独记录。这不是原 ISA 到 shim 的正确性证明。

详见 `noncomplex/final-results.json`、`gemm-sparse/RESULTS.json`、`conv-pool/*/review.json`，
以及各次 `attempts/*/proof.patch`、raw JSON 和 root 审计文件。最新 vlrelu 收尾结果应以其新快照为准。
