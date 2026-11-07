
**门禁变更（用户 11-07 决定）：intrinsic 不需要 C 函数体和函数体证明。** 见更新后的 COMMON-RULES 第 4 条：每个 ISA 一个共享 intrinsic 合同库（记录 sha256），合同写成"输出 lane = 具名 Coq 函数(输入 lane)"，每个具名函数对真实指令做差分测试。`xnn_*` wrapper 和 static inline 函数仍要证函数体。已证明的 shim 函数体可以保留，但不要再为 intrinsic 函数体花时间。

**do-while 崩溃（你的 P4）：** 用户决定不把它做成工具规则，改为人工审核的兼容改写，流程见 COMMON-RULES 第 4 条末尾。请把 P4 的效果改成 `manual-rewrites/` 下的补丁加说明，作用对象是统一工具 `rvv_ptr_lower` 的输出。你的草稿工具 `hvx_ptr_lower` 不能出现在最终包里：P2 就是已合入的 R23；其余规则请逐条列出，说明统一工具里是否已有对应规则（R 编号），没有的单独列出，交监督者裁定。

**HVX 范围与工具（用户 11-07）：** best effort，没有限制最好；HVX 整数类优先保证至少一个完整成功例子，浮点类能做就尝试。
- 你下一轮可以使用 WebFetch / WebSearch 查 Qualcomm HVX 文档和 QEMU 源码（只读；Bash 的网络仍在沙箱内）。引用要写 URL 和访问日期；仍未核实的说法照旧标 [未验证]。不要把未公开的项目内容发到任何外部服务。
- 新 QEMU：`research/sol-pipeline-comparison-20261030/tools/qemu-11.1.3-dl/x/usr/bin/qemu-hexagon`（11.1.3，支持 `-cpu v68 … v73`，sha256 记在 `tools/DOWNLOADS.sha256`）。监督者实测：v73 上整数 HVX 正常，**qf32 指令（`Q6_Vqf32_vadd_VsfVsf` 等）报 illegal instruction，即 QEMU 11 没有实现 HVX qfloat**；QEMU 也没有 v79/v81（IEEE sf HVX）。编译选项：`-mcpu=hexagonv73+hvxv73+hvx_length128b+hvx_qfloat`。所以浮点 HVX 没有可执行的差分对象，若要做，qf32 语义只能来自文档，必须标为未经执行验证的建模前提。
