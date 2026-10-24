# F32 → F16 C-shim 验证

验收结论以 [proof/status.json](proof/status.json)、[完整重放记录](proof/full-status.json) 和发布清单为准。组件证明、原生测试和 CPP 预检不能代替完整门禁。

53 个实际 helper 翻译单元和公开 caller/comparator 的普通 Coq typed gate 共包含 2138 个单元 VC 字段。NEON 整体函数 419 个实际字段、RVV 整体函数 115 个实际字段也分别在新编译依赖闭包中通过严格 `VC_Correct` 和全部对应 `Print Assumptions`。RVV 组件的 32 组证明从源码重编，共 73 个本案普通 Coq 模块通过；其 typed/115 项假设审计通过记录在 `proof/rvv-proof-status.json`。全域逐元素输出位相等、带界列表前缀及 ushort 字节视图的辅助引理已检查。

完整门禁包含 56 个实际 C 翻译单元、2672 个单元 VC 字段、119 个唯一函数体及 13 组共 36 个策略字段。它重新生成当前 C/策略目标，检查实际调用闭包，重新编译本案递归依赖与 BASE 的 87 个源码模块，并对全部 2708 项做分片假设审计和最终 typed 汇总。冻结清单在 `proof/frozen-full-handoff.json`；所有完整 C 输入从当前 `impl/spec/shim` 和注释即时构造到私有 `.build`，`proof/c` 不保留第二份完整函数体。

历史工具/证明尝试均保留：一轮在接近 16 GiB 时发生目标导出 SIGSEGV，没有形成完整目标；另一个 114 字段命名 cut 缺少值关系前提，未被采纳。当前 115 字段目标只给既有值作恒等命名，全部实际字段已证明。旧超时、OOM 和被更短真实证明替代的诊断进程均按真实结果记录，取消的重复诊断不算证明失败或成功；没有借这些历史结果取得整案信用。

整案 CPP 预检已核对 56 个翻译单元、119 个实际函数体及全部调用闭包；这项预检不是完整证明。证据在各 `proof/*-status.json` 和 `.build/`，最终状态以 `proof/status.json` 为准。

原件保留在 `proof/original/`。当前实现仅把两种固定十六进制浮点常量改成精确同值的十进制 `f` 拼写，以适配 QCP lexer；每侧各两处。保留了零 fuzz patch replay、独立 compiler bitprobe 和普通 Coq literal 位桥。该兼容处理记录在 `proof/compatibility.json`，不是语义 bug 修复，不能称为原 token 未变。

当前原生检查在 UBSan、ASan 下各通过 2304 cases、每侧 295775 lanes，独立 oracle 是 GCC12 `_Float16` 的 RNE cast；NaN 的 half 符号/规范 payload 从原始输入位独立判定。两侧同时输出相同错误的负控均被 oracle 明确拒绝。每进程限 16 GiB；ASan 实读 cgroup memory.max=16 GiB、swap.max=0。输出特意偏移两个字节，检查了不要求四字节对齐的尾存储；输入及 guard 保留。这些有限测试不是全域证明。

公开域包括所有 binary32 位模式（NaN/Inf/±0/subnormal），正 n、输入 n+3 个 float、两侧各 n 个 ushort，未使用 params 可为 NULL。RVV 固定 VLEN128、e32m8/e16m4、VLMAX32，选择 VL=min(AVL,32)；inactive 的零代表值不被存储观察。NEON 自比 vext 只借用一份资源，尾部通过真实 ushort C 存储写四字节，不解引用未对齐 uint32 指针。

目标是该固定 C-shim 的部分正确性和两侧 ushort 输出位相等。ISA/物理向量 ABI 对应、终止定理，以及抽象 IEEE binary16 转换规范的全域形式精化均不在本案已建立结论中。单元 VC 字段数不表示唯一语义义务，也不表示新增多个 kernel。

逐项人工审阅入口：[intrinsic-review.json](proof/intrinsic-review.json) 列出原始 48 个 intrinsic、51 个所用 provider、精确 Coq 返回合同/数值定义全名、文件 SHA 和官方规范来源；包含 load/store/vsetvl 及固定立即数适配。原始 grouped 语义说明在 [semantics.json](proof/semantics.json)。这些来源审阅不表示 ISA 形式精化。
