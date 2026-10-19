qu8-f32-vcvt：已通过 agent 完整检查、root 独立复验和打包后 canonical01 完整重放（994/994），已加入 verified/manifest.json。
实现、spec.h 和 wrapper 与本轮基线字节一致，原始两个 kernel 也单独保留。唯一证明文件 proof.patch，ghost helper 同文件，无额外 per-kernel helper。共享 v8 工具仅从实验目录搬到 tools，ROOT/import 路径按新位置调整，检查逻辑不变。
固定 VLEN=128，VL=min(remaining,32)，长度为公开前提范围内符号值。输出按数值相等或双方NaN比较，不要求NaN payload、正负零位或FP flags相同。ISA/intrinsic到C shim对应、ABI、Frama-C/WP/Why3及solver仍为TCB。
重放命令见 canonical01-command.json。
记录的 agent/root 日志保留候选目录命令路径作为历史来源；正式重放用本目录 canonical01-command.json。LLVM 证据为两份 IR 字节一致，llvm-diff 本身返回 1，不将其记为通过。
