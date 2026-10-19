# Typed chunk rank 独立修复候选

旧 MemTyped.int_rank 的 UInt128/SInt128 为 9/10，而 M_f32/M_f64 也是 9/10；compare 使用 rank 差，可能把不同 chunk 当成同一个 key。只将后续类型依次编号为 11..15，使 compare=0 与 chunk 相等一致。

旧 source、binary、share 和锁未动；基于独立 unary 修复 source。未引入公理或新增前提。因果关系及新模型尚未认证：需实际正反控制、IEEE/FMA/结构体/宽整数与旧通过 case 复验、新锁和新 freeze。禁止将本候选用于旧冻结记录或宣称新 kernel 通过。

## 实际对照

独立编译完成，structcopy01 在完全相同 proof 的普通配置下为 5/9，四条复制关系断言仍未证，输入 SHA 不变。这与旧 binary 相同；当前没有 rank 冲突导致本 float-only 问题的证据。进一步原始 WP 对照显示赋值关系存在于 Load_S5 等式，默认初始化假设过滤会删除它；关闭 Qed/clean 后仍 5/9，仍须调查 aggregate projection。
