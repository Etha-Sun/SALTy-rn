# F32 VSQRT：原始 kernel 与显式 intrinsic 规范边界

只有 `proof/status.json` 明确记录 `scope: full`、`passed: true` 和 `whole_kernel_verified: true`，且完整源身份与类型门禁有效时，本案才算完整验收。数学引理、单项 C VC、组件门禁及有限 native 检查都不能单独增加已验证 kernel 数量。

两侧 `impl/testNEON.c`、`impl/testRVV.c` 保持原始字节，身份见 `proof/originals.json`。公开入口是 `spec.c` 的 `equivalent`。输出观察是逐元素数值相等或两侧均为 NaN；不要求两侧 NaN 符号、payload 相同。输入、输出及框架资源按公开契约保留。

输入包含全部 FP32：NaN（含 signaling NaN）、正负无穷、正负零、subnormal，以及负数。公开 `n` 范围为 `0<n<=4611686018427387903`，对应合法的 64 位字节计数；输入拥有 `n+3` 个 float，输出各拥有恰好 `n` 个 float。参数未使用，允许传 NULL。内存有效性及自然四字节对齐来自既有 `FloatArray` 谓词，没有另加较强对齐条件。

ARM 环境固定为 RNE、DN=0、FZ=0、FIZ=0、AH=0，异常陷阱关闭且不观察异常标志。RVV 固定 VLEN=128、SEW=32、LMUL=8、VLMAX=32、FRM=RNE。VL 允许规范规定的所有逐点合法选择：AVL≤32 时取 AVL，32<AVL<64 时在 ceil(AVL/2)..32 之间，AVL≥64 时取32。逻辑 inactive 字段任意，既不强制为零，也不把它们作为实际 ISA 尾部位模式的证明；只约束和存储 active prefix。

按项目 intrinsic-spec 政策，7个载入、sqrt、抽取与 setvl intrinsic 使用逐项对照官方来源的规范。定义、契约原文 SHA、官方版本/页码、配置及人工审核状态见 `proof/intrinsic-ledger.json`。ARM 的输入 NaN 保留符号/payload 并置 quiet 位，负数 invalid 产生默认 NaN；RVV 使用 canonical NaN。两侧使用 Flocq 的 RNE binary32 sqrt 数学核心和各自的 NaN 包装；`Sqrt.Observation` 在该模型上证明数值或双 NaN 观察一致。没有证明官方 ISA/Sail 到这些定义的形式化精化，也没有证明物理向量 ABI、编译器或总终止性。最终人工规范审阅仍是独立边界。

4个存储入口另外经过真实指针适配 C body 检查；借用完整输入 region 的 load 契约保留同一资源，精确约束读窗地址和范围。普通 assertion、读取、NaN 观察桥、比较循环、两侧 kernel 循环/内存以及公开 caller 都属于实际 C 证明范围。9个实际单元共262个 C 接口字段（含重复接口/校验，不能称262个唯一语义义务）；实际清单和全新重生成结果由冻结 H 与完整报告核对。

有限 native 使用当前 scalar-field intrinsic 规范模拟器、实际适配器和原 kernel/public caller。UBSan 与 ASan 各49,536例、每侧3,219,840 lane，覆盖32种合法 VL 选择模式、特殊位模式、随机数、input pad3 与精确输出范围。独立 `sqrtl` oracle 检查输出，并分别检查 ARM quiet payload 与 RVV canonical NaN；两侧共同翻错输出的负控必须被 oracle 明确拒绝。两种模式都实际限制16GiB，ASan 使用 swap=0 的 cgroup。有限运行不是全域证明，精确当前输入与日志见 `proof/native-status.json`。

历史156例 native、旧0CVC探针和条件性生成实验保留在 `.build/pre-intrinsic-spec-boundary`，不作为本轮证明。新一轮还保留两类被拒绝的前端/注释目标：按值存储契约造成重复 initialized/undef 输出 heap；入口 cut 遗失 unused 参数局部 cell。最终分别采用实际单次求值指针存储适配器、以及各 cut/invariant 的 current==pre 参数链接修正；C 原文、公开域及资源均未削弱。所有失败源码、目标、日志与后续胜源保持独立，见本案 `.build` 和状态记录。

完整重放配置32个调度 job；普通 Coq 编译池实际最多同时16进程，每进程16GiB（合计上限256GiB），用于与服务器上的其它验证批次共享内存。等待依赖或编译槽位不消耗单项 proof timeout。9个独立 C 单元的生成仍可并行，每进程32GiB、有限6小时时限；普通证明采用有限2小时、重项4小时预算。完整门禁必须重新生成全部实际目标/策略、从源码重新编译87个 BASE 模块与本案递归依赖、检查严格接口和所有分组 Print，并核对外部库对象来源。
