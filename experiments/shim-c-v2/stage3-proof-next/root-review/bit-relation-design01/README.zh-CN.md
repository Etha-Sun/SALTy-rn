# 位表示关系的隔离设计探针

这是为第三阶段九项真实依赖 `canonical_nan` 评估的语义片段。**不是已修复的 Frama-C 模型，不是 C body 或整核证明，没有修改/启用任何当前模型。** 当前前端仍禁用旧 Bytes+float。

`codec.smt2` 只用原生 SMT IEEE binary32 与 BV32 操作及有定义的函数，没有额外 codec 公理。decode 是原生逐位解释。非 NaN 的 encode 是原生逐位编码；NaN 的 encode 接受独立 seed，生成任一符号及任一非零尾数，包含 quiet/signaling NaN。不能用固定 canonical NaN 代替所有输入 payload，也不能要求所有 bit-pattern 双向互逆。

固定 Z3 4.12.5 实际检查得到：

- 数值相等或双方 NaN 的往返关系：否定式 unsat。
- 任意 seed 的 NaN 编码均解码为 NaN：否定式 unsat。
- 正负零往返保留符号：否定式 unsat。
- 对所有 bits 要求逐位互逆不成立：sat，给出 NaN bits `0x7f840000` 见证。
- “零位模式是 NaN”的错误主张未获证明；基础上下文有 sat 模型。
- `coverage.smt2` 另外证明每个 NaN 位模式均有显式 seed 可生成，否定式 unsat。这是包含所有 payload 的检查，不能替代整个 C 内存模型的健全性论证。

命令、固定 binary SHA、源 SHA 和完整输出均保存；新运行可用 `run-probe.py <source.smt2> <fresh-run-name>`。首个 codec 运行记录在本目录，coverage 独立记录在 `coverage01/`。

尚待审计的关键问题：Frama-C store/load 中的新鲜 seed 必须在正确位置作非确定选择，不能被错误量化成可挑选的证明见证；同次赋值与复制之间的关联、内存有效性/分离、memcpy 和 endian、double、初始化状态均需处理。现有 MemLoader 的 store_float 仅返回 chunk 与 term，不能假定随意 freshvar 就自动实现了健全的非确定语义。只有补齐这些、建立独立环境版本、跑正反 C 语义控制和完整验收后，才可能用于目标；本探针不能绕开冻结要求或作为未经证明的 lemma 注入当前 proof。
