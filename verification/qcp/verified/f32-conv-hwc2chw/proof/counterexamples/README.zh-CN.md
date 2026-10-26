# 保存的反例与证据范围

- `original-full-kernel/` 是原始两侧实际完整 C 在独立 ISA 仿真/标量 oracle 下的有限反例。原NEON87a57d56…、原RVVdc4b0364…的实际递归编译依赖均已核；run/status、correct.log、编译日志与保存源码完整保留，旧 executable SHA 已核但未复制二进制。H1/W1/top1/start0/end1/C1/pattern1/alias0/policy0/cell0：NEON和oracle为7fc00000，原RVV为c0000000。它证明这一原版输入不一致，不能单独隔离每项修复原因，也不证明全部新实现正确。
- `annotation-only/annotation-pointer-scaling-witness.json` 记录旧私有 NEON 注释把 float* 的偏移重复乘sizeof，48B实际游标与192B错误要求不同。未改公开C；不是新算法反例。
- `annotation-only/width-onepast-endpoint-witness.json`、`Main443DeadCursorWitness.v` 和 `ordinary-status.json` 记录公开域允许 out=2^64-8、H1/N4/C1/hs=cs8/end1；末次逻辑pointer+8为2^64，旧注释取模却为0。原数学源/状态 SHA 已核；无新Coq重跑。现以裸Z游标修正注释，不限制公开域。该端点未由本次 native 仿真直接执行。

这些历史文件均按原字节保存，不对旧失败记录重签，也不把已有Coq局部数学/finite native混为整核形式证明。
