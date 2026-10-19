f32-vmax v2：在独立修补的 WP 前端下验证，旧目录 f32-vmax/ 的隔离记录保留。

实现、公共 spec 和 wrapper 与之前冻结版本逐字节相同；proof.patch 是唯一证明文件。
共享 shim C 已按该版本冻结并放在本目录。全局模型在 experiments/shim-c-v2/model-front/。
观察：输出逐项数值相等或双方 NaN；不比较 NaN payload、正负零位、FP flags 或 errno。
固定 VLEN=128，本 kernel 的 RVV e32m8 capacity=32、VL=min(remaining,32)。
长度在 spec.h 允许范围内为符号值；此结果不是任意 VLEN/VL 调度或机器二进制等价。

源证明记录：experiments/shim-c-v2/float-proof-candidates/f32-vmax-q-complete-front/logs/proof01-summary.json，538/538。
打包后的 canonical01 已完整重验：538/538，源文件/模型 hash 均未改变；所有函体及全局 lemma 检查覆盖。
LLVM IR 两份编译产物逐字节相同。旧 llvm-diff-14 对相同输入也返回 1，原始失败保留在 llvm/result.json；身份判断单独记录在 llvm/byte-identity-audit.json。
重放：python3 tools/shim_c_campaign_v2.py verified/f32-vmax-v2 --frozen-sha256 0f6b253a60e337d84772053826e4d1552e1a9f81878f6c318675bb002eab71f9 --name replay02 --framac /zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence/experiments/shim-c-v2/model-front/frama-c.py --prover-bin /zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin

TCB 仍包括 C→WP 前端、模型/driver、SMT、检查器、ABI/浮点环境和 ISA intrinsic→C shim 对应。
额外内存模型假设及未支持的 alignment/valid_function RTE 留在实际日志中；不宣称穷尽 C UB。
