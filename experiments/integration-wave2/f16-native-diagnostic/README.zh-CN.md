有限本机差分诊断，没有完整等价性证明或新 kernel 收录。

逐字复制 f16 v04 frozen manifest 的普通 C/H，使用原 equivalent 包装；n=1..97，
每个长度64组，共6208组。输入恰好分配 n+3 个 float，两个输出各 n 个 uint16，
独立 malloc 满足现有 spec 的有效范围与 separation。params 为 NULL，原程序不读它，
现有公开 spec 也没有 params 前件。舍入环境固定 FE_TONEAREST。

前23组轮换正负零、subnormal、FP16边界、最大有限数、Inf、signaling/quiet NaN；
后41组使用固定种子 0x05a17f16 的 xorshift32 位模式。长度覆盖 NEON 的8/4元素
路径和 RVV 的32元素路径及其余数。Clang14 O0、ASan+UBSan 下6208组输出相同，
sanitizer 没有报错。具体命令、原始stdout/stderr和源码 SHA 在 result/provenance.json。

这个有限集合不能证明任意长度、全部 float 位模式或其他舍入环境。它没有消除
WP 中的 fabs 合同、byte-view、codec 和最终 caller 义务；也没有验证真实 ISA
与 C/shim 的对应。未修改原实现、公开 spec、浮点模型或 verified manifest。
