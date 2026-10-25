# X32 Packw-GEMM-GOI 完整验收记录

当前**模块化 SIMD 修复版**已通过全案 fresh 门禁：**13 个实际 C 单元、312 项 C VC、14 个普通函数体、295 次本地普通 Coq 编译、325 条有限命令全部成功**。最终 444 项假设报告由 312 项实际 C 接口报告和 132 项数学报告组成，仅含 10 项既有框架/functional-extensionality 假设，无新项目 Coq 公理。完整核查包括每个实际 C 的完整 `VC_Correct`、再次类型归属、全部字段的 `Print Assumptions`、463 个外部库对象身份和 295 个 fresh 对象加载位置；没有复用组件 `.vo`。

固定证据为 `proof/full-status.json`，运行 `full-q9hrn0sm`；冻结 H 的 SHA256 为 `91fc21b2cfc925a2f4425fffa2519992b6e891f02b97c35611d8e1c18d0a3d7b`。完整归档、逐文件清单及精确继承假设分别见 `proof/evidence/full-run/`、`proof/manifest.json`、`proof/assumption-audit.json`。签发与迁移审计核对证据身份，不是第二次形式证明。

公开域保留正 raw UInt64 `g/nc/kc`，`nr=2/kr=1/sr=1`，所有 UInt32 位型、四字节倍数 `extra_bytes`，以及合同明确的有效、对齐、有界内存。`scale/params` 不被解引用，可取任意指针。weights/bias 共同使用一个 initialized owned-word map，允许二者只读别名；输出与它空间分离。输出由 `Z -> option Z` 状态描述，`None` 可表示未初始化存储。每个真实 input/bias 读取都必须满足存在且初始化的 window，绝不以 lookup 默认值填补缺失读取。完整后状态保存各自未写 holes/gaps/外部 frame 的原 option 值，无需预先初始化这些位置。

配置是 QCP arch64/little，NEON 二个 UInt32 lane，RVV **VLEN=128、SEW=32、main LMUL=4/VLMAX=16、header LMUL=1/VLMAX=4、header VL=2**。main vsetvl 保留 v1.0 的全部合法选择，包含 AVL17..31 的所有合法中间结果；大输入尺寸不等于任意硬件 VLEN。当前证明是该配置和公开存储条件下的 C-shim 模块化部分正确性，没有独立 C 终止性或形式 ISA/ABI/编译器 refinement 结论。

NEON 的每次 pair KC2 迭代真实读取四个权重字，先写深度 k 的两 channel，再写深度 k+1 的两 channel；KC1 尾部读取和写入各两个字。普通 odd helper 每次读取一个权重字，只写对应偶数输出槽。RVV 每次先加载两个 VL-row 权重向量，再由经过实际 C 体证明的普通 helper 调用两条原生 `vsse32`：第一条写 `p+8*i`，第二条写 `p+4+8*i`。每个 chunk 的总读取/写入仍为 `2*VL` 字。单条原生 store 的元素内部顺序不作为可观察量；活动地址互异且输出与只读输入分离，已检查数学桥保证该次序与 segmented 布局的完整后状态相同。header 为 present-bias odd 时仅写一字、保留第二槽；absent bias 时真实写两字零，这一区别保留在共同模型和实际代码中。

普通 header、KC loops、scalar readers/writers、store adapter、两个主函数及公有 caller 均有实际 C 函数体证明。公有 caller 在同一 live buffer 上执行两侧并将首次实际读取保留为 C local，经完整后状态幂等定理检查第二次读取；所观察地址必须在首次执行后已初始化，未写 `None` 不被读取或清零。两侧完整状态的逐位相等由相同输入和初始输出状态的实际 kernel postconditions 给出，不只依赖有限 caller 样例。

`proof/intrinsic-ledger.json` 公开 **12 个 native specification views**（lane0/1 分开登记），逐条包含真实指令对应、完整合同、Coq 定义和锁定的一手来源。它们具有 source-reviewed 规范信用，不具有 intrinsic C body 或 formal ISA correspondence 信用，**人工规格复核仍 pending**。无新 Coq 公理的报告不消除此 native-spec 信任边界。

原始 C、既有兼容版、当前 23-file 零 fuzz patch、修复原因及全部历史失败均保留。当前修复将原 SIMD KC loops/header 因子化为真实普通 helpers，正入口 do 改写为 while，增加显式 group/tile 计数；RVV 原 vcreate+vsseg2 分解为两条原生 strided stores。NEON helper 的所有被 store lane 在 store 前均由原 load 覆盖。没有宣称原始 C 已被完整形式精化，也没有将历史 scalar projection 的 883 项 VC 算作实际 SIMD 成果。

当前源已在两个真实 SDK 上成功编译。有限 UBSan 和实际 16GiB/swap0/LSan ASan 各检查 41,184 个用例、每侧 83,232,864 输出字节、13,728 个 weights/bias 别名用例、三种合法 VL 策略和两种 inactive 模式；每种 sanitizer 还执行 41,184 次真实公有 caller，全部返回 1。独立 indexed oracle 同时检查原版与当前版、全部 OLD holes/gaps/guards、只读输入保持，并拒绝单侧/双侧同错的输出破坏负控。这些有限执行和 SDK 编译分别记录，不替代无限域形式证明。
