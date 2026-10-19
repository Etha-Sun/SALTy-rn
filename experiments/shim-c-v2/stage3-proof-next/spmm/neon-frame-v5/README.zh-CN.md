# NEON 七循环 frame 候选

原 wrapper 传 mc=m*4，output_stride=(m+4)*4，合法输出域为 nc*(m+4) 个 float；冻结spec赋予该域有效性与metadata分离。本候选 ghost 固定 spn_MC=mc 和 spn_output=output，故所有写域仅 spn_output[0..nc*(spn_MC/4+4)-1]，没有增大公共写域。

4-lane 外循环写mc/input/output/errno及输出域；三个column循环写n/w/dmap/nnzmap/input/output/errno及同输出域；三个nnz循环只写nnz/dmap/input/w/对应累加器/errno，无输出域。真实stores分别vst1q(4)、vst1(2)、vst1_lane(1)，均须用body证明位于该域，uintptr桥未证不能跳过。局部声明变量无需列入外层frame。

共20个新不变量（40条建立/保持）、7个variant、7组loop assigns，后两类raw数量由实际WP生成决定。无新函数requires/assigns、无新assert、无修改C token。所有frame证明必须留下，不能仅检查后续RVV metadata就宣称成功。proof/sourceguard/runnerSHA已留存。独立runner继续内联真实prefetch且保留定义，不当旧checker验收。

主agent可先枚举整个equivalent并针对新增命名不变量和所有loop assigns分组；完整运行不能跳过原callee body。元数据5目标只是辅助观察。
