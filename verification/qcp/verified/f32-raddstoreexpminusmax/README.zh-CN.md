# F32 RADDSTOREEXPMINUSMAX

证明对象是 `impl/` 中的当前 C 程序。最终完整结果只以
`proof/status.json` 的 full 证书为准；生成目标、组件通过、有限 native
测试均不单独代表整核通过。

原件在 `proof/original/`。原 RVV 的变长累加和无序归约不能复现 NEON 的
四个累加器、`(a0+a1)+(a2+a3)` 和最后 2+1 尾部顺序，已保留有限反例。
修复后的 RVV 在完整硬件 VLMAX16 上请求 AVL4，显式重建该树；没有使用浮点
加法结合律。九个十六进制常量转换为精确同值十进制，嵌套调用改为单次求值的
临时变量。原因、原件、GNU 零 fuzz 补丁和反例分别见 `proof/repair.json`、
`proof/originals.json`、`proof/repair.patch` 和 `proof/original-counterexamples.json`。

范围包含所有 IEEE754 binary32（NaN、Inf、正负零、subnormal），固定 RNE。
比较对象是给定多项式与位操作算法，未证明其数学 exp 近似误差。
观察已写浮点输出和最终 sum：数值相等或双方均为 NaN；不观察 NaN payload、
浮点异常标志、时间或物理 ABI。RVV 配置为 VLEN128、SEW32、LMUL4、VLMAX16，
保留架构允许的全部 VL 选择；程序请求的短 AVL 有唯一合法结果。

公开内存条件使用共享只读图，允许 input/max 重叠和重复读；一个可变图同时覆盖
output/sum，允许两者别名，最终写入获胜，初态可以是任意 None/Some。
只读图与可变图分离。原 C prototype 没有 restrict；input==output 的原地调用
属于这里尚未证明的范围，并非声称原 C 禁止该调用。输入带三个 padding lane；
正的 64 位字节 batch 是 4 的倍数；未使用的 params 可以为 NULL。

`public_spec.c` 实际顺序调用两侧程序，后置条件比较第一次的历史状态和第二次的
最终状态并保留未写 frame。返回 1 是后置条件的见证，**不是运行时比较器**。
有限测试另外使用独立 scalar/tree oracle，并检查双侧共同错误能被拒绝。

原始 intrinsic 的 40 个形式视图、官方来源、精确 Coq 定义与源 SHA 在
`proof/intrinsic-ledger.json`；最终人工规格审查仍 pending，未声称已证明 ISA
对应或物理 ABI。工具自动生成的 R/Int/Arch32BE 结构定义明确拒绝编译；
实际 Float/UInt 目标使用 `VectorRecords.v` 的 fp32/Float、64 位小端定义。
四个 `*_def.v` 仅转出这一个模型；完整门禁另行保存每次原始 emitted 定义文本、
原 SHA 和实际编译模型 SHA，供复核此表示边界。普通 C helpers、两侧循环/内存和公开 caller 必须通过完整
实际 C 调用闭包和新生成目标的普通 Coq 类型检查。没有终止性定理。

完整重放使用 `proof/build_full_handoff.py`、`proof/check_full.py`；封存后的
H 不可覆盖。重放从当前 C/头文件私有生成翻译单元，从 `.v` 编译全部所需
项目依赖，逐字段检查假设并记录全部来源。默认配置 32 jobs，实际 admission
服从共享资源预算；普通进程 16GiB，重型 32GiB，均有有限时限。
