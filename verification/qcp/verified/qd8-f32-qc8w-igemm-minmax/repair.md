# IGEMM 唯一修复/兼容日志

NEON仅去除表回退指针cast中的restrict；原始快照保留。RVV把两个标量自比较NaN检测写为__builtin_isnan，把*a0++拆为读取再递增；不改变分支选址、循环、packed布局、整数/浮点运算顺序或公开域。shim中isnan使用GEMM已检查普通helper；本案以新生成/编译和完整接口绑定检查其body。

目的为适配QCP表达式与ABI路径，精确补丁在proof/evidence/rvv-repair.patch，原始快照和SHA保留。未声称原版到当前改写的形式refinement。整核尚未闭合。

rvv02已执行到整核末尾表游标回退处，QCP拒绝cast type内的restrict语法。rvv03移除该cast上的restrict限定（参数/局部声明restrict保留），指针回退表达式和原表步长保持。失败记录完整保留。

NEON具有同一个table回退cast语法；只去掉cast上的restrict，参数与局部声明限定保留，原快照/精确补丁在proof/evidence/original-neon.c和neon-compat.patch。RVV03完整生成719字段后才应用此独立NEON改动；RVV03原始输入记录保留。

## 策略类型绑定修正

`shim/copy.strategies` 的16位有符号内存类型由 `short` 改为策略语言的具体类型 `I16`。隔离实际StrategyCheck确认前者打印为自由类型变量，后者精确生成 `FET_short`。不改变C实现或输入域。旧neon01因这一确定输入缺陷停止，保留日志；rvv03仅作为旧目标证据，最终采用修正策略重新生成并绑定。禁止手改生成的策略目标以代替策略源修正。

独立窗口选择注释统一使用 `zero@pre/zero_data@pre/a_offset@pre`，使其与 `input_mapping` 的入口参数一致。旧目标中的which_implies 4/12/18遗漏这个关系，属于注释信息丢失；kernel代码和公开前置条件不变。隔离rvv05与当前neon03重生保留旧、新证据。
