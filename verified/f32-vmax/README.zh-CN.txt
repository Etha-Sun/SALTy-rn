模型一致性审计：此浮点结果已隔离，不再计入verified。
同上下文无前置条件的ensures false被判valid；下方全绿数字仅为历史运行记录。
原因与证据见logs/model-control01及../../docs/shared-shim/EXTENSION-RESULTS.zh-CN.txt。

f32-vmax：冻结普通 C 输出等价性证明

正式重放 canonical01：528/528，249.545 秒，complete=true。
结论只在 spec.h 前置条件、固定 VLEN=128 和声明的 C/浮点模型下成立。
长度为符号长度，非固定测试数组上限；实际 VL 调度为 min(AVL,capacity)。

neon.c、rvv.c 是普通 C intrinsic shim 的两个实际 kernel；spec.h 是冻结公共规格，
harness.c 调用双方并比较输出；unit.c 引入这些文件与共享模块。
proof.patch 是唯一的每-kernel 证明文件，不修改实现/spec。
共享原语合同/循环证明保存在 frozen.json 的 proof_patches 列表；这些共享证明在
本 kernel 的 WP 运行中也重新产生 body/lemma 义务，并非未证明的自由 helper 合同。
此 proof.patch 新增非空行 205（含 ACSL/ghost 定界行，不是 tactic 个数）。

公共输出观察：数值相等或双方 NaN；不比较 NaN payload、正负零位、FP flags、errno。
target 已修复 NaN propagation，original/rvv.c 保留原版。

检查：冻结 SHA、注释移除后的 C token、预处理 C token 相同；host LLVM IR 字节完全相同。
min/max 的 llvm-diff14 连同自身比较也返回1，原失败记录保留，字节相同审计另列
logs/llvm-byte-audit.json；此诊断不改变 WP 和源码冻结结果。
ISA→shim 对应、Frama-C/WP/Why3模型及 driver、检查器实现仍在可信边界内。
Typed 附加内存假设及不支持的 alignment/valid_function guard 保留在日志；不宣称穷尽 C UB。

重放（使用新名字，保护原记录）：
python3 tools/shim_c_campaign.py verified/f32-vmax --frozen-sha256 5cb8ff06e44e0a699c127656686548e09413a91ba2b5db2dcbf07756af1a1489 --name replay02 --framac /path/to/frama-c --prover-bin /path/to/provers/bin

证明结果：logs/canonical01-summary.json、canonical01.json、canonical01.log。
冻结输入/所用 proof SHA 均在 summary 中；旧版实验在 experiments/shared-extension/float/f32-vmax。
