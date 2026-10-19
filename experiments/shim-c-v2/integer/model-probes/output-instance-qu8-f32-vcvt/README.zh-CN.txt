局部proof-only诊断，不计入完整kernel成功。
来源：integer-array-v3/qu8-f32-vcvt local01 冻结C/spec与proof。
增加真实最终比较循环的逐点loop invariant output_same，以及checked Wp.instance策略。
final03原始报告：3/3（真实wrapper ensures_equal、output_same established/preserved）全部Valid。
命令command03.json；原始完整输出final03.log。原ensures_equal单独诊断final02也Valid；final01错误使用property tag未生成任何VC，不作为证据。
所有C实现token和public spec保持来源一致；proof.patch可对原plain快照应用。
这未闭合原local01整核835/843的另外7个kernel层VC，不能与该统计合并为整核通过。
