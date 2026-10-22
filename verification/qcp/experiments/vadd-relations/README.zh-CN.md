# 从共同输出模型到观察等价

运行 `python3 verification/qcp/experiments/vadd-relations/run.py`。它先重编依赖，再检查三个纯Coq引理；没有生成或声称新的C VC。

- `same_value_reflexive`：任意fp32与自身满足“数值相等或双方NaN”，包括NaN、无穷和有符号零；该定理closed。
- `identical_outputs_are_related`：任意同一列表的两份结果满足`Forall2 same_value`；该定理closed。
- `shared_vadd_model_implies_related`：若两侧结果分别等于同一个`vadd_values n A B`，则满足比较器需要的逐元素观察关系。类型引用浮点加法模型，因此Print Assumptions仍列出该模型的标准Coq/Flocq实数和外延性假设。

这些引理连接kernel内部输出模型与公开比较循环，不把kernel post作为已完成的证明：两个实际kernel满足`vadd_values`及源码转换对应关系仍需分别检查。没有排除NaN，没有新增axiom或Admitted。`status.json`记录源文件hash和实际编译命令。
