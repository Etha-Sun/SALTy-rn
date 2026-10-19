一致性审计未通过：同一浮点注释上下文能把无前置 ensures \false 的空函数判为 Valid。以下 raw WP 成功计数不能视为可信等价性证明；目前所有 float case 暂停接纳，详见 ../model-audit/INITIAL-ALERT.zh-CN.txt。

f32-vsqrt 未完成证明

结果：347/357 raw obligations，
complete=false，unchanged=true，193.043 秒。
完整证据：logs/run02-summary.json、run02.json、run02.log。
所有 body ensures 和全局 lemma 均有目标覆盖；有目标未通过，不列入 verified。

实现/spec/driver 由 root 冻结，agent 只补 proof.patch。无 axiom/external ghost 合同，
没有排除 NaN/Inf。Typed+float 无法在当前证明中闭合 float/int memcpy 的对象表示桥接。
repr32/from_repr32 是尚待定义和实现证明的逻辑接口，不是可信 axioms；函数 body 对应
postcondition 未证明，所以其消费者即使局部通过也不构成完整证明。

还存在输出的语义组合证明；不可只归结为工具失败，补齐表示桥接后仍需为整个 pipeline
补 pointwise prefix/relational invariants。sqrt 另需建立精确 nearest-even 算法的合同证明。
这里的 timeout 是未完成证明，不是找到 kernel 反例。共享 bits.c 中部分未通过函数
可能不是该 kernel 使用的 API；checker 要求本次编译模块全部 body 验证。

剩余目标（完整名称见 effort.json 同样分组）：
- bits_float: typed_extensions_bits_float_ensures，extensions.h:31，timeout
- bits_float: typed_extensions_bits_float_assigns_normal，representation.c:4，timeout
- bits_float: typed_extensions_bits_float_call_memcpy_requires_valid_dest，representation.c:4，timeout
- bits_float: typed_extensions_bits_float_call_memcpy_requires_valid_src，representation.c:4，timeout
- equivalent: typed_extensions_equivalent_ensures_equal，spec.h:47，timeout
- f32_sqrt: typed_extensions_f32_sqrt_ensures，sqrt.c:7，timeout
- float_bits: typed_extensions_float_bits_ensures，extensions.h:29，timeout
- float_bits: typed_extensions_float_bits_assigns_normal，representation.c:3，timeout
- float_bits: typed_extensions_float_bits_call_memcpy_requires_valid_dest，representation.c:3，timeout
- float_bits: typed_extensions_float_bits_call_memcpy_requires_valid_src，representation.c:3，timeout

case proof ACSL/ghost 非空物理行：32（含注释边界）。
没有独立 per-kernel proof helper 文件。固定 VLEN=128，输入总长度仍为符号值。
