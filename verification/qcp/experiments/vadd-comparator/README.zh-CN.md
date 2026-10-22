# 实际数组比较循环的 QCP/Coq 证明

从框架worktree根运行：

```sh
python3 verification/qcp/experiments/vadd-comparator/run.py
```

`comparator.c` 对两个真实浮点数组执行while循环：用已经证明的 `qcp_vadd_read` 读取两侧第i个元素，调用已经证明的 `same_lane` 比较；不匹配返回0，遍历完返回1。输入合同为正的有界符号长度、两块分离数组资源与 `outputs_related(L,R)`，其中该谓词在 `ComparatorLogic.v` 中定义为 `Forall2 same_value`，`same_value`直接引用NaN bridge的定义。没有有限浮点/非NaN前提，也没有固定循环展开长度。

完整loop的 **12个canonical VC** 已检查，包含初始化/保持不变量、两次read的调用条件、逐元素关系实例化、不可达失败返回、最终返回1和数组资源保持。最初的冗余 `Zlength(L)=n` 前提已去掉：循环初始化证明直接从 `FloatArray.full` 的已证长度性质导出。`ListBridge.related_Znth` 用于从Forall2关系得到第i个元素的关系。

独立的 `comparator.strategies` 有4条实际检查的策略：既有数组读出/重组两条，加上 `FloatArray.seg(p,0,n,L)` 归一化为full，以及full资源消去。策略目标由真实StrategyCheck生成，四个证明在 `comparator_strategy_proof.v` 中。没有修改已发布的shared/vadd策略或旧proof。

本实验不把两个callee当作只声明的可信外部函数。Runner逐字核对caller原型合同与实际callee合同，重新从真实 `array_read.c` 和 `bridge.c` 生成VC，并在独立复制的Coq namespace中重查：read的2个VC、identity/check_observation/same_lane的14个VC、原数组策略2条，以及本实验的12个loop VC与4条策略。自动生成的Admitted文件不进入编译链。

Runner还将最后的 `return 1` 改为 `return 0` 作负控制：QCP必须因返回合同出现 `0 == 1` 而拒绝，环境错误不算此控制通过。原生控制检查相关数组返回1、末元素不等返回0、输入字节保持，覆盖NaN不同payload、±0、Inf、subnormal及随机bit值。实际计数、命令、文件SHA和Coq假设报告见 `status.json` 及其指向的隔离日志。

证明边界：

- 本结果证明实际比较循环在两个输出列表已满足关系时安全返回1；两个原始vadd kernel建立该关系的义务仍由它们自己的body证明承担。
- 比较调用采用已证的identity NaN桥；桥的观察等价引理保持原inline比较语义。整个mapper从重复数组表达式到这些read/helper调用的程序变换对应，仍是独立集成义务，不能用本局部结果直接标记整个`equivalent`已证。
- QCP给出的这些VC是partial correctness；本实验没有另证整个程序的终止语义定理。
- `Print Assumptions`保留QCP地址/布局参数和标准Coq/Flocq外延性、经典实数假设。没有新增axiom、未证cut或排除NaN。
- `full_vadd_kernel_proof`在本结果中固定为false；局部28个body VC的通过不能换成整核通过数量。
