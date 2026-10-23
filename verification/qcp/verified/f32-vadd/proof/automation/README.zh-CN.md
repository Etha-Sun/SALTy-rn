# VADD：通用内存自动化与算法证明的边界

结论：数组拆分、字段地址归一化、资源重排和frame应进入共享库，不能按kernel重写。
已实现 `FloatMemory.v` 原型：同一个 `float_memory` tactic通过原有39个NEON目标，
包括26个copy/frame、8个load和5个store；目标、C文件、spec及原证明均未修改。
原主证明保留为基线，新脚本独立检查替代证明，尚未切换默认整包检查入口。

```coq
Lemma proof_of_test_neon_partial_solve_wit_12 : test_neon_partial_solve_wit_12.
Proof. unfold test_neon_partial_solve_wit_12; float_memory. Qed.
```

这些lemma外壳由脚本生成，不需要人填写地址、长度、frame或具体VC编号。
`_aux`定义从生成目标中识别。tactic按目标中的数组谓词识别地址、长度、宽度和尾段，
只调用已证明的拆分、地址和分离逻辑规则；不会引入新公理，也不会略过失败目标。

## 当前已验证范围

- f32标量字段表示；向量布局为现有4/2-lane类型。
- 写入prefix宽度1、2、4；读取prefix宽度4；任意起点的单元素undef尾段展开。
- 保留任意未修改frame、字段重排、已初始化资源转为未初始化资源。
- `GenericChecks.v`额外验证了不同变量名、任意二元操作和任意frame；
  要求拒绝“只有1个元素的边界却拆4个”和“把undef当作已初始化值”。
- 尚未在第二个真实kernel验证；不是覆盖全部40个kernel的自动证明器。

先运行主入口完成本机87模块检查，再运行：

```bash
python3 verification/qcp/vadd/proof/automation/check.py
```

脚本复用该已检查基线的外部库路径及本地`.vo`，逐字核对87个本地源文件未改变，
重新编译新tactic、通用正反例和39个替代证明。结果见 `status.json`。
这属于增量检查，不声称再次重建整个基线依赖。

## VADD的逐项归类

| NEON118个目标 | 数量 | 可复用程度 |
|---|---:|---|
| copy/frame | 26 | 本原型已统一自动解决 |
| load | 8 | 本原型已统一自动解决 |
| store | 5 | 本原型已统一自动解决 |
| pure tail | 2 | 同一套逻辑预处理，可生成 |
| adapted | 31 | 19安全条件、12分支条件，多数为算术模板；现有PreH20/PreH21、k/k_2名字耦合需消除 |
| reused | 46 | 直接复用旧VADD定理；不能据此认定可跨kernel直接套用 |

RVV45个目标中，40个调用/安全目标已经按类型生成脚本：13个frame使用同一模板，
其余27个使用纯算术或旧定理。旧定理中含VADD依赖，不能把这些全部算作通用自动化。
剩余5个循环内存目标涉及初始化、出口恢复、当前vl块拆分和回边。
其中数组拆合由量化任意内容、prefix、chunk的 `RvvLoopMemory.v` 提供；
回边中的 `rvv_packed_result_prefix`、`rvv_vadd_append` 属于算法族输出模型的连接。

## 哪些写一次共享，哪些需要实例化

| 层次 | 处理方式 | 例子 |
|---|---|---|
| 内存与frame | 共享引理+tactic；每种元素/向量布局注册一次 | 数组拆合、地址归一化、资源重排、保留未修改区间 |
| intrinsic实现及合同 | 每个新intrinsic/参数配置证明一次，所有kernel复用 | load/store/add、FMA、饱和、转换、mask语义 |
| 算法族 | 共享模型、循环不变量和拼接规则 | 逐元素、归约、扫描、重排、矩阵乘法分别建模板 |
| kernel实例 | 填参数并审核；模板外语义再补证明 | 操作、shape、stride、padding、别名条件、边界及观察关系 |

VADD的 `vadd_values` 是对两输入逐元素应用 `fp32_add`。
其长度、切片、拼接性质大多可以推广为任意二元操作 `op`，不依赖加法结合律。
因此逐元素加、减、乘等可共用算法族证明，再实例化已证intrinsic操作及循环步长。
这是下一步抽象方向，此原型尚未完成这套泛化定理。

矩阵乘法需要不同的不变量：已完成输出块、当前归约位置与部分和，以及packed/stride布局。
浮点归约顺序、FMA与分开乘加的舍入差异必须按实际程序处理。
通用frame tactic只搬运这些已声明的关系，不能自行发现关系或消除真实语义差异。

后续生成流程应从已识别的算法族提出不变量候选，自动发出lemma外壳并尝试共享tactic，
仅把未解决的语义目标交给人。不得靠有限浮点域、新公理或弱化输入输出契约获得通过。
