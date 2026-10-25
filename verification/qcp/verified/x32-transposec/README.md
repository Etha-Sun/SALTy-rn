# x32-transposec：修复版完整 C-shim 验证

本案两侧实现、普通 helper、公开调用入口和统一源码重放门禁均已通过。正式准入状态见 [proof/status.json](proof/status.json) 与全局 verified 清单。

本次结果：8 个实际 C 单元、381 项 C 证明义务、13 个普通函数体、116 个源码重新编译的本地 Coq 模块；完整 `VC_Correct` 绑定、16 组假设报告和最终门禁通过，共 489 项最终报告（381 C、108 数学）。11 项既有框架假设逐项公开，未新增项目公理。9 项 intrinsic 采用源规范对应的公开合同，未计入 C-body 或形式 ISA refinement 信用；最终人工规格审核仍待进行。

输出关系覆盖任意 written 地址上的完整 UInt32 位值，并保留每次执行各自的 unwritten 初值（包括未初始化的 None）。仅在两侧 unwritten 初值相同的条件下，进一步给出完整输出 map 相等。输入只读 map 允许合法的行复用和 padding 别名；输出权限与只读输入分离。条件内存域、模64原入口 assert、64位计数、零高度无访存、全部合法 VL 和任意 inactive lane 都保留。

修复与兼容改动：RVV 高度非零时将零宽按一列处理；NEON 保留原 assert 后增加零高度返回，将 tuple ZIP 拆为原生 AArch64 ZIP1/ZIP2，并在正值归一化后机械调整外层循环形式。实际 tile2×2、高列先写低列后写及奇数尾部顺序保持。原件、原版不等价反例、零 fuzz 精确补丁和来源见 [proof/repair.json](proof/repair.json)、[proof/originals.json](proof/originals.json) 和 [proof/original-counterexample.json](proof/original-counterexample.json)。没有声称建立原始 C 到兼容改写 C 的完整形式 refinement；本次证明对象是明确记录的当前修复/兼容实现。

固定 RVV 配置为 VLEN128、e32m8、VLMAX32。byte-stride 的 signed64 API 映射及模64地址对应有单独数学证明；多 lane strided store 的无序访存通过活动输出地址互异处理。规范定义、合同、官方版本及审查边界见 [intrinsic 台账](proof/intrinsic-ledger.json)。本结果不包含任意硬件 VLEN、机器 ISA/编译器/ABI 对应或独立完整终止性。

有限原生回归另记：UBSan 与实际 16GiB/swap0、LSan 开启的 ASan，各执行 8,808 个矩阵用例、每侧 1,006,296 个 written word、67 个零高度调用和 127,014 次当前公开 caller 调用；覆盖 3 种合法 VL 选择与 2 种 inactive-tail 填充。独立 scalar oracle、完整输出/间隙/guard/输入保持和两种错误负控均通过。两架构真实 SDK 编译也通过。它们不替代 Coq 证明。

冻结候选阶段说明 [README.zh-CN.md](README.zh-CN.md) 是本次 H 的原字节输入，其开头“尚未通过”描述冻结时的历史状态；本文件在门禁完成后新增，用于记录当前结果。原 254 项冻结输入、模型、实际 CPP、目标与证明没有因此改动。归档器和迁移审计只检查身份，不被记作第二次形式化重放。重放脚本可能覆盖收据，重新验证请先复制到隔离目录并保存历史记录。

审核顺序：`impl/` → `spec.c` → `shim/` 和台账引用的 Coq 定义 → `proof/frozen-full-handoff.json` → `proof/full-status.json`、假设审计与 `proof/evidence/full-run/`。

本次 full SHA256：`0a3b17c1cd3b0413e076ebee3300faf940d9aae691e240f23f399d282b0636a2`。

H SHA256：`d0b64cb097d1fc81bde18cee7c04304f61b81069421d4fbd9d77c1f60e7037c6`。
