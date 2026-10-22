# 从共同输出模型到观察等价

运行 `python3 verification/qcp/experiments/vadd-relations/run.py`。它先重编依赖，再检查九个纯Coq引理；没有生成或声称新的C VC。

- `same_value_reflexive`：任意fp32与自身满足“数值相等或双方NaN”，包括NaN、无穷和有符号零；该定理closed。
- `identical_outputs_are_related`：任意同一列表的两份结果满足`Forall2 same_value`；该定理closed。
- `shared_vadd_model_implies_related`：若两侧结果分别等于同一个`vadd_values n A B`，则满足比较器需要的逐元素观察关系。类型引用浮点加法模型，因此Print Assumptions仍列出该模型的标准Coq/Flocq实数和外延性假设。

这些引理连接kernel内部输出模型与公开比较循环，不把kernel post作为已完成的证明：两个实际kernel满足`vadd_values`及源码转换对应关系仍需分别检查。没有排除NaN，没有新增axiom或Admitted。`status.json`记录源文件hash和实际编译命令。

`VaddSegments.v` 增加三个基础list引理及三个循环模型引理：

- `vadd_values_length`：合法范围内输出长度恰为k。
- `vadd_values_split`：任意非负k/m的结果可分成已处理前缀及skipn后的剩余计算；这是无额外数组长度要求的截断列表恒等式。
- `vadd_values_nth`：合法索引处恰为两个输入元素的fp32_add；左右数组可以有不同总长度。

这些引理供NEON循环块和1/2/3元素tail复用；没有将C循环保持性当成已证。runner中的9项包括原3项和新增6项，不是9个新的C VC。
