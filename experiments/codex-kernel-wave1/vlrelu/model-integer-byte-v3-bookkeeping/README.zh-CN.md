纯整数 Bytes 模型的独立检查器构建

以 experiments/shim-c-v2/model-integer-byte-v2 为基础，仅修改 ProofEngine.ml 对内部 Wpo.is_trivial 子目标的结果统计；MemBytes、Cint 和所有语义库原样保留。source-audit.json 记录 10893 份不变源码以及唯一变化；trivial-child-stats.patch 是完整补丁。此修复让标准 tactic 已化简为真的子目标正确计入报告，不加入新的数学或内存公理。

frama-c.py 逐项校验 model_lock.json，再调用独立 .build/install。仅允许纯整数 Bytes 和此目录的 wp-share；浮点 codec 与额外语义 driver/library 被拒绝。本构建没有替换系统 Frama-C，也没有覆盖旧模型或旧结果。

本轮正反控制、原语以及实际 kernel 的完整/失败记录分别在 qs8-vlrelu-v*/logs 和 ../../integer/qs8-vcvt-modular-v*/logs。统计修复和控制拒绝并不是整个内存模型的一致性定理。标准 libc 的 memcpy 内容、终止和不异常退出合同仍属 TCB，memcpy 的实现没有在这些 kernel 包中验证。默认合同的完整生效导出见 ../../audit/cvt-libc-effective-root02/。

恢复环境先按照旧 model-integer-byte-v2 和 toolchain-build 的 README 准备外部依赖，再在全新命名空间执行上一级 build_integer_bookkeeping.py。该脚本拒绝覆盖已有目录。脚本还依赖 float-bits/model-native-bytes32-v5-bookkeeping/trivial-child-stats.patch 的同字节副本。新的安装与路径需要重新冻结、重跑控制，不能把历史 hash 或历史通过日志当作 fresh clone 已配置、已经验证的证据。

.build、安装二进制和生成 wp-share 缓存不入 Git；model_lock.json 是本次实际环境的完整清单。锁内仍保留构建时的 candidate 字段，资格和验证状态以独立审计及每个完整 run 的 summary 为准，不能为了改文字而静默更改冻结 hash。
