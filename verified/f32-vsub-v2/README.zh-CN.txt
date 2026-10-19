f32-vsub v2：修复前端后的独立版本，旧隔离目录 f32-vsub/ 保留。
实现、公共 spec.h 和 wrapper 与原冻结版本逐字节相同。唯一证明文件是 proof.patch。
两个 kernel 定义前的 ensures 是新增且必须由原函数体证明的中间结论；没有新增前置条件或修改原 spec。
源完整验证：experiments/shim-c-v2/float-proof-candidates/f32-vsub-index-v7-front/logs/proof01-summary.json，556/556。
打包后 canonical01 已完整重验 556/556。LLVM 两份 IR 逐字节相同，llvm-diff 原始返回码保存在 llvm/result.json。
固定 VLEN=128，VL=min(remaining,capacity)，长度在 spec.h 域内为符号值。
比较逐项数值相等或双方NaN，不比较NaN payload、正负零位或FP flags。ISA→C shim 对应仍是TCB。
重放：python3 tools/shim_c_campaign_v7.py verified/f32-vsub-v2 --frozen-sha256 b3f005b1ae73839a6e33f030621a29a9d8a22399d73f66fcc59964f860ab61c1 --name replay02 --framac /zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence/experiments/shim-c-v2/model-front/frama-c.py --prover-bin /zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin
