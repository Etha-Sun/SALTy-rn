# 最终稳定v07：四主目标及完整新增依赖已闭

同一immutable snapshot实际caller64/64、三helper body/assigns6/6、globals21/21；正控制通过、负控制false未证明，四组exit0。逐项映射见complete-goal-map.json，raw/命令见complete-deps01，身份/SHA见review.json。

新增两个空ghost point helper无公理；四private requires、两index cast/output valid-read/old point、所有transfer requires及全部caller RTE均实查。mf2_lanes官方Wp.instance真正选中vst1 post的forall，P1=goal index，子分支Qed。没有增强public pre。

sourceguard5740 tokens与d5b18一致；spec、rvv、bits、float_ops、driver、unit字节不变；原VmemAddress保留。相对d5b18最小delta为minimal-on-d5b18.patch（88行）。

不称整核通过；root须与prefix/permission改动合并后最终完整检查。v08未跑WP且不采用。
