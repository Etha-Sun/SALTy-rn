f32-vmin v2：在独立修补的 WP 前端下验证，旧目录 f32-vmin/ 的隔离记录保留。

实现、公共 spec 和 wrapper 与之前冻结版本逐字节相同；proof.patch 是唯一证明文件。
共享 shim C 已按该版本冻结并放在本目录。全局模型在 experiments/shim-c-v2/model-front/。
观察：输出逐项数值相等或双方 NaN；不比较 NaN payload、正负零位、FP flags 或 errno。
固定 VLEN=128，本 kernel 的 RVV e32m8 capacity=32、VL=min(remaining,32)。
长度在 spec.h 允许范围内为符号值；此结果不是任意 VLEN/VL 调度或机器二进制等价。

源证明记录：experiments/shim-c-v2/frontend-campaign/f32-vmin/logs/agent01-summary.json，536/536。
打包后的 canonical01 已完整重验：536/536，源文件/模型 hash 均未改变；所有函体及全局 lemma 检查覆盖。
LLVM IR 两份编译产物逐字节相同。旧 llvm-diff-14 对相同输入也返回 1，原始失败保留在 llvm/result.json；身份判断单独记录在 llvm/byte-identity-audit.json。
重放：python3 tools/shim_c_campaign_v2.py verified/f32-vmin-v2 --frozen-sha256 edd91ec7ac875ee5ebb2bab04881f869ba5edea2590fc2d74a3030354c8e0069 --name replay02 --framac /zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence/experiments/shim-c-v2/model-front/frama-c.py --prover-bin /zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin

TCB 仍包括 C→WP 前端、模型/driver、SMT、检查器、ABI/浮点环境和 ISA intrinsic→C shim 对应。
额外内存模型假设及未支持的 alignment/valid_function RTE 留在实际日志中；不宣称穷尽 C UB。
