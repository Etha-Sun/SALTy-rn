
**门禁变更（用户 11-07 决定）：intrinsic 不需要 C 函数体和函数体证明。** 见更新后的 COMMON-RULES 第 4 条：每个 ISA 一个共享 intrinsic 合同库（记录 sha256），合同写成"输出 lane = 具名 Coq 函数(输入 lane)"，每个具名函数对真实指令做差分测试。`xnn_*` wrapper 和 static inline 函数仍要证函数体。已证明的 shim 函数体可以保留，但不要再为 intrinsic 函数体花时间。

对 W02 的补充：`f32_to_bits` / `bits_to_f32` 按 intrinsic 合同处理即可，不需要我另外批准信任基；`and_ps`、`blendv` 等也可以直接写成按位的函数式合同（具名 Coq 函数经 `bits_of_fp32`），配差分测试，不必写 int 位运算的 C 体。R24 的裁定等你本轮报告后给出。

**用户 11-07 采用方案 (b)：** 平凡转发的 `xnn_*` wrapper（预处理后函数体恰好是一条形参按原顺序的 intrinsic 调用，无常量、无转换）可以进合同库、不证函数体，条件见 COMMON-RULES 第 4 条；检查脚本要写进 `check.py` 门禁。请下一轮**先做实测**：把 `xnn_storeu_f32` 按这个方式处理（合同可以写成让 QCP 方便处理的形状，例如按值参数的 lane 作为纯值），看调用处的陈旧所有权问题是否消失、R24 是否还需要。把结果写进报告；R24 只有在实测证明仍然需要时才提交审批。
