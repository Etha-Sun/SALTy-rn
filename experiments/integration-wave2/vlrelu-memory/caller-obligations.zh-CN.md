这份分类只计`equivalent`实际调用者目标，不重复加入store/signed reinterpret各自body欠债。

|真实目标类别|v06剩余46|root vlrelu-main/v01剩余17|
|---|---:|---:|
|load调用前置条件|3|3|
|validity / separation / read-frame传递|23|4|
|loop/function assigns写入范围|6|0|
|值的联系 / unary_value桥 / 最终输出|14|10|

root v01剩余4个内存目标分别是：harness assert1（input/left当前元素valid_read）；harness assert3（input当前元素与right全区间separated）；RVV assert43（input当前元素valid_read）；RVV assert44（input当前元素与当前output写入区间separated）。

剩余10个值目标是harness assert6、7；NEON assert8、19、29、31、loop invariant14 preserved、assert40、41；RVV assert42。其中loop invariant14真实结论是单lane尾部写入之后的unary_value前缀传播，不是frame有效性。

真实公式已本地导出至`caller-sequent01/sequent.log`（只export，prover none，无验证结果）。完整逐goal分类及源raw SHA见`caller-obligations.json`。导出时cwd为仓库目录，#line相对路径导致显示坐标与原full报告不同，分类以相同plain assertion/invariant的ordinal和实际公式为准；没有用打印公式代替已验证结果。
