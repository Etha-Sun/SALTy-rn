纯整数 Bytes v4：删除全局地址范围公理的独立版本

旧 v3 在 MemBytes.PointersProperties 中，对所有静态 base 的所有整数 offset
无条件声明 int_of_addr 属于有限 uint64 区间。base=0 总是静态，addr offset
无界；结合 addr_of_int 左逆，这些前提相互矛盾。独立 Lean 证明和源码对应见
../../audit/pointer-range-consistency-root01/，peer 复核见
../../maxpool-address-wave2/pointer-range-lean-peer-review.json。

本版本只删除 MemBytes.ml 中 ranges 定义和一次调用，共11行，不补新公理。
MemAddr、Cint、字节模型、浮点 codec 拒绝和 ProofEngine 统计修复均不变。
source-audit.json 给出逐源码哈希，no-pointer-range.patch 是完整差异。
旧 v3、旧 proof 和旧绿色日志全部保留；旧绿色记录不具新增验收资格。

Root 已独立复核锁内34197个文件，并重新运行整数正反控制、mask 控制、
wrapper 的 float/额外 driver 拒绝和直接 binary 的 float codec 拒绝。
结果见 ../../audit/integer-v4-root-independent01/。这只确认指定回归及该
冲突已被移除，不是所有剩余模型公理的一致性证明。

实现、spec.h、wrapper 固定后，每个 kernel 仍须重新完整检查、独立重验、
打包后 canonical 重放，检查全部实际 body/global lemma、调用闭包、RTE、
终止/退出/variant，并检查没有额外 memory model 前提。不得引用旧模型下的
局部或整核计数代替新检查。libc memcpy 合同、ABI、内存模型、WP/Why3/SMT
与工具链仍是 TCB；ISA 到普通 C shim 的对应未证明。

构建入口为上级 build_integer_no_pointer_range.py，先按旧 v2/v3 文档恢复
外部 Frama-C/opam 环境与 v3 构建，再在全新命名空间构建。工具拒绝覆盖旧版。
.build、安装二进制和生成 wp-share 不入 Git；fresh clone 不是配置好的环境。
跨机器或新安装必须另行冻结新锁并实际复验。model_lock.json 的 candidate
文字是构建时快照，后续资格以独立审计为准，不原地改锁中的历史字段。
