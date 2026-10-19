# int64 按高低32位分解（未证明）

只准备源码和无solver导出，三个独立=() body未导入任何候选lemma；不改旧模型/driver。实际导出exit0，仍待root求解。

1. OfIntSplit：有界n的int2bv64等于concat(int2bv32(n div 2^32), int2bv32(n mod 2^32))。
2. ConcatValue：bv2int(concat(hi,lo))等于2^32*bv2int(hi)+bv2int(lo)。
3. IntegerSplit：有界n的商/余数均在32位范围，并精确重构n。

前三项各自独立，NativeBV仅使用v3自定义原语，无标准BV逆关系公理。前两项导出分别为实际int2bv/concat和bv2int/concat目标。IntegerSplit使用Why3标准整数EuclideanDivision（导出含标准整数除余性质）；没有BV/codec inverse假设或待证目标自身假设。

若三项实际Valid，才可组装int64往返：调用IntegerSplit获得高低范围，OfIntSplit改写表示，ConcatValue拆整数值，再对商/余分别调用v3已body证明的IntRoundtrip32，最后用整数重组等式。当前不导入未证module、不生成虚假组合通过记录。不会重跑其它已证前置/接口。

commands.json提供Z3-only真实求解与导出命令；默认30秒/2048MB。若任何分解仍超时，只标未证，不把代数预期当实际Valid。
