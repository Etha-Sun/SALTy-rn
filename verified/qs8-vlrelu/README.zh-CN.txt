qs8-vlrelu：候选已完成两次完整检查；当前仅待canonical重放，不代表已经加入manifest。
spec.h与普通C独立冻结；唯一证明文件proof.patch，ghost helper都在该patch内。original保留原kernel。
纯整数Bytes模型，LP64小端，VLEN=128，VL=min(remaining,32)。长度为公开spec范围内符号值。
libc memcpy内容/终止/退出合同、WP/Why3/SMT及memory model属于TCB；ISA到shim对应未证明。
工具外部构建缓存不入Git，fresh clone并不是已配置环境。重放命令见canonical01-command.json。

重要审计更正：本目录canonical虽全绿，但旧Bytes地址范围law组合经独立Lean证明存在逻辑矛盾，本目录未加入manifest，不可作为已验证等价性的收录结果。旧记录原样保留；须使用删除该law的新独立模型重新冻结验证。详情见 experiments/codex-kernel-wave1/audit/pointer-range-consistency-root01/。
