# 原生 BV 分解候选 v3（未证明）

仅准备源码与无solver导出，未修改v1/v2/旧driver/share。

采用无axiom的自定义NativeBV原语，Z3 driver将类型直接映射SMT BitVec32/64，所有操作映射int2bv、bv2int、原生FP bitcast和v1原样encoder。没有使用Why3标准bv模块，避免其to_uint_of_int公理先行假定本次待证目标。

prerequisites.mlw包含四个彼此独立、有=() body的lemma：两种宽度的非NaN BV逆关系，以及有界int→BV→int。interfaces.mlw包含两个独立、有body的界面一致性lemma（各有decode/encode ensures），目标只是native展开后的相同表达式，不假定逆关系。全部仅导入原语，不导入候选lemma。

三批导出exit0。SMT审查见AUDIT.json：每个goal前只有继承Cfloat的标准CompatOrderMult事实，没有codec或BV逆关系假设、没有未解释codec/BV原语；BV逆goal完全在BV域，int往返goal仅含bv2int(int2bv(n))。这些只是导出审查，不能视为证明。

commands.json固定精确root运行命令（Z3-only，30秒/2048MB）与导出命令。CVC5 encoder不支持fp.to_ieee_bv，因此不在本配置中。

negative.mlw使用具体NaN bits：64位0x7ff8000000000001、32位0x7fc00001，seed=0；本encoder选择0x7ff0000000000001/0x7f800001。错误“仍等于原bits”的goal应实际得到SAT拒绝；另含false控制。不以timeout替代反例。

组合阶段见composition-plan.txt：先待四个前提body与两个接口body实际Valid并锁定证据，再生成调用这些已证helper的第三阶段组合module。当前刻意不import未证lemma，也没有伪造已完成的组合证明。若int/BV往返仍超时，保留结果并继续拆解，不增加axiom或kernel前提。
