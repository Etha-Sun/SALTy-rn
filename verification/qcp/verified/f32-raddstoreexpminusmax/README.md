# F32 RAddStoreExpMinusMax 候选

本案尚未完成形式验证，不计入 verified。原件保存在 `proof/original/`，身份见 `proof/originals.json`。

原 RVV 使用可变 VL 的 lane 累加和无序归约，未保留 NEON 的四个独立累加器、固定 pairwise 树以及尾部 2+1 顺序。实际 7 元素有限反例已复现：NEON sum 为 `36620cbc`，RVV 为 `36620cbd`；输入、原件、运行日志和预算见 `proof/original-counterexamples.json`。修复在真实 RVV C 中请求 bulk AVL=4，硬件仍固定 VLEN128/e32m4/VLMAX16；末端显式取前四个 lane，执行同一树与尾部顺序。没有使用浮点结合律，也没有把原无序归约规格选成 NEON 的树。

两侧九个十六进制浮点常量改写成 Fraction 推导的精确同值十进制常量。GNU patch 零模糊重放和九项编译器位身份检查通过；普通 Coq 常量桥仍待完成。补丁、原因和相关历史见 `proof/repair.json`。

当前双 sanitizer 有限检查各 6192 例、每侧 402480 个有效 lane，修复结果均通过独立标量 IEEE 表达式与 NEON 累加树参考；原版 sum 有 824 处差异。覆盖 NaN/Inf/±0/subnormal、随机位、两种合法原 VL 选择、max/input 只读别名、sum/output 重复地址和 NULL unused params。双共同错误负控均由独立 oracle 明确拒绝，ASan 实测内存上限16GiB、swap0。`proof/native-status.json` 只记录有限测试，不能替代所有合法输入/VL 的证明。

通用 RNE 浮点、NaN 与精确位转换数学从已冻结 DWConv 源迁移并在新 namespace 中从 `.v` 重新编译；没有复用组件 `.vo` 或整核信用。主多项式、归约、内存、实际 C 目标及整案 fresh 门禁尚未完成。计划公开全部 FP32 的 numeric-or-bothNaN 观察，保留原 bit 操作、FMA/乘法/减法次序、任意正64位 byte batch 的合法内存域、输入 padding3 和 unused NULL params。sum 与输出共享一个写状态，最后的 sum 写回允许覆盖输出位置。ISA 规范逐项人工审核待完成；真实 ISA 形式对应、物理 ABI、异常标志和完整终止性不在当前证明信用内。

本轮新增的程序数学保持四路累加器、`(a0+a1)+(a2+a3)` 和尾部先两项后单项的顺序。它覆盖全部 FP32，包括 NaN；未使用浮点加法结合律。`proof/accumulator-status.json` 记录普通 Coq 从源码编译结果，仍不是实际 C kernel 证书。

形式内存接口采用一个共享只读图覆盖 input/max，因此允许两者重复或重叠读取；一个共享可写图覆盖 output/sum，因此允许 sum 指向某个 output 单元并保留最后一次写入。只读图与可写图在 SEP 中分离。原始 C 原型没有 `restrict`，本次契约没有证明 input==output 原地执行或任意可写/只读重叠，不能将其描述成原程序的限制或所有别名已覆盖。

当前兼容版还把嵌套 reinterpret/shift/BIC 与 slide/extract 改写成同类型命名临时量，每个原始 intrinsic 单次求值；原件、完整零 fuzz 补丁、改写前 native 状态以及诊断原样保留。这属于公开实现的兼容改写，没有隐藏在注释生成器中。原始 IEEE 运算和归约顺序保持。
